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
	movq <%ref n_drops>, %r8      # load n_drops
	leaq <%ref drops>, %r10       # load pointer to drops array
        leaq (%r8, %r8, 2), %r9       # rdx = n_drops * 3

	movl %edi, (%r10, %r9, 8)     # drop->x = x
	movl %esi, 4(%r10, %r9, 8)    # drop->y = y
	movl %edx, 8(%r10, %r9, 8)    # drop->type = type
	movq %rcx, 16(%r10, %r9, 8)   # drop->id = id

        addq $1, %r8                  # increment n_drops
        movq %r8, <%ref n_drops>      # store

	leaq (%r10, %r9, 8), %rax     # return drops + n_drops
        ret
