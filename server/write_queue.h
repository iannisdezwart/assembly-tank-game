/**
 * @brief Linked list structure containing a batch of data that has to
 * be written to a client socket.
 * @param buf_size The size of the data buffer.
 * @param buf_shr_ptr A shared pointer to the data buffer. Must be disowned.
 * @param next A pointer to the next element on the list. Must be freed.
 */
struct WriteQueueNode
{
	size_t buf_size;
	struct SharedPtr *buf_shr_ptr;
	struct WriteQueueNode *next;
};

/**
 * @brief Recursively frees all WriteQueueNodes on a write queue.
 * @param write_queue The head of the write queue.
 */
void
free_write_queue(struct WriteQueueNode *write_queue)
{
	if (write_queue->next != NULL)
	{
		free_write_queue(write_queue->next);
	}

	SharedPtr_disown(write_queue->buf_shr_ptr);
	free(write_queue);
}