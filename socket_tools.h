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
 * @brief Puts a socket in no-delay and cork mode.
 * This bypasses Nagle's algorithm which is used to improve TCP/IP networks
 * by reducing the number of packets that need to be sent over the network.
 * We have to disable it because our game uses highly interactive IO
 * and we cannot afford to wait for packets or have data clottered up into
 * multiple packets.
 * @param socket_fd The socket to put in no-delay mode.
 */
void
set_no_delay(int socket_fd)
{
	int flag = 1;

	#ifdef TCP_NODELAY
	setsockopt(socket_fd, IPPROTO_TCP, TCP_NODELAY, &flag, sizeof(flag));
	#endif
	#ifdef TCP_CORK
	setsockopt(socket_fd, IPPROTO_TCP, TCP_CORK, &flag, sizeof(flag));
	#endif
}

/**
 * @brief Flushes a socket. This ensures the data to it is written
 * as a whole and not clottered up into multiple packets.
 * Flushing is done by setting the socket into no-cork mode, which sends the
 * packet, and then setting the socket into cork mode, which ensures upcoming
 * data isn't clottered.
 * @param socket_fd The socket flush.
 */
void
flush_socket(int socket_fd)
{
	int flag = 0;

	#ifdef TCP_CORK
	setsockopt(socket_fd, IPPROTO_TCP, TCP_CORK, &flag, sizeof(flag));
	#endif
	#ifdef TCP_NODELAY
	setsockopt(socket_fd, IPPROTO_TCP, TCP_NODELAY, &flag, sizeof(flag));
	#endif

	flag = 1;

	#ifdef TCP_CORK
	setsockopt(socket_fd, IPPROTO_TCP, TCP_CORK, &flag, sizeof(flag));
	#endif
	#ifdef TCP_NODELAY
	setsockopt(socket_fd, IPPROTO_TCP, TCP_NODELAY, &flag, sizeof(flag));
	#endif
}