/**
 * @brief Returns a random integer between min and max.
 * @param min The lower bound, inclusive.
 * @param max The upper bound, inclusive.
 */
uint32_t
random_int(uint32_t min, uint32_t max)
{
	uint32_t range = max - min + 1;
	uint32_t random = rand() % range;
	return random + min;
}