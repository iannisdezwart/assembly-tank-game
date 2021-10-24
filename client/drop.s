.data
<%glbl n_powerups>
	.quad 0

<%glbl powerups>
	.skip 64

.text
/**
 * Renders all drops.
 */
<%fn render_drops>
	pushq %r14
	pushq %rbx
	pushq %rax

	cmpq $0, <%ref n_drops>        # if n_drops == 0: return
	jle .L_render_drops_return

	leaq <%ref drops>, %rbx        # load a pointer to the drops array

.L_render_drops_switch:
	movzbl 8(%rbx), %edx           # switch (drop->type)
	cmpq $3, %rdx                  # jump to default case
	ja .L_render_drops_switch_default

	movq <%ref drop_heal_pack>, %rax
	leaq .L_render_drops_switch_jump_table(%rip), %rcx
	movq (%rcx, %rdx, 8), %rdx
	addq %rcx, %rdx
	jmp *%rdx

.L_render_drops_switch_case_fast_shooting:
	movq <%ref drop_fast_shooting>, %rax
	jmp .L_render_drops_render

.L_render_drops_switch_case_big_bullets:
	movq <%ref drop_big_bullets>, %rax
	jmp .L_render_drops_render

.L_render_drops_switch_case_super_speed:
	movq <%ref drop_super_speed>, %rax

.L_render_drops_render:
	movq %rax, %r14                # img = <switch value>

	xorps %xmm0, %xmm0
	cvtsi2ssl (%rbx), %xmm0        # load drop->x
	xorps %xmm1, %xmm1
	cvtsi2ssl 4(%rbx), %xmm1       # load drop ->y
	<%call translate>

	movq %r14, %rdi                # arg1 = img
	leal -15(%rax), %esi           # arg2 = x
	shrq $32, %rax
	leal -15(%rax), %edx           # arg3 = y
	movl $30, %ecx                 # arg4 = width (30px)
	movl $30, %r8d                 # arg5 = height (30px)
	<%call render_surface>

.L_render_drops_loop_check:
	addq $24, %rbx                 # drop++
	movq <%ref n_drops>, %rax      # load n_drops
	leaq (%rax, %rax, 2), %rax     # n_drops *= 8
	leaq <%ref drops>, %rcx
	leaq (%rcx, %rax, 8), %rax
	cmpq %rax, %rbx                # if drop == drops_end: stop
	jb .L_render_drops_switch
	jmp .L_render_drops_return

.L_render_drops_switch_default:
	leaq .L_render_drops_unknown_drop_str(%rip), %rdi
	movl %edx, %esi
	xorl %eax, %eax
	<%call printf>
	jmp .L_render_drops_loop_check

.L_render_drops_return:
	addq $8, %rsp
	popq %rbx
	popq %r14
	ret

.L_render_drops_switch_jump_table:
	.quad .L_render_drops_render - .L_render_drops_switch_jump_table
	.quad .L_render_drops_switch_case_fast_shooting - .L_render_drops_switch_jump_table
	.quad .L_render_drops_switch_case_big_bullets - .L_render_drops_switch_jump_table
	.quad .L_render_drops_switch_case_super_speed - .L_render_drops_switch_jump_table

.L_render_drops_unknown_drop_str:
	.string "Unknown drop of type %u\n"

/**
 * Removes a powerup from the powerups array.
 * @rdi powerup A pointer to the powerup to remove.
 */
<%fn del_powerup>
del_powerup:
	cmpl $3, (%rdi)                    # if powerup->type == DT_SUPER_SPEED
	jne .L_del_powerup_no_super_speed  #   then disable super speed
	movb $0, <%ref super_speed_enabled>

.L_del_powerup_no_super_speed:
	movq <%ref n_powerups>, %rax          # load n_powerups
	subq $1, %rax                         # n_powerups--
	movq %rax, <%ref n_powerups>          # store n_powerups
	shlq $4, %rax                         # n_powerups *= 16
					      # arg1 = powerup (already in %rdi)
	leaq <%ref powerups>, %rcx
	leaq (%rcx, %rax), %rsi               # arg2 = powerups + n_powerups
	<%jmp copy_powerup>

/**
 * Activates a powerup.
 * @edi drop_type The drop type of the powerup to activate.
 */
<%fn activate_powerup>
	pushq %rbp
	pushq %rbx
	pushq %rax

	movl %edi, %ebp                # save drop_type
	movq <%ref n_powerups>, %rax   # load n_powerups
	testq %rax, %rax               # if n_powerups == 0: skip find loop
	je .L_activate_powerup_skip_find_loop

	leaq <%ref powerups>, %rbx     # load ptr to powerups
	addq $8, %rbx                  # align ptr to powerups to time_activated
	movq %rax, %rcx                # i = n_powerups

