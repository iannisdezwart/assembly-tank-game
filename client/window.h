extern uint32_t width;
extern uint32_t height;
extern uint32_t refresh_rate;
extern uint32_t frame_time_usec;

extern SDL_Window *window;
extern SDL_Renderer *renderer;

/**
 * @brief Sets up the window.
 * SDL and the TTF engine are started, the window is created, and
 * the renderer is initialised.
 * Some vital global variables such as the width, height and refresh rate
 * of the screen are initialised too.
 * @warning Use `cleanup_window()` to free the memory used for the window.
 */
extern void
setup_fullscreen_window(void);
/**
 * @brief Frees memory used for the window and renderer, and stops
 * the SDL and TTF engine.
 */
extern void
cleanup_window(void);