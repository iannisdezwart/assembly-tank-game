#define READ_BUF_SIZE 4096
#define CAP_FPS_TO_REFRESH_RATE

int raw_mouse_x;
int raw_mouse_y;

/**
 * @brief Initialises some variables used in the `handle_events()` function.
 */
void
setup_io(void)
{
	player.x = MAP_WIDTH / 2;
	player.y = MAP_HEIGHT / 2;
	player.rot = 0;
	player.health = MAX_HEALTH;

	raw_mouse_y = MAP_HEIGHT / 2;
	raw_mouse_x = INT32_MAX;

	init_timings();
}

/**
 * @brief Handles all mouse and keyboard IO events.
 */
void
handle_events(void)
{
	SDL_Event e;

	uint64_t start_time;
	uint64_t finish_time;

	uint64_t latest_shoot_time = 0;

	#ifdef CAP_FPS_TO_REFRESH_RATE

	uint64_t duration;
	int64_t delay;

	#endif

	struct Point pointer;

	int8_t move_up = 0;
	int8_t move_down = 0;
	int8_t move_left = 0;
	int8_t move_right = 0;

	int8_t shooting = 0;
	float bullet_x;
	float bullet_y;

	float temp_x;
	float temp_y;
	float temp_rot;
	health_t temp_health;
	int temp_owner;
	bullet_id_t temp_bullet_id;
	uint64_t size;

	char read_buf[READ_BUF_SIZE];
	char *read_ptr;
	ssize_t read_buf_size;
	enum ServerMessageType msg_type;
	player_t num_clients;

	next_event:

	start_time = now();

	while (SDL_PollEvent(&e) != 0)
	{
		switch (e.type)
		{
			case SDL_QUIT:
				goto quit;

			case SDL_KEYDOWN:
				switch (e.key.keysym.scancode)
				{
					case SDL_SCANCODE_W:
						move_up = 1;
						break;

					case SDL_SCANCODE_A:
						move_left = 1;
						break;

					case SDL_SCANCODE_S:
						move_down = 1;
						break;

					case SDL_SCANCODE_D:
						move_right = 1;
						break;

					case SDL_SCANCODE_SPACE:
						shooting = 1;
						break;

					default:
						break;
				}

				break;

			case SDL_KEYUP:
				switch (e.key.keysym.scancode)
				{
					case SDL_SCANCODE_W:
						move_up = 0;
						break;

					case SDL_SCANCODE_A:
						move_left = 0;
						break;

					case SDL_SCANCODE_S:
						move_down = 0;
						break;

					case SDL_SCANCODE_D:
						move_right = 0;
						break;

					case SDL_SCANCODE_SPACE:
						shooting = 0;
						break;

					default:
						break;
				}

				break;

			case SDL_MOUSEMOTION:
				raw_mouse_x = e.motion.x;
				raw_mouse_y = e.motion.y;

				break;
		}
	}

	clear_screen();
	render_border();

	// Get relative mouse position to player

	pointer = untranslate(raw_mouse_x, raw_mouse_y);

	update_player(move_right - move_left, move_down - move_up,
		pointer.x - player.x, pointer.y - player.y);

	update_other_players();
	update_bullets();

	render_bullets();
	render_fps_counter();
	render_frame();

	// Update player position

	if (start_time - last_server_tick_time >= USEC_PER_SERVER_TICK)
	{
		last_server_tick_time = now();
		send_position_tick();
	}

	// Shoot

	if (shooting && now() - latest_shoot_time >= BULLET_RELOAD_SPEED
		/* && player.health > 0 */)
	{
		bullet_x = player.x + (TANK_GUN_WIDTH + TANK_BODY_RADIUS) * cos(player.rot);
		bullet_y = player.y + (TANK_GUN_WIDTH + TANK_BODY_RADIUS) * sin(player.rot);

		send_bullet(bullet_x, bullet_y, player.rot);
		latest_shoot_time = now();
	}

	// Read socket

	read_buf_size = read_from_socket(socket_fd, read_buf, READ_BUF_SIZE);
	read_ptr = read_buf;

	while (read_buf_size > 0)
	{
		msg_type = read_u8(&read_ptr);

		switch (msg_type)
		{
			case SMT_HANDSHAKE:
				if (read_buf_size < 5)
				{
					fprintf(stderr,
						"Received a SMT_HANDSHAKE message of invalid length %lu\n",
						read_buf_size);
					break;
				}

				client_id = read_u32(&read_ptr);

				read_buf_size -= 5;
				break;

			case SMT_PLAYER_POSITIONS:
				if (read_buf_size < (1 + sizeof(health_t)
					+ sizeof(player_t)))
				{
					fprintf(stderr,
						"Received a SMT_PLAYER_POSITIONS message of invalid length %lu\n",
						read_buf_size);
					break;
				}

				player.health = read_u8(&read_ptr);
				num_clients = read_u8(&read_ptr);
				delete_other_players();

				for (player_t i = 0; i < num_clients; i++)
				{
					temp_x = read_f32(&read_ptr);
					temp_y = read_f32(&read_ptr);
					temp_rot = read_f32(&read_ptr);
					temp_health = read_u8(&read_ptr);

					add_other_player(temp_x, temp_y, temp_rot, temp_health);
				}

				read_buf_size -= 1 + sizeof(health_t) + sizeof(player_t)
					+ 13 * num_clients;
				break;

			case SMT_SPAWN_BULLET:
				if (read_buf_size < 25)
				{
					fprintf(stderr,
						"Received a SMT_SPAWN_BULLET message of invalid length %lu\n",
						read_buf_size);
					break;
				}

				temp_bullet_id = read_u64(&read_ptr);
				temp_x = read_f32(&read_ptr);
				temp_y = read_f32(&read_ptr);
				temp_rot = read_f32(&read_ptr);
				temp_owner = read_u32(&read_ptr);
 
				add_bullet(temp_bullet_id, temp_x, temp_y, temp_rot, temp_owner);

				read_buf_size -= 25;
				break;

			case SMT_DELETED_BULLETS:
				if (read_buf_size < 9)
				{
					fprintf(stderr,
						"Received a SMT_DELETED_BULLETS message of invalid length %lu\n",
						read_buf_size);
					break;
				}

				size = read_u64(&read_ptr);

				for (size_t i = 0; i < size; i++)
				{
					temp_bullet_id = read_u64(&read_ptr);
					del_bullet_by_id(temp_bullet_id);
				}

				read_buf_size -= 9 + size * sizeof(bullet_id_t);
				break;

			case SMT_DIE:
				if (read_buf_size < 1)
				{
					fprintf(stderr,
						"Received a SMT_DIE message of invalid length %lu\n",
						read_buf_size);
					break;
				}

				player.health = 0;
				read_buf_size -= 1;
				break;

			case SMT_RESPAWN:
				if (read_buf_size < 9)
				{
					fprintf(stderr,
						"Received a SMT_RESPAWN message of invalid length %lu\n",
						read_buf_size);
					break;
				}

				player.x = read_f32(&read_ptr);
				player.y = read_f32(&read_ptr);
				player.health = MAX_HEALTH;

				read_buf_size -= 9;
				break;

			default:
				fprintf(stderr,
					"Received unknown message from server of type %u of length %lu\n",
					msg_type, read_buf_size);
				break;
		}
	}

	// Schedule next frame

	finish_time = now();
	add_frame_time(finish_time);

	#ifdef CAP_FPS_TO_REFRESH_RATE

	duration = finish_time - start_time;
	delay = frame_time_usec - duration;

	if (delay > 0)
	{
		usleep(delay);
	}

	#endif

	goto next_event;

	quit:;
}
