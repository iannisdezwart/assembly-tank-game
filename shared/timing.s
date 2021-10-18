.equ USEC_PER_DT, 100
.equ USEC_PER_SERVER_TICK, 10000

// .data
// <%fn dt>
// 	.zero 4

// .text
// /**
//  * Returns the number of microseconds since EPOCH.
//  */
// <%fn now>
// 	# struct timeval tv @ 0(%rsp)

// 	subq $24, %rsp

// 	movq %rsp, %rdi              # arg1 = &tv
// 	xorl %esi, %esi              # arg2 = NULL
// 	<%call gettimeofday>

// 	imulq $1000000, (%rsp), %rax # time = tv.tv_sec * 1000000
// 	addq 8(%rsp), %rax           # time += tv.tv_usec

// 	addq $24, %rsp
// 	ret
