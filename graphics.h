/**
 * @brief Renders the renderer to the frame.
 */
void
render_frame(void)
{
	SDL_RenderPresent(renderer);
}

/**
 * @brief Sets the drawing colour to an rgb value.
 * The alpha value is implicitly set to 0xFF.
 * @param r 8-bit red value.
 * @param g 8-bit green value.
 * @param b 8-bit blue value.
 */
void
set_colour_rgb(uint8_t r, uint8_t g, uint8_t b)
{
	SDL_SetRenderDrawColor(renderer, r, g, b, 0xFF);
}

/**
 * @brief Sets the drawing colour to an rgba value.
 * @param r 8-bit red value.
 * @param g 8-bit green value.
 * @param b 8-bit blue value.
 * @param a 8-bit alpha value.
 */
void
set_colour_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
	SDL_SetRenderDrawColor(renderer, r, g, b, a);
}

/**
 * @brief Draws a stroked rectangle.
 * @param x The x coordinate of the top left corner.
 * @param y The y coordinate of the top left corner.
 * @param width The width of the rectangle.
 * @param height The height of the rectangle.
 */
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

/**
 * @brief Draws a filled rectangle.
 * @param x The x coordinate of the top left corner.
 * @param y The y coordinate of the top left corner.
 * @param width The width of the rectangle.
 * @param height The height of the rectangle.
 */
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

/**
 * @brief Rotates a point around an origin point with an angle.
 * @param x The x coordinate of the point.
 * @param y The y coordinate of the point.
 * @param angle The angle of rotation.
 * @param x_origin The x coordinate of the origin.
 * @param y_origin The y coordinate of the origin.
 * @returns A point structure that contains the x and y value of the
 * rotated point.
 */
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

/**
 * @brief Draws a filled rotated rectangle.
 * Coordinates and lengths of a normal rectangle (the original) are passed.
 * This original rectangle is then rotated around an origin.
 * Then it is drawn to the screen.
 * @param x The x coordinate of the top left corner of the original rectangle.
 * @param y The y coordinate of the top left corner of the original rectangle.
 * @param width The width of the original rectangle.
 * @param height The height of the original rectangle.
 * @param angle The angle to rotate the rectangle with.
 * @param x_origin The x coordinate of the origin to rotate from.
 * @param y_origin The y coordinate of the origin to rotate from.
 */
void
filled_rotated_rect(int x, int y, uint32_t width, uint32_t height,
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

/**
 * @brief Draws a stroked circle.
 * @param x_centre The x coordinate of the centre of the circle.
 * @param y_centre The y coordinate of the centre of the circle.
 * @param radius The radius the circle.
 */
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

/**
 * @brief Draws a filled circle.
 * @param x_centre The x coordinate of the centre of the circle.
 * @param y_centre The y coordinate of the centre of the circle.
 * @param radius The radius the circle.
 */
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