/**
 * Draws a health bar below a tank.
 * @rdi tank The tank to draw a health bar for.
 */
<%fn render_health_bar>
	pushq %r15
	pushq %r14
	pushq %rbx

	movq %rdi, %r14             # save tank
	movss (%rdi), %xmm0         # arg1 = tank->x
	movss 4(%rdi), %xmm1        # arg2 = tank->y
	<%call translate>

	movq %rax, %r15             # save translated x
	movq %rax, %rbx             # save translated y
	shrq $32, %rbx              # align y

	xorl %edi, %edi             # set colour to rgb(0, 0, 0)
	xorl %esi, %esi
	xorl %edx, %edx
	<%call set_colour_rgb>

	leal -25(%r15), %edi        # arg1 = x - HEALTH_BAR_WIDTH / 2
	leal 43(%rbx), %esi         # arg2 = y + TANK_BODY_RADIUS + margin
	movl $50, %edx              # arg3 = width
	movl $10, %ecx              # arg4 = height
	movl $2, %r8d               # arg5 = border thickness
	<%call stroke_rect>

	movb 12(%r14), %al          # load tank->health
	testb %al, %al              # if tank->health >= 128: render green bar
	js .L_render_health_bar_green

	cmpb $64, %al               # if tank->health < 64: render red bar
	jb .L_render_health_bar_red

	                            # render orange bar
	movl $-55, %edi             # set colour to rgb(201, 143, 42)
	movl $-113, %esi
	movl $42, %edx
	jmp .L_render_health_bar_render_bar

.L_render_health_bar_green:
	movl $50, %edi              # set colour to rgb(50, 168, 82)
	movl $-88, %esi
	movl $82, %edx
	jmp .L_render_health_bar_render_bar

.L_render_health_bar_red:           # set colour to rgb(194, 60, 60)
	movl $-62, %edi
	movl $60, %esi
	movl $60, %edx

.L_render_health_bar_render_bar:
	<%call set_colour_rgb>

	movzbl 12(%r14), %eax       # load tank->health
	imull $1579056, %eax, %edx  # tank health *= HEALTH_BAR_WIDTH
	shrl $23, %edx              # tank health /= MAX_HEALTH
	addl $44, %ebx              # y += TANK_BODY_RADIUS + margin

	leal -24(%r15), %edi        # arg1 = x - HEALTH_BAR_WIDTH / 2
	movl %ebx, %esi             # arg2 = y + TANK_BODY_RADIUS + margin
	                            # arg3 = width (already in %edx)
	movl $8, %ecx               # arg4 = height

	popq %rbx                   # prepare to tailcall
	popq %r14
	popq %r15
	<%jmp fill_rect>
