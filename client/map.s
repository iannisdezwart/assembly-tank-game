/**
 * Renders the map border.
 */
<%fn render_map_border>
	subq $8, %rsp

	xorl %edi, %edi      # set colour to rgb(0, 0, 0)
	xorl %esi, %esi
	xorl %edx, %edx
	<%call set_colour_rgb>

	pxor %xmm0, %xmm0    # arg1 = 0
	pxor %xmm1, %xmm1    # arg2 = 0
	<%call translate>

	movl %eax, %edi      # arg1 = translated x
	shrq $32, %rax       # align for translated x
	movl %eax, %esi      # arg2 = translated y
	movl $5000, %edx     # arg3 = MAP_WIDTH
	movl $5000, %ecx     # arg4 = MAP_WIDTH
	movl $10, %r8d       # arg5 = MAP_BORDER_THICKNESS
	<%call stroke_rect>

	addq $8, %rsp
	ret

/**
 * Renders the map grid.
 */
<%fn render_map_grid>
	subq $8, %rsp

	movb $192, %dil      # set colour to rgb(192, 192, 192)
	movb %dil, %sil
	movb %dil, %dl
	<%call set_colour_rgb>

	xorl %ebx, %ebx      # x = 0

.L_render_map_grid_vertical_loop_check:
	cmpl $5000, %ebx     # continue as long as x < MAP_WIDTH
	jge .L_render_map_grid_horizontal_loop_setup

	xorps %xmm0, %xmm0   # clear xmm0
	cvtsi2ss %ebx, %xmm0 # arg1 = (float) x
	xorps %xmm1, %xmm1   # arg2 = 0
	<%call translate>

	movl %eax, %edi      # arg1 = point.x
	shrq $32, %rax       # align for point.y
	movl %eax, %esi      # arg2 = point.y
	movl $1, %edx        # arg3 = MAP_GRID_THICKNESS
	movl $5000, %ecx     # arg4 = MAP_HEIGHT
	<%call fill_rect>

	addl $50, %ebx       # x += MAP_GRID_SPACING
	jmp .L_render_map_grid_vertical_loop_check

.L_render_map_grid_horizontal_loop_setup:

	xorl %ebx, %ebx      # y = 0

.L_render_map_grid_horizontal_loop_check:
	cmpl $5000, %ebx     # continue as long as y < MAP_WIDTH
	jge .L_render_map_grid_ret

	xorps %xmm0, %xmm0   # arg1 = 0
	xorps %xmm1, %xmm1   # clear xmm1
	cvtsi2ss %ebx, %xmm1 # arg2 = (float) y
	<%call translate>

	movl %eax, %edi      # arg1 = point.x
	shrq $32, %rax       # align for point.y
	movl %eax, %esi      # arg2 = point.y
	movl $5000, %edx     # arg4 = MAP_WIDTH
	movl $1, %ecx        # arg3 = MAP_GRID_THICKNESS
	<%call fill_rect>

	addl $50, %ebx       # y += MAP_GRID_SPACING
	jmp .L_render_map_grid_horizontal_loop_check

.L_render_map_grid_ret:

	addq $8, %rsp
	ret
