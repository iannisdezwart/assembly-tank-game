.equ FIONBIO, 0x5421
.equ IPPROTO_TCP, 0x6
.equ TCP_NODELAY, 0x1
.equ TCP_CORK, 0x3

/**
 * Puts a socket into non-blocking mode.
 * When an IO operation is performed and there is no IO, the socket will
 * not wait until there is new IO, but simply skip the operation.
 * @edi socket_fd The socket to put into non-blocking mode.
 */
.global set_nonblocking
set_nonblocking:
	# int flags @ 12(rsp)

	subq $24, %rsp
	                    # arg1 = socket_fd (already in %edi)
	movl $FIONBIO, %esi # arg2 = FIONBIO
	leaq 12(%rsp), %rdx # arg3 = &flags
	xorl %eax, %eax     # clear %eax
	movl $1, 12(%rsp)   # flags = 1
	call ioctl
	addq $24, %rsp
	ret

/**
 * Puts a socket in no-delay and cork mode.
 * This bypasses Nagle's algorithm which is used to improve TCP/IP networks
 * by reducing the number of packets that need to be sent over the network.
 * We have to disable it because our game uses highly interactive IO
 * and we cannot afford to wait for packets or have data clottered up into
 * multiple packets.
 * @edi socket_fd The socket to put in no-delay mode.
 */
.global set_no_delay
set_no_delay:
	# int flag @ 12(rsp)

	pushq %rbp
	subq $16, %rsp

	movl $1, 12(%rsp)          # flag = 1
	movl %edi, %r15d           # save socket_fd

	                           # arg1 = socket_fd (already in %edi)
	movl $IPPROTO_TCP, %esi    # arg2 = IPPROTO_TCP
	movl $TCP_NODELAY, %edx    # arg3 = TCP_NODELAY
	leaq 12(%rsp), %rcx        # arg4 = &flag
	movl $4, %r8d              # arg5 = sizeof(flag)
	call setsockopt

	movl %r15d, %edi           # arg1 = socket_fd
	movl $IPPROTO_TCP, %esi    # arg2 = IPPROTO_TCP
	movl $TCP_CORK, %edx       # arg3 = TCP_NODELAY
	leaq 12(%rsp), %rcx        # arg4 = &flag
	movl $4, %r8d              # arg5 = sizeof(flag)
	call setsockopt

	addq $16, %rsp
	popq %rbp
	ret

/**
 * Flushes a socket. This ensures the data to it is written
 * as a whole and not clottered up into multiple packets.
 * Flushing is done by setting the socket into no-cork mode, which sends the
 * packet, and then setting the socket into cork mode, which ensures upcoming
 * data isn't clottered.
 * @edi socket_fd The socket flush.
 */
.global flush_socket
flush_socket:
	# int flag @ 12(rsp)

	pushq %rbp
	subq $16, %rsp

	movl $1, 12(%rsp)          # flag = 1
	movl %edi, %r15d           # save socket_fd

	                           # arg1 = socket_fd (already in %edi)
	movl $IPPROTO_TCP, %esi    # arg2 = IPPROTO_TCP
	movl $TCP_NODELAY, %edx    # arg3 = TCP_NODELAY
	leaq 12(%rsp), %rcx        # arg4 = &flag
	movl $4, %r8d              # arg5 = sizeof(flag)
	call setsockopt

	movl %r15d, %edi           # arg1 = socket_fd
	movl $IPPROTO_TCP, %esi    # arg2 = IPPROTO_TCP
	movl $TCP_CORK, %edx       # arg3 = TCP_NODELAY
	leaq 12(%rsp), %rcx        # arg4 = &flag
	movl $4, %r8d              # arg5 = sizeof(flag)
	call setsockopt

	movl $0, 12(%rsp)          # flag = 0

	movl %r15d, %edi           # arg1 = socket_fd
	movl $IPPROTO_TCP, %esi    # arg2 = IPPROTO_TCP
	movl $TCP_NODELAY, %edx    # arg3 = TCP_NODELAY
	leaq 12(%rsp), %rcx        # arg4 = &flag
	movl $4, %r8d              # arg5 = sizeof(flag)
	call setsockopt

	movl %r15d, %edi           # arg1 = socket_fd
	movl $IPPROTO_TCP, %esi    # arg2 = IPPROTO_TCP
	movl $TCP_CORK, %edx       # arg3 = TCP_NODELAY
	leaq 12(%rsp), %rcx        # arg4 = &flag
	movl $4, %r8d              # arg5 = sizeof(flag)
	call setsockopt

	addq $16, %rsp
	popq %rbp
	ret
