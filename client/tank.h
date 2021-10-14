/**
 * @brief Renders one tank instance.
 * @param tank The tank to render. This struct contains the x, y and rotation.
 */
void
render_tank(struct Tank *tank)
{
	struct Point tr;

	tr = translate(tank->x, tank->y);

	// Draw gun

	set_colour_rgb(TANK_GUN_COLOUR);
	filled_rotated_rect(tr.x + TANK_BODY_RADIUS,
		tr.y - TANK_GUN_HEIGHT / 2, TANK_GUN_WIDTH, TANK_GUN_HEIGHT,
		tank->rot, tr.x, tr.y);

	// Draw body

	set_colour_rgb(TANK_BODY_COLOUR);
	fill_circle(tr.x, tr.y, TANK_BODY_RADIUS);

	// Draw username

	set_colour_rgb(TANK_USERNAME_COLOUR);
	render_text(font_12px, tank->username,
		tr.x, tr.y - TANK_USERNAME_MARGIN_BOTTOM);
}