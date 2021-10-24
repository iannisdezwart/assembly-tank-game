/**
 * Renders one tank instance.
 * @rdi tank The tank to render. This struct contains the x, y and rotation.
 */
<%fn render_tank>
	pushq %rbx
	pushq %r12
	pushq %r13

	movq %rdi, %rbx                # save pointer to tank

	movss (%rdi), %xmm0            # arg1 = tank->x
	movss 4(%rdi), %xmm1           # arg2 = tank->y
	<%call translate>
	movl %eax, %r12d               # save translated x
	shrq $32, %rax                 # align for translated y
	movl %eax, %r13d               # save translated y

	movl $64, %edi                 # set colour to rgb(64, 70, 74)
	movl $70, %esi
	movl $74, %edx
	<%call set_colour_rgb>

	movl %r12d, %edi               # load translated x
	movl %r13d, %esi               # load translated y
	addl $20, %edi                 # arg1 = tr.x + TANK_BODY_RADIUS
	subl $8, %esi                  # arg2 = tr.y - TANK_GUN_HEIGHT / 2
	movl $20, %edx                 # arg3 = TANK_GUN_WIDTH
	movl $16, %ecx                 # arg4 = TANK_GUN_HEIGHT
	movss 8(%rbx), %xmm0           # arg5 = tank->rot
	movl %r12d, %r8d               # arg6 = translated x
	movl %r13d, %r9d               # arg7 = translated y
	<%call fill_rotated_rect>

	movl $3, %edi                  # set colour to rgb(3, 152, 252)
	movl $152, %esi
	movl $252, %edx
	<%call set_colour_rgb>

	movl %r12d, %edi               # arg1 = translated x
	movl %r13d, %esi               # arg2 = translated y
	movl $20, %edx                 # arg3 = TANK_BODY_RADIUS
	<%call fill_circle>

	movl $64, %edi                 # set colour to rgb(64, 64, 64)
	movl %edi, %esi
	movl %edi, %edx
	<%call set_colour_rgb>

	movl %r13d, %ecx               # load translated x

	movq <%ref font_16px>, %rdi    # arg1 = font_16px
	leaq 14(%rbx), %rsi            # arg2 = tank->username
	movl %r12d, %edx               # arg3 = tr.x
	subl $56, %ecx                 # arg4 = tr.y - margin
	<%call render_text_centred>

	popq %r13
	popq %r12
	popq %rbx
	ret
