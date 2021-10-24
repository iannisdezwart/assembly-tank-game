# Assembly Tank Game

Online multiplayer tank game written in Assembly.
Compatible for x86 Linux and x86 MacOS.

## Installation

You need to install some SDL2 development libraries to compile the game.
The cross-compile preprocessor requires NodeJS to be installed on the system.
You can install all dependencies with the following command on a debian-based
machine:
On a debian-based machine these can be installed with:

```sh
sudo apt install libsdl2-dev libsdl2-ttf-dev nodejs
```

Next you need to compile the program.
Simply run

```sh
make
```

That's all!
You can run the game with:

```sh
./tank_game_client <server ip>
```

## Server

The server will also be compiled with `make`.

Run:

```sh
./tank_game_server
```

And the server will start listening on port 4242.
To connect a client to the local server, run

```sh
./tank_game_client 127.0.0.1
```