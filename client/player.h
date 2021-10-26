#define PLAYER_SPEED_NORMAL 0.03
#define PLAYER_SPEED_SUPER 0.04
#define MAX_PLAYERS 255 // Also change `MAX_CLIENTS` in `server.c`
#define player_t uint8_t

extern struct Tank player;
extern struct Tank other_players[MAX_PLAYERS - 1];
extern player_t num_other_players;
extern bool super_speed_enabled;

/**
 * @brief Translates an in-game coordinate to a pixel on the screen.
 * @param x The in-game x coordinate.
 * @param y The in-game y coordinate.
 */
extern struct Point
translate(float x, float y);

/**
 * @brief Translates a pixel coordinate to the in-game coordinate.
 * @param x The x coordinate of the pixel.
 * @param y The y coordinate of the pixel.
 */
extern struct Point
untranslate(int x, int y);

/**
 * @returns The current player speed.
 */
extern float
get_player_speed(void);

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

	player.x += mult * get_player_speed() * dx * dt;
	player.y += mult * get_player_speed() * dy * dt;

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
 * @param x The x coordinate of the other player.
 * @param y The y coordinate of the other player.
 * @param rot The rotation of the other player.
 * @param health The health of the other player.
 * @param username_size The length of the other player's username.
 * @param username The other player's username.
 */
void
add_other_player(float x, float y, float rot, health_t health,
	score_t score, uint8_t username_size, char *username)
{
	other_players[num_other_players].x = x;
	other_players[num_other_players].y = y;
	other_players[num_other_players].rot = rot;
	other_players[num_other_players].score = score;
	other_players[num_other_players].health = health;
	other_players[num_other_players].username_size = username_size;
	strncpy(other_players[num_other_players].username, username,
		username_size);


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