/**
 * @brief Renders all drops.
 */
void
render_drops(void)
{
	struct Drop *drop;
	Image *img;
	struct Point p;

	for (drop = drops; drop < drops + n_drops; drop++)
	{
		switch (drop->type)
		{
			case DT_HEAL_PACK:
				img = drop_heal_pack;
				break;

			case DT_FAST_SHOOTING:
				img = drop_fast_shooting;
				break;

			case DT_BIG_BULLETS:
				img = drop_big_bullets;
				break;

			case DT_SUPER_SPEED:
				img = drop_super_speed;
				break;

			default:
				fprintf(stderr, "Unknown drop of type %u\n",
					drop->type);
				goto next_drop;
		}

		p = translate(drop->x, drop->y);

		render_surface(img, p.x - DROP_WIDTH / 2, p.y - DROP_HEIGHT / 2,
			DROP_WIDTH, DROP_HEIGHT);

		next_drop:;
	}
}