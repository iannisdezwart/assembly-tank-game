.equ Drop_SIZE, 24
.equ MAX_DROPS, 20

.data
<%glbl n_drops>
	.quad 0

<%glbl drops>
	.zero 480

.text
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

/**
 * Copies a drop.
 * @rdi dst A pointer to the destination drop.
 * @rsi src A pointer to the source drop.
 */
<%fn copy_drop>
	# bytes 0-7

        movq (%rsi), %rax
        movq %rax, (%rdi)

	# bytes 8-11

        movl 8(%rsi), %eax
        movl %eax, 8(%rdi)

	# bytes 16-23

        movq 16(%rsi), %rax
        movq %rax, 16(%rdi)
        ret

/**
 * Removes a drop from the drops array.
 * @rdi drop A pointer to the drop to remove.
 */
<%fn del_drop>
	subq $8, %rsp

	leaq <%ref drops>, %rdx    # load drops
        movq <%ref n_drops>, %rax  # load n_drops
        leaq -1(%rax), %rcx        # n_drops--
        movq %rcx, <%ref n_drops>  # store n_drops

        leaq (%rcx, %rcx, 2), %rsi # n_drops *= 3
        salq $3, %rsi              # n_drops *= 8
	addq %rdx, %rsi            # last = drops + n_drops
	<%call copy_drop>

	addq $8, %rsp
        ret

/**
 * Remove a drop from the drops array by id.
 * @rdi id The id of the drop to remove.
 */
<%fn del_drop_by_id>
	subq $8, %rsp
	movq %rdi, %rax            # save id
	leaq <%ref drops>, %rdi    # drop = drops
	jmp .L_del_drop_by_id_check

.L_del_drop_by_id_loop:
	addq $24, %rdi             # drop++

.L_del_drop_by_id_check:
	movq 16(%rdi), %rcx        # load drop->id
	cmpq %rcx, %rax            # if drop->id == id: stop
	jne .L_del_drop_by_id_loop

	<%call del_drop>

	addq $8, %rsp
	ret

/**
 * Checks if the drops array is full.
 */
<%fn drops_full>
	cmpq $MAX_DROPS, <%ref n_drops>
	sete %al
	ret

.equ Powerup_SIZE, 16

/**
 * struct Powerup
 * A structure for a powerup.
 * @0-3 type The powerup type.
 * @8-15 time_activated When this powerup was activated.
 */

/**
 * Copies a powerup.
 * @rdi dst A pointer to the destination drop.
 * @rsi src A pointer to the drop to copy.
 */
<%fn copy_powerup>
	# bytes 0-3

        movl (%rsi), %eax
        movl %eax, (%rdi)

	# bytes 0-15

        movq 8(%rsi), %rax
        movq %rax, 8(%rdi)

	ret
