#include <SDL2/SDL.h>
#include <stdio.h>

const int WIDTH = 640;
const int HEIGHT = 480;

int
main(int argc, char **argv)
{
	SDL_Window *window;
	SDL_Surface *screen_surface;

	if (SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		fprintf(stderr, "Error initialising SDL: %s\n", SDL_GetError());
		exit(1);
	}

	window = SDL_CreateWindow("TankGame", SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED, WIDTH, HEIGHT, SDL_WINDOW_SHOWN);

	if (window == NULL)
	{
		fprintf(stderr, "Error creating window: %s\n", SDL_GetError());
		exit(1);
	}

	screen_surface = SDL_GetWindowSurface(window);

	SDL_FillRect(screen_surface, NULL,
		SDL_MapRGB(screen_surface->format, 0xFF, 0xFF, 0xFF));

	SDL_UpdateWindowSurface(window);

	SDL_Delay(2000);

	SDL_DestroyWindow(window);
	SDL_Quit();

	return 0;
}