uint32_t width;
uint32_t height;
uint32_t refresh_rate;
uint32_t frame_time_usec;

SDL_Window *window;
SDL_Renderer *renderer;

/**
 * @brief Sets up the window.
 * SDL and the TTF engine are started, the window is created, and
 * the renderer is initialised.
 * Some vital global variables such as the width, height and refresh rate
 * of the screen are initialised too.
 * @warning Use `cleanup_window()` to free the memory used for the window.
 */
void
setup_fullscreen_window(void)
{
	SDL_DisplayMode display_mode;

	// Start SDL

	if (SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		fprintf(stderr, "Error initialising SDL: %s\n", SDL_GetError());
		exit(1);
	}

	// Get display data

	SDL_GetCurrentDisplayMode(0, &display_mode);

	width = display_mode.w;
	height = display_mode.h;
	refresh_rate = display_mode.refresh_rate;
	frame_time_usec = (uint64_t) 1E6 / refresh_rate;

	// Create window

	window = SDL_CreateWindow("TankGame", SDL_WINDOWPOS_CENTERED,
		SDL_WINDOWPOS_CENTERED, width, height, SDL_WINDOW_FULLSCREEN);

	if (window == NULL)
	{
		fprintf(stderr, "Error creating window: %s\n", SDL_GetError());
		exit(1);
	}

	// Create renderer

	renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

	if (renderer == NULL)
	{
		fprintf(stderr, "Error creating renderer: %s\n", SDL_GetError());
	}
}

void
exit_window()
{
	SDL_DestroyWindow(window);
	SDL_DestroyRenderer(renderer);
	SDL_Quit();
}