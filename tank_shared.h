#define TANK_BODY_COLOUR 0x03, 0x98, 0xFC
#define TANK_BODY_RADIUS 20

#define TANK_GUN_COLOUR 0x40, 0x46, 0x4A
#define TANK_GUN_WIDTH 20
#define TANK_GUN_HEIGHT 16

typedef uint8_t health_t;
#define MAX_HEALTH 255

/**
 * @brief A structure containing the position and health of a tank.
 * @param x The x coordinate of the tank.
 * @param y The y coordinate of the tank.
 * @param rot The rotation of the tank.
 * @param health The health of the tank.
 */
struct Tank
{
	float x;
	float y;
	float rot;
	health_t health;
};