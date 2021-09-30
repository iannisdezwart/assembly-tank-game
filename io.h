struct Tank player;

int mouse_x;
int mouse_y;

/**
 * @brief Initialises some variables used in the `handle_events()` function.
 */
void
setup_io(void)
{
	player.x = 250;
	player.y = 200;
	player.rot = 0;

	mouse_y = player.y;
	mouse_x = INT32_MAX;

	init_frame_times_array();
}

/**
 * @brief Renders the next frame of the game.
 */
void
render(void)
{
	char fps_str[16];

	// White background

	set_colour_rgb(0xFF, 0xFF, 0xFF);
	fill_rect(0, 0, width, height);

	// Red filled rectangle

	set_colour_rgb(0xFF, 0x00, 0x00);
	fill_rect(100, 100, 300, 200);

	// Green stroked rectangle

	set_colour_rgb(0x00, 0xFF, 0x00);
	stroke_rect(50, 50, 400, 300);

	// Blue stroked circle

	set_colour_rgb(0x00, 0x00, 0xFF);
	stroke_circle(250, 200, 75);

	// Pink filled circle

	set_colour_rgb(0xFF, 0x00, 0xFF);
	fill_circle(250, 200, 50);

	// Render player tank

	render_tank(&player);

	// Write FPS counter

	snprintf(fps_str, sizeof(fps_str), "%05.1f FPS", fps);
	set_colour_rgb(0xFF, 0x00, 0x00);
	render_text(font_20px, fps_str, 0, 0);

	// Render the frame

	render_frame();
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

	int pointer_dx;
	int pointer_dy;

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
				mouse_x = e.motion.x;
				mouse_y = e.motion.y;

				break;
		}
	}

	// Move

	player.x += move_right - move_left;
	player.y += move_down - move_up;

	// Rotate

	pointer_dx = mouse_x - player.x;
	pointer_dy = mouse_y - player.y;

	player.rot = atan2(pointer_dy, pointer_dx);

	// Render

	render();

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