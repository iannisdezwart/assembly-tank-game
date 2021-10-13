struct SharedPtr
{
	size_t handles;
	void *ptr;
};

/**
 * @brief Adds a handle to a shared pointer.
 * @param ptr The shared pointer to own.
 */
void
SharedPtr_own(struct SharedPtr *ptr)
{
	ptr->handles++;
}

/**
 * @brief Releases a handle from a shared pointer.
 * If no handles are left, both the shared pointer and the pointed object are
 * freed.
 * @param ptr The shared pointer to disown.
 */
void
SharedPtr_disown(struct SharedPtr *ptr)
{
	switch (ptr->handles)
	{
		case 0:
			fprintf(stderr, "SharedPtr_release() called on a pointer with 0 handles\n");
			break;

		case 1:
			free(ptr->ptr);
			free(ptr);
			break;

		default:
			ptr->handles--;
			break;
	}
}

/**
 * @brief Creates a shared pointer with a specified number of initial handles.
 * @param ptr The pointer to the object to share.
 * @param initial_handles The number of initial owners of the shared pointer.
 * @returns The shared pointer object.
 */
struct SharedPtr *
SharedPtr_create(void *ptr, size_t initial_handles)
{
	struct SharedPtr *shared_ptr = new(struct SharedPtr);

	shared_ptr->ptr = ptr;
	shared_ptr->handles = initial_handles;

	return shared_ptr;
}