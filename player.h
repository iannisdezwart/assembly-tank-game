#define PLAYER_SPEED 0.03

struct Tank player;

/**
 * @brief Translates an in-game coordinate to a pixel on the screen.
 * @param x The in-game x coordinate.
 * @param y The in-game y coordinate.
 */
struct Point
translate(float x, float y)
{
	struct Point point;

	point.x = x - player.x + width / 2;
	point.y = y - player.y + height / 2;

	return point;
}

/**
 * @brief Translates a pixel coordinate to the in-game coordinate.
 * @param x The x coordinate of the pixel.
 * @param y The y coordinate of the pixel.
 */
struct Point
untranslate(int x, int y)
{
	struct Point point;

	point.x = x + player.x - width / 2;
	point.y = y + player.y - height / 2;

	return point;
}

/**
 * @brief Updates the position and rotation of the player and renders it.
 * @param dx The change in x of the tank.
 * @param dy The change in y of the tank.
 * @param pointer_dx The change in x of the pointer.
 * @param pointer_dy The change in y of the pointer.
 */
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

/**
 * @brief Sends the current player position to the server.
 */
void
send_position_tick(void)
{
	char buf_arr[13];
	char *buf = buf_arr;

	write_u8(&buf, CMT_PLAYER_POS);
	write_f32(&buf, player.x);
	write_f32(&buf, player.y);
	write_f32(&buf, player.rot);

	write(socket_fd, buf, sizeof(buf));
}