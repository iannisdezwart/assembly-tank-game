/**
 * @brief Puts a socket into non-blocking mode.
 * When an IO operation is performed and there is no IO, the socket will
 * not wait until there is new IO, but simply skip the operation.
 * @param socket_fd The socket to put into non-blocking mode.
 */
extern int
set_nonblocking(int socket_fd);

/**
 * @brief Puts a socket in no-delay and cork mode.
 * This bypasses Nagle's algorithm which is used to improve TCP/IP networks
 * by reducing the number of packets that need to be sent over the network.
 * We have to disable it because our game uses highly interactive IO
 * and we cannot afford to wait for packets or have data clottered up into
 * multiple packets.
 * @param socket_fd The socket to put in no-delay mode.
 */
extern void
set_no_delay(int socket_fd);

/**
 * @brief Flushes a socket. This ensures the data to it is written
 * as a whole and not clottered up into multiple packets.
 * Flushing is done by setting the socket into no-cork mode, which sends the
 * packet, and then setting the socket into cork mode, which ensures upcoming
 * data isn't clottered.
 * @param socket_fd The socket flush.
 */
extern void
flush_socket(int socket_fd);