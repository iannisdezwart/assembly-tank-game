#define CF_FAST_SHOOTING 1 << 0
#define CF_BIG_BULLETS   1 << 1
#define CF_SUPER_SPEED   1 << 2

typedef uint8_t Client_flag_t;

/**
 * @brief Structure for a client connection.
 * @param fd The client's socket file descriptor.
 * @param write_queue A pointer to the head of the write queue.
 * @param player Details about the client's tank.
 * @param active Boolean indicating whether the client is active or not.
 * @param kill_time The last time this client has been killed.
 * @param flags Bit list of flags. See `CF_*` #defines.
 */
struct Client
{
	int fd;
	struct WriteQueueNode *write_queue;
	struct Tank player;
	bool active;
	uint64_t kill_time;
	Client_flag_t flags;
	uint8_t behaviour;
};

/**
 * @brief Sets a certain flag to a client.
 * @param client The client to set a flag on.
 * @param flag The flag to set.
 */
void
Client_set_flag(struct Client *client, Client_flag_t flag)
{
	client->flags |= flag;
}

/**
 * @brief Disables a certain flag from a client.
 * @param client The client to disable a flag from.
 * @param falg The flag to disable.
 */
void
Client_disable_flag(struct Client *client, Client_flag_t flag)
{
	client->flags &= ~flag;
}

/**
 * @brief Checks if a given client has a certain flag.
 * @param client The client to check.
 * @returns True if the client has the flag, false if not.
 */
bool
Client_has_flag(struct Client *client, Client_flag_t flag)
{
	return client->flags & flag;
}

/**
 * @brief Checks if a given client is currently in-game.
 * @param client The client to check.
 * @returns True if the client is active, false if not.
 */
bool
Client_is_active(struct Client *client)
{
	return client->fd != 0 && client->active;
}

/**
 * @brief Checks if a given client is alive.
 * @param client The client to check.
 * @returns True if the client is alive, false, if not.
 */
bool
Client_is_alive(struct Client *client)
{
	return client->player.health > 0;
}

/**
 * @brief Finds a client by its file descriptor.
 * @param clients A pointer to the start of the clients array.
 * @param fd The file descriptor of the client.
 * @returns A pointer to a client structure. Returns NULL if none was found.
 */
struct Client *
get_client_by_fd(struct Client *clients, int fd)
{
	struct Client *client;

	for (client = clients; client < clients + MAX_CLIENTS; client++)
	{
		if (Client_is_active(client) && client->fd == fd)
		{
			return client;
		}
	}

	return NULL;
}

/**
 * @brief Stores `new_client_fd` onto the `clients` array.
 * If the `clients` array is full, -1 is returned.
 * @param clients A pointer to the start of the clients array.
 * @param client_index An index to the first unused block.
 * @param new_client_fd The client file descriptor to store.
 * @returns The new `client_index`: an index to the new first unused block.
 */
ssize_t
add_client(struct Client *clients, size_t client_index, int new_client_fd)
{
	if (client_index >= MAX_CLIENTS || client_index < 0)
	{
		return -1;
	}

	clients[client_index].fd = new_client_fd;
	clients[client_index].write_queue = NULL;
	clients[client_index].player.health = MAX_HEALTH;
	clients[client_index].player.score = 0;
	clients[client_index].active = false;
	clients[client_index].flags = 0;
	clients[client_index].behaviour = 10;

	client_index++;

	while (client_index < MAX_CLIENTS
		&& Client_is_active(clients + client_index))
	{
		client_index++;
	}

	return client_index;
}

/**
 * @brief Removes an client from the clients array.
 * @param clients A pointer to the start of the clients array.
 * @param obsolete_client A pointer to the client to remove.
 * @returns The new `client_index`: the index to the removed client.
 */
size_t
del_client(struct Client *clients, struct Client *obsolete_client)
{
	printf("Client socket %d closed\n",
		obsolete_client->fd);

	if (obsolete_client->write_queue != NULL)
	{
		free_write_queue(obsolete_client->write_queue);
	}

	close(obsolete_client->fd);
	obsolete_client->fd = 0;

	return obsolete_client - clients;
}

/**
 * @brief Subtracts a behaviour point from a client.
 * The client is disconnected if they run out of behaviour points.
 * This function is called when a client sends gibberish over the network,
 * or has a terrible connection.
 * @param clients A pointer to the start of the clients array.
 * @param client The client that behaved badly.
 * @returns A boolean indicating whether the client should be disconnected
 */
bool
penalise_bad_client_behaviour(struct Client *clients, struct Client *client)
{
	client->behaviour--;
	return client->behaviour == 0;
}

/**
 * @brief Immediately sends a player a message that it has been kicked.
 * @param clients A pointer to the start of the clients array.
 * @param client The client that should be kicked.
 */
size_t
kick_client(struct Client *clients, struct Client *client)
{
	char buf[1];
	char *ptr = buf;

	printf("Kicked client %d because of bad behaviour\n",
		client->fd);

	write_u8(&ptr, SMT_BAD_BEHAVIOUR);
	write(client->fd, buf, sizeof(buf));

	return del_client(clients, client);
}