#define SERVER_PORT 4242

extern char *server_ip;
extern int socket_fd;
extern int client_id;
extern char *username;

/**
 * @brief Initialises the connection to the server.
 */
extern void
setup_socket(void);

/**
 * @brief Writes to the server.
 * @param socket_fd The file descriptor of the client socket.
 * @param buf A pointer to the buffer to write.
 * @param buf_size The size of the buffer in bytes.
 */
extern void
write_to_socket(int socket_fd, char *buf, size_t buf_size);

/**
 * @brief Reads from the server.
 * @param socket_fd The file descriptor of the client socket.
 * @param buf A pointer to the buffer to write.
 * @param buf_size The size of the buffer in bytes.
 * @returns The number of bytes read.
 */
extern size_t
read_from_socket(int socket_fd, char *buf, size_t buf_size);

/**
 * @brief Closes the client socket.
 */
extern void
cleanup_socket(void);

/**
 * @brief Sends a handshake to the server.
 */
extern void
send_handshake(void);