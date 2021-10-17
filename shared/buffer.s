/**
 * Reads 1 byte from a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 */
.global read_u8
read_u8:
	movq (%rdi), %rax   # load *ptr
	movzbl (%rax), %r8d # data = **ptr
	addq $1, %rax       # *ptr += 1
	movq %rax, (%rdi)   # store *ptr
	movl %r8d, %eax     # return data
	ret

/**
 * Reads 2 bytes from a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 */
.global read_u16
read_u16:
	movq (%rdi), %rax   # load *ptr
	movzwl (%rax), %r8d # data = **ptr
	addq $2, %rax       # *ptr += 2
	movq %rax, (%rdi)   # store *ptr
	movl %r8d, %eax     # return data
	ret

/**
 * Reads 4 bytes from a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 */
.global read_u32
read_u32:
	movq (%rdi), %rax   # load *ptr
	movl (%rax), %r8d   # data = **ptr
	addq $4, %rax       # *ptr += 4
	movq %rax, (%rdi)   # store *ptr
	movl %r8d, %eax     # return data
	ret


/**
 * Reads 8 bytes from a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 */
.global read_u64
read_u64:
	movq (%rdi), %rax   # load *ptr
	movq (%rax), %r8    # data = **ptr
	addq $8, %rax       # *ptr += 8
	movq %rax, (%rdi)   # store *ptr
	movq %r8, %rax      # return data
	ret

/**
 * Reads 4 bytes from a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 */
.global read_f32
read_f32:
	movq (%rdi), %rax   # load *ptr
	movss (%rax), %xmm0 # data = **ptr
	addq $4, %rax       # *ptr += 4
	movq %rax, (%rdi)   # store *ptr
	ret

/**
 * Reads 8 bytes from a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 */
.global read_f64
read_f64:
	movq (%rdi), %rax   # load *ptr
	movsd (%rax), %xmm0 # data = **ptr
	addq $8, %rax       # *ptr += 8
	movq %rax, (%rdi)   # store *ptr
	ret

/**
 * Writes 1 byte to a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 * @sil data The data to write.
 */
.global write_u8
write_u8:
	movq (%rdi), %rax # load *ptr
	movb %sil, (%rax) # **ptr = data
	addq $1, (%rdi)   # *ptr += 1
	ret

/**
 * Writes 2 bytes to a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 * @si data The data to write.
 */
.global write_u16
write_u16:
	movq (%rdi), %rax # load *ptr
	movw %si, (%rax) # **ptr = data
	addq $2, (%rdi)   # *ptr += 2
	ret

/**
 * Writes 4 bytes to a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 * @esi data The data to write.
 */
.global write_u32
write_u32:
	movq (%rdi), %rax # load *ptr
	movl %esi, (%rax) # **ptr = data
	addq $4, (%rdi)   # *ptr += 4
	ret

/**
 * Writes 8 bytes to a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 * @rsi data The data to write.
 */
.global write_u64
write_u64:
	movq (%rdi), %rax # load *ptr
	movq %rsi, (%rax) # **ptr = data
	addq $8, (%rdi)   # *ptr += 8
	ret

/**
 * Writes 4 bytes to a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 * @xmm0 data The data to write.
 */
.global write_f32
write_f32:
	movq (%rdi), %rax   # load *ptr
	movss %xmm0, (%rax) # **ptr = data
	addq $4, (%rdi)     # *ptr += 4
	ret

/**
 * Writes 4 bytes to a buffer.
 * @rdi ptr A pointer to a pointer to the buffer.
 * @xmm0 data The data to write.
 */
.global write_f64
write_f64:
	movq (%rdi), %rax   # load *ptr
	movsd %xmm0, (%rax) # **ptr = data
	addq $8, (%rdi)     # *ptr += 4
	ret
