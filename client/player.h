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
extern void
update_player(int8_t dx, int8_t dy, int pointer_dx, int pointer_dy);

/**
 * @brief Sends the current player position to the server.
 */
extern void
send_position_tick(void);

/**
 * @brief Discards all entries in the `other_players` array.
 */
extern void
delete_other_players(void);

/**
 * @brief Adds a player to the `other_players` array.
 * @param x The x coordinate of the other player.
 * @param y The y coordinate of the other player.
 * @param rot The rotation of the other player.
 * @param health The health of the other player.
 * @param score The score of the other player.
 * @param username_size The length of the other player's username.
 * @param username The other player's username.
 */
extern void
add_other_player(float x, float y, float rot, health_t health,
	score_t score, uint8_t username_size, char *username);

/**
 * @brief Renders the other players.
 */
extern void
update_other_players(void);