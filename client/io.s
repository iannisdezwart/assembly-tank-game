.data
<%glbl raw_mouse_y>
	.long 0

<%glbl raw_mouse_x>
	.long 0

<%glbl latest_shoot_time>
	.quad 0

.L_float_48:
	.long 0x42400000

.L_handle_events_smt_handshake_err_str:
	.string "Received a SMT_HANDSHAKE message of invalid length %lu\n"

.L_handle_events_smt_player_positions_err_str:
	.string "Received a SMT_PLAYER_POSITIONS message of invalid length %lu\n"

.L_handle_events_smt_player_positions_no_err_loop_err_str:
	.string "Ran out of buffer for SMT_PLAYER_POSITIONS message before end"

.L_handle_events_smt_player_positions_no_err_loop_err_str_2:
	.string "Ran out of buffer for SMT_PLAYER_POSITIONS message username before end"

.L_handle_events_smt_spawn_bullet_err_str:
	.string "Received a SMT_SPAWN_BULLET message of invalid length %lu\n"

.L_handle_events_smt_deleted_bullets_err_str:
	.string "Received a SMT_DELETED_BULLETS message of invalid length %lu\n"

.L_handle_events_smt_deleted_bullets_no_err_loop_err_str:
	.string "Ran out of buffer for SMT_DELETED_BULLETS message before end"

.L_handle_events_smt_die_err_str:
	.string "Received a SMT_DIE message of invalid length %lu\n"

.L_handle_events_smt_respawn_err_str:
	.string "Received a SMT_RESPAWN message of invalid length %lu\n"

.L_handle_events_smt_spawn_drop_err_str:
	.string "Received a SMT_SPAWN_DROP message of invalid length %lu\n"

.L_handle_events_smt_spawn_drop_no_err_loop_check_err_str:
	.string "Ran out of buffer for SMT_SPAWN_DROP message before end"

.L_handle_events_smt_despawn_drop_err_str:
	.string "Received a SMT_DESPAWN_DROP message of invalid length %lu\n"

.L_handle_events_smt_powerup_err_str:
	.string "Received a SMT_POWERUP message of invalid length %lu\n"

.L_handle_events_smt_unknown_err_str:
	.string "Received unknown message from server of type %u of length %lu\n"

.L_handle_events_bad_behaviour_str:
	.string "The server kicked you because of bad behaviour\n"

.text
/**
 * @brief Initialises some variables used in the `handle_events()` function.
 */
<%fn setup_io>
	pushq %rbx
	pushq %r12
	subq $8, %rsp

	leaq <%ref player>, %r12       # load pointer to player
	movl $0, 8(%r12)               # player->rot = 0
	movb $0, 12(%r12)              # player->health = 0
	movq <%ref username>, %rbx     # load username

	movq %rbx, %rdi                # arg1 = username
	movl $15, %esi                 # arg2 = username max size
	<%call strnlen>
	movb %al, 13(%r12)             # player->username_size = username size

	leaq 14(%r12), %rdi            # arg1 = pointer to username
	movq %rbx, %rsi                # arg2 = username
	movl $15, %edx                 # arg3 = username max size
	<%call strncpy>

	movl <%ref height>, %eax       # load window height
	shrl $1, %eax                  # window height /= 2
	movl %eax, <%ref raw_mouse_y>  # raw_mouse_y = middle of screen
	movl $2147483647, <%ref raw_mouse_x> # raw_mouse_x = INT_MAX

	addq $8, %rsp                  # prepare to tailcall
	popq %r12
	popq %rbx
	<%jmp init_timings>

/**
 * @brief Handles all mouse and keyboard and server IO events.
 */
<%fn handle_events>
	# SDL_Event e           @ 0-55(%rsp)
	# float sin             @ 56-59
	# float cos             @ 60-63
	# char read_buf[4096]   @ 64-4159
	# char *read_ptr        @ 4160-4167
	# int flags_spill       @ 4168-4171
	# float temp_x          @ 4172-4175
	# float temp_y          @ 4176-4179
	# float temp_rot        @ 4180-4183
	# uint16_t temp_score   @ 4184-4185
	# uint8_t temp_health   @ 4186
	# uint8_t username_size @ 4187
	# char username[16]     @ 4188-4203

	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	subq $4208, %rsp
	xorl %r14d, %r14d              # flags = 0

