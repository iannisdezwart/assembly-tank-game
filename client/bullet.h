/**
 * @brief Renders all bullets in the current frame.
 */
extern void
render_bullets(void);

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