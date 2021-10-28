.data

<%glbl width>
	.skip 4

<%glbl height>
	.skip 4

<%glbl refresh_rate>
	.skip 4

<%glbl frame_time_usec>
	.skip 4

<%glbl window>
	.skip 8

<%glbl renderer>
	.skip 8

.L_setup_fullscreen_window_sdl_init_err_str:
	.string "Error initialising SDL: %s\n"

.L_window_name_str:
	.string "TankGame"

.L_setup_fullscreen_window_create_window_err_str:
	.string "Error creating window: %s\n"

.L_setup_fullscreen_window_create_renderer_err_str:
	.string "Error creating renderer: %s\n"

.L_setup_fullscreen_window_ttf_init_err_str:
	.string "Error initialising TTF engine: %s\n"

.text

/**
 * Sets up the window.
 * SDL and the TTF engine are started, the window is created, and
 * the renderer is initialised.
 * Some vital global variables such as the width, height and refresh rate
 * of the screen are initialised too.
 */
<%fn setup_fullscreen_window>
	subq $24, %rsp

	# struct SDL_DisplayMode display_mode @ 0(%rsp)

	movl $0x20, %edi               # arg1 = SDL_INIT_VIDEO
	<%call SDL_Init>

	testl %eax, %eax               # if result < 0: error
	jge .L_setup_fullscreen_window_sdl_init_no_err

	<%call SDL_GetError>
	leaq .L_setup_fullscreen_window_sdl_init_err_str(%rip), %rdi
	movq %rax, %rsi                # arg2 = err
	<%call printf>

	movl $1, %edi                  # exit with error code 1
	<%call exit>

.L_setup_fullscreen_window_sdl_init_no_err:
	xorl %edi, %edi                # arg1 = display_index 0
	movq %rsp, %rsi                # arg2 = &display_mode
	<%call SDL_GetCurrentDisplayMode>

	movl 4(%rsp), %ecx             # load display_mode.w
	shrl $1, %ecx                  # display_mode.w /= 2
	movl %ecx, <%ref width>        # store in width

	movl 8(%rsp), %ecx             # load display_mode.h
	shrl $1, %ecx                  # display_mode.h /= 2
	movl %ecx, <%ref height>       # store in width

	movl 12(%rsp), %ecx            # load display_mode.refresh_rate
	movl %ecx, <%ref refresh_rate> # store in refresh rate

	xorl %edx, %edx                # clear remainder
	movl $1000000, %eax            # load 1E6
	divl %ecx                      # compute 1E6 / refresh_rate
	movl %eax, <%ref frame_time_usec> # store in frame_time_usec

	leaq .L_window_name_str(%rip), %rdi # arg1 = window_name_str
	movl $805240832, %esi          # arg2 = SDL_WINPOS_CENTERED
	movl $805240832, %edx          # arg3 = SDL_WINPOS_CENTERED
	movl <%ref width>, %ecx        # arg4 = width
	movl <%ref height>, %r8d       # arg5 = height
	movl $2, %r9d                  # arg6 = SDL_WINDOW_OPENGL
	<%call SDL_CreateWindow>
	movq %rax, <%ref window>

	testl %eax, %eax               # if result == NULL
	jne .L_setup_fullscreen_window_create_window_no_err

	<%call SDL_GetError>
	leaq .L_setup_fullscreen_window_create_window_err_str(%rip), %rdi
	movq %rax, %rsi                # arg2 = err
	<%call printf>

	movl $1, %edi                  # exit with error code 1
	<%call exit>

.L_setup_fullscreen_window_create_window_no_err:
	movq <%ref window>, %rdi       # arg1 = window
	movl $-1, %esi                 # arg2 = index -1
	movl $2, %edx                  # arg3 = SDL_RENDERER_ACCELERATED
	<%call SDL_CreateRenderer>
	movq %rax, <%ref renderer>

	testl %eax, %eax               # if result == NULL
	jne .L_setup_fullscreen_window_create_renderer_no_err

	<%call SDL_GetError>
	leaq .L_setup_fullscreen_window_create_renderer_err_str(%rip), %rdi
	movq %rax, %rsi                # arg2 = err
	<%call printf>

	movl $1, %edi                  # exit with error code 1
	<%call exit>

.L_setup_fullscreen_window_create_renderer_no_err:
	movq <%ref renderer>, %rdi     # arg1 = renderer
	movl $1, %esi                  # arg2 = SDL_BLENDMODE_BLEND
	<%call SDL_SetRenderDrawBlendMode>
	<%call TTF_Init>

	cmpl $0, %eax                  # if result < 0: error

	addq $24, %rsp
	ret

.L_setup_fullscreen_window_ttf_init_err:
	<%call SDL_GetError>
	leaq .L_setup_fullscreen_window_ttf_init_err_str(%rip), %rdi
	movq %rax, %rsi                # arg2 = err
	<%call printf>

	movl $1, %edi                  # exit with error code 1
	<%call exit>

/**
 * Frees memory used for the window and renderer, and stops
 * the SDL and TTF engine.
 */
<%fn cleanup_window>
	subq $8, %rsp

	movq <%ref window>, %rdi       # arg1 = window
	<%call SDL_DestroyWindow>

	movq <%ref renderer>, %rdi     # arg1 = renderer
	<%call SDL_DestroyRenderer>
	<%call TTF_Quit>

	addq $8, %rsp                  # prepare to tailcall
	<%jmp SDL_Quit>
