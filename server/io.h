/**
 * @brief Handles incoming messages to the server.
 * @param clients A pointer to the start of the clients array.
 * @param client A pointer to the client that sent the data.
 * @param read_buf Contains the read data.
 * @param read_buf_size Number of bytes on the buffer.
 * @returns A boolean indicating whether the client should be kicked.
 */
bool
handle_incoming_data(struct Client *clients, struct Client *client,
	char *read_buf, size_t read_buf_size)
{
	enum ClientMessageType msg_type;

	char *read_ptr = read_buf;
	char *write_buf;
	char *write_ptr;

	bullet_id_t bullet_id;
	float bullet_x;
	float bullet_y;
	float bullet_heading;
	float bullet_speed;
	uint8_t bullet_radius;

	#ifdef DEBUG_IO
	printf("read %lu bytes from socket\n",
		read_buf_size);
	#endif

	while (read_buf_size > 0)
	{
		msg_type = read_u8(&read_ptr);

		switch (msg_type)
		{
			case CMT_HANDSHAKE:
				if (read_buf_size < 1)
				{
					fprintf(stderr,
						"Received a CMT_HANDSHAKE message of invalid length %lu\n",
						read_buf_size);

					break;
				}

				// Disconnect client if they already sent a handshake

				if (client->active)
				{
					printf("Disconnected client %d "
						"because they sent two "
						"handshakes\n", client->fd);

					return true;
				}

				client->player.username_size  = read_u8(&read_ptr);
				strncpy(client->player.username, read_ptr,
					TANK_USERNAME_MAX_SIZE);

				write_buf = malloc(5);
				write_ptr = write_buf;

				write_u8(&write_ptr, SMT_HANDSHAKE);
				write_u32(&write_ptr, client->fd);
				client->active = true;
				message_client(client, write_buf, 5);

				#ifdef DEBUG_IO
				printf("Received CMT_HANDSHAKE\n");
				printf("Sent SMT_HANDSHAKE to %d { %d }\n",
					client->fd, client->fd);
				#endif

				respawn_client(client);
				send_all_drops(client);

				read_buf_size -= 17;
				break;

			case CMT_PLAYER_POSITION:
				if (read_buf_size < 13)
				{
					fprintf(stderr,
						"Received a CMT_PLAYER_POSITION message of invalid length %lu\n",
						read_buf_size);

					break;
				}

				read_buf_size -= 13;

				if (!client->active || !Client_is_alive(client))
				{
					break;
				}

				client->player.x = read_f32(&read_ptr);
				client->player.y = read_f32(&read_ptr);
				client->player.rot = read_f32(&read_ptr);

				#ifdef DEBUG_IO
				printf("Received CMT_PLAYER_POSITION "
					"{ %.1f, %.1f, %.1f }\n",
					client->player.x, client->player.y,
					client->player.rot);
				#endif

				break;

			case CMT_SHOOT_BULLET:
				if (read_buf_size < 13)
				{
					fprintf(stderr,
						"Received a CMT_SHOOT_BULLET message of invalid length %lu\n",
						read_buf_size);

					break;
				}

				read_buf_size -= 13;

				if (!client->active || !Client_is_alive(client))
				{
					printf("player tried to shoot while dead\n");
					break;
				}

				// Create buffer for message

				write_buf = malloc(30);
				write_ptr = write_buf;

				// Get bullet data

				bullet_id = bullet_id_gen++;
				bullet_x = read_f32(&read_ptr);
				bullet_y = read_f32(&read_ptr);
				bullet_heading = read_f32(&read_ptr);

				#ifdef DEBUG_IO
				printf("Received CMT_SHOOT_BULLET "
					"{ %lu, %.1f, %.1f, %.1f }\n",
					bullet_id, bullet_x, bullet_y,
					bullet_heading);
				#endif

				if (Client_has_flag(client, CF_BIG_BULLETS))
				{
					bullet_radius = BULLET_RADIUS_BIG;
				}
				else
				{
					bullet_radius = BULLET_RADIUS_NORMAL;
				}

				if (Client_has_flag(client, CF_FAST_SHOOTING))
				{
					bullet_speed = BULLET_SPEED_FAST;
				}
				else
				{
					bullet_speed = BULLET_SPEED_NORMAL;
				}

				// Add a bullet to the bullets array

				add_bullet(bullet_id, bullet_x, bullet_y,
					bullet_heading, bullet_radius,
					bullet_speed, client->fd);

				// Broadcast message to other clients that a new bullet has spawned

				write_u8(&write_ptr, SMT_SPAWN_BULLET);
				write_u64(&write_ptr, bullet_id);
				write_f32(&write_ptr, bullet_x);
				write_f32(&write_ptr, bullet_y);
				write_f32(&write_ptr, bullet_heading);
				write_u8(&write_ptr, bullet_radius);
				write_f32(&write_ptr, bullet_speed);
				write_u32(&write_ptr, client->fd); // Owner

				broadcast(clients, write_buf, 30);

				#ifdef DEBUG_IO
				printf("Broadcast SMT_SPAWN_BULLET { %lu, "
					"%.1f, %.1f, %.1f, %hhu, %.1f "
					"%u }\n", bullet_id, bullet_x,
					bullet_y, bullet_heading, bullet_radius,
					bullet_speed, client->fd);
				#endif

				break;

			default:
				fprintf(stderr,
					"Received unknown message of type %u\n",
					msg_type);

				return penalise_bad_client_behaviour(
					clients, client);
		}
	}

	return false;
}

