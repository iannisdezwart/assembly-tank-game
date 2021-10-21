#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <math.h>
#include <string.h>
#include <errno.h>

#define DEBUG_IO

#define PORT 4242

#define MAX_CLIENTS 255 // Also change `MAX_PLAYERS` in `player.h`
#define client_t uint8_t
#define RESPAWN_WAITING_TIME_USEC (uint64_t) 5E6

#define READ_BUF_SIZE 4096
#define IDLE_TIMEOUT_USEC 10000

#define die(msg) do { \
	fprintf(stderr, msg ": %s\n", \
		strerror(errno)); \
	exit(1); \
} while (0);

#define new(type) (type *) malloc(sizeof(type))


#include "shared/buffer.h"
#include "shared/socket_tools.h"
#include "shared/network_messages.h"
#include "shared/random.h"
#include "shared/shared_ptr.h"
#include "shared/timing.h"
#include "server/timing.h"
#include "shared/map.h"
#include "shared/tank.h"
#include "server/write_queue.h"
#include "server/client.h"
#include "server/communication.h"
#include "shared/bullet.h"
#include "server/bullet.h"
#include "shared/drop.h"
#include "server/drop.h"
#include "server/client_io.h"
#include "server/create_server.h"
#include "server/io.h"
#include "server/serve.h"


int
main(int argc, char **argv)
{
	srand(time(NULL));
	serve(create_server());
}
