#define BULLET_COLOUR 0x78, 0x78, 0xFF
#define BULLET_COLOUR_OPPONENT 0xFF, 0x78, 0x78
#define BULLET_RADIUS_NORMAL  8
#define BULLET_RADIUS_BIG    16

#define BULLET_SPEED_NORMAL 0.05
#define BULLET_SPEED_FAST   0.10
#define BULLET_RELOAD_SPEED 100000
#define BULLET_DAMAGE_BIG 20
#define BULLET_DAMAGE_NORMAL 10

#define MAX_BULLETS 1024

typedef uint64_t bullet_id_t;

/**
 * @brief A structure for a bullet.
 * @param id The unique identifier of the bullet.
 * @param destroy_on_next_update If this flag is enabled, the bullet will
 * despawn in the next server tick.
 * @param x The x coordinate of the bullet.
 * @param y The y coordinate of the bullet.
 * @param heading The heading of the bullet.
 * @param speed The speed of the bullet.
 * @param radius The radius of the bullet.
 * @param owner The unique identifier of the client owning the bullet.
 */
struct Bullet
{
	bullet_id_t id;
	bool destroy_on_next_update;

	float x;
	float y;

	float heading;
	float speed;
	uint8_t radius;

	int owner;
};

/**
 * @brief Checks if a bullet is active. A bullet is active if its
 * `destroy_on_next_update` flag is set to false.
 * @param bullet The bullet to check.
 * @returns True if the bullet is active, false otherwise.
 */
extern bool
Bullet_is_active(struct Bullet *bullet);

extern struct Bullet bullets_arr[MAX_BULLETS];
struct Bullet *bullets = bullets_arr;
extern struct Bullet new_bullets_arr[MAX_BULLETS];
struct Bullet *new_bullets = new_bullets_arr;

extern size_t n_bullets;

/**
 * @brief Moves a bullet forward one tick of time.
 * @param bullet The bullet to move.
 */
extern void
move_bullet(struct Bullet *bullet);

/**
 * @brief Adds a new bullet struct to the bullet array.
 * @param bullet_id The id of the bullet.
 * @param x The x coordinate of the starting position of the bullet.
 * @param y The y coordinate of the starting position of the bullet.
 * @param heading The heading of the bullet.
 * @param radius The radius of the bullet.
 * @param speed The speed of the bullet.
 * @param owner The id of the owner of the bullet.
 */
extern void
add_bullet(bullet_id_t id, float x, float y, float heading, uint8_t radius,
	float speed, int owner);

/**
 * @brief Copies a bullet.
 * @param src The original bullet.
 * @param dst The destination for the bullet.
 */
extern void
copy_bullet(struct Bullet *dst, struct Bullet *src);

/**
 * @brief Schedules a bullet to be removed in the next update.
 * @param bullet The the bullet to remove.
 */
extern void
del_bullet(struct Bullet *bullet);

/**
 * @brief Finds a bullet by its id and schedules it to be removed
 * in the next update.
 * @param bullet_id The id of the bullet to remove.
 */
extern void
del_bullet_by_id(bullet_id_t bullet_id);

/**
 * @brief Updates the location of bullets.
 */
extern void
update_bullets(void);