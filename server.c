#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <math.h>
#include <string.h>
#include <errno.h>


#define PORT 4242

#define MAX_CLIENTS 255 // Also change `MAX_PLAYERS` in `player.h`
#define client_t uint8_t
#define READ_BUF_SIZE 4096
#define IDLE_TIMEOUT_USEC 10000

#define die(msg) do { \
	fprintf(stderr, msg ": %s\n", \
		strerror(errno)); \
	exit(1); \
} while (0);

#define new(type) (type *) malloc(sizeof(type))


#include "shared_ptr.h"
#include "timing_shared.h"
#include "map_shared.h"
#include "bullet_shared.h"
#include "tank_shared.h"
#include "network_messages.h"
#include "buffer.h"
#include "socket_tools.h"


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
	set_no_delay(server_fd);

	return server_fd;
}

/**
 * @brief Linked list structure containing a batch of data that has to
 * be written to a client socket.
 * @param buf_size The size of the data buffer.
 * @param buf_shr_ptr A shared pointer to the data buffer. Must be disowned.
 * @param next A pointer to the next element on the list. Must be freed.
 */
struct WriteQueueNode
{
	size_t buf_size;
	struct SharedPtr *buf_shr_ptr;
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

	SharedPtr_disown(write_queue->buf_shr_ptr);
	free(write_queue);
}

/**
 * @brief Structure for a client connection.
 * @param fd The client's socket file descriptor.
 * @param write_queue A pointer to the head of the write queue.
 * @param player_x The player's last known x location.
 * @param player_y The player's last known y location.
 * @param player_rot The player's last known rotation.
 */
