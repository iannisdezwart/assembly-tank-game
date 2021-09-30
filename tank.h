#define TANK_BODY_COLOUR 0x03, 0x98, 0xFC
#define TANK_BODY_RADIUS 20

#define TANK_GUN_COLOUR 0x40, 0x46, 0x4A
#define TANK_GUN_WIDTH 20
#define TANK_GUN_HEIGHT 16

struct Tank
{
	uint32_t x;
	uint32_t y;
	float rot;
};

/**
 * @brief Renders one tank instance.
 * @param tank The tank to render. This struct contains the x, y and rotation.
 */
void
render_tank(struct Tank *tank)
{
	// Draw gun

	set_colour_rgb(TANK_GUN_COLOUR);
	filled_rotated_rect(tank->x + TANK_BODY_RADIUS, tank->y - TANK_GUN_HEIGHT / 2,
		TANK_GUN_WIDTH, TANK_GUN_HEIGHT, tank->rot, tank->x, tank->y);

	// Draw body

	set_colour_rgb(TANK_BODY_COLOUR);
	fill_circle(tank->x, tank->y, TANK_BODY_RADIUS);
}