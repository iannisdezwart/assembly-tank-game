#define SERVER_HOSTNAME "127.0.0.1"
#define SERVER_PORT 4242

int socket_fd;

/**
 * @brief Initialises the connection to the server.
 */
void
setup_socket(void)
{
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

	// Set socket options

	set_nonblocking(socket_fd);
	set_no_delay(socket_fd);
}

/**
 * @brief Writes to the server.
 * @param socket_fd The file descriptor of the client socket.
 * @param buf A pointer to the buffer to write.
 * @param buf_size The size of the buffer in bytes.
 */
void
write_to_socket(int socket_fd, char *buf, size_t buf_size)
{
	if (write(socket_fd, buf, buf_size) < 0)
	{
		fprintf(stderr, "Failed to write %ld bytes to the client socket: %s\n",
			buf_size, strerror(errno));
	}

	flush_socket(socket_fd);
}

/**
 * @brief Reads from the server.
 * @param socket_fd The file descriptor of the client socket.
 * @param buf A pointer to the buffer to write.
 * @param buf_size The size of the buffer in bytes.
 */
size_t
read_from_socket(int socket_fd, char *buf, size_t buf_size)
{
	ssize_t bytes_read = read(socket_fd, buf, buf_size);

	if (bytes_read < 0)
	{
		if (errno != EWOULDBLOCK && errno != EAGAIN)
		{
			fprintf(stderr, "Wasn't able to read from server\n");
		}

		bytes_read = 0;
	}

	return bytes_read;
}

/**
 * @brief Closes the client socket.
 */
void
cleanup_socket(void)
{
	close(socket_fd);
}