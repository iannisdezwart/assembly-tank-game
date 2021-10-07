#define SERVER_HOSTNAME "127.0.0.1"
#define SERVER_PORT 4242

int socket_fd;

/**
 * @brief Initialises the connection to the server.
 */
void
setup_socket(void)
{
	char buf[1024];
	struct sockaddr_in server_addr;

	socket_fd = socket(AF_INET, SOCK_STREAM, 0);

	if (socket_fd < 0)
	{
		fprintf(stderr, "Failed to create a socket: %s\n",
			strerror(errno));
		exit(1);
	}

	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(SERVER_PORT);


	if (inet_pton(AF_INET, SERVER_HOSTNAME, &server_addr.sin_addr) <= 0)
	{
		fprintf(stderr, "Failed to decode address %s to binary form\n",
			SERVER_HOSTNAME);
		exit(1);
	}

	if (connect(socket_fd, (struct sockaddr *) &server_addr,
		sizeof(server_addr)) < 0)
	{
		fprintf(stderr, "Failed to connect to the game server: %s\n",
			strerror(errno));
	}

	strcpy(buf, "Hello, World!");
	send(socket_fd, buf, strlen(buf), 0);
	read(socket_fd, buf, 1024);
	printf("got a message from the server: %s\n", buf);
}

/**
 * @brief Closes the client socket.
 */
void
cleanup_socket(void)
{
	close(socket_fd);
}