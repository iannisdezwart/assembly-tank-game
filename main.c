#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <errno.h>

#include "buffer.h"
#include "socket_tools.h"
#include "network.h"
#include "network_messages.h"
#include "window.h"
#include "timing.h"
#include "frame_timing.h"
#include "assets.h"
#include "graphics.h"
#include "tank_struct.h"
#include "tank.h"
#include "map.h"
#include "bullet.h"
#include "player.h"
#include "render.h"
#include "io.h"

int
main(int argc, char **argv)
{
	// Setup

	setup_fullscreen_window();
	setup_assets();
	setup_io();
	setup_socket();

	// Main loop

	handle_events();

	// Cleanup

	cleanup_window();
	cleanup_assets();
	cleanup_socket();

	return 0;
}