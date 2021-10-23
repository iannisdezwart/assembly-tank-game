#define READ_BUF_SIZE 4096
#define CAP_FPS_TO_REFRESH_RATE

extern int raw_mouse_x;
extern int raw_mouse_y;

/**
 * @brief Initialises some variables used in the `handle_events()` function.
 */
extern void
setup_io(void);

char
debug1(char c)
{
	printf("received message of type %hhu\n", c);

	return c;
}

void
debug2(char *read_ptr, size_t read_buf_size)
{
	printf("reading %lu bytes from socket\n", read_buf_size);

	for (size_t i = 0; i < read_buf_size; i += 16)
	{
		printf("%04lx    ", i);

		for (size_t j = 0; j < 16 && read_buf_size - i > j; j++)
		{
			printf("%02hhx ", read_ptr[i + j]);
		}

		printf("\n");
	}
}

void
debug3(void)
{
	for (size_t i = 0; i < n_drops; i++)
	{
		printf("Drop: { %u, %u, %hhu, %lu }\n",
			drops[i].x, drops[i].y, drops[i].type, drops[i].id);
	}
}

int
debug4(int scancode)
{
	printf("scancode %d\n", scancode);
	return scancode;
}

int
debug5(int e_type)
{
	if (e_type > 1)
	{
		printf("event of type %u\n", e_type);
	}

	return e_type;
}

void
debug6(void)
{
	printf("(%d powerups)\n", n_powerups);

	for (size_t i = 0; i < n_powerups; i++)
	{
		printf("Powerup: { %d, %lu }\n",
			powerups[i].type, powerups[i].time_activated);
	}
}

/**
 * @brief Handles all mouse and keyboard IO events.
 */
extern void
handle_events(void);