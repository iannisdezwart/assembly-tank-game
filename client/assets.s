.L_load_font_err_str:
	.string "Failed to load font: %s\n"

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

.L_load_font_err:
	<%call SDL_GetError>
	movq <%ref stderr>, %rdi               # arg1 = stderr
	movq <%ref .L_load_font_err_str>, %rsi # arg2 = fmt_str
	movq %rax, %rdx                        # arg3 = err_str
	xorl %eax, %eax
	<%call fprintf>

	movl $1, %edi                          # exit with code 1
	call exit

/**
 * Frees the memory used for a font.
 * @rdi font The font structure to free.
 */
<%fn free_font>
	<%jmp TTF_CloseFont>

.L_load_bmp_rb_str:
	.string "rb"