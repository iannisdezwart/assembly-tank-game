uint64_t n_server_ticks = 0;

/**
 * @brief Checks if an interval should be executed in the current server tick.
 * @param interval The interval to check.
 * @returns True if the interval should be executed, false if not.
 */
bool
time_for(uint64_t interval)
{
	return n_server_ticks % interval == 0;
}