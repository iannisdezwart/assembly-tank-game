typedef TTF_Font Font;
typedef SDL_Surface Image;

Font *font_20px;
Image *drop_heal_pack;
Image *drop_fast_shooting;
Image *drop_big_bullets;
Image *drop_super_speed;

/**
 * @brief Loads a font into memory so it can be used in the font
 * rendering functions from the `graphics.h` library.
 * @param ttf_file_path The file path to the font asset.
 * @param px_size The pixel size of the font.
 * @returns A font structure for the font.
 * @warning Use `free_font()` to free the memory used by the font.
 */
Font *
load_font(const char *ttf_file_path, int px_size)
{
	Font *font;

	font = TTF_OpenFont(ttf_file_path, px_size);

	if (font == NULL)
	{
		fprintf(stderr, "Failed to load font: %s\n", TTF_GetError());
		exit(1);
	}

	return font;
}

/**
 * @brief Frees the memory used for a font.
 * @param font The font structure to free.
 */
void
free_font(Font *font)
{
	TTF_CloseFont(font);
}

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
void
setup_assets(void)
{
	font_20px = load_font("assets/play_bold.ttf", 20);
	drop_heal_pack = load_bmp("assets/heal_pack.bmp");
	drop_fast_shooting = load_bmp("assets/fast_shooting.bmp");
	drop_big_bullets = load_bmp("assets/big_bullets.bmp");
	drop_super_speed = load_bmp("assets/super_speed.bmp");
}

/**
 * @brief Frees the memory used for the vital assets.
 */
void
cleanup_assets(void)
{
	free_font(font_20px);
	SDL_FreeSurface(drop_heal_pack);
	SDL_FreeSurface(drop_fast_shooting);
	SDL_FreeSurface(drop_big_bullets);
	SDL_FreeSurface(drop_super_speed);
}