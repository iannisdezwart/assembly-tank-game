typedef TTF_Font Font;

Font *font_20px;

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
 * @brief Loads all vital assets into memory.
 * @warning Use `cleanup_assets()` to free the memory used by the assets.
 */
void
setup_assets(void)
{
	font_20px = load_font("assets/Play-Bold.ttf", 20);
}

/**
 * @brief Frees the memory used for the vital assets.
 */
void
cleanup_assets(void)
{
	free_font(font_20px);
}