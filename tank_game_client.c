#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <stdbool.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <errno.h>

#include "shared/buffer.h"
#include "shared/socket_tools.h"
#include "shared/network_messages.h"
#include "shared/tank.h"
#include "client/network.h"
#include "client/window.h"
#include "shared/timing.h"
#include "client/timing.h"
#include "client/assets.h"
#include "client/graphics.h"
#include "client/tank.h"
#include "client/health_bar.h"
#include "shared/map.h"
#include "client/map.h"
#include "shared/bullet.h"
#include "client/bullet.h"
#include "client/player.h"
#include "shared/drop.h"
#include "client/drop.h"
#include "client/leaderboard.h"
#include "client/render.h"
#include "client/io.h"

int
main(int argc, char **argv)
{
	if (argc < 2)
	{
		username = "Unnamed Tank";
	}
	else
	{
		username = argv[1];
	}

	// Setup

	setup_fullscreen_window();
	setup_assets();
	setup_io();
	setup_socket();
	send_handshake();

	// Main loop

	handle_events();

	// Cleanup

	cleanup_assets();
	cleanup_window();
	cleanup_socket();

	return 0;
}