.L_activate_powerup_find_loop_body:
	cmpl %ebp, -8(%rbx)            # if powerups[i].type == drop_type:
	je .L_activate_powerup_find_loop_body_inner # then activate the powerup
	addq $16, %rbx                 # powerups++
	subq $1, %rcx                  # i--
	jne .L_activate_powerup_find_loop_body # loop again if i > 0

.L_activate_powerup_skip_find_loop:
	shlq $4, %rax                  # n_powerups *= 16
	leaq <%ref powerups>, %rcx
	movl %ebp, (%rcx, %rax)        # powerups[n_powerups].type = drop_type

	<%call now>
	movq <%ref n_powerups>, %rcx   # load n_powerups
	movq %rcx, %rdx                # copy n_powerups
	shlq $4, %rdx                  # n_powerups *= 16
	leaq <%ref powerups>, %r8
	movq %rax, 8(%r8, %rdx)        # powerup->time_activated = now()

	addq $1, %rcx                  # n_powerups++
	movq %rcx, <%ref n_powerups>   # save n_powerups

	cmpl $3, %ebp                  # if drop_type == DT_SUPER_SPEED
	jne .L_activate_powerup_ret
	movb $1, <%ref super_speed_enabled> # then enable super speed
	jmp .L_activate_powerup_ret

.L_activate_powerup_find_loop_body_inner:
	<%call now>
	movq %rax, (%rbx)              # powerups[i].time_activated = now()

.L_activate_powerup_ret:
	addq $8, %rsp
	popq %rbx
	popq %rbp
	ret

/**
 * Checks if the player currently has a specific powerup.
 * @rdi type The powerup type to check.
 */
<%fn has_powerup>
	movq <%ref n_powerups>, %r8 # load n_powerups
	testq %r8, %r8              # if n_powerups == 0: return false
	je .L_has_powerup_ret_false

	movb $1, %al                # ret = true
	cmpl %edi, <%ref powerups>  # powerups[i].type == type: return true
	je .L_has_powerup_ret

	movl $1, %esi               # i = 1
	leaq <%ref powerups>, %rax  # powerup = powerups
	addq $16, %rax              # powerup++

.L_has_powerup_loop:
	movq %rsi, %rdx             # save i
	cmpq %rsi, %r8              # if i == n_powerups: return false
	je .L_has_powerup_ret_cond

	leaq 1(%rdx), %rsi          # i++
	leaq 16(%rax), %rcx         # powerup++
	cmpl %edi, (%rax)           # if powerup->type == type: return true
	movq %rcx, %rax             # save powerup
	jne .L_has_powerup_loop

.L_has_powerup_ret_cond:
	cmpq %r8, %rdx              # return true or false
	setb %al

.L_has_powerup_ret:
	ret

.L_has_powerup_ret_false:
	xorl %eax, %eax             # return false
	ret

/**
 * Renders a powerup bar.
 * @rdi powerup The powerup to render.
 * @rsi y_offset The index of the powerup bar.
 * Lower indices will be placed lower on the screen.
 */
<%fn render_powerup_bar>
	pushq %rbp
	pushq %r15
	pushq %r14
	pushq %rbx
	pushq %rax

	// Compute width and position of powerup bar

	movq %rdi, %r15                # save powerup
	movl <%ref height>, %ebx       # load window height
	shll $3, %esi                  # y_offset *= 8
	leal (%rsi, %rsi, 4), %ebp     # y = y_offset * 40

	<%call now>
	subq 8(%r15), %rax             # rem = now() - powerup->time_activated
	imulq $200, %rax, %rax         # rem *= POWERUP_BAR_WIDTH
	movabsq $-2972493582642298179, %rcx # 1 / POWERUP_DURATION_USEC
	mulq %rcx                      # rem /= POWERUP_DURATION_USEC
	movq %rdx, %r14                # save remainder of division

	// Draw border

	xorl %edi, %edi                # set colour to rgba(0, 0, 0, 160)
	xorl %esi, %esi
	xorl %edx, %edx
	movl $160, %ecx
	<%call set_colour_rgba>

	movl $8, %edi                  # arg1 = x - POWERUP_BAR_BORDER_WIDTH / 2

	movl %ebp, %eax                # arg2 = y - POWERUP_BAR_BORDER_WIDTH / 2
	negl %eax
	leal (%rbx, %rax), %esi
	addl $-42, %esi

	movl $204, %edx                # arg3 = width
	movl $34, %ecx                 # arg4 = height
	movl $4, %r8d                  # arg5 = border thickness
	<%call stroke_rect>

	movl (%r15), %edx              # switch (powerup->type)
	cmpl $3, %edx                  #   case DT_SUPER_SPEED
	je .L_render_powerup_bar_switch_super_speed

	cmpl $2, %edx                  #   case DT_BIG_BULLETS
	je .L_render_powerup_bar_switch_big_bullets

	cmpl $1, %edx                  #   default
	jne .L_render_powerup_bar_switch_default

				       # case DT_FAST_SHOOTING
	movl $119, %edi                # set colour to rgba(119, 184, 242, 160)
	movl $184, %esi
	movl $242, %edx
	movl $160, %ecx
	<%call set_colour_rgba>

	leaq <%ref drop_fast_shooting>, %rax # icon = drop_fast_shooting
	jmp .L_render_powerup_bar_background

