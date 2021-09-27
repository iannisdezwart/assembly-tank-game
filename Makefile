CC = gcc
CFLAGS = -g -O3 -Wall -lSDL2 -lm

.PHONY: main
main: main.c
	$(CC) main.c -o main $(CFLAGS)