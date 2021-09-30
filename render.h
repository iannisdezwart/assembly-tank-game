/**
 * @brief Clears the screen.
 */
void
clear_screen(void)
{
	SDL_RenderClear(renderer);

	// White background

	set_colour_rgb(0xFF, 0xFF, 0xFF);
	fill_rect(0, 0, width, height);
}

/**
 * @brief Renders an FPS counter to the top left of the screen.
 */
void
render_fps_counter(void)
{
	char fps_str[16];

	// Write FPS counter

	snprintf(fps_str, sizeof(fps_str), "%05.1f FPS", fps);
	set_colour_rgb(0xFF, 0x00, 0x00);
	render_text(font_20px, fps_str, 0, 0);
}