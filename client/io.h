#define READ_BUF_SIZE 4096
#define CAP_FPS_TO_REFRESH_RATE

extern int raw_mouse_x;
extern int raw_mouse_y;

/**
 * @brief Initialises some variables used in the `handle_events()` function.
 */
extern void
setup_io(void);

char
debug1(char c)
{
	printf("received message of type %hhu\n", c);

	return c;
}

void
debug2(char *read_ptr, size_t read_buf_size)
{
	printf("reading %lu bytes from socket\n", read_buf_size);

	for (size_t i = 0; i < read_buf_size; i += 16)
	{
		printf("%04lx    ", i);

		for (size_t j = 0; j < 16 && read_buf_size - i > j; j++)
		{
			printf("%02hhx ", read_ptr[i + j]);
		}

		printf("\n");
	}
}

void
debug3(void)
{
	for (size_t i = 0; i < n_drops; i++)
	{
		printf("Drop: { %u, %u, %hhu, %lu }\n",
			drops[i].x, drops[i].y, drops[i].type, drops[i].id);
	}
}

int
debug4(int scancode)
{
	printf("scancode %d\n", scancode);
	return scancode;
}

int
debug5(int e_type)
{
	if (e_type > 1)
	{
		printf("event of type %u\n", e_type);
	}

	return e_type;
}

/**
 * @brief Handles all mouse and keyboard IO events.
 */
