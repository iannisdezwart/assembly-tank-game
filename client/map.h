#define MAP_BORDER_COLOUR 0x00, 0x00, 0x00
#define MAP_BORDER_THICKNESS 10

void
render_map_border(void)
{
	struct Point top_left;

	top_left = translate(0, 0);

	set_colour_rgb(MAP_BORDER_COLOUR);
	stroke_rect(top_left.x, top_left.y, MAP_WIDTH, MAP_HEIGHT,
		MAP_BORDER_THICKNESS);
}

#define MAP_GRID_THICKNESS 1
#define MAP_GRID_SPACING 50
#define MAP_GRID_COLOUR 0xC0, 0xC0, 0xC0

void
render_map_grid(void)
{
	struct Point p;

	set_colour_rgb(MAP_GRID_COLOUR);

	// Vertical lines

	for (size_t x = 0; x < MAP_WIDTH; x += MAP_GRID_SPACING)
	{
		p = translate(x, 0);
		fill_rect(p.x, p.y, MAP_GRID_THICKNESS, MAP_HEIGHT);
	}

	// Horizontal lines

	for (size_t y = 0; y < MAP_HEIGHT; y += MAP_GRID_SPACING)
	{
		p = translate(0, y);
		fill_rect(p.x, p.y, MAP_WIDTH, MAP_GRID_THICKNESS);
	}
}