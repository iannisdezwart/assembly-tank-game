#define MAX_DELETED_BULLETS 128

bullet_id_t deleted_bullets[MAX_DELETED_BULLETS];
bullet_id_t *deleted_bullets_ptr = deleted_bullets;
bullet_id_t bullet_id_gen = 1;

/**
 * @brief Copies the id of a bullet that will be deleted to the deleted
 * bullets array. On the next server tick, the deleted bullets will be broadcast
 * to all clients.
 * @param bullet The bullet to add to the deleted bullets array.
 */
void
add_to_deleted_bullets(struct Bullet *bullet)
{
	del_bullet(bullet);
	*deleted_bullets_ptr++ = bullet->id;
}

/**
 * @brief Empties the deleted bullets array.
 */
void
reset_deleted_bullets(void)
{
	deleted_bullets_ptr = deleted_bullets;
}