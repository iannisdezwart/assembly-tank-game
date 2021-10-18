.equ Bullet_SIZE, 40

<%lbl .L_MAP_SIZE>
	.long   1167867904 # 5000.0

/**
 * struct Bullet:
 * A structure for a bullet.
 * @0-7 id The unique identifier of the bullet.
 * @8-8 destroy_on_next_update If this flag is enabled, the bullet will
 * in the next server tick.
 * @12-15 x The x coordinate of the bullet.
 * @16-19 y The y coordinate of the bullet.
 * @20-23 heading The heading of the bullet.
 * @24-27 speed The speed of the bullet.
 * @28-28 radius The radius of the bullet.
 * @32-35 owner The unique identifier of the client owning the bullet.
 */

/**
 * Checks if a bullet is active. A bullet is active if its
 * `destroy_on_next_update` flag is set to false.
 * @rdi bullet The bullet to check.
 */
<%fn Bullet_is_active>
	movzbl 8(%rdi), %eax # active = bullet->destroy_on_next_update
	xorl $1, %eax        # return ~active
	ret

/**
 * Moves a bullet forward one tick of time.
 * @rdi bullet The bullet to move.
 */
<%fn move_bullet>
	subq $24, %rsp

	# double dx @ 0(%rsp)
	# double dy @ 8(%rsp)

	movq %rdi, %r15          # save bullet

	pxor %xmm0, %xmm0        # zero %xmm0
	cvtss2sd 20(%rdi), %xmm0 # arg1 = bullet->heading (cast to double)
	leaq 8(%rsp), %rdi       # arg2 = &dy
	movq %rsp, %rsi          # arg3 = &dx
	<%call sincos>

	# next will follow some floating point magic that will compute
	# bullet->x += dx * bullet->speed * dt
	# bullet->y += dy * bullet->speed * dt

	movq 20(%r15), %xmm0       # xmm0 = [ _heading, speed ]
	movupd (%rsp), %xmm1       # xmm1 = [ dx, dy ]
	shufps $0xe5, %xmm0, %xmm0 # drop junk
	cvtpd2ps %xmm1, %xmm1      # doubles to floats
	mulps %xmm1, %xmm0         # dx *= speed, dy *= speed
	movss <%ref dt>, %xmm1     # xmm1 = dt
	shufps $0xe0, %xmm1, %xmm1 # drop junk
	mulps %xmm1, %xmm0         # dx *= dt, dy *= dt
	movq 12(%r15), %xmm1       # xmm1 = [ bullet->x, bullet_y ]
	addps %xmm1, %xmm0         # compute the next values for bullet x and y
	movlps %xmm0, 12(%r15)     # save the values back into memory

	addq $24, %rsp
	ret

/**
 * Adds a new bullet struct to the bullet array.
 * @rdi bullet_id The id of the bullet.
 * @xmm0 x The x coordinate of the starting position of the bullet.
 * @xmm1 y The y coordinate of the starting position of the bullet.
 * @xmm2 heading The heading of the bullet.
 * @sil radius The radius of the bullet.
 * @xmm3 speed The speed of the bullet.
 * @edx owner The id of the owner of the bullet.
 */
<%fn add_bullet>
	movq <%ref bullets>, %r15   # load address of bullets array
	movq <%ref n_bullets>, %rax # load n_bullets

	# this is a big brain way of getting a pointer to the next bullet

	leaq (%rax, %rax, 4), %rcx  # rcx = 5 * n_bullets
	leaq (%r15, %rcx, 8), %r15  # bullet = bullets[rcx * 8]

	movq  %rdi, (%r15)          # bullet->id = id
	movb $0, 8(%r15)            # bullet->destroy_on_next_update = false

	# this is a big brain way of collecting the x, y, heading and speed
	# into a single xmm register

	unpcklps %xmm3, %xmm2       # interleave heading and speed
	unpcklps %xmm1, %xmm0       # interleave x and y
	movlhps %xmm2, %xmm0        # append xmm2 to xmm0
	movups %xmm0, 12(%r15)      # copy to memory

	movb %sil, 28(%r15)         # bullet->radius = radius
	movl %edx, 32(%r15)         # bullet->owner = owner

	addq $1, %rax               # increment n_bullets
	movq %rax, <%ref n_bullets> # store n_bullets
	ret

/**
 * Copies a bullet.
 * @rdi dst The destination for the bullet.
 * @rsi src The original bullet.
 */
<%fn copy_bullet>
	# bytes 0-15

	movdqu (%rsi), %xmm0   # load src
	movups %xmm1, (%rdi)   # store in dst

	# bytes 16-31

	movdqu 16(%rsi), %xmm0 # load src + 16
	movups %xmm1, 16(%rdi) # store in dst + 16

	# bytes 32-40

	movq 32(%rsi), %rax
	movq %rax, 32(%rdi)

	ret

