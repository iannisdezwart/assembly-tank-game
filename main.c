#include <SDL2/SDL.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/time.h>

#include "window.h"
#include "graphics.h"
#include "tank.h"
#include "timing.h"

struct Tank player = { .x = 250, .y = 200, .rot = 0 };

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

	render_tank(&player);

	render_frame();
}

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

	start_time = now();

	next_event:

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
				pointer_dx = e.motion.x - player.x;
				pointer_dy = e.motion.y - player.y;

				player.rot = atan2(pointer_dy, pointer_dx);

				break;
		}
	}

	player.x += move_right - move_left;
	player.y += move_down - move_up;

	render();

	finish_time = now();
	duration = finish_time - start_time;
	start_time += duration;
	delay = frame_time_usec - duration;
	start_time = finish_time;

	if (delay > 0)
	{
		usleep(delay);
	}

	goto next_event;

	quit:;
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