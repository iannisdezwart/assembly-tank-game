CLIENT_CFLAGS = -g -no-pie -O0 -Wall -lSDL2 -lSDL2_ttf -lm
SERVER_CFLAGS = -g -no-pie -O0 -Wall -lm
SHARED_ASM_FILES = shared/buffer.s shared/socket_tools.s shared/random.s \
	shared/shared_ptr.s shared/timing.s shared/bullet.s

all: tank_game_client tank_game_server

.PHONY: tank_game_client
tank_game_client: tank_game_client.c
	$(CC) $(SHARED_ASM_FILES) tank_game_client.c -o tank_game_client \
		$(CLIENT_CFLAGS)

.PHONY: tank_game_server
tank_game_server: tank_game_server.c
	$(CC) $(SHARED_ASM_FILES) tank_game_server.c -o tank_game_server \
		$(SERVER_CFLAGS)