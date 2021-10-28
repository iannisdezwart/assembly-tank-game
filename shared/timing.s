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
	subq $24, %rsp

	# struct timeval tv @ 0(%rsp)

	movq %rsp, %rdi              # arg1 = &tv
	xorl %esi, %esi              # arg2 = NULL
	<%call gettimeofday>

	imulq $1000000, (%rsp), %rax # time = tv.tv_sec * 1000000

	# time += tv.tv_usec
	# here we have to be careful because the number of microseconds is
	# 8 bytes on Linux, but 4 bytes on MacOS

	<%ifmacos movslq 8(%rsp), %rdx>
	<%ifmacos addq %rdx, %rax>
	<%iflinux addq 8(%rsp), %rax>

	addq $24, %rsp
	ret
