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
extern void
send_bullet(float x, float y, float heading);