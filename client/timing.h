#define FPS_CALC_FRAMES 5

extern uint64_t frame_times[FPS_CALC_FRAMES];
extern size_t frame_times_index;
extern float fps;
extern uint64_t last_server_tick_time;

/**
 * @brief Computes the average FPS for the last `FPS_CALC_FRAMES` frames.
 * The FPS is stored in the global `fps` variable.
 */
extern void
compute_avg_fps(void);

/**
 * @brief Initialises the frame_times array and some global timing variables.
 */
extern void
init_timings(void);

/**
 * @brief Adds a frame time record to the frame_times array.
 * @param time The current time.
 */
extern void
add_frame_time(uint64_t time);