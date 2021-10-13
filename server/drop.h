/**
 * @brief Generates a random drop. The drop is added to the drops array
 * and broadcast to all clients.
 */
void
gen_drop(struct Client *clients)
{
	int x = random_int(DROP_WIDTH / 2, MAP_WIDTH + DROP_WIDTH / 2);
	int y = random_int(DROP_WIDTH / 2, MAP_WIDTH + DROP_WIDTH / 2);
	enum DropType type;

	char *buf;
	char *ptr = buf;
	size_t buf_size;

	add_drop(x, y, type);

	broadcast(clients, buf, buf_size);
}