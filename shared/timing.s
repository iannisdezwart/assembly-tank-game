.equ USEC_PER_DT, 100
.equ USEC_PER_SERVER_TICK, 10000

.data
<%fn dt>
	.long 0

.text
/**
 * Returns the number of microseconds since EPOCH.
 */
<%fn now>
        subq    $24, %rsp
        leaq    8(%rsp), %rdi
        xorl    %esi, %esi
        callq   gettimeofday
        imulq   $1000000, 8(%rsp), %rax         # imm = 0xF4240
        addq    16(%rsp), %rax
        addq    $24, %rsp
        retq
	# struct timeval tv @ 0(%rsp)

	subq $24, %rsp

	movq %rsp, %rdi              # arg1 = &tv
	xorl %esi, %esi              # arg2 = NULL
	<%call gettimeofday>

	imulq $1000000, (%rsp), %rax # time = tv.tv_sec * 1000000
	addq 8(%rsp), %rax           # time += tv.tv_usec

	addq $24, %rsp
	ret
