.data
<%glbl frame_times>
	.skip 40

<%glbl frame_times_index>
	.skip 8

<%glbl fps>
	.skip 4

<%glbl last_server_tick_time>
	.skip 8

.L_float_1E6:
	.long 0x49742400               # 1E6 in IEEE-754 hexadecimal notation

.L_float_100:
	.long 0x42c80000               # 100 in IEEE-754 hexadecimal notation

.text
/**
 * Computes the average FPS for the last `FPS_CALC_FRAMES` frames.
 * The FPS is stored in the global `fps` variable.
 */
<%fn compute_avg_fps>
	subq $8, %rsp

	leaq <%ref frame_times>, %rdx   # load pointer to frame times
	movq 32(%rdx), %rax             # avg_frame_time = last
	subq (%rdx), %rax               # avg_frame_time -= first
	shrq $2, %rax                   # avg_frame_time /= 4

	cvtsi2ss %rax, %xmm0            # convert avg_frame_time to float
	movss .L_float_1E6(%rip), %xmm1 # load 1E6 in xmm1
	divss %xmm0, %xmm1              # 1E6 / (float) avg_frame_time
	movss %xmm1, <%ref fps>         # store to fps

	addq $8, %rsp
	ret

/**
 * Initialises the frame_times array and some global timing variables.
 */
<%fn init_timings>
	subq $8, %rsp

	<%call now>
	movq %rax, <%ref frame_times>           # frame_times[0] = now()
	movq %rax, <%ref last_server_tick_time> # last_server_tick_time = now()
	movl $1, <%ref frame_times_index>       # frame_times_index = 0

	addq $8, %rsp
	ret

/**
 * @Adds a frame time record to the frame_times array.
 * @rdi time The current time.
 */
<%fn add_frame_time>
	pushq %rbx

	leaq <%ref frame_times>, %rbx      # load pointer to frame times
	movq <%ref frame_times_index>, %r8 # load frame_times_index

	cmpq $5, %r8                       # if frame_times_index != 5: skip
	jne .L_add_frame_time_skip_compute

	<%call compute_avg_fps>            # doesn't change %rdi, %r8 and %rbx

	movq 32(%rbx), %rax                # load last frame time
	movq %rax, (%rbx)                  # store in first frame time slot
	movl $1, %r8d                      # frame_times_index = 1

.L_add_frame_time_skip_compute:
	movq %rdi, (%rbx, %r8, 8)        # frame_times[frame_times_index] = time

	subq $1, %r8                       # frame_times_index--
	subq (%rbx, %r8, 8), %rdi          # compute dt

	cvtsi2ss %rdi, %xmm0               # convert dt to float
	divss .L_float_100(%rip), %xmm0    # dt /= USEC_PER_DT
	movss %xmm0, <%ref dt>             # save dt

	addq $2, %r8                       # frame_times_index += 2
	movq %r8, <%ref frame_times_index> # store frame_times_index

	popq %rbx
	ret
