/**
 * Renders the renderer to the frame.
 */
<%fn render_frame>
	movq <%ref renderer>, %rdi     # arg1 = renderer
	<%jmp SDL_RenderPresent>       # tailcall

/**
 * Sets the drawing colour to an rgb value.
 * The alpha value is implicitly set to 0xFF.
 * @dil r 8-bit red value.
 * @sil g 8-bit green value.
 * @dl b 8-bit blue value.
 */
<%fn set_colour_rgb>
	movl $-1, %r8d                 # arg5 = alpha (255)
	movb %dl, %cl                  # arg4 = blue
	movb %sil, %dl                 # arg3 = green
	movb %dil, %sil                # arg2 = red
	movq <%ref renderer>, %rdi     # arg1 = renderer
	<%jmp SDL_SetRenderDrawColor>  # tailcall

/**
 * Sets the drawing colour to an rgba value.
 * @dil r 8-bit red value.
 * @sil g 8-bit green value.
 * @dl b 8-bit blue value.
 * @cl a 8-bit alpha value.
 */
<%fn set_colour_rgba>
	movb %cl, %r8b                 # arg5 = alpha (255)
	movb %dl, %cl                  # arg4 = blue
	movb %sil, %dl                 # arg3 = green
	movb %dil, %sil                # arg2 = red
	movq <%ref renderer>, %rdi     # arg1 = renderer
	<%jmp SDL_SetRenderDrawColor>  # tailcall

/**
 * Draws a filled rectangle.
 * @edi x The x coordinate of the top left corner.
 * @esi y The y coordinate of the top left corner.
 * @edx width The width of the rectangle.
 * @ecx height The height of the rectangle.
 */
<%fn fill_rect>
	subq $24, %rsp

	# SDL_Rect rect @ 0(%rsp)

	movl %edi, (%rsp)              # store x coordinate in rect struct
	movl %esi, 4(%rsp)             # store y coordinate in rect struct
	movl %edx, 8(%rsp)             # store width in rect struct
	movl %ecx, 12(%rsp)            # store height in rect struct

	movq <%ref renderer>, %rdi     # arg1 = renderer
	movq %rsp, %rsi                # arg2 = rect
	<%call SDL_RenderFillRect>

	addq $24, %rsp
	ret

/**
 * @brief Draws a stroked rectangle.
 * @edi x The x coordinate of the top left corner.
 * @esi y The y coordinate of the top left corner.
 * @edx width The width of the rectangle.
 * @ecx height The height of the rectangle.
 * @r8d thickness The line tickness of the rectangle.
 */
<%fn stroke_rect>
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15

	movl %r8d, %r15d               # save thickness
	shrl $1, %r8d                  # offset = thickness / 2

	movl %edi, %r14d               # load x
	subl %r8d, %r14d               # x_left = x - offset

	movl %esi, %r13d               # load y
	subl %r8d, %r13d               # y_top = y - offset

	movl %edx, %r12d               # save width
	movl %ecx, %ebx                # save height

	# top line

	movl %r14d, %edi               # arg1 = x_left
	movl %r13d, %esi               # arg2 = y_top
	movl %r12d, %edx               # arg3 = width
	addl %r15d, %edx               # arg3 += thickness
	movl %r15d, %ecx               # arg4 = thickness
	<%call fill_rect>

	# bottom line

	movl %r14d, %edi               # arg1 = x_left
	movl %r13d, %esi               # arg2 = y_top
	addl %ebx, %esi                # arg2 += height
	movl %r12d, %edx               # arg3 = width
	addl %r15d, %edx               # arg3 += thickness
	movl %r15d, %ecx               # arg4 = thickness
	<%call fill_rect>

	addl %r15d, %r13d              # y_bottom = y_top + thickness

	# left line

	movl %r14d, %edi               # arg1 = x_left
	movl %r13d, %esi               # arg2 = y_bottom
	movl %r15d, %edx               # arg3 = thickness
	movl %ebx, %ecx                # arg4 = height
	subl %r15d, %ecx               # arg4 -= thickness
	<%call fill_rect>

	# right line

	movl %r14d, %edi               # arg1 = x_left
	addl %r12d, %edi               # arg1 += width
	movl %r13d, %esi               # arg2 = y_bottom
	movl %r15d, %edx               # arg3 = thickness
	movl %ebx, %ecx                # arg4 = height
	subl %r15d, %ecx               # arg4 -= thickness
	<%call fill_rect>

	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	ret

/**
 * Rotates a point around an origin point with an angle.
 * @edi x The x coordinate of the point.
 * @esi y The y coordinate of the point.
 * @xmm0 angle The angle of rotation.
 * @edx x_origin The x coordinate of the origin.
 * @ecx y_origin The y coordinate of the origin.
 */