struct Client
{
	int fd;
	struct WriteQueueNode *write_queue;
	struct Tank player;
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
 * @param clients A pointer to the clients array.
 * @param buf A pointer to the data to queue.
 * @param buf_size The number of bytes on the buffer.
 */
void
broadcast(struct Client *clients, char *buf, size_t buf_size)
{
	struct SharedPtr *buf_shr_ptr = SharedPtr_create(buf, 0);

	for (client_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (clients[i].fd != 0)
		{
			queue_write(clients + i, buf_shr_ptr, buf_size);
			buf_shr_ptr->handles++;
		}
	}
}

/**
 * @brief Broadcasts a message to every client except one.
 * @param clients A pointer to the clients array.
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
		if (clients[i].fd != 0 && clients + i != skip_client)
		{
			queue_write(clients + i, buf_shr_ptr, buf_size);
			buf_shr_ptr->handles++;
		}
	}
}

/**
 * @brief Handles incoming messages to the server.
 * @param clients A pointer to the clients array.
 * @param client A pointer to the client that sent the data.
 * @param read_buf Contains the read data.
 * @param read_buf_size Number of bytes on the buffer.
 */
void
handle_incoming_data(struct Client *clients, struct Client *client,
	char *read_buf, size_t read_buf_size)
{
	enum ClientMessageType msg_type;

	char *read_ptr = read_buf;
	char *write_buf;
	char *write_ptr;

	float bullet_x;
	float bullet_y;
	float bullet_heading;

	while (read_buf_size > 0)
	{
		msg_type = read_u8(&read_ptr);

		switch (msg_type)
		{
			case CMT_PLAYER_POSITION:
				if (read_buf_size < 13)
				{
					fprintf(stderr,
						"Received a CMT_PLAYER_POSITION message of invalid length %lu\n",
						read_buf_size);

					fprintf(stderr, "Message: %.*s\n", (int) read_buf_size, read_buf);

					break;
				}

				client->player.x = read_f32(&read_ptr);
				client->player.y = read_f32(&read_ptr);
				client->player.rot = read_f32(&read_ptr);

				read_buf_size -= 13;
				break;

			case CMT_SHOOT_BULLET:
				if (read_buf_size < 13)
				{
					fprintf(stderr,
						"Received a CMT_SHOOT_BULLET message of invalid length %lu\n",
						read_buf_size);

					fprintf(stderr, "Message: %.*s\n", (int) read_buf_size, read_buf);

					break;
				}

				// Create buffer for message

				write_buf = malloc(13);
				write_ptr = write_buf;

				// Get bullet data

				write_u8(&write_ptr, SMT_SPAWN_BULLET);

				bullet_x = read_f32(&read_ptr);
				bullet_y = read_f32(&read_ptr);
				bullet_heading = read_f32(&read_ptr);

				// Add a bullet to the bullets array

				add_bullet(bullet_x, bullet_y, bullet_heading);

				// Broadcast message to other clients that a new bullet has spawned

				write_u8(&write_ptr, SMT_SPAWN_BULLET);
				write_u8(&write_ptr, bullet_x);
				write_u8(&write_ptr, bullet_y);
				write_u8(&write_ptr, bullet_heading);

				broadcast_except(clients, client, write_buf, 13);

				read_buf_size -= 13;
				break;

			default:
				printf("Received unknown message of type %u\n", msg_type);
				goto skip_all;
		}
	}

	skip_all:;
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

		flush_socket(client->fd);

		if (bytes_rw < 0)
		{
			fprintf(stderr, "Wasn't able to write %lu bytes to client socket %d\n",
				client->write_queue->buf_size, client->fd);

			// Try writing at a later point in time

			goto read;
		}

		// Free the write queue node we just processed

		done_io = 1;
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

	done_io = 1;
	handle_incoming_data(clients, client, read_buf, bytes_rw);

	ret:
	return done_io;
}

/**
 * @brief Sends a client all other players' positions.
 * @param clients A pointer to the clients array.
 * @param client A pointer to the client we're sending the positions to.
 */
void
send_player_positions(struct Client *clients, struct Client *client)
{
	char *buf = malloc(1 + sizeof(client_t) + 12 * MAX_CLIENTS);
	char *ptr = buf;
	struct SharedPtr *buf_shr_ptr;
	size_t buf_size = 1;

	#if MAX_CLIENTS > 255
	#error To support more than 255 clients, \
		read the comment below this line first
	#endif

	// Follow the "Increase to support more than 255 clients" comments in all
	// files of this project

	client_t num_clients = 0;

	write_u8(&ptr, SMT_PLAYER_POSITIONS);
	ptr += sizeof(client_t); // Leave room for the number of clients

	for (client_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (clients[i].fd != 0 && clients + i != client)
		{
			write_f32(&ptr, clients[i].player.x);
			write_f32(&ptr, clients[i].player.y);
			write_f32(&ptr, clients[i].player.rot);

			buf_size += 12;
			num_clients++;
		}
	}

	if (num_clients == 0)
	{
		// There is only one player, so we won't send it an empty array

		free(buf);
		return;
	}

	// Write the number of clients

	*(client_t *) (buf + 1) = num_clients;
	buf_size++;

	// Wrap the buffer around a shared pointer so it is only freed after
	// we have written the buffer to all selected clients

	buf_shr_ptr = SharedPtr_create(buf, num_clients);
	queue_write(client, buf_shr_ptr, buf_size);
}

/**
 * @brief Subtracts health points from a client.
 * @param client The client to subtract health points from.
 */
void
hit_client(struct Client *client)
{
	if (BULLET_DAMAGE > client->player.health)
	{
		client->player.health = 0;

		printf("client %d died\n",
			client->fd);
	}
	else
	{
		client->player.health -= BULLET_DAMAGE;
	}
}

/**
 * @brief Checks if a bullet hits a client.
 * @param bullet The bullet to check.
 * @param client The client to check.
 * @returns 1 if the bullet is in hitting range of the client, 0 if not.
 */
uint8_t
bullet_in_range(struct Bullet *bullet, struct Client *client)
{
	float dx = client->player.x - bullet->x;
	float dy = client->player.y - bullet->y;

	return hypot(dx, dy) < (TANK_BODY_RADIUS - BULLET_RADIUS);
}

/**
 * @brief Handles bullet collisions for a given client.
 * @param client The client to check bullet collisions for.
 */
void
handle_bullet_hits_for_client(struct Client *client)
{
	for (size_t j = 0; j < n_bullets; j++)
	{
		if (bullet_in_range(bullets + j, client))
		{
			hit_client(client);
			printf("client %d got hit and now has %hhu HP\n",
				client->fd, client->player.health);
		}
	}
}

/**
 * @brief Handles bullet collisions.
 * @param clients A pointer to the start of the clients array.
 */
void
handle_bullet_hits(struct Client *clients)
{
	for (size_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (clients->fd != 0)
		{
			handle_bullet_hits_for_client(clients + i);
		}
	}
}

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

	uint8_t done_io;

	latest_dt_update_time = latest_server_tick_time = now();

	while (1)
	{
		done_io = 0;

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

		done_io = 1;
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

		for (client_t i = 0; i < MAX_CLIENTS; i++)
		{
			if (clients[i].fd != 0)
			{
				if (handle_io(clients, clients + i, &client_index))
				{
					done_io = 1;
				}
			}
		}

		// Broadcast player positions to clients

		if (now() - latest_server_tick_time >= USEC_PER_SERVER_TICK)
		{
			for (client_t i = 0; i < MAX_CLIENTS; i++)
			{
				if (clients[i].fd != 0)
				{
					send_player_positions(clients, clients + i);
					latest_server_tick_time = now();
					done_io = 1;
				}
			}
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

int
main(int argc, char **argv)
{
	serve(create_server());
}
