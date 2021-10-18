/**
 * @brief Creates a new socket for a server.
 * The socket is bound, and starts listening.
 * @returns The spawned server's file descriptor.
 */
int
create_server(void)
{
	int server_fd;
	int flag = 1;

	struct sockaddr_in server_address;

	server_fd = socket(AF_INET, SOCK_STREAM, 0);

	if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int)) < 0)
	{
		fprintf(stderr, "Failed to set socket option SO_REUSEADDR\n");
	}

	if (server_fd == 0)
	{
		die("Failed to create a socket");
	}

	server_address.sin_family = AF_INET;
	server_address.sin_addr.s_addr = INADDR_ANY;
	server_address.sin_port = htons(PORT);

	if (bind(server_fd, (struct sockaddr *) &server_address,
		sizeof(server_address)) < 0)
	{
		die("Failed to bind socket");
	}

	listen(server_fd, 20);

	// Set socket options

	set_nonblocking(server_fd);

	return server_fd;
}