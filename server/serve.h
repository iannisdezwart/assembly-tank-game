/**
 * @brief Accepts any new connections and handles IO.
 * @param server_fd The server's file descriptor.
 */
void
serve(int server_fd)
{
	uint64_t latest_server_tick_time;
	uint64_t latest_dt_update_time;

	struct Client clients[MAX_CLIENTS] = { 0 };
	size_t client_index = 0;

	int new_client_fd;
	struct sockaddr_in client_address;
	socklen_t client_address_size = sizeof(client_address);

	bool done_io;

	latest_dt_update_time = latest_server_tick_time = now();

	while (true)
	{
		done_io = false;

		// If there is a new connection, accept it

		new_client_fd = accept(server_fd, (struct sockaddr *) &client_address,
			&client_address_size);

		if (new_client_fd < 0)
		{
			if (errno != EWOULDBLOCK && errno != EAGAIN)
			{
				fprintf(stderr, "accept() error: %s\n",
					strerror(errno));
			}

			// There is no new connection

			goto io;
		}

		done_io = true;
		set_nonblocking(new_client_fd);

		client_index = add_client(clients, client_index, new_client_fd);

		printf("new client %d\n", new_client_fd);

		if (client_index == -1)
		{
			fputs("couldn't accept new client because the "
				"clients array is full\n", stderr);
		}

		io:

		// If there is IO, handle it

		for (client_t i = 0; i < MAX_CLIENTS; i++)
		{
			if (clients[i].fd != 0)
			{
				if (handle_io(clients, clients + i, &client_index))
				{
					done_io = true;
				}
			}
		}

		// Broadcast player positions and removed bullets to clients,
		// and respawn dead clients

		if (now() - latest_server_tick_time >= USEC_PER_SERVER_TICK)
		{
			for (client_t i = 0; i < MAX_CLIENTS; i++)
			{
				if (Client_is_active(clients + i))
				{
					respawn_dead_client(clients + i);
					done_io = true;
				}
			}

			for (client_t i = 0; i < MAX_CLIENTS; i++)
			{
				if (Client_is_active(clients + i))
				{
					send_player_positions(clients, clients + i);

					latest_server_tick_time = now();
					done_io = true;
				}
			}

			send_deleted_bullets(clients);
		}

		// Update bullets and check if players are hit

		update_bullets();
		handle_bullet_hits(clients);

		// Update dt

		dt = now() - latest_dt_update_time;
		latest_dt_update_time = now();
		dt /= USEC_PER_DT;


		// If we're idle, we can give other processes some CPU time

		if (!done_io)
		{
			usleep(IDLE_TIMEOUT_USEC);
		}
	}
}