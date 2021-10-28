#define READ_BUF_SIZE 4096
#define CAP_FPS_TO_REFRESH_RATE

extern int raw_mouse_x;
extern int raw_mouse_y;

/**
 * @brief Initialises some variables used in the `handle_events()` function.
 */
extern void
setup_io(void);

/**
 * @brief Handles all mouse and keyboard IO events.
 */
extern void
handle_events(void);