/**
 * @brief Handles IO for a client.
 * @param clients A pointer to the start of the clients array.
 * Needed for deleting the socket.
 * @param client A pointer to the client to handle IO for.
 * @param client_index A pointer to the index to the first unused client block.
 * @returns 1 if there was any IO to process, 0 if no IO was processed.
 */
uint8_t
handle_io(struct Client *clients, struct Client *client, size_t *client_index)
{
	ssize_t bytes_rw;
	struct WriteQueueNode *next_wq_node;
	char read_buf[READ_BUF_SIZE];
	uint8_t done_io;

	int socket_state;
	int socket_err;
	socklen_t socket_error_size = sizeof(socket_err);

	done_io = 0;

	// Check if the socket is still up

	socket_state = getsockopt(client->fd, SOL_SOCKET, SO_ERROR,
		&socket_err, &socket_error_size);

	if (socket_state != 0)
	{
		// TODO: check if this does causes problems when two sockets
		// disconnect at the same time

		*client_index = del_client(clients, client);
	}

	if (socket_err != 0)
	{
		fprintf(stderr, "Client socket error: %s\n",
			strerror(socket_err));
	}

	// Write

	if (client->write_queue != NULL)
	{
		// Write the buffer

		bytes_rw = write(client->fd, client->write_queue->buf_shr_ptr->ptr,
			client->write_queue->buf_size);

		if (bytes_rw < 0)
		{
			fprintf(stderr, "Wasn't able to write %lu bytes to client socket %d\n",
				client->write_queue->buf_size, client->fd);

			// Try writing at a later point in time

			goto read;
		}

		// Free the write queue node we just processed

		done_io = true;
		next_wq_node = client->write_queue->next;
		SharedPtr_disown(client->write_queue->buf_shr_ptr);
		free(client->write_queue);

		// Shift the write queue

		client->write_queue = next_wq_node;
	}

	read:

	bytes_rw = read(client->fd, read_buf, READ_BUF_SIZE);

	if (bytes_rw < 0)
	{
		if (errno != EWOULDBLOCK && errno != EAGAIN)
		{
			fprintf(stderr, "Wasn't able to read from client socket %d\n",
				client->fd);
		}

		goto ret;
	}

	if (bytes_rw == 0)
	{
		// EOF

		// TODO: check if this does causes problems when two sockets
		// disconnect at the same time

		*client_index = del_client(clients, client);

		goto ret;
	}

	done_io = true;

	if (handle_incoming_data(clients, client, read_buf, bytes_rw))
	{
		// If handle_incoming_data returned true,
		// the client should be kicked

		*client_index = kick_client(clients, client);
	}

	ret:
	return done_io;
}