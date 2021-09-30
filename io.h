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
						add_bullet(player.x, player.y, player.rot);
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

	update_bullets();
	render_fps_counter();
	render_frame();

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