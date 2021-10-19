.data
<%glbl font_16px>
	.quad 0

<%glbl font_20px>
	.quad 0

<%glbl drop_heal_pack>
	.quad 0

<%glbl drop_fast_shooting>
	.quad 0

<%glbl drop_big_bullets>
	.quad 0

<%glbl drop_super_speed>
	.quad 0

.text
/**
 * Loads a font into memory so it can be used in the font
 * rendering functions from the `graphics.h` library.
 * @rdi ttf_file_path The file path to the font asset.
 * @rsi px_size The pixel size of the font.
 */
<%fn load_font>
	subq $8, %rsp

	<%call TTF_OpenFont>

	testq %rax, %rax
	je .L_load_font_err

	addq $8, %rsp
	ret

.L_load_font_err_str:
	.string "Failed to load font: %s\n"

.L_load_font_err:
	<%call SDL_GetError>
	leaq .L_load_font_err_str(%rip), %rdi  # arg1 = fmt_str
	movq %rax, %rsi                        # arg2 = err_str
	xorl %eax, %eax
	<%call printf>

	movl $1, %edi                          # exit with code 1
	<%call exit>

/**
 * Frees the memory used for a font.
 * @rdi font The font structure to free.
 */
<%fn free_font>
	<%jmp TTF_CloseFont>

.L_load_bmp_rb_str:
	.string "rb"

.L_setup_assets_font_path:
	.string "assets/play_bold.ttf"

.L_setup_assets_heal_pack_path:
	.string "assets/heal_pack.bmp"

.L_setup_assets_fast_shooting_path:
	.string "assets/fast_shooting.bmp"

.L_setup_assets_big_bullets_path:
	.string "assets/big_bullets.bmp"

.L_setup_assets_super_speed_path:
	.string "assets/super_speed.bmp"

/**
 * Loads all vital assets into memory.
 */
<%fn setup_assets>
	subq $8, %rsp

	leaq .L_setup_assets_font_path(%rip), %rdi
	movq $16, %rsi
	<%call load_font>
	movq %rax, <%ref font_16px>

	leaq .L_setup_assets_font_path(%rip), %rdi
	movq $20, %rsi
	<%call load_font>
	movq %rax, <%ref font_20px>

	leaq .L_setup_assets_heal_pack_path(%rip), %rdi
	<%call load_bmp>
	movq %rax, <%ref drop_heal_pack>

	leaq .L_setup_assets_fast_shooting_path(%rip), %rdi
	<%call load_bmp>
	movq %rax, <%ref drop_fast_shooting>

	leaq .L_setup_assets_big_bullets_path(%rip), %rdi
	<%call load_bmp>
	movq %rax, <%ref drop_big_bullets>

	leaq .L_setup_assets_super_speed_path(%rip), %rdi
	<%call load_bmp>
	movq %rax, <%ref drop_super_speed>

	addq $8, %rsp
	ret

/**
 * Frees the memory used for the vital assets.
 */
<%fn cleanup_assets>
	subq $8, %rsp

	movq <%ref font_16px>, %rdi
	<%call free_font>

	movq <%ref font_20px>, %rdi
	<%call free_font>

	movq <%ref drop_heal_pack>, %rdi
	<%call SDL_FreeSurface>

	movq <%ref drop_fast_shooting>, %rdi
	<%call SDL_FreeSurface>

	movq <%ref drop_big_bullets>, %rdi
	<%call SDL_FreeSurface>

	movq <%ref drop_super_speed>, %rdi
	<%call SDL_FreeSurface>

	addq $8, %rsp
	ret
