#define FPS_CALC_FRAMES 5
#define USEC_PER_DT 100

uint64_t frame_times[FPS_CALC_FRAMES];
size_t frame_times_index;
float fps;
float dt;
uint64_t last_server_tick_time;

/**
 * @brief Computes the average FPS for the last `FPS_CALC_FRAMES` frames.
 * The FPS is stored in the global `fps` variable.
 */
void
compute_avg_fps(void)
{
	uint64_t avg_frame_time = 0;

	for (size_t i = 1; i < FPS_CALC_FRAMES; i++)
	{
		avg_frame_time += frame_times[i] - frame_times[i - 1];
	}

	avg_frame_time /= (FPS_CALC_FRAMES - 1);
	fps = 1E6 / (double) avg_frame_time;
}

/**
 * @brief Initialises the frame_times array and some global timing variables.
 */
void
init_timings(void)
{
	uint64_t cur_time = now();

	frame_times[0] = cur_time;
	frame_times_index = 1;
	fps = 0;
	dt = 0;
	last_server_tick_time = cur_time;
}

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