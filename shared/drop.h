#define DROP_WIDTH 30
#define DROP_HEIGHT DROP_WIDTH

enum DropType
{
	DT_HEAL_PACK,
	DT_FAST_SHOOTING,
	DT_BIG_BULLETS,
	DT_SUPER_SPEED,
	DT_N_ITEMS
};

/**
 * @brief Structure for a drop.
 * @param x The x coordinate of the drop.
 * @param y The y coordinate of the drop.
 * @param type The type of drop.
 * @param id The id of the drop.
 */
struct Drop
{
	int x;
	int y;
	enum DropType type;
	uint64_t id;
};

#define MAX_DROPS 128

struct Drop drops[MAX_DROPS];
size_t n_drops = 0;
uint64_t drop_id_gen = 0;

/**
 * @brief Adds a drop to the drops array.
 * @param x The x coordinate of the drop.
 * @param y The y coordinate of the drop.
 * @param type The type of drop.
 * @returns A pointer to the new drop.
 */
struct Drop *
add_drop(int x, int y, enum DropType type)
{
	drops[n_drops].x = x;
	drops[n_drops].y = y;
	drops[n_drops].type = type;
	drops[n_drops].id = drop_id_gen++;
	n_drops++;

	return drops + n_drops - 1;
}

/**
 * @brief Copies a drop.
 * @param src A pointer to the source drop.
 * @param dst A pointer to the destination drop.
 */
void
copy_drop(struct Drop *src, struct Drop *dst)
{
	dst->x    = src->x;
	dst->y    = src->y;
	dst->type = src->type;
	dst->id   = src->id;
}

/**
 * @brief Remove a drop from the drops array.
 * @param drop A pointer to the drop to remove.
 */
void
del_drop(struct Drop *drop)
{
	n_drops--;

	// Move the last drop from the drops array to the location of the
	// deleted drop
	// This way `drop` itself is overwritten and removed from the array

	copy_drop(drops + n_drops, drop);
}

/**
 * @brief Remove a drop from the drops array by id.
 * @param id The id of the drop to remove.
 */
void
del_drop_by_id(uint64_t id)
{
	struct Drop *drop = drops;

	while (drop->id != id)
	{
		drop++;
	}

	del_drop(drop);
}

/**
 * @brief Checks if the drops array is full.
 * @returns True if the drops array is full, false otherwise.
 */
bool
drops_full(void)
{
	return n_drops == MAX_DROPS;
}