/**
 * @brief Queues data to be written to a client.
 * @param client The client to write to.
 * @param buf_shr_ptr A shared pointer to the buffer to queue.
 * @param buf_size The number of bytes on the buffer.
 */
void
queue_write(struct Client *client, struct SharedPtr *buf_shr_ptr,
	size_t buf_size)
{
	struct WriteQueueNode *last_node;

	if (client->write_queue == NULL)
	{
		client->write_queue = new(struct WriteQueueNode);
		client->write_queue->buf_shr_ptr = buf_shr_ptr;
		client->write_queue->buf_size = buf_size;
		client->write_queue->next = NULL;
	}
	else
	{
		last_node = client->write_queue;

		while (last_node->next != NULL)
		{
			last_node = last_node->next;
		}

		last_node->next = new(struct WriteQueueNode);
		last_node->next->buf_shr_ptr = buf_shr_ptr;
		last_node->next->buf_size = buf_size;
		last_node->next->next = NULL;
	}
}

/**
 * @brief Broadcasts a message to every client.
 * @param clients A pointer to the start of the clients array.
 * @param buf A pointer to the data to queue.
 * @param buf_size The number of bytes on the buffer.
 */
void
broadcast(struct Client *clients, char *buf, size_t buf_size)
{
	struct SharedPtr *buf_shr_ptr = SharedPtr_create(buf, 0);

	for (client_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (Client_is_active(clients + i))
		{
			queue_write(clients + i, buf_shr_ptr, buf_size);
			buf_shr_ptr->handles++;
		}
	}
}

/**
 * @brief Sends a message to a single client.
 * @param client A pointer to the client to send the message to.
 * @param buf A pointer to the data to send.
 * @param buf_size The number of bytes on the buffer.
 */
void
message_client(struct Client *client, char *buf, size_t buf_size)
{
	struct SharedPtr *buf_shr_ptr = SharedPtr_create(buf, 1);
	queue_write(client, buf_shr_ptr, buf_size);
}

/**
 * @brief Broadcasts a message to every client except one.
 * @param clients A pointer to the start of the clients array.
 * @param skip_client A pointer to the client to skip.
 * @param buf A pointer to the data to queue.
 * @param buf_size The number of bytes on the buffer.
 */
void
broadcast_except(struct Client *clients, struct Client *skip_client,
	char *buf, size_t buf_size)
{
	struct SharedPtr *buf_shr_ptr = SharedPtr_create(buf, 0);

	for (client_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (Client_is_active(clients + i) && clients + i != skip_client)
		{
			queue_write(clients + i, buf_shr_ptr, buf_size);
			buf_shr_ptr->handles++;
		}
	}
}