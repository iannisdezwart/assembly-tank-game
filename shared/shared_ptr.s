.equ SharedPointer_SIZE, 16

/**
 * struct SharedPointer:
 * A structure for a shared pointer.
 * A shared pointer is automatically freed when there are no references to it.
 * @0-7 handles The number of references to the shared pointer.
 * @8-15 ptr A pointer to the shared data.
 */

/**
 * Adds a handle to a shared pointer.
 * @rdi ptr The shared pointer to own.
 */
<%fn SharedPtr_own>
	addq $1, (%rdi) # ptr->handles++
	ret

/**
 * Releases a handle from a shared pointer.
 * If no handles are left, both the shared pointer and the pointed object are
 * freed.
 * @rdi ptr The shared pointer to disown.
 */
<%fn SharedPtr_disown>
	movq (%rdi), %rax   # handles = ptr->handles
	testq %rax, %rax    # if handles == 0: error
	je .L_SharedPtr_disown_err_zero_handles

	subq $8, %rsp
	movq %rdi, %r15     # save ptr
	cmpq $1, %rax       # if handles == 1: free
	je .L_SharedPtr_disown_free

	subq $1, (%rdi)     # handles > 1: handles--
	addq $8, %rsp
	ret

.L_SharedPtr_disown_err_zero_handles_str:
	.string "SharedPtr_release() called on a pointer with 0 handles"

.L_SharedPtr_disown_err_zero_handles:
	# this should never happen by the way

	leaq .L_SharedPtr_disown_err_zero_handles_str(%rip), %rdi
	<%jmp puts>         # return address is already pushed on the stack

.L_SharedPtr_disown_free:
	movq %rdi, %r15     # save ptr
	movq 8(%rdi), %rdi  # arg1 = ptr->handles
	<%call free>

	movq %r15, %rdi     # arg1 = ptr
	addq $8, %rsp
	<%jmp free>

/**
 * Creates a shared pointer with a specified number of initial handles.
 * @rdi ptr The pointer to the object to share.
 * @rsi initial_handles The number of initial owners of the shared pointer.
 */
<%fn SharedPtr_create>
	movq %rdi, %r15    # save ptr
	movq %rsi, %r14    # save initial_handles

	movl $SharedPointer_SIZE, %edi # malloc size
	<%call malloc>

	movq %r14, (%rax)  # shared_ptr->handles = initial_handles
	movq %r15, 8(%rax) # shared_ptr->ptr = ptr

	ret
