#define DROP_INTERVAL 500

/**
 * @brief Generates a random drop. The drop is added to the drops array
 * and broadcast to all clients.
 */
void
gen_drop(struct Client *clients)
{
	int x = random_int(DROP_WIDTH / 2, MAP_WIDTH - DROP_WIDTH / 2);
	int y = random_int(DROP_HEIGHT / 2, MAP_HEIGHT - DROP_WIDTH / 2);
	enum DropType type = random_int(0, DT_N_ITEMS - 1);

	size_t buf_size = 10;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	add_drop(x, y, type);

	write_u8(&ptr, SMT_SPAWN_DROP);
	write_u32(&ptr, x);
	write_u32(&ptr, y);
	write_u8(&ptr, type);

	broadcast(clients, buf, buf_size);
}