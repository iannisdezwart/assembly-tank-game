/**
 * @brief Checks if a bullet is owned by a given client.
 * @param bullet The bullet to check.
 * @param client The client to check.
 * @returns True if the bullet is owned by the client, false if not.
 */
bool
Bullet_is_owned_by_client(struct Bullet *bullet, struct Client *client)
{
	return bullet->owner == client->fd;
}

/**
 * @brief Sets a client's health to 0 and schedules it to respawn.
 * @param client The client to kill.
 */
void
kill_client(struct Client *client)
{
	size_t buf_size = 1;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	write_u8(&ptr, SMT_DIE);
	message_client(client, buf, buf_size);

	#ifdef DEBUG_IO
	printf("Sent SMT_DIE to %d {}\n", client->fd);
	#endif

	client->player.health = 0;
	client->kill_time = now();
}

#define KILL_REWARD 200

/**
 * @brief Hits a client with a bullet.
 * Subtracts health points from a client.
 * The client who shot this bullet will receive points.
 * @param client A pointer to the start of the clients array.
 * @param client The client to subtract health points from.
 * @param bullet The bullet that the player is shot by.
 */
void
hit_client(struct Client *clients, struct Client *client, struct Bullet *bullet)
{
	health_t bullet_damage;

	if (bullet->radius == BULLET_RADIUS_BIG)
	{
		bullet_damage = BULLET_DAMAGE_BIG;
	}
	else
	{
		bullet_damage = BULLET_DAMAGE_NORMAL;
	}

	if (bullet_damage >= client->player.health)
	{
		kill_client(client);
		get_client_by_fd(clients, bullet->owner)->player.score
			+= KILL_REWARD;

	}
	else
	{
		client->player.health -= bullet_damage;
	}

	get_client_by_fd(clients, bullet->owner)->player.score += bullet_damage;
}

/**
 * @brief Messages a client that it may respawn and resets its health and score.
 * @param client The client to respawn.
 */
void
respawn_client(struct Client *client)
{
	size_t buf_size = 9;
	char *buf = malloc(buf_size);
	char *ptr = buf;

	float respawn_x = random_int(0, MAP_WIDTH);
	float respawn_y = random_int(0, MAP_HEIGHT);

	write_u8(&ptr, SMT_RESPAWN);
	write_f32(&ptr, respawn_x);
	write_f32(&ptr, respawn_y);

	client->player.health = MAX_HEALTH;
	client->player.score /= 2;

	message_client(client, buf, buf_size);

	#ifdef DEBUG_IO
	printf("Sent SMT_RESPAWN to %d { %.1f, %.1f }\n",
		client->fd, respawn_x, respawn_y);
	#endif
}

/**
 * @brief Respawns a client if it is dead and it has been waiting long enough.
 * @param clients A pointer to the start of the clients array.
 */
void
respawn_dead_client(struct Client *client)
{
	if (!Client_is_alive(client) && now() - client->kill_time
		>= RESPAWN_WAITING_TIME_USEC)
	{
		respawn_client(client);
	}
}

/**
 * @brief Checks if a bullet hits a client.
 * @param bullet The bullet to check.
 * @param client The client to check.
 * @returns True if the bullet is in hitting range of the client, false if not.
 */
bool
bullet_in_range(struct Bullet *bullet, struct Client *client)
{
	float dx = client->player.x - bullet->x;
	float dy = client->player.y - bullet->y;

	return hypot(dx, dy) < (TANK_BODY_RADIUS + bullet->radius);
}

/**
 * @brief Handles bullet collisions for a given client.
 * The client will receive damage and the bullet will be removed.
 * @param clients A pointer to the start of the clients array.
 * @param client The client to check bullet collisions for.
 */
void
handle_bullet_hits_for_client(struct Client *clients, struct Client *client)
{
	for (size_t i = 0; i < n_bullets; i++)
	{
		if (Bullet_is_active(bullets + i)
			&& !Bullet_is_owned_by_client(bullets + i, client)
			&& bullet_in_range(bullets + i, client))
		{
			hit_client(clients, client, bullets + i);
			add_to_deleted_bullets(bullets + i);
		}
	}
}

