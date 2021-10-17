.equ Bullet_SIZE, 40

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
.global Bullet_is_active
Bullet_is_active:
	movzbl 8(%rdi), %eax # active = bullet->destroy_on_next_update
	xorl $1, %eax        # return ~active
	ret

/**
 * Moves a bullet forward one tick of time.
 * @rdi bullet The bullet to move.
 */
.global move_bullet
move_bullet:
	subq $24, %rsp           # for some reason 16 doesn't work ¯\_(ツ)_/¯

	# double dx @ 0(%rsp)
	# double dy @ 8(%rsp)

	movq %rdi, %r15          # save bullet

	pxor %xmm0, %xmm0        # zero %xmm0
	cvtss2sd 20(%rdi), %xmm0 # arg1 = bullet->heading (cast to double)
	leaq 8(%rsp), %rdi       # arg2 = &dy
	movq %rsp, %rsi          # arg3 = &dx
	call sincos

	# next will follow some floating point magic that will compute
	# bullet->x += dx * bullet->speed * dt
	# bullet->y += dy * bullet->speed * dt

	movq 20(%r15), %xmm0       # xmm0 = [ _heading, speed ]
	movupd (%rsp), %xmm1       # xmm1 = [ dx, dy ]
	shufps $0xe5, %xmm0, %xmm0 # drop junk
	cvtpd2ps %xmm1, %xmm1      # doubles to floats
	mulps %xmm1, %xmm0         # dx *= speed, dy *= speed
	movss dt(%rip), %xmm1      # xmm1 = dt
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
.global add_bullet
add_bullet:
	movq bullets(%rip), %r15   # load address of bullets array
	movq n_bullets(%rip), %rax # load n_bullets

	# this is a big brain way of getting a pointer to the next bullet

	leaq (%rax, %rax, 4), %rcx # rcx = 5 * n_bullets
	leaq (%r15, %rcx, 8), %r15 # bullet = bullets[rcx * 8]

	movq  %rdi, (%r15)         # bullet->id = id
	movb $0, 8(%r15)           # bullet->destroy_on_next_update = false

	# this is a big brain way of collecting the x, y, heading and speed
	# into a single xmm register

	unpcklps %xmm3, %xmm2      # interleave heading and speed
	unpcklps %xmm1, %xmm0      # interleave x and y
	movlhps %xmm2, %xmm0       # append xmm2 to xmm0
	movups %xmm0, 12(%r15)     # copy to memory

	movb %sil, 28(%r15)        # bullet->radius = radius
	movl %edx, 32(%r15)        # bullet->owner = owner

	addq $1, %rax              # increment n_bullets
	movq %rax, n_bullets(%rip) # store n_bullets
	ret

/**
 * Copies a bullet.
 * @rdi dst The destination for the bullet.
 * @rsi src The original bullet.
 */
.global copy_bullet
copy_bullet:
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
.global del_bullet
del_bullet:
	movb $1, 8(%rdi) # set the destroy_on_next_update flag
	ret

/**
 * Finds a bullet by its id and schedules it to be removed
 * in the next update.
 * @rdi bullet_id The id of the bullet to remove.
 */
.global del_bullet_by_id
del_bullet_by_id:
	movq n_bullets(%rip), %rdx # load n_bullets
	movq bullets(%rip), %rax   # pointer to start of bullets array

	# this is a big brain way of getting a pointer to the end of the array

	leaq (%rdx, %rdx, 4), %rdx # rdx = 5 * n_bullets
	leaq (%rax, %rdx, 8), %rdx # end = bullets[rdx * 8]

	cmpq %rdx, %rax            # search iff iterator < end
	jb .L_del_bullet_by_id_search
	ret

.L_del_bullet_by_id_search_next:
	addq $40, %rax             # it++
	cmpq %rdx, %rax            # stop searching iff iterator < end
	jnb .L_del_bullet_by_id_stop_search

.L_del_bullet_by_id_search:
	cmpq %rdi, (%rax)          # if it->id != bullet_id: continue search
	jne .L_del_bullet_by_id_search_next
	movb $1, 8(%rax)           # set the destroy_on_next_update flag

.L_del_bullet_by_id_stop_search:
	ret
