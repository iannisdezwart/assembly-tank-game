.data

<%glbl super_speed_enabled>
	.zero 1

<%glbl num_other_players>
	.zero 1

<%glbl other_players>
	.skip 8128

<%glbl player>
	.skip 32

.L_float_0_04:
	.long 0x3d23d70a

.L_float_0_03:
	.long 0x3cf5c28f

.L_float_1_or_sqrt2:
	.long 0x3f800000 # float 1
	.long 0x3f34fdf4 # float 0.707

.L_float_5000:
	.long 0x459c4000 # float 5000

.text
/**
 * Translates an in-game coordinate to a pixel on the screen.
 * @xmm0 x The in-game x coordinate.
 * @xmm1 y The in-game y coordinate.
 */
<%fn translate>
	# this function is called millions of times,
	# so we will use about every SIMD trick in the book!

	unpcklps %xmm1, %xmm0          # xmm0 = [ x, y ]
	# make use of the fact that the x and y coordinate of the player
	# are aligned as the first two dwords of the player structure
	movq <%ref player>, %xmm1      # xmm1 = [ player.x, player.y, rubbish ]
	subps %xmm1, %xmm0             # xmm0 = [ x - player.x, y - player.y ]

	movd <%ref width>, %xmm2       # xmm2 = width
	movd <%ref height>, %xmm3      # xmm3 = height
	punpckldq %xmm3, %xmm2         # xmm2 = [ width, height ]
	# fancy SIMD right shift
	psrld $1, %xmm2                # xmm2 = [ width / 2, height / 2 ]
	cvtdq2ps %xmm2, %xmm2          # convert xmm2 to floats

	# [ x - player.x + width / 2, y - player.y + height /2 ]
	addps %xmm0, %xmm2
	cvttps2dq %xmm2, %xmm0         # convert back to ints
	movq %xmm0, %rax               # return point

	ret

/**
 * Translates a pixel coordinate to the in-game coordinate.
 * @edi x The x coordinate of the pixel.
 * @esi y The y coordinate of the pixel.
 */
<%fn untranslate>
	# while we're at it, let's also optimise the heck out of this function
	# using the same elegant SIMD instructions

	movd %edi, %xmm0               # xmm0 = x
	movd %esi, %xmm1               # xmm2 = y

	punpckldq %xmm1, %xmm0         # xmm0 = [ x, y ]
	cvtdq2ps %xmm0, %xmm0          # convert xmm1 ??
	# make use of the fact that the x and y coordinate of the player
	# are aligned as the first two dwords of the player structure
	movq <%ref player>, %xmm1      # xmm1 = [ player.x, player.y, rubbish ]
	addps %xmm1, %xmm0             # xmm0 = [ x + player.x, y + player.y ]

	movd <%ref width>, %xmm1       # xmm1 = width
	movd <%ref height>, %xmm2      # xmm2 = height
	punpckldq %xmm2, %xmm1         # xmm1 = [ width, height ]
	# fancy SIMP right shift
	psrld $1, %xmm1                # xmm1 = [ width / 2, height / 2 ]
	cvtdq2ps %xmm1, %xmm1          # convert xmm1 ??

	# [ x + player.x - width / 2, y + player.y - height / 2 ]
	subps %xmm1, %xmm0
	cvttps2dq %xmm0, %xmm0         # convert back to ints
	movq %xmm0, %rax               # return point

	ret

/**
 * The current player speed.
 */
<%fn get_player_speed>
	cmpb $0, <%ref super_speed_enabled>
	movss .L_float_0_04(%rip), %xmm0
	jne .L_get_player_speed_ret
	movss .L_float_0_03(%rip), %xmm0

.L_get_player_speed_ret:
	ret

/**
 * @brief Updates the position and rotation of the player and renders it.
 * The position of the player is only updated if the player is alive.
 * @dil dx The change in x of the tank.
 * @sil dy The change in y of the tank.
 * @edx pointer_dx The change in x of the pointer.
 * @ecx pointer_dy The change in y of the pointer.
 */