<%fn rotate_point_around_point>
	pushq %r13
	pushq %r12
	pushq %rbp
	pushq %rbx
	subq $24, %rsp

	# float sin @ 8(%rsp)
	# float cos @ 12(%rsp)

	movl %edi, %r12d               # save x
	movl %esi, %ebp                # save y
	movl %ecx, %r13d               # save y_origin
	movl %edx, %ebx                # save x_origin

	subl %r13d, %ebp               # dy = y - y_origin
	subl %ebx, %r12d               # dx = x - x_origin

	leaq 8(%rsp), %rsi             # arg1 = &sin
	leaq 12(%rsp), %rdi            # arg2 = &cos
	<%call sincosf>

	movss 12(%rsp), %xmm1          # load cos into xmm1
	movss 8(%rsp), %xmm0           # load sin into xmm3
	unpcklps %xmm1, %xmm0          # unpack: xmm0 = [ sin, cos ]
	unpcklps %xmm0, %xmm1          # unpack: xmm1 = [ cos, sin ]

	pxor %xmm2, %xmm2              # zero xmm2
	cvtsi2ssl %r12d, %xmm2         # load dx cast to float into xmm2
	shufps $0xe0, %xmm2, %xmm2     # copy and align dx
	mulps %xmm2, %xmm0             # xmm0 = [ dx * sin, dx * cos ]

	pxor %xmm2, %xmm2              # zero xmm2
	cvtsi2ssl %ebp, %xmm2          # load dy cast to float into xmm2
	shufps $0xe0, %xmm2, %xmm2     # copy and align dy
	mulps %xmm2, %xmm1             # xmm1 = [ dy * cos, dy * sin ]

	movaps %xmm0, %xmm2            # save [ dx * sin, dx * cos ] to xmm2
	subps %xmm1, %xmm2             # xmm2 = [ dx * cos - dy * sin, rubbish ]
	addps %xmm1, %xmm0             # xmm0 = [ dx * sin + dy * cos, rubbish ]

	movd %ebx, %xmm1               # load x_origin into xmm1
	movd %r13d, %xmm4              # load y_origin into xmm4
	punpckldq %xmm4, %xmm1         # xmm1 = [ x_origin, y_origin ]
	cvtdq2ps %xmm1, %xmm1          # convert xmm1 ints to floats

	# [ dx * cos - dy * sin, dx * sin + dy * cos ]
	movss %xmm2, %xmm0

	# [ dx * cos - dy * sin + x_origin, dx * sin + dy * cos + y_origin ]
	addps %xmm1, %xmm0

	cvttps2dq %xmm0, %xmm5 # convert floats to ints
	movq %xmm5, %rax       # return point

	addq $24, %rsp
	popq %rbx
	popq %rbp
	popq %r12
	popq %r13
	ret

/**
 * Draws a filled rotated rectangle.
 * Coordinates and lengths of a normal rectangle (the original) are passed.
 * This original rectangle is then rotated around an origin.
 * Then it is drawn to the screen.
 * @edi x The x coordinate of the top left corner of the original rectangle.
 * @esi y The y coordinate of the top left corner of the original rectangle.
 * @edx width The width of the original rectangle.
 * @ecx height The height of the original rectangle.
 * @xmm0 angle The angle to rotate the rectangle with.
 * @r8d x_origin The x coordinate of the origin to rotate from.
 * @r9d y_origin The y coordinate of the origin to rotate from.
 */
<%fn fill_rotated_rect>
	pushq %rbp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	subq $24, %rsp

	# float angle @  8(%rsp)
	# int x_max   @ 12(%rsp)

	leal (%rdx, %rdi), %eax        # compute x + width
	movl %eax, 12(%rsp)            # save in x_max
	movss %xmm0, 8(%rsp)           # save angle

	cmpl %eax, %edi                # if x >= x_max: return
	jnb .L_fill_rotated_rect_ret

	leal (%rcx, %rsi), %ebp        # y_max = y + height

	movl %edi, %ebx                # save x
	movl %esi, %r14d               # save y
	movl %r8d, %r12d               # save x_origin
	movl %r9d, %r13d               # save y_origin

	cmpl %ebp, %esi                # if y >= y_max: return
	jnb .L_fill_rotated_rect_ret

.L_fill_rotated_rect_horizontal_loop:
	movl %r14d, %r15d              # load y

.L_fill_rotated_rect_vertical_loop:
	movl %ebx, %edi                # arg1 = x
	movl %r15d, %esi               # arg2 = y
	movss 8(%rsp), %xmm0           # arg3 = angle
	movl %r12d, %edx               # arg4 = x_origin
	movl %r13d, %ecx               # arg5 = y_origin
	<%call rotate_point_around_point>
	movq %rax, %rcx                # save rotated point
	shrq $32, %rcx                 # align for y

	movq <%ref renderer>, %rdi     # arg1 = load renderer
	movl %eax, %esi                # arg2 = rotated_point.x
	movl %ecx, %edx                # arg3 = rotate_point.y
	<%call SDL_RenderDrawPoint>

	addl $1, %r15d                 # y++
	cmpl %ebp, %r15d               # if y >= y_max: break
	jb .L_fill_rotated_rect_vertical_loop

	addl $1, %ebx                  # x++
	cmpl %ebx, 12(%rsp)            # if x >= x_max: break
	ja .L_fill_rotated_rect_horizontal_loop

.L_fill_rotated_rect_ret:
	addq $24, %rsp
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	popq %rbp
	ret
