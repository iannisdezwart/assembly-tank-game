CLIENT_CFLAGS = -g -no-pie -O0 -Wall -lSDL2 -lSDL2_ttf -lm
SERVER_CFLAGS = -g -no-pie -O0 -Wall -lm
SHARED_ASM_FILES = shared/buffer.pp.s shared/socket_tools.pp.s \
	shared/random.pp.s shared/shared_ptr.pp.s shared/timing.pp.s \
	shared/bullet.pp.s shared/drop.pp.s
CLIENT_ASM_FILES = client/assets.pp.s client/bullet.pp.s client/drop.pp.s \
	client/health_bar.pp.s client/io.pp.s client/leaderboard.pp.s \
	client/map.pp.s client/network.pp.s client/render.pp.s

all: tank_game_client tank_game_server

.PHONY: tank_game_client
tank_game_client: tank_game_client.c
	node cross_compile_asm $(shell uname -s)
	$(CC) $(SHARED_ASM_FILES) tank_game_client.c -o tank_game_client \
		$(CLIENT_CFLAGS) $(CLIENT_ASM_FILES)

.PHONY: tank_game_server
tank_game_server: tank_game_server.c
	node cross_compile_asm $(shell uname -s)
	$(CC) $(SHARED_ASM_FILES) tank_game_server.c -o tank_game_server \
		$(SERVER_CFLAGS)