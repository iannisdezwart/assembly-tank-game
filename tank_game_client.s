.data

.L_default_tank_username_str:
	.string "Unnamed Tank"

.L_usage_str:
	.string "usage: %s <server ip> [username]\n"

.text

<%fn main>
	subq $8, %rsp

	cmpl $2, %edi                  # if argc < 2: print usage string
	jl .L_main_print_usage_str

	movq 8(%rsi), %rax             # load server_ip from argv[1]
	movq %rax, <%ref server_ip>    # store in server_ip variable

	leaq .L_default_tank_username_str(%rip), %rax
	cmpl $3, %edi                  # if argc < 3: get username from argv[2]
	jl .L_main_store_username
	movq 16(%rsi), %rax            # get username from argv[2]

.L_main_store_username:
	movq %rax, <%ref username>     # store username

	# setup

	<%call setup_fullscreen_window>
	<%call setup_assets>
	<%call setup_io>
	<%call setup_socket>
	<%call send_handshake>

	# main loop

	<%call handle_events>

	# cleanup

	<%call cleanup_assets>
	<%call cleanup_window>
	<%call cleanup_socket>

	xorl %eax, %eax                # exit with exit code 0
	ret

.L_main_print_usage_str:
	leaq .L_usage_str(%rip), %rdi  # arg1 = usage str
	movq (%rsi), %rsi              # arg2 = argv[0]
	xorl %eax, %eax
	<%call printf>

	movl $1, %edi                  # exit with error code 1
	<%call exit>
