#define USEC_PER_DT 100
#define USEC_PER_SERVER_TICK 10000

extern float dt;

/**
 * @returns The number of microseconds since EPOCH.
 */
extern uint64_t
now(void);