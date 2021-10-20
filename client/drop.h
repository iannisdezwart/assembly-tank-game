/**
 * @brief Renders all drops.
 */
extern void
render_drops(void);

struct Powerup powerups[DT_N_ITEMS];
size_t n_powerups = 0;

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