CLIENT_CFLAGS = -g -O3 -Wall -lSDL2 -lSDL2_ttf -lm
SERVER_CFLAGS = -g -O3 -Wall -lm

all: tank_game_client tank_game_server

.PHONY: tank_game_client
tank_game_client: tank_game_client.c
	$(CC) tank_game_client.c -o tank_game_client $(CLIENT_CFLAGS)

.PHONY: tank_game_server
tank_game_server: tank_game_server.c
	$(CC) tank_game_server.c -o tank_game_server $(SERVER_CFLAGS)