CLIENT_CFLAGS = -g -O3 -Wall -lSDL2 -lSDL2_ttf -lm
SERVER_CFLAGS = -g -O3 -Wall -lm
SHARED_ASM_FILES = shared/buffer.s

all: tank_game_client tank_game_server

.PHONY: tank_game_client
tank_game_client: tank_game_client.c
	$(CC) $(SHARED_ASM_FILES) tank_game_client.c -o tank_game_client \
		$(CLIENT_CFLAGS)

.PHONY: tank_game_server
tank_game_server: tank_game_server.c
	$(CC) $(SHARED_ASM_FILES) tank_game_server.c -o tank_game_server \
		$(SERVER_CFLAGS)