.L_handle_events_next_event:
	<%call now>
	movq %rax, %r15                # save start_time

.L_handle_events_poll_event_loop_check:
	movq %rsp, %rdi                # arg1 = &e
	<%call SDL_PollEvent>

	testl %eax, %eax
	je .L_handle_events_render

	movl (%rsp), %eax              # load event.type

	cmpl $256, %eax                # SDL_QUIT
	je .L_handle_events_quit

	cmpl $768, %eax                # SDL_KEYDOWN
	je .L_handle_events_poll_event_loop_keydown

	cmpl $769, %eax                # SDL_KEYUP
	je .L_handle_events_poll_event_loop_keyup

	cmpl $1024, %eax               # SDL_MOUSEMOTION
	je .L_handle_events_poll_event_loop_mousemotion
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keydown:
	movl 16(%rsp), %eax            # load scancode

	cmpl $26, %eax                 # W
	je .L_handle_events_poll_event_loop_keydown_w

	cmpl $4, %eax                  # A
	je .L_handle_events_poll_event_loop_keydown_a

	cmpl $22, %eax                 # S
	je .L_handle_events_poll_event_loop_keydown_s

	cmpl $7, %eax                  # D
	je .L_handle_events_poll_event_loop_keydown_d

	cmpl $44, %eax                 # space
	je .L_handle_events_poll_event_loop_keydown_space
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keydown_w:
	orl $1, %r14d                   # flags |= MOVE_UP
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keydown_s:
	orl $2, %r14d                  # flags |= MOVE_DOWN
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keydown_a:
	orl $4, %r14d                  # flags |= MOVE_LEFT
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keydown_d:
	orl $8, %r14d                  # flags |= MOVE_RIGHT
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keydown_space:
	orl $16, %r14d                 # flags |= SHOOTING
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keyup:
	movl 16(%rsp), %eax           # load scancode

	cmpl $26, %eax                # W
	je .L_handle_events_poll_event_loop_keyup_w

	cmpl $4, %eax                  # A
	je .L_handle_events_poll_event_loop_keyup_a

	cmpl $22, %eax                 # S
	je .L_handle_events_poll_event_loop_keyup_s

	cmpl $7, %eax                  # D
	je .L_handle_events_poll_event_loop_keyup_d

	cmpl $44, %eax                 # space
	je .L_handle_events_poll_event_loop_keyup_space
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keyup_w:
	andl $-2, %r14d                # flags &= ~MOVE_UP
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keyup_s:
	andl $-3, %r14d               # flags &= ~MOVE_DOWN
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keyup_a:
	andl $-5, %r14d               # flags &= ~MOVE_LEFT
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keyup_d:
	andl $-9, %r14d               # flags &= ~MOVE_RIGHT
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_keyup_space:
	andl $-17, %r14d              # flags &= ~SHOOTING
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_poll_event_loop_mousemotion:
	movl 20(%rsp), %eax           # load e.motion.x
	movl %eax, <%ref raw_mouse_x> # raw_mouse_x = e.motion.x
	movl 24(%rsp), %eax           # load e.motion.x
	movl %eax, <%ref raw_mouse_y> # raw_mouse_y = e.motion.y
	jmp .L_handle_events_poll_event_loop_check