/**
 * Schedules a bullet to be removed in the next update.
 * @rdi bullet The the bullet to remove.
 */
<%fn del_bullet>
	movb $1, 8(%rdi) # set the destroy_on_next_update flag
	ret

/**
 * Finds a bullet by its id and schedules it to be removed
 * in the next update.
 * @rdi bullet_id The id of the bullet to remove.
 */
<%fn del_bullet_by_id>
	movq <%ref n_bullets>, %rdx # load n_bullets
	movq <%ref bullets>, %rax   # pointer to start of bullets array

	# this is a big brain way of getting a pointer to the end of the array

	leaq (%rdx, %rdx, 4), %rdx  # rdx = 5 * n_bullets
	leaq (%rax, %rdx, 8), %rdx  # end = bullets[rdx * 8]

	cmpq %rdx, %rax             # search iff iterator < end
	jb .L_del_bullet_by_id_search
	ret

.L_del_bullet_by_id_search_next:
	addq $40, %rax              # it++
	cmpq %rdx, %rax             # stop searching iff iterator < end
	jnb .L_del_bullet_by_id_stop_search

.L_del_bullet_by_id_search:
	cmpq %rdi, (%rax)           # if it->id != bullet_id: continue search
	jne .L_del_bullet_by_id_search_next
	movb $1, 8(%rax)            # set the destroy_on_next_update flag

.L_del_bullet_by_id_stop_search:
	ret

/**
 * Updates the location of bullets.
 */
<%fn update_bullets>
	movq <%ref n_bullets>, %rax # load n_bullets
        testq %rax, %rax            # if n_bullets == 0: don't do anything
        je .L_update_bullets_end_ret

        pushq %r12
        pushq %rbp
        pushq %rbx

        xorl %ebx, %ebx            # i = 0
        xorl %r12d, %r12d          # new_i = 0

.L_update_bullets_next:
        movq <%ref bullets>, %rdx  # bullet = bullets

	# this is a big brain way of getting a pointer to the next bullet

        leaq (%rbx, %rbx, 4), %rax # rax = 5 * i
        leaq (%rdx, %rax, 8), %rbp # bullet = bullets[rax * 8]

        movq %rbp, %rdi         # arg1 = bullet
        <%call move_bullet>

        movss 12(%rbp), %xmm0 # load bullet->x
        pxor %xmm1, %xmm1     # load 0
        comiss %xmm1, %xmm0   # if bullet->x <= 0: continue
        jbe .L_update_bullets_next_continue

        movss <%ref .L_MAP_SIZE>, %xmm2
        comiss %xmm0, %xmm2   # if bullet->x > MAP_SIZE: continue
        jbe .L_update_bullets_next_continue

        movss 16(%rbp), %xmm0
        comiss %xmm1, %xmm0   # if bullet->y <= 0: continue
        jbe .L_update_bullets_next_continue

        comiss %xmm0, %xmm2   # if bullet->y > MAP_SIZE: continue
        jbe .L_update_bullets_next_continue

        cmpb $0, 8(%rbp)      # if !bullet->destroy_on_next_update: continue
        je .L_update_bullets_next_include

.L_update_bullets_next_continue:
        addq $1, %rbx
        cmpq %rbx, <%ref n_bullets>
        ja .L_update_bullets_next

.L_update_bullets_end_loop:
        movslq  %r12d, %rax          # save new_i

.L_update_bullets_end:
        movq %rax, <%ref n_bullets>  # n_bullets = new_i

	# swap the pointers to the `bullets` and `new_bullets` array.
	# this is a sneaky way to "move" the new bullets to the current bullets
	# array without having to actually copy them.
	# we simply relabel the `new_bullet` array as the new `bullet` array.

        movq <%ref bullets>, %rdx     # load pointer to bullets array
        movq <%ref new_bullets>, %rax # load pointer to new bullets array
        movq %rdx, <%ref new_bullets> # new_bullets = bullets
        movq %rax, <%ref bullets>     # bullets = new_bullets

        popq %rbx
        popq %rbp
        popq %r12

.L_update_bullets_end_ret:
        ret

.L_update_bullets_next_include:
        movslq %r12d, %rax           # load new_i as 64-bit
        movq %rbp, %rdi              # arg1 = bullet

	# this is a big brain way of getting a pointer to the next bullet

        leaq (%rax, %rax, 4), %rdx   # rax = 5 * new_i
        movq <%ref new_bullets>, %rax
        leaq (%rax, %rdx, 8), %rsi   # arg2 = new_bullets + rax * 4
        <%call copy_bullet>

        addq $1, %rbx                # i++
        addl $1, %r12d               # new_i++

        cmpq %rbx, <%ref n_bullets>  # if i < n_bullets: continue loop
        ja .L_update_bullets_next
        jmp .L_update_bullets_end_loop