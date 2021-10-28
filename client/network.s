.data
<%glbl server_ip>
	.skip 8

<%glbl socket_fd>
	.skip 4

<%glbl client_id>
	.skip 4

<%glbl username>
	.skip 8

.text
/**
 * Cross platform solution that returns strerror(errno)
 */
<%fn geterr>
	subq $8, %rsp

	<%call __errno_location>

	addq $8, %rsp        # prepare to tailcall
	movq (%rax), %rdi    # arg1 = errno location
	<%jmp strerror>      # tailcall

/**
 * Initialises the connection to the server.
 */
<%fn setup_socket>
	pushq %rbx
	subq $16, %rsp

	# struct sockaddr_in server_addr @ 0(%rsp)

	movl $2, %edi         # arg1 = AF_INET
	movl $1, %esi         # arg2 = SOCK_STREAM
	xorl %edx, %edx       # arg3 = 0 (choose protocol automatically)
	<%call socket>

	movq %rax, %rbx       # save socket_fd
	movq %rax, <%ref socket_fd>

	cmpl $0, %eax         # if socket < 0: error
	jge .L_setup_socket_get_socket_no_err

	<%call geterr>
	leaq .L_setup_socket_get_socket_err_str(%rip), %rdi
	movq %rax, %rsi       # arg2 = error
	<%call printf>

	movl $1, %edi         # exit code 1
	<%call exit>

.L_setup_socket_get_socket_err_str:
	.string "Failed to create a socket: %s\n"

.L_setup_socket_get_socket_no_err:
	movw $2, (%rsp)       # server_addr.sin_family = AF_INET
	movw $-28144, 2(%rsp) # server_addr.sin_family = port big endian (4242)

	movl $2, %edi               # arg1 = AF_INET
	movq <%ref server_ip>, %rsi # arg2 = server_ip
	leaq 4(%rsp), %rdx          # arg3 = &server_addr.sin_addr
	<%call inet_pton>

	cmpl $0, %eax         # if result < 0: error
	jge .L_setup_socket_inet_pton_no_err

	<%call geterr>
	leaq .L_setup_socket_inet_pton_err_str(%rip), %rdi
	movq <%ref server_ip>, %rsi # arg2 = error
	<%call printf>

	movl $1, %edi         # exit code 1
	<%call exit>

.L_setup_socket_inet_pton_err_str:
	.string "Failed to decode ip address %s\n"

.L_setup_socket_inet_pton_no_err:
	movq %rbx, %rdi       # arg1 = socket_fd
	movq %rsp, %rsi       # arg2 = &server_addr
	movl $16, %edx        # arg3 = sizeof(server_addr)
	<%call connect>

	cmpl $0, %eax         # if result < 0: error
	jge .L_setup_socket_connect_no_err

	<%call geterr>
	leaq .L_setup_socket_connect_err_str(%rip), %rdi
	movq %rax, %rsi       # arg2 = error
	<%call printf>

	movl $1, %edi         # exit code 1
	<%call exit>

.L_setup_socket_connect_err_str:
	.string "Failed to connect to the game server: %s\n"

.L_setup_socket_connect_no_err:
	movq %rbx, %rdi       # arg1 = socket_fd

	addq $16, %rsp        # prepare to tailcall
	popq %rbx
	<%jmp set_nonblocking>

/**
 * Writes to the server.
 * @edi socket_fd The file descriptor of the client socket.
 * @rsi buf A pointer to the buffer to write.
 * @rdx buf_size The size of the buffer in bytes.
 */
<%fn write_to_socket>
	subq $8, %rsp

	<%call write>         # all arguments are already in their registers
	cmpl $0, %eax         # if result < 0: error
	jge .L_write_to_socket_ret

	<%call geterr>
	leaq .L_write_to_socket_err_str(%rip), %rdi
	movq %rax, %rsi       # arg2 = error
	<%call printf>

.L_write_to_socket_ret:
	addq $8, %rsp
	ret

.L_write_to_socket_err_str:
	.string "Failed to write to the server: %s\n"

/**
 * Reads from the server.
 * @edi socket_fd The file descriptor of the client socket.
 * @rsi buf A pointer to the buffer to write.
 * @rdx buf_size The size of the buffer in bytes.
 */
<%fn read_from_socket>
	subq $8, %rsp

	<%call read>          # all arguments are already in their registers
	cmpl $0, %eax         # if result < 0: maybe error
	jge .L_read_from_socket_ret

	<%call __errno_location>
	cmpl <%ifmacos $35><%iflinux $11>, (%rax) # if errno == EAGAIN: err
	je .L_read_from_socket_eagain

	<%call geterr>
	leaq .L_read_from_socket_err_str(%rip), %rdi
	movq %rax, %rsi        # arg2 = error
	<%call printf>

.L_read_from_socket_eagain:
	xorl %eax, %eax       # bytes_read = 0

.L_read_from_socket_ret:
	addq $8, %rsp
	ret

.L_read_from_socket_err_str:
	.string "Wasn't able to read from server: %s\n"

/**
 * Closes the client socket.
 */
<%fn cleanup_socket>
	movl <%ref socket_fd>, %edi
	<%jmp close>          # tailcall

/**
 * Sends a handshake to the server.
 */
<%fn send_handshake>
	subq $40, %rsp

	# char buf[17] @  0(%rsp)
	# char *ptr    @ 24(%rsp)

	movq %rsp, 24(%rsp)            # ptr = buf

	leaq 24(%rsp), %rdi            # arg1 = &ptr
	xorl %esi, %esi                # arg2 = CMT_HANDSHAKE
	<%call write_u8>

	movq <%ref username>, %rdi     # arg1 = username
	movl $15, %esi                 # arg2 = max username size
	<%call strnlen>

	leaq 24(%rsp), %rdi            # arg1 = &ptr
	movl %eax, %esi                # arg2 = username size
	<%call write_u8>


	movq 24(%rsp), %rdi            # arg1 = ptr
	movq <%ref username>, %rsi     # arg2 = username
	movl $15, %edx                 # arg3 = max username size
	<%call strncpy>

	movq <%ref socket_fd>, %rdi    # arg1 = socket_fd
	movq %rsp, %rsi                # arg2 = buf
	movl $17, %edx                 # arg3 = sizeof(buf)
	<%call write_to_socket>

	addq $40, %rsp
	ret