<%fn update_player>
	pushq %rbp
	pushq %r15
	pushq %r14
	pushq %r13
	pushq %rbx
	subq $16, %rsp

	# float spill @ 4(%rsp)

	leaq <%ref player>, %r13       # load pointer to player
	cmpb $0, 12(%r13)              # if player.health == 0: return
	je .L_update_player_ret

	movl %edi, %ebp                # save dx
	movl %esi, %ebx                # save dy
	movl %edx, %r14d               # save pointer_dx
	movl %ecx, %r15d               # save pointer_dy
	movl %ebp, %eax                # copy dx

	# this is a big brain way to get the absolute value of dx
	sarb $7, %al                   # get sign bit of dx
	leal (%rax, %rbp), %ecx        # compute dx + sign bit
	xorb %al, %cl                  # flip bits if sign (two's complement)
	movzbl %cl, %eax               # save abs(dx)
	# same thing
	movl %ebx, %ecx                # copy dy
	sarb $7, %cl                   # get sign bit of dy
	leal (%rbx, %rcx), %edx        # compute dy + sign bit
	xorb %cl, %dl                  # flip bits if sign (two's complement)
	movzbl %dl, %ecx               # save abs(dy)

	addl %eax, %ecx                # abs(dx) + abs(dy)
	xorl %eax, %eax                # flag = 0
	cmpl $2, %ecx                  # if abs(dx) + abs(dy) == 2:
	sete %al                       #   mult *= sqrt(2)

	leaq .L_float_1_or_sqrt2(%rip), %rcx # load pointer to 1 or sqrt2
	movss (%rcx, %rax, 4), %xmm0         # xmm0 = mult
	movss %xmm0, 4(%rsp)                 # save mult

	<%call get_player_speed>
	movsbl %bpl, %eax              # load dx
	cvtsi2ss %eax, %xmm1           # xmm1 = dx cast to float
	mulss 4(%rsp), %xmm0           # xmm0 = mult * speed
	mulss %xmm0, %xmm1             # xmm1 = mult * speed * dx
	mulss <%ref dt>, %xmm1         # xmm1 = mult * speed * dx * dt
	addss <%ref player>, %xmm1     # xmm1 = mult * speed * dx * dt + plyr.x
	movss %xmm1, <%ref player>     # save into player.x

	<%call get_player_speed>
	movsbl %bl, %eax               # load dy
	xorps %xmm1, %xmm1             # zero xmm1
	cvtsi2ss %eax, %xmm1           # xmm1 = dy cast to float
	mulss 4(%rsp), %xmm0           # xmm0 = mult * speed
	mulss %xmm0, %xmm1             # xmm1 = mult * speed * dy
	mulss <%ref dt>, %xmm1         # xmm1 = mult * speed * dy * dt
	addss 4(%r13), %xmm1           # xmm1 = mult * speed * dy * dt + plyr.y
	movss %xmm1, 4(%r13)           # save into player.y

	movss <%ref player>, %xmm2     # load player.x
	xorps %xmm0, %xmm0             # xmm0 = 0
	ucomiss %xmm2, %xmm0           # if player.x < 0: x = 0
	ja .L_update_player_bound_left

	movss .L_float_5000(%rip), %xmm0 # xmm0 = MAP_WIDTH
	ucomiss %xmm0, %xmm2           # if player.x > MAP_WIDTH: x = MAP_WIDTH
	jbe .L_update_player_bound_right

.L_update_player_bound_left:
	movss %xmm0, <%ref player>     # player.x = 0

.L_update_player_bound_right:
	xorps %xmm0, %xmm0             # xmm0 = 0
	ucomiss %xmm1, %xmm0           # if player.y == 0: y = 0
	ja .L_update_player_bound_up
	movss .L_float_5000(%rip), %xmm0 # xmm0 = MAP_WIDTH
	ucomiss %xmm0, %xmm1           # if player.y > MAP_WIDTH: y = MAP_WIDTH
	jbe .L_update_player_bound_down

.L_update_player_bound_up:
	movss %xmm0, 4(%r13)           # player.y = 0

