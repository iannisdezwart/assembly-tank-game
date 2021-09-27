#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdint.h>

#include "window.h"
#include "graphics.h"

void
handle_events(void)
{
	SDL_Event e;

	while (1)
	{
		while (SDL_PollEvent(&e) != 0)
		{
			if (e.type == SDL_QUIT)
			{
				goto quit;
			}
		}
	}

	quit:;
}

void
render(void)
{
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

	render_frame();
}

int
main(int argc, char **argv)
{
	create_fullscreen_window();
	render();
	handle_events();
	exit_window();

	return 0;
}