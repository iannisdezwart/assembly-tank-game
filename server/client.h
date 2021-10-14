/**
 * @brief Structure for a client connection.
 * @param fd The client's socket file descriptor.
 * @param write_queue A pointer to the head of the write queue.
 * @param player Details about the client's tank.
 */
struct Client
{
	int fd;
	struct WriteQueueNode *write_queue;
	struct Tank player;
	bool active;
	uint64_t kill_time;
};

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
	clients[client_index].active = false;

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

	obsolete_client->fd = 0;

	if (obsolete_client->write_queue != NULL)
	{
		free_write_queue(obsolete_client->write_queue);
	}

	return obsolete_client - clients;
}