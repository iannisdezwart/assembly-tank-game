/**
 * Clears the screen.
 */
<%fn clear_screen>
	subq $8, %rsp

	movq <%ref renderer>, %rdi     # arg1 = renderer
	<%call SDL_RenderClear>

	movl $255, %edi                # set colour to rgb(255, 255, 255)
	movl %edi, %esi
	movl %edi, %edx
	<%call set_colour_rgb>

	xorl %edi, %edi                # arg1 = 0
	xorl %esi, %esi                # arg2 = 0
	movl <%ref width>, %edx        # arg3 = width
	movl <%ref height>, %ecx       # arg4 = height
	<%call fill_rect>

	addq $8, %rsp
	ret

/**
 * Renders an FPS counter to the top left of the screen.
 */
<%fn render_fps_counter>
	subq $24, %rsp

	# char fps_str[16]

	movq %rsp, %rdi                # arg1 = fps_str
	movl $16, %esi                 # arg2 = sizeof(fps_str)
	leaq .L_render_fps_counter_fmt_str(%rip), %rdx # arg3 = fmt str
	movss <%ref fps>, %xmm0        # arg4 = fps
	cvtss2sd %xmm0, %xmm0          # convert fps to double
	movb $1, %al                   # 1 floating point argument
	<%call snprintf>

	movl $255, %edi                # set colour to rgb(255, 0, 0)
	xorl %esi, %esi
	xorl %edx, %edx
	<%call set_colour_rgb>

	movq <%ref font_20px>, %rdi    # arg1 = font_20px
	movq %rsp, %rsi                # arg2 = fps_str
	xorl %edx, %edx                # arg3 = x (0)
	xorl %ecx, %ecx                # arg4 = y (0)
	<%call render_text>

	addq $24, %rsp
	ret

.L_render_fps_counter_fmt_str:
	.string "%05.1f FPS"
