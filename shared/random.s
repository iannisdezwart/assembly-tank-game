/**
 * Returns a random integer between min and max.
 * @edi min The lower bound, inclusive.
 * @esi max The upper bound, inclusive.
 */
<%fn random_int>
	subq $8, %rsp

	movl %edi, %ebx          # save min
	movl %esi, %r14d         # save max

	xorl %eax, %eax          # clear %eax
	<%call rand>             # rand_num = rand()

	subl %ebx, %r14d         # range = max - min
	leal 1(%r14d), %esi      # range += 1

	xorl %edx, %edx          # clear %edx for division
	divl %esi                # rand_num %= range
	leal (%rdx, %rbx), %eax  # return rand_num + min

	addq $8, %rsp
	ret
