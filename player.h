#define PLAYER_SPEED 0.03

struct Tank player;

struct Point
translate(float x, float y)
{
	struct Point point;

	point.x = x - player.x + width / 2;
	point.y = y - player.y + height / 2;

	return point;
}

struct Point
untranslate(int x, int y)
{
	struct Point point;

	point.x = x + player.x - width / 2;
	point.y = y + player.y - height / 2;

	return point;
}

void
update_player(int8_t dx, int8_t dy, int pointer_dx, int pointer_dy)
{
	float mult = 1;

	if (abs(dx) + abs(dy) == 2)
	{
		mult = 0.707; // sqrt 2
	}

	player.x += mult * PLAYER_SPEED * dx * dt;
	player.y += mult * PLAYER_SPEED * dy * dt;

	// Map bound checking

	if (player.x < 0)
	{
		player.x = 0;
	}

	if (player.x > MAP_WIDTH)
	{
		player.x = MAP_WIDTH;
	}

	if (player.y < 0)
	{
		player.y = 0;
	}

	if (player.y > MAP_HEIGHT)
	{
		player.y = MAP_HEIGHT;
	}

	// Rotate player

	player.rot = atan2(pointer_dy, pointer_dx);

	// Render player

	render_tank(&player);
}