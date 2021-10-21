#define DROP_INTERVAL 500
#define MAX_CLIENT_POWERUPS MAX_CLIENTS * DT_N_ITEMS

uint64_t drop_id_gen = 0;

/**
 * @brief A structure containing a powerup and the client it belongs to.
 * @param client The client the powerup belongs to.
 * @param powerup The powerup.
 */
struct ClientPowerup
{
	struct Client *client;
	struct Powerup powerup;
};

struct ClientPowerup client_powerups[MAX_CLIENT_POWERUPS];
size_t n_client_powerups = 0;

/**
 * @brief Adds a client powerup to the client powerups array.
 * @param client The client to which the powerup belongs to.
 * @param type The type of powerup
 */
void
add_client_powerup(struct Client *client, enum DropType type)
{
	struct ClientPowerup *cli_pow;

	// First check if the client already has this powerup

	for (cli_pow = client_powerups;
		cli_pow < client_powerups + n_client_powerups;
		cli_pow++)
	{
		if (cli_pow->client == client && cli_pow->powerup.type == type)
		{
			cli_pow->powerup.time_activated = now();
			return;
		}
	}

	// Otherwise, add a new powerup

	client_powerups[n_client_powerups].client = client;
	client_powerups[n_client_powerups].powerup.time_activated = now();
	client_powerups[n_client_powerups].powerup.type = type;

	n_client_powerups++;

	// Enable flag on the client structure

	switch (type)
	{
		case DT_FAST_SHOOTING:
			Client_set_flag(client, CF_FAST_SHOOTING);
			break;

		case DT_BIG_BULLETS:
			Client_set_flag(client, CF_BIG_BULLETS);
			break;

		case DT_SUPER_SPEED:
			Client_set_flag(client, CF_SUPER_SPEED);
			break;

		default:
			fprintf(stderr, "Cannot enable client flag for "
				"unknown powerup of type %d\n", type);
			break;
	}
}

/**
 * @brief Copies a client powerup into another location.
 * @param src A pointer to the source client powerup.
 * @param dst A pointer to the destination client powerup.
 */
void
copy_client_powerup(struct ClientPowerup *src, struct ClientPowerup *dst)
{
	dst->client = src->client;
	copy_powerup(&dst->powerup, &src->powerup);
}

/**
 * @brief Removes a client powerup from the client powerups array.
 * @param client_powerup The client powerup to remove.
 */
void
del_client_powerup(struct ClientPowerup *client_powerup)
{
	// Disable flag on the client structure

	switch (client_powerup->powerup.type)
	{
		case DT_FAST_SHOOTING:
			Client_disable_flag(client_powerup->client,
				CF_FAST_SHOOTING);
			break;

		case DT_BIG_BULLETS:
			Client_disable_flag(client_powerup->client,
				CF_BIG_BULLETS);
			break;

		case DT_SUPER_SPEED:
			Client_disable_flag(client_powerup->client,
				CF_SUPER_SPEED);
			break;

		default:
			fprintf(stderr, "Cannot disable client flag for "
				"unknown powerup of type %d\n",
				client_powerup->powerup.type);
			break;
	}

	n_client_powerups--;

	// Move the last client powerup from the client powerups array to
	// the location of the deleted client powerup
	// This way `client_powerup` itself is overwritten and removed from
	// the array

	copy_client_powerup(client_powerups + n_client_powerups,
		client_powerup);
}

/**
 * @brief Updates all client powerups. Completed powerups are deleted.
 * Client flags are updated if needed.
 */
void
update_client_powerups(void)
{
	struct ClientPowerup *cli_pow;
	uint64_t time = now();

	for (cli_pow = client_powerups;
		cli_pow < client_powerups + n_client_powerups;
		cli_pow++)
	{
		if (time - cli_pow->powerup.time_activated
			> POWERUP_DURATION_USEC)
		{
			del_client_powerup(cli_pow);
			cli_pow--;
		}
	}
}

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

	#ifdef DEBUG_IO
	printf("Broadcast SMT_SPAWN_DROP { 1, %u, %u, %hhu, %lu }\n",
		x, y, type, drop->id);
	#endif
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

	#ifdef DEBUG_IO
	printf("Sent SMT_SPAWN_DROP to %d { %lu, { ", client->fd, n_drops);
	#endif

	while (drop < drops + n_drops)
	{
		write_u32(&ptr, drop->x);
		write_u32(&ptr, drop->y);
		write_u8(&ptr, drop->type);
		write_u64(&ptr, drop->id);

		drop++;

		#ifdef DEBUG_IO
		printf("{ %u, %u, %hhu, %lu }, ",
			drop->x, drop->y, drop->type, drop->id);
		#endif
	}

	message_client(client, buf, buf_size);

	#ifdef DEBUG_IO
	printf("} }\n");
	#endif
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
 * @brief Allows a client to activate a powerup.
 * @param client The client to give the powerup.
 * @param drop The drop containing the ID of the powerup.
 */
void
send_powerup(struct Client *client, struct Drop *drop)
{
	size_t buf_size;
	char *buf;
	char *ptr;

	switch (drop->type)
	{
		case DT_HEAL_PACK:
			if (client->player.health > MAX_HEALTH - HEAL_PACK_HEALTH)
			{
				client->player.health = MAX_HEALTH;
			}
			else
			{
				client->player.health += HEAL_PACK_HEALTH;
			}

			break;

		default:
			buf_size = 2;
			buf = malloc(buf_size);
			ptr = buf;

			write_u8(&ptr, SMT_POWERUP);
			write_u8(&ptr, drop->type);

			add_client_powerup(client, drop->type);
			message_client(client, buf, buf_size);

			#ifdef DEBUG_IO
			printf("Sent SMT_POWERUP to %d { %hhu }\n",
				client->fd, drop->type);
			#endif

			break;
	}
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

	#ifdef DEBUG_IO
	printf("Broadcast SMT_DESPAWN_DROP { %lu }\n", drop->id);
	#endif
}

/**
 * @brief Lets a client pick up a drop and removes the drop.
 * The client will get a powerup.
 * @param clients A pointer to the start of the clients array.
 * @param client The client that picks up the drop.
 * @param drop The drop that is picked up.
 */
void
pickup_drop(struct Client *clients, struct Client *client, struct Drop *drop)
{
	send_powerup(client, drop);
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