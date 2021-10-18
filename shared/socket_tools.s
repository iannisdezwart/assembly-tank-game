.equ FIONBIO, <%ifmacos 0x8004667e><%iflinux 0x5421>
.equ IPPROTO_TCP, 0x6
.equ TCP_NODELAY, 0x1
.equ TCP_CORK, 0x3

/**
 * Puts a socket into non-blocking mode.
 * When an IO operation is performed and there is no IO, the socket will
 * not wait until there is new IO, but simply skip the operation.
 * @edi socket_fd The socket to put into non-blocking mode.
 */
<%fn set_nonblocking>
	# int flags @ 12(rsp)

	subq $24, %rsp
	                    # arg1 = socket_fd (already in %edi)
	movl $FIONBIO, %esi # arg2 = FIONBIO
	leaq 12(%rsp), %rdx # arg3 = &flags
	xorl %eax, %eax     # clear %eax
	movl $1, 12(%rsp)   # flags = 1
	<%call ioctl>
	addq $24, %rsp
