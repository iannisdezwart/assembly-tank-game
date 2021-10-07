#define READ_BUF_SIZE 4096

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
	uint64_t duration;
	int64_t delay;

	struct Point pointer;

	int8_t move_up = 0;
	int8_t move_down = 0;
	int8_t move_left = 0;
	int8_t move_right = 0;

	int8_t shooting = 0;
	float bullet_x;
	float bullet_y;

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
	render_fps_counter();
	render_frame();

	// Update player position

	if (start_time - last_server_tick_time >= USEC_PER_SERVER_TICK)
	{
		last_server_tick_time = now();
		send_position_tick();
	}

	// Shoot

	if (shooting)
	{
		bullet_x = player.x + (TANK_GUN_WIDTH + TANK_BODY_RADIUS) * cos(player.rot);
		bullet_y = player.y + (TANK_GUN_WIDTH + TANK_BODY_RADIUS) * sin(player.rot);

		send_bullet(bullet_x, bullet_y, player.rot);
		add_bullet(bullet_x, bullet_y, player.rot);
	}

	// Read socket

	read_buf_size = read_from_socket(socket_fd, read_buf, READ_BUF_SIZE);
	read_ptr = read_buf;

	while (read_buf_size > 0)
	{
		msg_type = read_u8(&read_ptr);

		switch (msg_type)
		{
			case SMT_PLAYER_POSITIONS:
				if (read_buf_size < (sizeof(player_t) + 1))
				{
					fputs("Received a SMT_PLAYER_POSITIONS message of invalid length\n",
						stderr);
					break;
				}

				// Increase to support more than 255 clients

				num_clients = read_u8(&read_ptr);
				delete_other_players();

				for (player_t i = 0; i < num_clients; i++)
				{
					add_other_player(
						/*  x  */ read_f32(&read_ptr),
						/*  y  */ read_f32(&read_ptr),
						/* rot */ read_f32(&read_ptr));
				}

				read_buf_size -= 1 + sizeof(player_t) + 12 * num_clients;
				break;

			case SMT_SPAWN_BULLET:
				if (read_buf_size < 13)
				{
					fputs("Received a SMT_SPAWN_BULLET message of invalid length\n",
						stderr);
					break;
				}

				add_bullet(
					/*    x    */ read_f32(&read_ptr),
					/*    y    */ read_f32(&read_ptr),
					/* heading */ read_f32(&read_ptr));

				read_buf_size -= 13;
				break;

			default:
				fprintf(stderr, "Received unknown message from server of type %hhu\n",
					msg_type);
				break;
		}
	}

	// Schedule next frame

	finish_time = now();
	duration = finish_time - start_time;
	delay = frame_time_usec - duration;

	add_frame_time(finish_time);

	if (delay > 0)
	{
		usleep(delay);
	}

	goto next_event;

	quit:;
}