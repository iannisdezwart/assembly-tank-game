void
render_frame(void)
{
	SDL_RenderPresent(renderer);
}

void
set_colour_rgb(uint8_t r, uint8_t g, uint8_t b)
{
	SDL_SetRenderDrawColor(renderer, r, g, b, 1);
}

void
set_colour_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
	SDL_SetRenderDrawColor(renderer, r, g, b, a);
}

void
stroke_rect(uint32_t x, uint32_t y, uint32_t width, uint32_t height)
{
	SDL_Rect rect;

	rect.x = x;
	rect.y = y;
	rect.w = width;
	rect.h = height;

	SDL_RenderDrawRect(renderer, &rect);
}

void
fill_rect(uint32_t x, uint32_t y, uint32_t width, uint32_t height)
{
	SDL_Rect rect;

	rect.x = x;
	rect.y = y;
	rect.w = width;
	rect.h = height;

	SDL_RenderFillRect(renderer, &rect);
}

void
stroke_circle(uint32_t x_centre, uint32_t y_centre, uint32_t radius)
{
	const uint32_t diameter = radius * 2;

	int32_t x = radius - 1;
	int32_t y = 0;
	int32_t tx = 1;
	int32_t ty = 1;
	int32_t err = tx - diameter;

	while (x >= y)
	{
		// Draw the octants of the circle

		SDL_RenderDrawPoint(renderer, x_centre + x, y_centre + y);
		SDL_RenderDrawPoint(renderer, x_centre + x, y_centre - y);
		SDL_RenderDrawPoint(renderer, x_centre - x, y_centre + y);
		SDL_RenderDrawPoint(renderer, x_centre - x, y_centre - y);
		SDL_RenderDrawPoint(renderer, x_centre + y, y_centre + x);
		SDL_RenderDrawPoint(renderer, x_centre + y, y_centre - x);
		SDL_RenderDrawPoint(renderer, x_centre - y, y_centre + x);
		SDL_RenderDrawPoint(renderer, x_centre - y, y_centre - x);

		if (err <= 0)
		{
			y++;
			err += ty;
			ty += 2;
		}
		else
		{
			x--;
			tx += 2;
			err += tx - diameter;
		}
	}
}

void
fill_circle(uint32_t x_centre, uint32_t y_centre, uint32_t radius)
{
	const int diameter = radius * 2;
	const int radius_squared = radius * radius;

	for (uint32_t i = 0; i < diameter; i++)
	{
		for (uint32_t j = 0; j < diameter; j++)
		{
			uint32_t x = radius - i;
			uint32_t y = radius - j;

			if (x * x + y * y <= radius_squared)
			{
				SDL_RenderDrawPoint(renderer, x_centre + x, y_centre + y);
			}
		}
	}
}