.L_render_powerup_bar_switch_super_speed:
	movl $245, %edi                # set colour to rgba(245, 212, 126, 160)
	movl $212, %esi
	movl $126, %edx
	movl $160, %ecx
	<%call set_colour_rgba>

	leaq <%ref drop_super_speed>, %rax # icon = drop_super_speed
	jmp .L_render_powerup_bar_background

.L_render_powerup_bar_switch_big_bullets:
	movl $127, %edi                # set colour to rgba(127, 208, 89, 160)
	movl $208, %esi
	movl $89, %edx
	movl $160, %ecx
	<%call set_colour_rgba>

	leaq <%ref drop_big_bullets>, %rax # icon = drop_big_bullets

.L_render_powerup_bar_background:
	// Fill background

	subl %ebp, %ebx                # compute y
	subl $40, %ebx                 # horizontal margin
	shrq $23, %r14                 # magically compute 200 - width
	movl $200, %edx
	subl %r14d, %edx               # width = 200 - magic value
	movq (%rax), %r14              # save pointer to icon

	movl $10, %edi                 # arg1 = x
	movl %ebx, %esi                # arg2 = y
				       # arg3 = width
	movl $30, %ecx                 # arg4 = height (already in %rdx)
	<%call fill_rect>

	// Draw icon

	movq %r14, %rdi                # arg1 = pointer to icon
	movl $15, %esi                 # arg2 = x
	addl $5, %ebx                  # vertical margin
	movl %ebx, %edx                # arg3 = y
	movl $20, %ecx                 # arg4 = width
	movl $20, %r8d                 # arg5 = height

	addq $8, %rsp                  # prepare to tailcall
	popq %rbx
	popq %r14
	popq %r15
	popq %rbp
	<%jmp render_surface>

.L_render_powerup_bar_switch_default:
	movl .L_render_powerup_bar_err_str(%rip), %edi # print err string
	xorl %eax, %eax

	addq $8, %rsp                  # prepare to tailcall
	popq %rbx
	popq %r14
	popq %r15
	popq %rbp
	<%jmp puts>

.L_render_powerup_bar_err_str:
	.string "Invalid powerup type %d"

/**
 * @brief Updates powerups and renders them.
 */
<%fn update_powerups>
	pushq %r14
	pushq %rbx
	pushq %rax

	<%call debug6>
	<%call now>                    # time = now()
	cmpq $0, <%ref n_powerups>     # if n_powerups == 0: return
	je .L_update_powerups_ret

	movq %rax, %r14                # save time
	xorl %ebx, %ebx                # i = 0
	jmp .L_update_powerups_loop

.L_update_powerups_loop_update:
	                               # arg1 (powerup) is already in %rdi
	movzbl %bl, %esi               # arg2 (y_offset) = i
	<%call render_powerup_bar>

	addq $1, %rbx                  # i++
	cmpq <%ref n_powerups>, %rbx   # if i < n_powerups: continue
	jae .L_update_powerups_ret

.L_update_powerups_loop:
	movq %rbx, %rax                # save i
	shlq $4, %rax                  # i *= 16
	leaq <%ref powerups>, %rcx
	leaq (%rcx, %rax), %rdi        # powerup = powerups[i]
	movq %r14, %rcx                # save time

	leaq 8(%rdi), %r8              # load powerup->time_activated
	subq (%r8), %rcx               # time -= powerup->time_activated
	cmpq $10000000, %rcx           # if time_diff < 1E7: update
	jb .L_update_powerups_loop_update

	<%call del_powerup>            # else: delete the powerup
	cmpq <%ref n_powerups>, %rbx   # if i < n_powerups: continue
	jb .L_update_powerups_loop

.L_update_powerups_ret:
	addq $8, %rsp
	popq %rbx
	popq %r14
	ret
