.data

<%glbl super_speed_enabled>
	.zero 1

<%glbl num_other_players>
	.zero 1

<%glbl other_players>
	.skip 8128

<%glbl player>
	.skip 32

.L_float_0_04:
	.long 0x3d23d70a

.L_float_0_03:
	.long 0x3cf5c28f

.text
/**
 * Translates an in-game coordinate to a pixel on the screen.
 * @xmm0 x The in-game x coordinate.
 * @xmm1 y The in-game y coordinate.
 */
<%fn translate>
	# this function is called millions of times,
	# so we will use about every SIMD trick in the book!

	unpcklps %xmm1, %xmm0          # xmm0 = [ x, y ]
	# make use of the fact that the x and y coordinate of the player
	# are aligned as the first two dwords of the player structure
	movq <%ref player>, %xmm1      # xmm1 = [ player.x, player.y, rubbish ]
	subps %xmm1, %xmm0             # xmm0 = [ x - player.x, y - player.y ]

	movd <%ref width>, %xmm2       # xmm2 = width
	movd <%ref height>, %xmm3      # xmm3 = height
	punpckldq %xmm3, %xmm2         # xmm2 = [ width, height ]
	# fancy SIMD right shift
	psrld $1, %xmm2                # xmm2 = [ width / 2, height / 2 ]
	cvtdq2ps %xmm2, %xmm2          # convert xmm2 to floats

	# [ x - player.x + width / 2, y - player.y + height /2 ]
	addps %xmm0, %xmm2
	cvttps2dq %xmm2, %xmm0         # convert back to ints
	movq %xmm0, %rax               # return point

	ret

/**
 * Translates a pixel coordinate to the in-game coordinate.
 * @edi x The x coordinate of the pixel.
 * @esi y The y coordinate of the pixel.
 */
<%fn untranslate>
	# while we're at it, let's also optimise the heck out of this function
	# using the same elegant SIMD instructions

	movd %edi, %xmm0               # xmm0 = x
	movd %esi, %xmm1               # xmm2 = y

	punpckldq %xmm1, %xmm0         # xmm0 = [ x, y ]
	cvtdq2ps %xmm0, %xmm0          # convert xmm1 ??
	# make use of the fact that the x and y coordinate of the player
	# are aligned as the first two dwords of the player structure
	movq <%ref player>, %xmm1      # xmm1 = [ player.x, player.y, rubbish ]
	addps %xmm1, %xmm0             # xmm0 = [ x + player.x, y + player.y ]

	movd <%ref width>, %xmm1       # xmm1 = width
	movd <%ref height>, %xmm2      # xmm2 = height
	punpckldq %xmm2, %xmm1         # xmm1 = [ width, height ]
	# fancy SIMP right shift
	psrld $1, %xmm1                # xmm1 = [ width / 2, height / 2 ]
	cvtdq2ps %xmm1, %xmm1          # convert xmm1 ??

	# [ x + player.x - width / 2, y + player.y - height / 2 ]
	subps %xmm1, %xmm0
	cvttps2dq %xmm0, %xmm0         # convert back to ints
	movq %xmm0, %rax               # return point

	ret

/**
 * The current player speed.
 */
<%fn get_player_speed>
	cmpb $0, <%ref super_speed_enabled>
	movss .L_float_0_04(%rip), %xmm0
	jne .L_get_player_speed_ret
	movss .L_float_0_03(%rip), %xmm0

.L_get_player_speed_ret:
	ret
