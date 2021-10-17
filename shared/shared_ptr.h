/**
 * @brief A structure for a shared pointer.
 * A shared pointer is automatically freed when there are no references to it.
 * @param handles The number of references to the shared pointer.
 * @param ptr A pointer to the shared data.
 */
struct SharedPtr
{
	size_t handles;
	void *ptr;
};

/**
 * @brief Adds a handle to a shared pointer.
 * @param ptr The shared pointer to own.
 */
extern void
SharedPtr_own(struct SharedPtr *ptr);

/**
 * @brief Releases a handle from a shared pointer.
 * If no handles are left, both the shared pointer and the pointed object are
 * freed.
 * @param ptr The shared pointer to disown.
 */
extern void
SharedPtr_disown(struct SharedPtr *ptr);

/**
 * @brief Creates a shared pointer with a specified number of initial handles.
 * @param ptr The pointer to the object to share.
 * @param initial_handles The number of initial owners of the shared pointer.
 * @returns The shared pointer object.
 */
extern struct SharedPtr *
SharedPtr_create(void *ptr, size_t initial_handles);