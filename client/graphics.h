/**
 * @brief Renders the renderer to the frame.
 */
extern void
render_frame(void);

/**
 * @brief Sets the drawing colour to an rgb value.
 * The alpha value is implicitly set to 0xFF.
 * @param r 8-bit red value.
 * @param g 8-bit green value.
 * @param b 8-bit blue value.
 */
extern void
set_colour_rgb(uint8_t r, uint8_t g, uint8_t b);

/**
 * @brief Sets the drawing colour to an rgba value.
 * @param r 8-bit red value.
 * @param g 8-bit green value.
 * @param b 8-bit blue value.
 * @param a 8-bit alpha value.
 */
extern void
set_colour_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a);

/**
 * @brief Draws a filled rectangle.
 * @param x The x coordinate of the top left corner.
 * @param y The y coordinate of the top left corner.
 * @param width The width of the rectangle.
 * @param height The height of the rectangle.
 */
extern void
fill_rect(int x, int y, uint32_t width, uint32_t height);

/**
 * @brief Draws a stroked rectangle.
 * @param x The x coordinate of the top left corner.
 * @param y The y coordinate of the top left corner.
 * @param width The width of the rectangle.
 * @param height The height of the rectangle.
 * @param thickness The line tickness of the rectangle.
 */
extern void
stroke_rect(int x, int y, uint32_t width, uint32_t height, uint32_t thickness);

struct Point
{
	int x;
	int y;
};

/**
 * @brief Translates an in-game coordinate to a physical pixel coordinate.
 */
extern struct Point
translate(float x, float y);

/**
 * @brief Translates a physical pixel coordinate back to an in-game coordinate.
 */
extern struct Point
untranslate(int x, int y);

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
extern struct Point
rotate_point_around_point(int x, int y, float angle,
	int x_origin, int y_origin);

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
extern void
fill_rotated_rect(int x, int y, uint32_t width, uint32_t height,
	float angle, int x_origin, int y_origin);

/**
 * @brief Draws a filled circle.
 * @param x_centre The x coordinate of the centre of the circle.
 * @param y_centre The y coordinate of the centre of the circle.
 * @param radius The radius the circle.
 */
extern void
fill_circle(int x_centre, int y_centre, uint32_t radius);

/**
 * @brief Render an SDL_Surface onto the frame.
 * @param surface A pointer to the surface to render.
 * @param x The x coordinate of where to render the surface.
 * @param y The y coordinate of where to render the surface.
 * @param width The width of the surface.
 * @param height The height of the surface.
 */
extern void
render_surface(struct SDL_Surface *surface, int x, int y,
	uint32_t width, uint32_t height);

/**
 * @brief Renders text onto the frame in a left align.
 * @param font The font to use.
 * @param text The text to write.
 * @param x The x coordinate of the location to render to.
 * @param y The y coordinate of the location to render to.
 */
extern void
render_text(Font *font, const char *text, int x, int y);

/**
 * @brief Renders text onto the frame in a centred align.
 * @param font The font to use.
 * @param text The text to write.
 * @param x The middle x coordinate of the location to render to.
 * @param y The y coordinate of the location to render to.
 */
extern void
render_text_centred(Font *font, const char *text, int x, int y);

/**
 * @brief Renders text onto the frame in a right align.
 * @param font The font to use.
 * @param text The text to write.
 * @param x The right x coordinate of the location to render to.
 * @param y The y coordinate of the location to render to.
 */
extern void
render_text_right(Font *font, const char *text, int x, int y);