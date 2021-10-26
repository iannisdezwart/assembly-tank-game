.equ LeaderboardEntry_SIZE, 18

/**
 * struct LeaderboardEntry
 * Structure for a leaderboard entry.
 * @0-15 username The username to show on the leaderboard.
 * @16-17 score The score to show on the leaderboard.
 */

/**
 * A comparison function for leaderboard entry structures.
 * @rdi a The first leaderboard entry.
 * @rsi b The second leaderboard entry.
 */
<%fn LeaderboardEntry_cmp>
	movzwl 16(%rdi), %ecx # load a->score
	movzwl 16(%rsi), %eax # load b->score
	subl %ecx, %eax       # return b->score - a->score
	ret

/**
 * Sorts the leaderboard entries and shows the leaderboard.
 */
<%fn render_leaderboard>
	pushq %rbp
	pushq %r15
	pushq %r14
	pushq %r13
	pushq %r12
	pushq %rbx
	subq $40, %rsp

	# char leaderboard_line[32] @ 0(%rsp)

	leaq <%ref player>, %r15       # save pointer to player
	movzbl 13(%r15), %ebp          # load username_size
	leaq <%ref leaderboard>, %r12  # save pointer to leaderboard array

	leaq <%ref leaderboard>, %rdi  # arg1 = leaderboard[0].username
	leaq 14(%r15), %rsi            # arg2 = player.username
	movq %rbp, %rdx                # arg3 = player.username_size
	<%call strncpy>

	movb $0, (%r12, %rbp)          # NULL terminate username

	movzwl 30(%r15), %eax          # load player.score
	movw %ax, 16(%r12)             # and save it in leaderboard[0].score

	movzbl <%ref num_other_players>, %r14d
	testq %r14, %r14               # if num_other_players == 0: skip loop
	je .L_render_leaderboard_sort_entries

	movq %r14, %r13                # save num_other_players
	shlq $5, %r13                  # end_ptr_index = num_other_players * 32
	leaq 18(%r12), %rbp            # leaderboard_ptr = &leaderboard[1]
	xorl %ebx, %ebx                # player_ptr_index = 0
	leaq <%ref other_players>, %r14

.L_render_leaderboard_create_leaderboard_loop:
	movzbl 13(%r14, %rbx), %r15d   # save other_players[i].username_size
	movq %rbp, %rdi                # arg1 = leaderboard[i].username
	leaq 14(%r14, %rbx), %rsi      # arg2 = other_players[i].username
	movq %r15, %rdx                # arg3 = other_players[i].username_size
	<%call strncpy>

	movb $0, (%rbp, %r15)          # NULL terminate username

	movzwl 30(%r14, %rbx), %eax    # load other_players[i].score
	movw %ax, 16(%rbp)             # save in leaderboard[i].score

	addq $32, %rbx                 # player_ptr_index += sizeof(struct Tank)
	addq $18, %rbp                 # leaderboard_ptr++
	cmpq %rbx, %r13                # if player_ptr_index != end_ptr_index:
	jne .L_render_leaderboard_create_leaderboard_loop # continue loop

.L_render_leaderboard_sort_entries:
	movzbl <%ref num_other_players>, %r14d
	addq $1, %r14                  # num_players = 1 + num_other_players
	leaq <%ref leaderboard>, %rdi  # arg1 = leaderboard
	movq %r14, %rsi                # arg2 = num_players
	movl $18, %edx                 # arg2 = sizeof(struct LeaderboardEntry)
	leaq <%ref LeaderboardEntry_cmp>, %rcx # arg3 = comparison function
	<%call qsort>

	movl $255, %edi                # set colour to rgb(255, 0, 0)
	xorl %esi, %esi
	xorl %edx, %edx
	<%call set_colour_rgb>

	movq $-1, %rbx                 # i = -1
	xorl %ebp, %ebp                # text_y_offset = 0

.L_render_leaderboard_render_leaderboard_loop:
	movq %rsp, %rdi                # arg1 = leaderboard_line
	leaq .L_render_leaderboard_fmt_str(%rip), %rsi # arg2 = fmt_str
	movq %r12, %rdx                # arg3 = leaderboard[i].username
	movzwl 16(%r12), %ecx          # arg4 = leaderboard[i].score
	xorl %eax, %eax                # don't make sprintf curse on us
	<%call sprintf>

	movq <%ref font_20px>, %rdi    # arg1 = font_20px
	movq %rsp, %rsi                # arg2 = leaderboard_line
	movl <%ref width>, %edx        # arg3 = right side of screen
	movl %ebp, %ecx                # arg4 = i * LEADERBOARD_GAP
	<%call render_text_right>

	addq $1, %rbx                  # i++
	addq $18, %r12                 # leaderboard_ptr++
	addl $30, %ebp                 # text_y_offset += 30

	movzbl <%ref num_other_players>, %eax
	cmpq %rax, %rbx                # if i <= num_other_players: break
	jb .L_render_leaderboard_render_leaderboard_loop

	addq $40, %rsp
	popq %rbx
	popq %r12
	popq %r13
	popq %r14
	popq %r15
	popq %rbp
	ret

.L_render_leaderboard_fmt_str:
	.string "%s - %hu"