.L_handle_events_render:
	<%call clear_screen>
	<%call render_map_grid>
	<%call render_map_border>
	<%call render_drops>
	<%call update_other_players>

	movl <%ref raw_mouse_x>, %edi  # get pointer location
	movl <%ref raw_mouse_y>, %esi
	<%call untranslate>

	cvtsi2ss %eax, %xmm0           # load pointer.x into xmm0
	shrq $32, %rax                 # align pointer.y
	cvtsi2ss %eax, %xmm1           # load pointer.y into xmm1

	leaq <%ref player>, %rbx       # get pointer to player
	subss (%rbx), %xmm0            # pointer.x -= player.x
	subss 4(%rbx), %xmm1           # pointer.y -= player.y

	movl %r14d, %eax               # load flags
	andl $8, %eax                  # mask for move_right
	shrl $3, %eax                  # align for move_right
	movl %eax, %edi                # save move_right

	movl %r14d, %eax               # load flags
	andl $4, %eax                  # mask for move_left
	shrl $2, %eax                  # align for move_left
	subl %eax, %edi                # dx = move_right - move_left

	movl %r14d, %eax               # load flags
	andl $2, %eax                  # mask for move_down
	shrl $1, %eax                  # align for move_down
	movl %eax, %esi                # save move_down

	movl %r14d, %eax               # load flags
	andl $1, %eax                  # mask and align for move_up
	subl %eax, %esi                # dy = move_down - move_up

	                               # arg1 = dx (already in %edi)
	                               # arg2 = dy (already in %esi)
	cvttss2si %xmm0, %edx          # arg3 = pointer_dx
	cvttss2si %xmm1, %ecx          # arg4 = pointer_dy
	<%call update_player>
	<%call update_bullets>
	<%call render_bullets>
	<%call update_powerups>
	<%call render_leaderboard>
	<%call render_fps_counter>
	<%call render_frame>

	movq %r15, %rax                # load start_time
	subq <%ref last_server_tick_time>, %rax
	cmpq $10000, %rax              # if start_time - last_server_tick_time
	                               #   < USEC_PER_SERVER_TICK: skip
	jb .L_handle_events_shoot_check

	<%call now>
	movq %rax, <%ref last_server_tick_time> # last_server_tick_time = now()

	movb 12(%rbx), %al             # load player.dead
	testb %al, %al                 # if player.dead:
	je .L_handle_events_shoot_check #  don't send position tick
	<%call send_position_tick>

.L_handle_events_shoot_check:
	movl %r14d, %eax               # load flags
	andl $16, %eax                 # align for shooting flag
	shrl $4, %eax                  # mask for shooting flag
	testl %eax, %eax               # if !shooting: skip
	je .L_handle_events_read_socket

	<%call now>
	subq <%ref latest_shoot_time>, %rax
	cmpq $100000, %rax             # if now() - latest_shoot_time
	                               #   < BULLET_RELOAD_SPEED: skip
	jl .L_handle_events_read_socket

	movb 12(%rbx), %al             # load player.health
	testb %al, %al                 # if player.health == 0: skip
	je .L_handle_events_read_socket

	movss 8(%rbx), %xmm0           # arg1 = player.rot
	leaq 56(%rsp), %rdi            # arg2 = pointer to sin
	leaq 60(%rsp), %rsi            # arg3 = pointer to cos
	<%call sincosf>

	movss 56(%rsp), %xmm1          # load sin into xmm1
	mulss .L_float_48(%rip), %xmm1 # sin *= widths + radii
	addss 4(%rbx), %xmm1           # sin += player.y

	movss 60(%rsp), %xmm0          # load cos into xmm0
	mulss .L_float_48(%rip), %xmm0 # cos *= widths + radii
	addss (%rbx), %xmm0            # cos += player.x

	                               # arg1 = bullet_x (already in xmm0)
	                               # arg2 = bullet_y (already in xmm1)
	movss 8(%rbx), %xmm2           # arg3 = player.rot
	<%call send_bullet>

	<%call now>
	movq %rax, <%ref latest_shoot_time> # latest_shoot_time = now()

.L_handle_events_read_socket:
	movq %r14, 4168(%rsp)          # spill flags

	leaq 64(%rsp), %r13            # save read_buf
	movq %r13, 4160(%rsp)          # read_ptr = read_buf

	movl <%ref socket_fd>, %edi    # arg1 = socket_fd
	movq %r13, %rsi                # arg2 = read_buf
	movl $4096, %edx               # arg3 = READ_BUF_SIZE
	<%call read_from_socket>

	leaq 4160(%rsp), %r13          # save &read_ptr
	movq %rax, %r12                # save read_buf_size

