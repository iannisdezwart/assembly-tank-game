/**
 * @returns The number of microseconds since EPOCH.
 */
uint64_t
now(void)
{
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec * (uint64_t) 1000000 + tv.tv_usec;
}

#define USEC_PER_SERVER_TICK 100000