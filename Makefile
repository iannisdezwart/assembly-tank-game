MAIN_CFLAGS = -g -O3 -Wall -lSDL2 -lSDL2_ttf -lm
SERVER_CFLAGS = -g -O3 -Wall -lm
TEST_CLIENT_CFLAGS = -g -O3 -Wall

all: main server

.PHONY: main
main: main.c
	$(CC) main.c -o main $(MAIN_CFLAGS)

.PHONY: server
server: server.c
	$(CC) server.c -o server $(SERVER_CFLAGS)

.PHONY: test_client
test_client: test_client.c
	$(CC) test_client.c -o test_client $(TEST_CLIENT_CFLAGS)
