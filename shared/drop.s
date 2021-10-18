.equ Drop_SIZE, 24

/**
 * struct Drop:
 * Structure for a drop.
 * @0-3 x The x coordinate of the drop.
 * @4-7 y The y coordinate of the drop.
 * @8-11 type The type of drop.
 * @16-23 id The id of the drop.
 */

/**
 * Adds a drop to the drops array.
 * @edi x The x coordinate of the drop.
 * @esi y The y coordinate of the drop.
 * @edx type The type of drop.
 * @rcx id The id of drop.
 */
<%fn add_drop>
	movq <%ref n_drops>, %rax     # load n_drops
        movl %edx, %r8d               # save the type

        movd %edi, %xmm0              # load x in xmm
        movd %esi, %xmm1              # load y in xmm

        punpckldq %xmm1, %xmm0        # interleave as [ x, y ] into xmm0

        leaq (%rax, %rax, 2), %rdx    # rdx = n_drops * 3
        salq $3, %rdx                 # rdx *= 8 (now equal to n_drops * 24)

        addq $1, %rax                 # increment n_drops
        movq %rax, <%ref n_drops>     # store

        movq %xmm0, drops(%rdx)      # store x and y
        movl %r8d, drops+8(%rdx)     # store type
        movq %rcx, drops+16(%rdx)    # store id

        leaq (%rax, %rax, 2), %rax     # rax *= 3
        leaq drops-24(, %rax, 8), %rax # return drops + n_drops + 1
        ret
