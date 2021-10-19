/**
 * Renders all bullets in the current frame.
 */

<%fn render_bullets>
        pushq %r15
        pushq %r14
        pushq %r13
        pushq %r12
        pushq %rbx

        cmpq $0, <%ref n_bullets>      # if there is nothing to render, return
        je .L_render_bullets_ret

        movl $32, %ebx                 # offset to x and y
        xorl %r12d, %r12d              # i = 0

.L_render_bullets_loop:
        movq <%ref bullets>, %r13      # load pointer to bullets
	movss -20(%r13, %rbx), %xmm0   # xmm0 = bullet->x
        movss -16(%r13, %rbx), %xmm1   # xmm1 = bullet->y
        <%call translate>

        movq %rax, %r14                # x = tr->x
        movq %rax, %r15                # y = tr->y
        shrq $32, %r15

        movl (%r13, %rbx), %eax        # load bullet->owner
        cmpl <%ref client_id>, %eax    # if bullet->owner != client->id:
        jne .L_render_bullets_opponent # render opponent bullet

        movl $120, %edi                # 0x78 red
        movl $120, %esi                # 0x78 green
        movl $255, %edx                 # 0xFF blue

.L_render_bullets_draw:
        <%call set_colour_rgb>

        movl %r14d, %edi               # arg1 = tr->x
        movl %r15d, %esi               # arg2 = tr->y
        movzbl -4(%r13, %rbx), %edx    # arg3 = bullet->radius
        <%call fill_circle>

        addq $1, %r12                  # i++
        addq $40, %rbx                 # bullet++

        cmpq <%ref n_bullets>, %r12    # if (i == n_bullets): break
        jae .L_render_bullets_ret
	jmp .L_render_bullets_loop

.L_render_bullets_opponent:
        movl $255, %edi                 # 0xFF red
        movl $120, %esi                # 0x78 green
        movl $120, %edx                # 0x78 blue
	jmp .L_render_bullets_draw

.L_render_bullets_ret:
        popq %rbx
        popq %r12
        popq %r13
        popq %r14
        popq %r15
        ret

/**
 * Messages the server that the client shot a bullet.
 * @xmm0 x The x coordinate of the starting position of the bullet.
 * @xmm1 y The y coordinate of the starting position of the bullet.
 * @xmm2 heading The heading of the bullet.
 */
<%fn send_bullet>
	# char buf[13]  @ 0-12(%rsp)
	# char *ptr     @ 16-23(%rsp)
	# float x       @ 24-27(%rsp)
	# float y       @ 28-31(%rsp)
	# float heading @ 32-35(%rsp)

	subq $40, %rsp
	movss %xmm0, 24(%rsp)       # save x
	movss %xmm1, 28(%rsp)       # save y
	movss %xmm2, 32(%rsp)       # save heading

	movq %rsp, %r15             # ptr = buf

	movq %r15, 16(%rsp)         # store &ptr
	leaq 16(%rsp), %rdi         # arg1 = &ptr
	movb $2, %sil               # arg2 = CMT_SHOOT_BULLET
	<%call write_u8>

	leaq 16(%rsp), %rdi         # arg1 = &ptr
	movss 24(%rsp), %xmm0       # arg2 = x
	<%call write_f32>

	leaq 16(%rsp), %rdi         # arg1 = &ptr
	movss 28(%rsp), %xmm0       # arg2 = y
	<%call write_f32>

	leaq 16(%rsp), %rdi         # arg1 = &ptr
	movss 32(%rsp), %xmm0       # arg2 = heading
	<%call write_f32>

	movl <%ref socket_fd>, %edi # arg1 = socket_fd
	leaq 0(%rsp), %rsi          # arg2 = buf
	movl $13, %edx              # arg3 = sizeof(buf)
	<%call write_to_socket>

	addq $40, %rsp
	ret
