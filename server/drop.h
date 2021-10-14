#define DROP_INTERVAL 500

/**
 * @brief Generates a random drop. The drop is added to the drops array
 * and broadcast to all clients.
 */
void
gen_drop(struct Client *clients)
{
	struct Drop *drop;

	int x = random_int(DROP_WIDTH / 2, MAP_WIDTH - DROP_WIDTH / 2);
	int y = random_int(DROP_HEIGHT / 2, MAP_HEIGHT - DROP_WIDTH / 2);
	enum DropType type = random_int(0, DT_N_ITEMS - 1);

	size_t buf_size = 10;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	drop = add_drop(x, y, type);

	write_u8(&ptr, SMT_SPAWN_DROP);
	write_u32(&ptr, x);
	write_u32(&ptr, y);
	write_u8(&ptr, type);
	write_u64(&ptr, drop->id);

	broadcast(clients, buf, buf_size);
}

/**
 * @brief Sends all drops currently on the drops array to a client.
 */
void
send_all_drops(struct Client *client)
{
	struct Drop *drop = drops;

	while (drop < drops + n_drops)
	{
		message_client(client, buf, buf_size);
	}
}
