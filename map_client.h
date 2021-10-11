void
render_border(void)
{
	struct Point top_left;

	top_left = translate(0, 0);

	set_colour_rgb(0x00, 0x00, 0x00);
	stroke_rect(top_left.x, top_left.y, MAP_WIDTH, MAP_HEIGHT,
		MAP_BORDER_THICKNESS);
}