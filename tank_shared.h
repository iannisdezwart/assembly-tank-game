#define TANK_BODY_COLOUR 0x03, 0x98, 0xFC
#define TANK_BODY_RADIUS 20

#define TANK_GUN_COLOUR 0x40, 0x46, 0x4A
#define TANK_GUN_WIDTH 20
#define TANK_GUN_HEIGHT 16

typedef uint8_t health_t;
#define MAX_HEALTH 255

struct Tank
{
	float x;
	float y;
	float rot;
	health_t health;
};