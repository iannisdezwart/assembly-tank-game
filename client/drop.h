/**
 * @brief Renders all drops.
 */
extern void
render_drops(void);

extern struct Powerup powerups[DT_N_ITEMS];
extern size_t n_powerups;

/**
 * @brief Removes a powerup from the powerups array.
 * @param powerup A pointer to the powerup to remove.
 */
extern void
del_powerup(struct Powerup *powerup);

/**
 * @brief Activates a powerup.
 * @param drop_type The drop type of the powerup to activate.
 */
extern void
activate_powerup(enum DropType drop_type);

/**
 * @brief Checks if the player currently has a specific powerup.
 * @param type The powerup type to check.
 * @returns True if the player has the powerup, false if not.
 */
extern bool
has_powerup(enum DropType type);

/**
 * @brief Renders a powerup bar.
 * @param powerup The powerup to render.
 * @param y_offset The index of the powerup bar.
 * Lower indices will be placed lower on the screen.
 */
extern void
render_powerup_bar(struct Powerup *powerup, uint8_t y_offset);

/**
 * @brief Updates powerups and renders them.
 */
extern void
update_powerups(void);