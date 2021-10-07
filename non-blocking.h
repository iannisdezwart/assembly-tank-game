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