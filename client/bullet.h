/**
 * @brief Renders all bullets in the current frame.
 */
void
render_bullets(void)
{
	struct Bullet *bullet;
	struct Point pos_tr;

	for (size_t i = 0; i < n_bullets; i++)
	{
		bullet = bullets + i;
		pos_tr = translate(bullet->x, bullet->y);

		if (bullet->owner == client_id)
		{
			set_colour_rgb(BULLET_COLOUR);
		}
		else
		{
			set_colour_rgb(BULLET_COLOUR_OPPONENT);
		}

		fill_circle(pos_tr.x, pos_tr.y, bullet->radius);
	}
}

/**
 * @brief Messages the server that the client shot a bullet.
 * @param x The x coordinate of the starting position of the bullet.
 * @param y The y coordinate of the starting position of the bullet.
 * @param heading The heading of the bullet.
 */
void
send_bullet(float x, float y, float heading)
{
	char buf[13];
	char *ptr = buf;

	write_u8(&ptr, CMT_SHOOT_BULLET);
	write_f32(&ptr, x);
	write_f32(&ptr, y);
	write_f32(&ptr, heading);

	write_to_socket(socket_fd, buf, sizeof(buf));
}