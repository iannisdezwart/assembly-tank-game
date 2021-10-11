#define BULLET_COLOUR 0xFF, 0x78, 0x78
#define BULLET_RADIUS 8

#define BULLET_SPEED 0.05
#define BULLET_DAMAGE 10

#define MAX_BULLETS 1024

struct Bullet
{
	float x;
	float y;

	float heading;
	float speed;
};

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
 * @param x The x coordinate of the starting position of the bullet.
 * @param y The y coordinate of the starting position of the bullet.
 * @param heading The heading of the bullet.
 */
void
add_bullet(float x, float y, float heading)
{
	bullets[n_bullets].x = x;
	bullets[n_bullets].y = y;
	bullets[n_bullets].heading = heading;
	bullets[n_bullets].speed = BULLET_SPEED;

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
	dst->x = src->x;
	dst->y = src->y;
	dst->heading = src->heading;
	dst->speed = src->speed;
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

		// Remove dead bullets

		if (bullet->x > 0 && bullet->x < MAP_WIDTH
			&& bullet->y > 0 && bullet->y < MAP_HEIGHT)
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