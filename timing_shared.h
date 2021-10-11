#define USEC_PER_DT 100
#define USEC_PER_SERVER_TICK 10000

float dt = 0;

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
