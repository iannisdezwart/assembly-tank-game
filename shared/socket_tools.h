/**
 * @brief Puts a socket into non-blocking mode.
 * When an IO operation is performed and there is no IO, the socket will
 * not wait until there is new IO, but simply skip the operation.
 * @param socket_fd The socket to put into non-blocking mode.
 */
extern int
set_nonblocking(int socket_fd);