.data
.global dt
dt:
	.zero 4

.text
/**
 * Returns the number of microseconds since EPOCH.
 */
.global now
now:
	# struct timeval tv @ 0(%rsp)

	subq $16, %rsp

	movq %rsp, %rdi              # arg1 = &tv
	xorl %esi, %esi              # arg2 = NULL
	call gettimeofday

	imulq $1000000, (%rsp), %rax # time = tv.tv_sec * 1000000
	addq 8(%rsp), %rax           # time += tv.tv_usec

	addq $16, %rsp
	ret