/**
 * @brief Handles bullet collisions.
 * @param clients A pointer to the start of the clients array.
 */
void
handle_bullet_hits(struct Client *clients)
{
	for (size_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (Client_is_active(clients + i)
			&& Client_is_alive(clients + i))
		{
			handle_bullet_hits_for_client(clients, clients + i);
		}
	}
}

/**
 * @brief Sends all clients an array of deleted bullets.
 * @param clients A pointer to the start of the clients array.
 */
void
send_deleted_bullets(struct Client *clients)
{
	size_t size = deleted_bullets_ptr - deleted_bullets;

	if (size == 0)
	{
		return;
	}

	size_t buf_size = 9 + size * sizeof(bullet_id_t);
	char *buf = malloc(buf_size);
	char *ptr = buf;

	#ifdef DEBUG_IO
	printf("Broadcast SMT_DELETED_BULLETS { %lu, { ", size);
	#endif

	write_u8(&ptr, SMT_DELETED_BULLETS);
	write_u64(&ptr, size);

	for (bullet_id_t *it = deleted_bullets; it < deleted_bullets_ptr; it++)
	{
		write_u64(&ptr, *it);

		#ifdef DEBUG_IO
		printf("%lu, ", *it);
		#endif
	}

	broadcast(clients, buf, buf_size);
	reset_deleted_bullets();

	#ifdef DEBUG_IO
	printf("} }\n");
	#endif
}

/**
 * @brief Sends a client all other players' positions.
 * The health of all players, including the client itself, is also sent.
 * @param clients A pointer to the start of the clients array.
 * @param client A pointer to the client we're sending the positions to.
 */
void
send_player_positions(struct Client *clients, struct Client *client)
{
	size_t max_buf_size = 1 + sizeof(health_t) + sizeof(score_t)
		+ sizeof(client_t) + 16 * MAX_CLIENTS;
	size_t buf_size = 1 + sizeof(health_t) + sizeof(score_t)
		+ sizeof(client_t);

	char *buf = malloc(max_buf_size);
	char *ptr = buf;

	client_t num_clients = 0;

	#ifdef DEBUG_IO
	printf("Broadcast SMT_PLAYER_POSITIONS { %hu, { ", num_clients);
	#endif

	write_u8(&ptr, SMT_PLAYER_POSITIONS);
	write_u8(&ptr, client->player.health);
	write_u16(&ptr, client->player.score);

	ptr += sizeof(client_t); // Leave room for the number of clients

	for (client_t i = 0; i < MAX_CLIENTS; i++)
	{
		if (Client_is_active(clients + i)
			&& Client_is_alive(clients + i)
			&& clients + i != client)
		{
			write_f32(&ptr, clients[i].player.x);
			write_f32(&ptr, clients[i].player.y);
			write_f32(&ptr, clients[i].player.rot);
			write_u8(&ptr, clients[i].player.health);
			write_u16(&ptr, clients[i].player.score);
			write_u8(&ptr, clients[i].player.username_size);
			strncpy(ptr, clients[i].player.username,
				clients[i].player.username_size);

			ptr += clients[i].player.username_size;

			buf_size += 16 + clients[i].player.username_size;
			num_clients++;

			#ifdef DEBUG_IO
			printf("{ %.1f, %.1f, %.1f, %hhu, %hu, %hhu, %s }, ",
				clients[i].player.x, clients[i].player.y,
				clients[i].player.rot, clients[i].player.health,
				clients[i].player.score,
				clients[i].player.username_size,
				clients[i].player.username);
			#endif
		}
	}

	// Write the number of clients

	*(client_t *) (buf + 4) = num_clients;

	// Send the message

	message_client(client, buf, buf_size);

	#ifdef DEBUG_IO
	printf("} }\n");
	#endif
}