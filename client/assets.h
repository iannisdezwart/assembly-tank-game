typedef TTF_Font Font;
typedef SDL_Surface Image;

extern Font *font_16px;
extern Font *font_20px;
extern Image *drop_heal_pack;
extern Image *drop_fast_shooting;
extern Image *drop_big_bullets;
extern Image *drop_super_speed;

/**
 * @brief Loads a font into memory so it can be used in the font
 * rendering functions from the `graphics.h` library.
 * @param ttf_file_path The file path to the font asset.
 * @param px_size The pixel size of the font.
 * @returns A font structure for the font.
 * @warning Use `free_font()` to free the memory used by the font.
 */
extern Font *
load_font(const char *ttf_file_path, int px_size);

/**
 * @brief Frees the memory used for a font.
 * @param font The font structure to free.
 */
extern void
free_font(Font *font);

/**
 * @brief Loads a BMP image into memory so it can be rendered to the screen
 * whenever needed.
 * @param bmp_file_path The file path of the BMP image.
 * @returns An SDL_Surface containing the BMP image.
 * @warning Use `SDL_FreeSurface()` to free the memory used by the BMP image.
 */
SDL_Surface *
load_bmp(char *bmp_file_path)
{
	return SDL_LoadBMP(bmp_file_path);
}

/**
 * @brief Loads all vital assets into memory.
 * @warning Use `cleanup_assets()` to free the memory used by the assets.
 */
extern void
setup_assets(void);

/**
 * @brief Frees the memory used for the vital assets.
 */
extern void
cleanup_assets(void);