.L_update_player_bound_down:
	xorps %xmm0, %xmm0             # clear xmm0
	cvtsi2sd %r15d, %xmm0          # xmm0 = (float) pointer_dy
	xorps %xmm1, %xmm1             # clear xmm1
	cvtsi2sd %r14d, %xmm1          # xmm1 = (float) pointer_dx
	<%call atan2>

	cvtsd2ss %xmm0, %xmm0          # xmm0 from double to float
	movss %xmm0, 8(%r13)           # store in player.angle

	movq %r13, %rdi                # arg1 = player
	<%call render_tank>

	movq %r13, %rdi                # arg1 = player
	addq $16, %rsp                 # prepare to tailcall
	popq %rbx
	popq %r13
	popq %r14
	popq %r15
	popq %rbp
	<%jmp render_health_bar> # tailcall

.L_update_player_ret:
	addq $16, %rsp
	popq %rbx
	popq %r13
	popq %r14
	popq %r15
	popq %rbp
	ret

/**
 * Sends the current player position to the server.
 */
<%fn send_position_tick>
	subq $24, %rsp

	# char buf[13] @  0(%rsp)
	# char *ptr    @ 16(%rsp)

	movq %rsp, 16(%rsp)            # ptr = buf

	leaq 16(%rsp), %rdi            # arg1 = &ptr (won't be touched)
	movl $1, %esi                  # arg2 = CMT_PLAYER_POSITION
	<%call write_u8>

	leaq <%ref player>, %rcx       # load pointer to player
	movss (%rcx), %xmm0            # arg2 = player.x
	<%call write_f32>

	movss 4(%rcx), %xmm0           # arg2 = player.y
	<%call write_f32>

	movss 8(%rcx), %xmm0           # arg2 = player.rot
	<%call write_f32>

	movq <%ref socket_fd>, %rdi    # arg1 = socket_fd
	movq %rsp, %rsi                # arg2 = buf
	movl $13, %edx                 # arg3 = buf_size
	<%call write_to_socket>

	addq $24, %rsp
	ret

/**
 * Discards all entries in the `other_players` array.
 */
<%fn delete_other_players>
	movb $0, <%ref num_other_players>
	ret

/**
 * Adds a player to the `other_players` array.
 * @xmm0 x The x coordinate of the other player.
 * @xmm1 y The y coordinate of the other player.
 * @xmm2 rot The rotation of the other player.
 * @dil health The health of the other player.
 * @si score The score of the other player.
 * @dl username_size The length of the other player's username.
 * @rcx username The other player's username.
 */
<%fn add_other_player>
	movzbl <%ref num_other_players>, %eax # load num_other_players
	shlq $5, %rax                         # num_other_players *= 32
	leaq <%ref other_players>, %r8 # load pointer to other_players array

	movss %xmm0, (%r8, %rax)       # player->x = x
	movss %xmm1, 4(%r8, %rax)      # player->y = y
	movss %xmm2, 8(%r8, %rax)      # player->rot = rot
	movb %dil, 12(%r8, %rax)       # player->health = health
	movb %dl, 13(%r8, %rax)        # player->username_size = username_size
	movw %si, 30(%r8, %rax)        # player->score = score

	leaq 14(%r8, %rax), %rdi       # arg1 = player->username
	movq %rcx, %rsi                # arg2 = username
	movl $15, %edx                 # arg3 = max string size

	addl $1, %eax                  # num_other_players++
	movb %al, <%ref num_other_players> # store num_other_players

	<%jmp strncpy>                 # tailcall

/**
 * @brief Renders the other players.
 */
<%fn update_other_players>
	cmpb $0, <%ref num_other_players>
	je .L_update_other_players_ret

.L_update_other_players:
	pushq %rbp
	pushq %rbx
	subq $8, %rsp

	xorl %ebx, %ebx                     # i = 0

.L_update_other_players_loop:
	movzbl %bl, %ebp                    # save i to compute ptr
	addl $1, %ebx                       # i++
	salq $5, %rbp                       # ptr index *= 32
	leaq <%ref other_players>, %rcx     # load ptr to other_players
	addq %rcx, %rbp                     # compute ptr to player

	movq %rbp, %rdi                     # arg1 = other_players + i
	<%call render_tank>

	movq %rbp, %rdi                     # arg1 = other_players + i
	<%call render_health_bar>

	cmpb %bl, <%ref num_other_players>  # continue if i < num_other_players
	ja .L_update_other_players_loop

	addq $8, %rsp
	popq %rbx
	popq %rbp

.L_update_other_players_ret:
	ret
