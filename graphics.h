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
stroke_rect(int x, int y, uint32_t width, uint32_t height)
{
	SDL_Rect rect;

	rect.x = x;
	rect.y = y;
	rect.w = width;
	rect.h = height;

	SDL_RenderDrawRect(renderer, &rect);
}

void
fill_rect(int x, int y, uint32_t width, uint32_t height)
{
	SDL_Rect rect;

	rect.x = x;
	rect.y = y;
	rect.w = width;
	rect.h = height;

	SDL_RenderFillRect(renderer, &rect);
}

struct Point
{
	int x;
	int y;
};

struct Point
rotate_point_around_point(int x, int y, float angle,
	int x_origin, int y_origin)
{
	struct Point point;

	float s = sin(angle);
	float c = cos(angle);

	float dx = x - x_origin;
	float dy = y - y_origin;

	point.x = dx * c - dy * s + x_origin;
	point.y = dx * s + dy * c + y_origin;

	return point;
}

void
stroke_rotated_rect(int x, int y, uint32_t width, uint32_t height,
	float angle, int x_origin, int y_origin)
{
	struct Point rotated_point;

	for (int i = x; i < x + width; i++)
	{
		for (int j = y; j < y + height; j++)
		{
			rotated_point = rotate_point_around_point(i, j, angle,
				x_origin, y_origin);

			SDL_RenderDrawPoint(renderer, rotated_point.x, rotated_point.y);
		}
	}
}

void
stroke_circle(int x_centre, int y_centre, uint32_t radius)
{
	const uint32_t diameter = radius * 2;

	int x = radius - 1;
	int y = 0;
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
fill_circle(int x_centre, int y_centre, uint32_t radius)
{
	const int diameter = radius * 2;
	const int radius_squared = radius * radius;

	for (int i = 0; i < diameter; i++)
	{
		for (int j = 0; j < diameter; j++)
		{
			int x = radius - i;
			int y = radius - j;

			if (x * x + y * y <= radius_squared)
			{
				SDL_RenderDrawPoint(renderer, x_centre + x, y_centre + y);
			}
		}
	}
}