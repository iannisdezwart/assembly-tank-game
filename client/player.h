#define PLAYER_SPEED 0.03
#define MAX_PLAYERS 255 // Also change `MAX_CLIENTS` in `server.c`
#define player_t uint8_t

struct Tank player;
struct Tank other_players[MAX_PLAYERS - 1];
player_t num_other_players = 0;


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
 * The position of the player is only updated if the player is alive.
 * @param dx The change in x of the tank.
 * @param dy The change in y of the tank.
 * @param pointer_dx The change in x of the pointer.
 * @param pointer_dy The change in y of the pointer.
 */
void
update_player(int8_t dx, int8_t dy, int pointer_dx, int pointer_dy)
{
	if (player.health == 0)
	{
		return;
	}

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
	render_health_bar(&player);
}

/**
 * @brief Sends the current player position to the server.
 */
void
send_position_tick(void)
{
	char buf[13];
	char *ptr = buf;

	write_u8(&ptr, CMT_PLAYER_POSITION);
	write_f32(&ptr, player.x);
	write_f32(&ptr, player.y);
	write_f32(&ptr, player.rot);
	write_u8(&ptr, player.health);

	write_to_socket(socket_fd, buf, sizeof(buf));
}

/**
 * @brief Discards all entries in the `other_players` array.
 */
void
delete_other_players(void)
{
	num_other_players = 0;
}

/**
 * @brief Adds a player to the `other_players` array.
 */
void
add_other_player(float x, float y, float rot, health_t health)
{
	other_players[num_other_players].x = x;
	other_players[num_other_players].y = y;
	other_players[num_other_players].rot = rot;
	other_players[num_other_players].health = health;

	num_other_players++;
}

/**
 * @brief Renders the other players.
 */
void
update_other_players(void)
{
	for (player_t i = 0; i < num_other_players; i++)
	{
		render_tank(other_players + i);
		render_health_bar(other_players + i);
	}
}