extern void
handle_events(void); /*
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
	float bullet_speed;
	uint8_t bullet_radius;

	float temp_x;
	float temp_y;
	float temp_rot;
	health_t temp_health;
	score_t temp_score;
	int temp_owner;
	bullet_id_t temp_bullet_id;
	uint64_t size;
	uint8_t username_size;
	char username[TANK_USERNAME_MAX_SIZE];

	uint64_t drop_n;
	int drop_x;
	int drop_y;
	enum DropType drop_type;
	uint64_t drop_id;

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
	render_map_grid();
	render_map_border();

	// Get relative mouse position to player

	pointer = untranslate(raw_mouse_x, raw_mouse_y);

	render_drops();

	update_other_players();
	update_player(move_right - move_left, move_down - move_up,
		pointer.x - player.x, pointer.y - player.y);

	update_bullets();
	render_bullets();

	update_powerups();
	render_leaderboard();
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
		&& player.health > 0)
	{
		bullet_x = player.x + (TANK_GUN_WIDTH + TANK_BODY_RADIUS
			+ BULLET_RADIUS_NORMAL) * cos(player.rot);
		bullet_y = player.y + (TANK_GUN_WIDTH + TANK_BODY_RADIUS
			+ BULLET_RADIUS_NORMAL) * sin(player.rot);

		send_bullet(bullet_x, bullet_y, player.rot);
		latest_shoot_time = now();
	}

	// Read socket

	read_buf_size = read_from_socket(socket_fd, read_buf, READ_BUF_SIZE);
	read_ptr = read_buf;

	#ifdef DEBUG_IO
	printf("read %lu bytes from socket\n",
		read_buf_size);
	#endif

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
					goto next_msg;
				}

				client_id = read_u32(&read_ptr);

				read_buf_size -= 5;
				break;

			case SMT_PLAYER_POSITIONS:
				if (read_buf_size < (1 + sizeof(health_t)
					+ sizeof(score_t) + sizeof(player_t)))
				{
					fprintf(stderr,
						"Received a SMT_PLAYER_POSITIONS message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				player.health = read_u8(&read_ptr);
				player.score = read_u16(&read_ptr);
				num_clients = read_u8(&read_ptr);
				delete_other_players();

				#ifdef DEBUG_IO
				printf("Received SMT_PLAYER_POSITIONS "
					"{ %hhu, %hu, %hhu }\n",
					player.health, player.score,
					num_clients);
				#endif

				read_buf_size -= 1 + sizeof(health_t)
					+ sizeof(score_t) + sizeof(player_t);

				for (player_t i = 0; i < num_clients; i++)
				{
					if (read_buf_size < 16)
					{
						fprintf(stderr,
							"Ran out of buffer for SMT_PLAYER_POSITIONS message before end\n");
						goto next_msg;
					}

					temp_x = read_f32(&read_ptr);
					temp_y = read_f32(&read_ptr);
					temp_rot = read_f32(&read_ptr);
					temp_health = read_u8(&read_ptr);
					temp_score = read_u16(&read_ptr);
					username_size = read_u8(&read_ptr);

					read_buf_size -= 16;

					if (read_buf_size < username_size)
					{
						fprintf(stderr,
							"Ran out of buffer for SMT_PLAYER_POSITIONS message username before end\n");
						goto next_msg;
					}

					strncpy(username, read_ptr,
						username_size);

					username[username_size] = '\0';

					read_ptr += username_size;
					read_buf_size -= username_size;

					add_other_player(temp_x, temp_y,
						temp_rot, temp_health,
						temp_score, username_size,
						username);

					#ifdef DEBUG_IO
					printf("\t{ %.1f, %.1f, %.1f "
						"%hhu, %hu, %hhu, %s }\n",
						temp_x, temp_y, temp_rot,
						temp_health, temp_score,
						username_size, username);
					#endif
				}

				break;

			case SMT_SPAWN_BULLET:
				if (read_buf_size < 30)
				{
					fprintf(stderr,
						"Received a SMT_SPAWN_BULLET message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				temp_bullet_id = read_u64(&read_ptr);
				temp_x = read_f32(&read_ptr);
				temp_y = read_f32(&read_ptr);
				temp_rot = read_f32(&read_ptr);
				bullet_radius = read_u8(&read_ptr);
				bullet_speed = read_f32(&read_ptr);
				temp_owner = read_u32(&read_ptr);

				add_bullet(temp_bullet_id, temp_x, temp_y,
					temp_rot, bullet_radius, bullet_speed,
					temp_owner);

				#ifdef DEBUG_IO
				printf("Received SMT_SPAWN_BULLET "
					"{ %lu, %.1f, %.1f, %.1f, %hhu "
					" %.1f, %u }\n",
					temp_bullet_id, temp_x, temp_y,
					temp_rot, bullet_radius, bullet_speed,
					temp_owner);
				#endif

				read_buf_size -= 30;
				break;

			case SMT_DELETED_BULLETS:
				if (read_buf_size < 9)
				{
					fprintf(stderr,
						"Received a SMT_DELETED_BULLETS message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				size = read_u64(&read_ptr);

				#ifdef DEBUG_IO
				printf("Received SMT_DELETED_BULLETS "
					"{ %lu }\n", size);
				#endif

				read_buf_size -= 9;

				for (size_t i = 0; i < size; i++)
				{
					if (read_buf_size < sizeof(bullet_id_t))
					{
						fprintf(stderr,
							"Ran out of buffer for SMT_DELETED_BULLETS message before end\n");
						goto next_msg;
					}

					temp_bullet_id = read_u64(&read_ptr);
					del_bullet_by_id(temp_bullet_id);

					#ifdef DEBUG_IO
					printf("\t { %lu }\n", temp_bullet_id);
					#endif

					read_buf_size -= sizeof(bullet_id_t);
				}

				break;

			case SMT_DIE:
				if (read_buf_size < 1)
				{
					fprintf(stderr,
						"Received a SMT_DIE message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				#ifdef DEBUG_IO
				printf("Received SMT_DIE {}\n");
				#endif

				player.health = 0;
				read_buf_size -= 1;
				break;

			case SMT_RESPAWN:
				if (read_buf_size < 9)
				{
					fprintf(stderr,
						"Received a SMT_RESPAWN message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				player.x = read_f32(&read_ptr);
				player.y = read_f32(&read_ptr);
				player.health = MAX_HEALTH;

				#ifdef DEBUG_IO
				printf("Received SMT_RESPAWN "
					"{ %.1f, %.1f, %hhu }\n",
					player.x, player.y, player.health);
				#endif

				read_buf_size -= 9;
				break;

			case SMT_SPAWN_DROP:
				if (read_buf_size < 9)
				{
					fprintf(stderr,
						"Received a SMT_SPAWN_DROP message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				drop_n = read_u64(&read_ptr);
				read_buf_size -= 9;

				#ifdef DEBUG_IO
				printf("Received SMT_SPAWN_DROP "
					"{ %lu }\n", drop_n);
				#endif

				for (uint64_t i = 0; i < drop_n; i++)
				{
					if (read_buf_size < 17)
					{
						fprintf(stderr,
							"Ran out of buffer for SMT_SPAWN_DROP message of before end\n");
						goto next_msg;
					}

					drop_x = read_u32(&read_ptr);
					drop_y = read_u32(&read_ptr);
					drop_type = read_u8(&read_ptr);
					drop_id = read_u64(&read_ptr);

					add_drop(drop_x, drop_y, drop_type,
						drop_id);

					#ifdef DEBUG_IO
					printf("\t{ %u, %u, %hhu, %lu }\n",
						drop_x, drop_y, drop_type,
						drop_id);
					#endif

					read_buf_size -= 17;
				}

				break;

			case SMT_DESPAWN_DROP:
				if (read_buf_size < 9)
				{
					fprintf(stderr,
						"Received a SMT_DESPAWN_DROP message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				drop_id = read_u64(&read_ptr);

				#ifdef DEBUG_IO
				printf("Received SMT_DESPAWN_DROP "
					"{ %lu }\n", drop_id);
				#endif

				del_drop_by_id(drop_id);

				read_buf_size -= 9;
				break;

			case SMT_POWERUP:
				if (read_buf_size < 2)
				{
					fprintf(stderr,
						"Received a SMT_POWERUP message of invalid length %lu\n",
						read_buf_size);
					goto next_msg;
				}

				drop_type = read_u8(&read_ptr);
				activate_powerup(drop_type);

				#ifdef DEBUG_IO
				printf("Received SMT_POWERUP "
					"{ %hhu }\n", drop_type);
				#endif

				read_buf_size -= 2;
				break;

			default:
				fprintf(stderr,
					"Received unknown message from server of type %u of length %lu\n",
					msg_type, read_buf_size);
				break;
		}
	}

	next_msg:;

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
*/