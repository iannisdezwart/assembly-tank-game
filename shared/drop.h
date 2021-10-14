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
 */
struct Drop
{
	int x;
	int y;
	enum DropType type;
};

#define MAX_DROPS 128

struct Drop drops[MAX_DROPS];
size_t n_drops = 0;

/**
 * @brief Adds a drop to the drops array.
 * @param x The x coordinate of the drop.
 * @param y The y coordinate of the drop.
 * @param type The type of drop.
 */
void
add_drop(int x, int y, enum DropType type)
{
	drops[n_drops].x = x;
	drops[n_drops].y = y;
	drops[n_drops].type = type;
	n_drops++;
}

/**
 * @brief Remove a drop from the drops array.
 * @param drop A pointer to the drop to remove.
 */
void
del_drop(struct Drop *drop)
{
	n_drops--;

	// Shift the elements after `drop` one place to the left
	// This way `drop` itself is overwritten and removed from the array

	while (drop < drops + n_drops)
	{
		drop->x = drop[1].x;
		drop->y = drop[1].y;
		drop->type = drop[1].type;
		drop++;
	}
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