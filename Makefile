CC = gcc
CFLAGS = -g -O3 -Wall -lSDL2 -lSDL2_ttf -lm

.PHONY: main
main: main.c
	$(CC) main.c -o main $(CFLAGS)