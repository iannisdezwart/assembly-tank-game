/**
 * Renders all bullets in the current frame.
 */
                    # @render_bullets
//         pushq   %r15
//         pushq   %r14
//         pushq   %r13
//         pushq   %r12
//         pushq   %rbx
//         cmpq    $0, <%ref n_bullets>
//         je      .LBB0_6
//         movl    $32, %ebx
//         xorl    %r12d, %r12d
//         jmp     .LBB0_2
// .LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
//         movl    $-1, %edi
//         movl    $120, %esi
//         movl    $120, %edx
// .LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
//         <%call set_colour_rgb>
//         movzbl  -4(%r13,%rbx), %edx
//         movl    %r14d, %edi
//         movl    %r15d, %esi
//         <%call fill_circle>
//         addq    $1, %r12
//         addq    $40, %rbx
//         cmpq    <%ref n_bullets>, %r12
//         jae     .LBB0_6
// .LBB0_2:                                # =>This Inner Loop Header: Depth=1
//         movq    <%ref bullets>, %r13
//         movss   -20(%r13,%rbx), %xmm0           # xmm0 = mem[0],zero,zero,zero
//         movss   -16(%r13,%rbx), %xmm1           # xmm1 = mem[0],zero,zero,zero
//         <%call translate>
//         movq    %rax, %r14
//         movq    %rax, %r15
//         shrq    $32, %r15
//         movl    (%r13,%rbx), %eax
//         cmpl    <%ref client_id>, %eax
//         jne     .LBB0_4
//         movl    $120, %edi
//         movl    $120, %esi
//         movl    $-1, %edx
//         jmp     .LBB0_5
// .LBB0_6:
//         popq    %rbx
//         popq    %r12
//         popq    %r13
//         popq    %r14
//         popq    %r15
//         retq

/* <%fn render_bullets> */
        pushq %r15
        pushq %r14
        pushq %r13
        pushq %r12
        pushq %rbx

	leaq <%ref n_bullets>, %rax    # load n_bullets
        cmpq $0, (%rax)                # if there is nothing to render, return
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
        movl $-1, %edx                 # 0xFF blue

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

.L_render_bullets_opponent:
        movl $-1, %edi                 # 0xFF red
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