.L_handle_events_read_socket_loop_check:
	cmpq $0, %r12                  # if read_buf_size <= 0: stop
	jle .L_handle_events_schedule_next_frame

	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u8>

	testb %al, %al                 # SMT_HANDSHAKE
	je .L_handle_events_smt_handshake

	cmpb $1, %al                   # SMT_PLAYER_POSITIONS
	je .L_handle_events_smt_player_positions

	cmpb $2, %al                   # SMT_SPAWN_BULLET
	je .L_handle_events_smt_spawn_bullet

	cmpb $3, %al                   # SMT_DELETED_BULLETS
	je .L_handle_events_smt_deleted_bullets

	cmpb $4, %al                   # SMT_DIE
	je .L_handle_events_smt_die

	cmpb $5, %al                   # SMT_RESPAWN
	je .L_handle_events_smt_respawn

	cmpb $6, %al                   # SMT_SPAWN_DROP
	je .L_handle_events_smt_spawn_drop

	cmpb $7, %al                   # SMT_DESPAWN_DROP
	je .L_handle_events_smt_despawn_drop

	cmpb $8, %al                   # SMT_POWERUP
	je .L_handle_events_smt_powerup

	cmpb $9, %al                   # SMT_BAD_BEHAVIOUR
	je .L_handle_events_bad_behaviour
	jmp .L_handle_events_smt_unknown

.L_handle_events_smt_handshake:
	cmpq $5, %r12                  # if read_buf_size >= 5: skip error
	jge .L_handle_events_smt_handshake_no_err

	leaq .L_handle_events_smt_handshake_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_handshake_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u32>
	movl %eax, <%ref client_id>
	subq $5, %r12
	jmp .L_handle_events_read_socket_loop_check

