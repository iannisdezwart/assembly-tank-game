#define HEALTH_BAR_BORDER_COLOUR 0x00, 0x00, 0x00

#define HEALTH_BAR_FILL_COLOUR_GREEN 0x32, 0xA8, 0x52
#define HEALTH_BAR_FILL_COLOUR_ORANGE 0xC9, 0x8F, 0x2A
#define HEALTH_BAR_FILL_COLOUR_RED 0xC2, 0x3C, 0x3C

#define HEALTH_BAR_ORANGE_THRESHOLD MAX_HEALTH / 2
#define HEALTH_BAR_RED_THRESHOLD MAX_HEALTH / 4

#define HEALTH_BAR_WIDTH 48
#define HEALTH_BAR_HEIGHT 8
#define HEALTH_BAR_BORDER_WIDTH 2
#define HEALTH_BAR_MARGIN_TOP 24

/**
 * @brief Draws a health bar below a tank.
 * @param tank The tank to draw a health bar for.
 */
void
render_health_bar(struct Tank *tank)
{
	struct Point top_left = translate(tank->x, tank->y);

	top_left.x -= HEALTH_BAR_WIDTH / 2;
	top_left.y += TANK_BODY_RADIUS + HEALTH_BAR_MARGIN_TOP;

	// Draw border

	set_colour_rgb(HEALTH_BAR_BORDER_COLOUR);

	stroke_rect(top_left.x - HEALTH_BAR_BORDER_WIDTH / 2,
		top_left.y - HEALTH_BAR_BORDER_WIDTH / 2,
		HEALTH_BAR_WIDTH + HEALTH_BAR_BORDER_WIDTH,
		HEALTH_BAR_HEIGHT + HEALTH_BAR_BORDER_WIDTH,
		HEALTH_BAR_BORDER_WIDTH);

	// Draw inner

	if (tank->health > HEALTH_BAR_ORANGE_THRESHOLD)
	{
		set_colour_rgb(HEALTH_BAR_FILL_COLOUR_GREEN);
	}
	else if (tank->health > HEALTH_BAR_RED_THRESHOLD)
	{
		set_colour_rgb(HEALTH_BAR_FILL_COLOUR_ORANGE);
	}
	else
	{
		set_colour_rgb(HEALTH_BAR_FILL_COLOUR_RED);
	}

	fill_rect(top_left.x, top_left.y,
		tank->health * HEALTH_BAR_WIDTH / MAX_HEALTH,
		HEALTH_BAR_HEIGHT);
}