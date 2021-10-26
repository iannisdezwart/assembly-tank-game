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
void
add_frame_time(uint64_t time)
{
	if (frame_times_index == FPS_CALC_FRAMES)
	{
		compute_avg_fps();
		frame_times[0] = frame_times[FPS_CALC_FRAMES - 1];
		frame_times_index = 1;
	}

	frame_times[frame_times_index] = time;

	dt = frame_times[frame_times_index] - frame_times[frame_times_index - 1];
	dt /= USEC_PER_DT;

	frame_times_index++;
}