.L_handle_events_smt_player_positions:
	cmpq $5, %r12                  # if read_buf_size >= 5: skip error
	jge .L_handle_events_smt_player_positions_no_err

	leaq .L_handle_events_smt_player_positions_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_player_positions_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr (won't be touched)
	<%call read_u8>
	movb %al, 12(%rbx)             # save to player.health

	<%call read_u16>
	movw %ax, 30(%rbx)             # save to player.score

	<%call read_u8>
	movb %al, %r14b                # save num_clients

	<%call delete_other_players>

	subq $5, %r12                  # read_buf_size -= 5

.L_handle_events_smt_player_positions_no_err_loop_check:
	testb %r14b, %r14b             # if num_clients == 0: break
	jne .L_handle_events_smt_player_positions_no_err_loop_no_break

	je .L_handle_events_read_socket_loop_check

.L_handle_events_smt_player_positions_no_err_loop_no_break:
	cmpq $16, %r12                 # if read_buf_size >= 16: skip error
	jge .L_handle_events_smt_player_positions_no_err_loop_no_err

	leaq .L_handle_events_smt_player_positions_no_err_loop_err_str(%rip), %rdi
	<%call puts>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_player_positions_no_err_loop_no_err:
	subb $1, %r14b                 # num_clients--

	movq %r13, %rdi                # arg1 = &read_ptr (won't be touched)
	<%call read_f32>
	movss %xmm0, 4172(%rsp)        # save to temp_x

	<%call read_f32>
	movss %xmm0, 4176(%rsp)        # save to temp_y

	<%call read_f32>
	movss %xmm0, 4180(%rsp)        # save to temp_rot

	<%call read_u8>
	movb %al, 4186(%rsp)           # save to temp_health

	<%call read_u16>
	movw %ax, 4184(%rsp)           # save to temp_score

	<%call read_u8>
	movb %al, 4187(%rsp)           # save username size
	subq $16, %r12                 # read_buf_size -= 16

	movzbl %al, %eax
	cmpq %rax, %r12                # if read_buf_size >= username_size:
	                               #   skip error
	jge .L_handle_events_smt_player_positions_no_err_loop_no_err_2

	leaq .L_handle_events_smt_player_positions_no_err_loop_err_str_2(%rip), %rdi
	<%call puts>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_player_positions_no_err_loop_no_err_2:
	leaq 4188(%rsp), %rdi          # arg1 = username
	movq 4160(%rsp), %rsi          # arg2 = read_ptr
	movl %eax, %edx                # arg3 = username_size
	<%call strncpy>

	movzbl 4187(%rsp), %edx        # load username_size
	movl $0, 4188(%rsp, %rdx)      # username[username_size] = '\0'

	addq %rdx, 4160(%rsp)          # read_ptr += username_size
	subq %rdx, %r12                # read_buf_size -= username_size

	movss 4172(%rsp), %xmm0        # arg1 = temp_x
	movss 4176(%rsp), %xmm1        # arg2 = temp_y
	movss 4180(%rsp), %xmm2        # arg3 = temp_rot
	movb 4186(%rsp), %dil          # arg4 = temp_health
	movw 4184(%rsp), %si           # arg5 = temp_score
	                               # arg6 = username_size (already in %dl)
	leaq 4188(%rsp), %rcx          # arg7 = username
	<%call add_other_player>

	jmp .L_handle_events_smt_player_positions_no_err_loop_check

.L_handle_events_smt_spawn_bullet:
	cmpq $30, %r12                 # if read_buf_size >= 30: skip error
	jge .L_handle_events_smt_spawn_bullet_no_err

	leaq .L_handle_events_smt_spawn_bullet_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_spawn_bullet_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr (won't be touched)
	<%call read_u64>
	movq %rax, 4172(%rsp)          # save bullet id

	<%call read_f32>
	movss %xmm0, %xmm4             # save x

	<%call read_f32>
	movss %xmm0, %xmm1             # save y

	<%call read_f32>
	movss %xmm0, %xmm2             # save rot

	<%call read_u8>
	movb %al, %sil                 # save radius

	<%call read_f32>
	movss %xmm0, %xmm3             # save bullet speed

	<%call read_u32>
	movl %eax, %edx                # save owner

	movq 4172(%rsp), %rdi          # arg1 = bullet id
	movss %xmm4, %xmm0             # arg2 = x
	                               # all other arguments are already in
	                               # their registers
	<%call add_bullet>

	subq $30, %r12                 # read_buf_size -= 30
	jmp .L_handle_events_read_socket_loop_check

.L_handle_events_smt_deleted_bullets:
	cmpq $9, %r12                  # if read_buf_size >= 9: skip error
	jge .L_handle_events_smt_deleted_bullets_no_err

	leaq .L_handle_events_smt_deleted_bullets_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_deleted_bullets_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u64>
	movq %rax, %r14                # save size
	subq $9, %r12                  # read_buf_size -= 9

.L_handle_events_smt_deleted_bullets_no_err_loop_check:
	testq %r14, %r14               # if size == 0: break
	je .L_handle_events_read_socket_loop_check

	subq $1, %r14                  # size--
	cmpq $8, %r12                  # if read_buf_size >= 8: skip error
	jge .L_handle_events_smt_deleted_bullets_no_err_loop_no_err

	leaq .L_handle_events_smt_deleted_bullets_no_err_loop_err_str(%rip), %rdi
	<%call puts>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_deleted_bullets_no_err_loop_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u64>
	movq %rax, %rdi                # arg1 = the id of the bullet to delete
	<%call del_bullet_by_id>

	subq $8, %r12                  # read_buf_size -= 8
	jmp .L_handle_events_smt_deleted_bullets_no_err_loop_check

.L_handle_events_smt_die:
	testq %r12, %r12               # if read_buf_size >= 1: skip error
	jne .L_handle_events_smt_die_no_err

	leaq .L_handle_events_smt_die_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_die_no_err:
	movb $0, 12(%rbx)              # player.health = 0
	subq $1, %r12                  # read_buf_size -= 1
	jmp .L_handle_events_read_socket_loop_check

.L_handle_events_smt_respawn:
	cmpq $9, %r12                  # if read_buf_size >= 9: skip error
	jge .L_handle_events_smt_respawn_no_err

	leaq .L_handle_events_smt_respawn_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_respawn_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr (won't be touched)
	<%call read_f32>
	movss %xmm0, (%rbx)            # save into player.x

	<%call read_f32>
	movss %xmm0, 4(%rbx)           # save into player.y

	subq $9, %r12                  # read_buf_size -= 9
	jmp .L_handle_events_read_socket_loop_check

.L_handle_events_smt_spawn_drop:
	cmpq $9, %r12                  # if read_buf_size >= 9: skip error
	jge .L_handle_events_smt_spawn_drop_no_err

	leaq .L_handle_events_smt_spawn_drop_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_spawn_drop_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u64>
	movq %rax, %r14                # save n_drops

	subq $9, %r12                  # read_buf_size -= 9

.L_handle_events_smt_spawn_drop_no_err_loop_check:
	testq %r14, %r14               # if n_drops == 0: break
	je .L_handle_events_read_socket_loop_check

	subq $1, %r14                  # n_drops--

	cmpq $17, %r12                 # if read_buf_size >= 17: skip error
	jge .L_handle_events_smt_spawn_drop_no_err_loop_check_no_err

	leaq .L_handle_events_smt_spawn_drop_no_err_loop_check_err_str(%rip), %rdi
	<%call puts>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_spawn_drop_no_err_loop_check_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr (won't be touched)
	<%call read_u32>
	movl %eax, 4172(%rsp)          # save drop_x

	<%call read_u32>
	movl %eax, %esi                # save drop_y

	<%call read_u8>
	movzbl %al, %edx               # save drop_type

	<%call read_u64>
	movq %rax, %rcx                # save drop_id

	movl 4172(%rsp), %edi          # arg1 = drop_x
	<%call add_drop>               # all other arguments are already in regs

	subq $17, %r12                 # read_buf_size -= 17
	jmp .L_handle_events_smt_spawn_drop_no_err_loop_check

.L_handle_events_smt_despawn_drop:
	cmpq $9, %r12                  # if read_buf_size >= 9: skip error
	jge .L_handle_events_smt_despawn_drop_no_err

	leaq .L_handle_events_smt_despawn_drop_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_despawn_drop_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u64>

	movq %rax, %rdi                # arg1 = drop_id
	<%call del_drop_by_id>

	subq $9, %r12                  # read_buf_size -= 9
	jmp .L_handle_events_read_socket_loop_check

.L_handle_events_smt_powerup:
	cmpq $2, %r12                  # if read_buf_size >= 2: skip error
	jge .L_handle_events_smt_powerup_no_err

	leaq .L_handle_events_smt_powerup_err_str(%rip), %rdi
	movq %r12, %rsi
	<%call printf>
	jmp .L_handle_events_schedule_next_frame

.L_handle_events_smt_powerup_no_err:
	movq %r13, %rdi                # arg1 = &read_ptr
	<%call read_u8>

	movzbl %al, %edi               # arg1 = drop_type
	<%call activate_powerup>

	subq $2, %r12                  # read_buf_size -= 2
	jmp .L_handle_events_read_socket_loop_check

.L_handle_events_bad_behaviour:
	leaq .L_handle_events_bad_behaviour_str(%rip), %rdi
	<%call puts>

	jmp .L_handle_events_quit

.L_handle_events_smt_unknown:
	leaq .L_handle_events_smt_unknown_err_str(%rip), %rdi
	movb %al, %sil                 # arg2 = msg_type
	movq %r12, %rdx                # arg3 = read_buf_size
	<%call printf>

.L_handle_events_schedule_next_frame:
	movq 4168(%rsp), %r14          # reload flags

	<%call now>
	movq %rax, %rdi                # save finish_time
	subq %r15, %rax                # finish_time -= start_time
	movq %rax, %r15                # save duration

	<%call add_frame_time>

	movl <%ref frame_time_usec>, %edi # load frame_time_usec
	subq %r15, %rdi                # delay = frame_time_usec - duration

	cmpq $0, %rdi                  # if delay > 0: sleep
	jle .L_handle_events_next_event

	<%call usleep>
	jmp .L_handle_events_next_event

.L_handle_events_quit:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	addq $4208, %rsp
	ret
