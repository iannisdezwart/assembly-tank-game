#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <string.h>
#include <errno.h>


#define PORT 4242

#define MAX_CLIENTS 256
#define READ_BUF_SIZE 4096
#define IDLE_TIMEOUT_USEC 10000

#define die(msg) do { \
	fprintf(stderr, msg ": %s\n", \
		strerror(errno)); \
	exit(1); \
} while (0);

#define new(type) (type *) malloc(sizeof(type))


/**
 * @brief Puts a socket into non-blocking mode.
 * When an IO operation is performed and there is no IO, the socket will
 * not wait until there is new IO, but simply skip the operation.
 * @param socket_fd The socket to put into non-blocking mode.
 */
int
set_nonblocking(int socket_fd)
{
	int flags;

	#ifdef O_NONBLOCK
	if ((flags = fcntl(fd, F_GETFL, 0)) == -1) flags = 0;
	return fcntl(fd, F_SETFL, flags | O_NONBLOCK);
	#else
	flags = 1;
	return ioctl(socket_fd, FIONBIO, &flags);
	#endif
}

/**
 * @brief Creates a new socket for a server.
 * The socket is bound, and starts listening.
 * @returns The spawned server's file descriptor.
 */
int
create_server(void)
{
	int server_fd;
	int one = 1;

	struct sockaddr_in server_address;

	server_fd = socket(AF_INET, SOCK_STREAM, 0);

	if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(int)) < 0)
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
	set_nonblocking(server_fd);

	return server_fd;
}

/**
 * @brief Linked list structure containing a batch of data that has to
 * be written to a client socket.
 * @param buf_size The size of the data buffer.
 * @param buf A pointer to the heap allocated data buffer. Must be freed.
 * @param next A pointer to the next element on the list. Must be freed.
 */
struct WriteQueueNode
{
	size_t buf_size;
	char *buf;
	struct WriteQueueNode *next;
};

/**
 * @brief Recursively frees all WriteQueueNodes on a write queue.
 * @param write_queue The head of the write queue.
 */
void
free_write_queue(struct WriteQueueNode *write_queue)
{
	if (write_queue->next != NULL)
	{
		free_write_queue(write_queue->next);
	}

	free(write_queue->buf);
	free(write_queue);
}

/**
 * @brief Structure for a client connection.
 * @param fd The client's socket file descriptor.
 * @param write_queue A pointer to the head of the write queue.
 */
struct Client
{
	int fd;
	struct WriteQueueNode *write_queue;
};

/**
 * @brief Stores `new_client_fd` onto the `clients` array.
 * If the `clients` array is full, -1 is returned.
 * @param clients A pointer to the clients' file descriptors array.
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

	client_index++;

	while (client_index < MAX_CLIENTS && clients[client_index].fd != 0)
	{
		client_index++;
	}

	return client_index;
}

/**
 * @brief Removes an `obsolete_client_fd` from the `clients` array.
 * @param clients A pointer to the clients' file descriptors array.
 * @param obsolete_client A pointer to the client to remove.
 * @returns The new `client_index`: the index to the old file descriptor.
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

/**
 * @brief Handles incoming messages to the server.
 * @param client A pointer to the client that sent the data.
 * @param buf Contains the read data.
 * @param buf_size Number of bytes on the buffer.
 */
void
handle_incoming_data(struct Client *client, char *buf, size_t buf_size)
{
	printf("Incoming data from %d:\n%.*s\n\n",
		client->fd, (int) buf_size, buf);
}

/**
 * @brief Handles IO for a client.
 * @param clients A pointer to the clients array.
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
	uint8_t done_anything;

	int socket_state;
	int socket_err;
	socklen_t socket_error_size = sizeof(socket_err);

	done_anything = 0;

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

		bytes_rw = write(client->fd, client->write_queue->buf,
			client->write_queue->buf_size);

		if (bytes_rw < 0)
		{
			fprintf(stderr, "Wasn't able to write %lu bytes to client socket %d\n",
				client->write_queue->buf_size, client->fd);

			// Try writing at a later point in time

			goto read;
		}

		// Free the write queue node we just processed

		done_anything = 1;
		next_wq_node = client->write_queue->next;
		free(client->write_queue->buf);
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

	done_anything = 1;
	handle_incoming_data(client, read_buf, bytes_rw);

	ret:
	return done_anything;
}

/**
 * @brief Queues data to be written to a client.
 * @param client The client to write to.
 * @param buf A pointer to the data to queue.
 * @param buf_size The number of bytes on the buffer.
 */
void
queue_write(struct Client *client, char *buf, size_t buf_size)
{
	struct WriteQueueNode *last_node;

	if (client->write_queue == NULL)
	{
		client->write_queue = new(struct WriteQueueNode);
		client->write_queue->buf = buf;
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
		last_node->next->buf = buf;
		last_node->next->buf_size = buf_size;
		last_node->next->next = NULL;
	}
}

/**
 * @brief Accepts any new connections and handles IO.
 * @param server_fd The server's file descriptor.
 */
void
serve(int server_fd)
{
	struct Client clients[MAX_CLIENTS] = { 0 };
	size_t client_index = 0;

	int new_client_fd;
	struct sockaddr_in client_address;
	socklen_t client_address_size;

	uint8_t done_anything;

	done_anything = 0;
	client_address_size = sizeof(client_address);

	while (1)
	{
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

		done_anything = 1;
		set_nonblocking(new_client_fd);

		client_index = add_client(clients, client_index,
			new_client_fd);

		printf("new client %d\n", new_client_fd);

		if (client_index == -1)
		{
			fputs("couldn't accept new client because the "
				"clients array is full\n", stderr);
		}

		io:

		// If there is IO, handle it

		for (size_t i = 0; i < MAX_CLIENTS; i++)
		{
			if (clients[i].fd != 0)
			{
				if (handle_io(clients, clients + i, &client_index))
				{
					done_anything = 1;
				}
			}
		}

		// If we're idle, we can give other processes some CPU time

		if (!done_anything)
		{
			usleep(IDLE_TIMEOUT_USEC);
		}
	}
}

int
main(int argc, char **argv)
{
	serve(create_server());
}