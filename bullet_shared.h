#define BULLET_COLOUR 0x78, 0x78, 0xFF
#define BULLET_COLOUR_OPPONENT 0xFF, 0x78, 0x78
#define BULLET_RADIUS 8

#define BULLET_SPEED 0.05
#define BULLET_RELOAD_SPEED 100000
#define BULLET_DAMAGE 10

#define MAX_BULLETS 1024

typedef uint64_t bullet_id_t;

struct Bullet
{
	bullet_id_t id;
	bool destroy_on_next_update;

	float x;
	float y;

	float heading;
	float speed;

	int owner;
};

/**
 * @brief Checks if a bullet is active. A bullet is active if its
 * `destroy_on_next_update` flag is set to false.
 * @param bullet The bullet to check.
 * @returns True if the bullet is active, false otherwise.
 */
bool
Bullet_is_active(struct Bullet *bullet)
{
	return !bullet->destroy_on_next_update;
}

struct Bullet bullets_arr[MAX_BULLETS];
struct Bullet *bullets = bullets_arr;
struct Bullet new_bullets_arr[MAX_BULLETS];
struct Bullet *new_bullets = new_bullets_arr;

size_t n_bullets = 0;

/**
 * @brief Moves a bullet forward one tick of time.
 * @param bullet The bullet to move.
 */
void
move_bullet(struct Bullet *bullet)
{
	float dx = cos(bullet->heading);
	float dy = sin(bullet->heading);

	bullet->x += dx * bullet->speed * dt;
	bullet->y += dy * bullet->speed * dt;
}

/**
 * @brief Adds a new bullet struct to the bullet array.
 * @param bullet_id The id of the bullet.
 * @param x The x coordinate of the starting position of the bullet.
 * @param y The y coordinate of the starting position of the bullet.
 * @param heading The heading of the bullet.
 * @param owner The id of the owner of the bullet.
 */
void
add_bullet(bullet_id_t id, float x, float y, float heading, int owner)
{
	bullets[n_bullets].id = id;
	bullets[n_bullets].x = x;
	bullets[n_bullets].y = y;
	bullets[n_bullets].heading = heading;
	bullets[n_bullets].speed = BULLET_SPEED;
	bullets[n_bullets].owner = owner;
	bullets[n_bullets].destroy_on_next_update = false;

	n_bullets++;
}

/**
 * @brief Copies a bullet.
 * @param src The original bullet.
 * @param dst The destination for the bullet.
 */
void
copy_bullet(struct Bullet *src, struct Bullet *dst)
{
	memcpy(dst, src, sizeof(struct Bullet));
}

/**
 * @brief Schedules a bullet to be removed in the next update.
 * @param bullet The the bullet to remove.
 */
void
del_bullet(struct Bullet *bullet)
{
	bullet->destroy_on_next_update = true;
}

/**
 * @brief Finds a bullet by its id and schedules it to be removed
 * in the next update.
 * @param bullet_id The id of the bullet to remove.
 */
void
del_bullet_by_id(bullet_id_t bullet_id)
{
	for (struct Bullet *it = bullets; it < bullets + n_bullets; it++)
	{
		if (it->id == bullet_id)
		{
			del_bullet(it);
			return;
		}
	}
}

/**
 * @brief Updates the location of bullets.
 */
void
update_bullets(void)
{
	struct Bullet *bullet;
	int new_i = 0;

	for (int i = 0; i < n_bullets; i++)
	{
		bullet = bullets + i;

		move_bullet(bullet);

		// Keep alive bullets and remove dead bullets

		if (bullet->x > 0 && bullet->x < MAP_WIDTH
			&& bullet->y > 0 && bullet->y < MAP_HEIGHT
			&& !bullet->destroy_on_next_update)
		{
			copy_bullet(bullet, new_bullets + new_i);
			new_i++;
		}
	}

	// Update the number of bullets

	n_bullets = new_i;

	// Swap the pointers to the `bullets` and `new_bullets` array
	// This is a sneaky way to "move" the new bullets to the current bullets
	// array without having to actually copy them.
	// We simply relabel the `new_bullet` array as the new `bullet` array.

	bullet = new_bullets;
	new_bullets = bullets;
	bullets = bullet;
}