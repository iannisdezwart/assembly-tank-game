#define DROP_INTERVAL 500

uint64_t drop_id_gen = 0;

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

	size_t buf_size = 26;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	drop = add_drop(x, y, type, drop_id_gen++);

	write_u8(&ptr, SMT_SPAWN_DROP);
	write_u64(&ptr, 1); // 1 new drop

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
	size_t buf_size = 9 + n_drops * 17;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	struct Drop *drop = drops;

	write_u8(&ptr, SMT_SPAWN_DROP);
	write_u64(&ptr, n_drops);

	while (drop < drops + n_drops)
	{
		write_u32(&ptr, drop->x);
		write_u32(&ptr, drop->y);
		write_u8(&ptr, drop->type);
		write_u64(&ptr, drop->id);

		drop++;
	}

	message_client(client, buf, buf_size);
}

/**
 * @brief Checks if a drop is in range of a client to pick up.
 * @param drop The drop to check.
 * @param client The client to check.
 * @returns True if the client can pick up the drop, false if not.
 */
bool
drop_in_range(struct Drop *drop, struct Client *client)
{
	float dx = client->player.x - drop->x;
	float dy = client->player.y - drop->y;

	return hypot(dx, dy) < (TANK_BODY_RADIUS + DROP_WIDTH / 2);
}

/**
 * @brief Removes a drop from the drop array and broadcasts the id of this
 * drop to all clients so they can also remove it from their drop array.
 * @param clients A pointer to the start of the clients array.
 * @param drop The drop to remove.
 */
void
send_del_drop(struct Client *clients, struct Drop *drop)
{
	size_t buf_size = 9;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	write_u8(&ptr, SMT_DESPAWN_DROP);
	write_u64(&ptr, drop->id);

	broadcast(clients, buf, buf_size);
	del_drop(drop);
}

/**
 * @brief Lets a client pick up a drop and removes the drop.
 * @param clients A pointer to the start of the clients array.
 * @param client The client that picks up the drop.
 * @param drop The drop that is picked up.
 */
void
pickup_drop(struct Client *clients, struct Client *client, struct Drop *drop)
{
	send_del_drop(clients, drop);
}

/**
 * @brief Handles drop pickups for a given client.
 * The client will get the powerup and the drop will be removed.
 * @param clients A pointer to the start of the clients array.
 * @param client The client to check drop pickups for.
 */
void
handle_drop_pickups_for_client(struct Client *clients, struct Client *client)
{
	struct Drop *drop;

	for (drop = drops; drop < drops + n_drops; drop++)
	{
		if (drop_in_range(drop, client))
		{
			pickup_drop(clients, client, drop);
		}
	}
}

/**
 * @brief Handles drop pickups.
 * @param clients A pointer to the start of the clients array.
 */
void
handle_drop_pickups(struct Client *clients)
{
	struct Client *client;

	for (client = clients; client < clients + MAX_CLIENTS; client++)
	{
		if (Client_is_active(client))
		{
			handle_drop_pickups_for_client(clients, client);
		}
	}
}