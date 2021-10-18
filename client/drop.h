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

struct Powerup powerups[DT_N_ITEMS];
size_t n_powerups = 0;

/**
 * @brief Removes a powerup from the powerups array.
 * @param powerup A pointer to the powerup to remove.
 */
void
del_powerup(struct Powerup *powerup)
{
	switch (powerup->type)
	{
		case DT_SUPER_SPEED:
			super_speed_enabled = false;
			break;

		default:
			break;
	}

	n_powerups--;

	// Move the last powerup from the powerups array to the location of
	// the deleted powerup
	// This way `powerup` itself is overwritten and removed from the array

	copy_powerup(powerup, powerups + n_powerups);
}

/**
 * @brief Activates a powerup.
 * @param drop_type The drop type of the powerup to activate.
 */
void
activate_powerup(enum DropType drop_type)
{
	for (size_t i = 0; i < n_powerups; i++)
	{
		if (powerups[i].type == drop_type)
		{
			powerups[i].time_activated = now();
			return;
		}
	}

	powerups[n_powerups].type = drop_type;
	powerups[n_powerups].time_activated = now();

	n_powerups++;

	switch (drop_type)
	{
		case DT_SUPER_SPEED:
			super_speed_enabled = true;
			break;

		default:
			break;
	}
}

/**
 * @brief Checks if the player currently has a specific powerup.
 * @param type The powerup type to check.
 * @returns True if the player has the powerup, false if not.
 */
bool
has_powerup(enum DropType type)
{
	for (size_t i = 0; i < n_powerups; i++)
	{
		if (powerups[i].type == type)
		{
			return true;
		}
	}

	return false;
}

#define POWERUP_BAR_WIDTH 200
#define POWERUP_BAR_HEIGHT 30
#define POWERUP_BAR_MARGIN 10

#define POWERUP_BAR_BORDER_WIDTH 4
#define POWERUP_BAR_BORDER_COLOUR 0x00, 0x00, 0x00, 0xA0

#define POWERUP_BAR_FAST_SHOOTING_COLOUR 0x77, 0xB8, 0xF2, 0xA0
#define POWERUP_BAR_BIG_BULLETS_COLOUR 0x7F, 0xD0, 0x59, 0xA0
#define POWERUP_BAR_SUPER_SPEED_COLOUR 0xF5, 0xD4, 0x7E, 0xA0

#define POWERUP_ICON_MARGIN_WIDTH 20
#define POWERUP_ICON_MARGIN_HEIGHT POWERUP_ICON_MARGIN_WIDTH
#define POWERUP_ICON_MARGIN_LEFT 5
#define POWERUP_ICON_MARGIN_TOP 5

/**
 * @brief Renders a powerup bar.
 */
void
render_powerup_bar(struct Powerup *powerup, uint8_t y_offset)
{
	Image *icon;

	int x = POWERUP_BAR_MARGIN;
	int y = height - (POWERUP_BAR_MARGIN + POWERUP_BAR_HEIGHT)
		* (y_offset + 1);

	uint64_t time_remaining = now() - powerup->time_activated;
	uint32_t bar_width = POWERUP_BAR_WIDTH - time_remaining
		* POWERUP_BAR_WIDTH / POWERUP_DURATION_USEC;

	// Border

	set_colour_rgba(POWERUP_BAR_BORDER_COLOUR);

	stroke_rect(x - POWERUP_BAR_BORDER_WIDTH / 2,
		y - POWERUP_BAR_BORDER_WIDTH / 2,
		POWERUP_BAR_WIDTH + POWERUP_BAR_BORDER_WIDTH,
		POWERUP_BAR_HEIGHT + POWERUP_BAR_BORDER_WIDTH,
		POWERUP_BAR_BORDER_WIDTH);

	// Inner

	switch (powerup->type)
	{
		case DT_FAST_SHOOTING:
			set_colour_rgba(POWERUP_BAR_FAST_SHOOTING_COLOUR);
			icon = drop_fast_shooting;
			break;

		case DT_BIG_BULLETS:
			set_colour_rgba(POWERUP_BAR_BIG_BULLETS_COLOUR);
			icon = drop_big_bullets;
			break;

		case DT_SUPER_SPEED:
			set_colour_rgba(POWERUP_BAR_SUPER_SPEED_COLOUR);
			icon = drop_super_speed;
			break;

		default:
			fprintf(stderr, "Invalid powerup type %d\n",
				powerup->type);
			return;
	}

	fill_rect(x, y, bar_width, POWERUP_BAR_HEIGHT);

	// Icon

	render_surface(icon,
		x + POWERUP_ICON_MARGIN_LEFT,
		y + POWERUP_ICON_MARGIN_TOP,
		POWERUP_ICON_MARGIN_WIDTH,
		POWERUP_ICON_MARGIN_HEIGHT);
}

/**
 * @brief Updates powerups and renders them.
 */
void
update_powerups(void)
{
	uint64_t time = now();

	for (size_t i = 0; i < n_powerups; i++)
	{
		if (time - powerups[i].time_activated > POWERUP_DURATION_USEC)
		{
			// `n_powerups` is implicitly decremented
			// in `del_powerup()`

			del_powerup(powerups + i);
			i--;
		}
		else
		{
			render_powerup_bar(powerups + i, i);
		}
	}
}