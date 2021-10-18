
tank_game_client:     file format elf64-x86-64


Disassembly of section .init:

0000000000402000 <_init>:
  402000:	f3 0f 1e fa          	endbr64 
  402004:	48 83 ec 08          	sub    $0x8,%rsp
  402008:	48 8b 05 e9 7f 00 00 	mov    0x7fe9(%rip),%rax        # 409ff8 <__gmon_start__>
  40200f:	48 85 c0             	test   %rax,%rax
  402012:	74 02                	je     402016 <_init+0x16>
  402014:	ff d0                	callq  *%rax
  402016:	48 83 c4 08          	add    $0x8,%rsp
  40201a:	c3                   	retq   

Disassembly of section .plt:

0000000000402020 <.plt>:
  402020:	ff 35 e2 7f 00 00    	pushq  0x7fe2(%rip)        # 40a008 <_GLOBAL_OFFSET_TABLE_+0x8>
  402026:	ff 25 e4 7f 00 00    	jmpq   *0x7fe4(%rip)        # 40a010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40202c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402030 <SDL_DestroyWindow@plt>:
  402030:	ff 25 e2 7f 00 00    	jmpq   *0x7fe2(%rip)        # 40a018 <SDL_DestroyWindow>
  402036:	68 00 00 00 00       	pushq  $0x0
  40203b:	e9 e0 ff ff ff       	jmpq   402020 <.plt>

0000000000402040 <SDL_CreateRenderer@plt>:
  402040:	ff 25 da 7f 00 00    	jmpq   *0x7fda(%rip)        # 40a020 <SDL_CreateRenderer>
  402046:	68 01 00 00 00       	pushq  $0x1
  40204b:	e9 d0 ff ff ff       	jmpq   402020 <.plt>

0000000000402050 <__errno_location@plt>:
  402050:	ff 25 d2 7f 00 00    	jmpq   *0x7fd2(%rip)        # 40a028 <__errno_location@GLIBC_2.2.5>
  402056:	68 02 00 00 00       	pushq  $0x2
  40205b:	e9 c0 ff ff ff       	jmpq   402020 <.plt>

0000000000402060 <SDL_CreateWindow@plt>:
  402060:	ff 25 ca 7f 00 00    	jmpq   *0x7fca(%rip)        # 40a030 <SDL_CreateWindow>
  402066:	68 03 00 00 00       	pushq  $0x3
  40206b:	e9 b0 ff ff ff       	jmpq   402020 <.plt>

0000000000402070 <SDL_Quit@plt>:
  402070:	ff 25 c2 7f 00 00    	jmpq   *0x7fc2(%rip)        # 40a038 <SDL_Quit>
  402076:	68 04 00 00 00       	pushq  $0x4
  40207b:	e9 a0 ff ff ff       	jmpq   402020 <.plt>

0000000000402080 <atan2@plt>:
  402080:	ff 25 ba 7f 00 00    	jmpq   *0x7fba(%rip)        # 40a040 <atan2@GLIBC_2.2.5>
  402086:	68 05 00 00 00       	pushq  $0x5
  40208b:	e9 90 ff ff ff       	jmpq   402020 <.plt>

0000000000402090 <SDL_RenderPresent@plt>:
  402090:	ff 25 b2 7f 00 00    	jmpq   *0x7fb2(%rip)        # 40a048 <SDL_RenderPresent>
  402096:	68 06 00 00 00       	pushq  $0x6
  40209b:	e9 80 ff ff ff       	jmpq   402020 <.plt>

00000000004020a0 <socket@plt>:
  4020a0:	ff 25 aa 7f 00 00    	jmpq   *0x7faa(%rip)        # 40a050 <socket@GLIBC_2.2.5>
  4020a6:	68 07 00 00 00       	pushq  $0x7
  4020ab:	e9 70 ff ff ff       	jmpq   402020 <.plt>

00000000004020b0 <rand@plt>:
  4020b0:	ff 25 a2 7f 00 00    	jmpq   *0x7fa2(%rip)        # 40a058 <rand@GLIBC_2.2.5>
  4020b6:	68 08 00 00 00       	pushq  $0x8
  4020bb:	e9 60 ff ff ff       	jmpq   402020 <.plt>

00000000004020c0 <strerror@plt>:
  4020c0:	ff 25 9a 7f 00 00    	jmpq   *0x7f9a(%rip)        # 40a060 <strerror@GLIBC_2.2.5>
  4020c6:	68 09 00 00 00       	pushq  $0x9
  4020cb:	e9 50 ff ff ff       	jmpq   402020 <.plt>

00000000004020d0 <write@plt>:
  4020d0:	ff 25 92 7f 00 00    	jmpq   *0x7f92(%rip)        # 40a068 <write@GLIBC_2.2.5>
  4020d6:	68 0a 00 00 00       	pushq  $0xa
  4020db:	e9 40 ff ff ff       	jmpq   402020 <.plt>

00000000004020e0 <TTF_OpenFont@plt>:
  4020e0:	ff 25 8a 7f 00 00    	jmpq   *0x7f8a(%rip)        # 40a070 <TTF_OpenFont>
  4020e6:	68 0b 00 00 00       	pushq  $0xb
  4020eb:	e9 30 ff ff ff       	jmpq   402020 <.plt>

00000000004020f0 <TTF_Quit@plt>:
  4020f0:	ff 25 82 7f 00 00    	jmpq   *0x7f82(%rip)        # 40a078 <TTF_Quit>
  4020f6:	68 0c 00 00 00       	pushq  $0xc
  4020fb:	e9 20 ff ff ff       	jmpq   402020 <.plt>

0000000000402100 <SDL_DestroyRenderer@plt>:
  402100:	ff 25 7a 7f 00 00    	jmpq   *0x7f7a(%rip)        # 40a080 <SDL_DestroyRenderer>
  402106:	68 0d 00 00 00       	pushq  $0xd
  40210b:	e9 10 ff ff ff       	jmpq   402020 <.plt>

0000000000402110 <SDL_RWFromFile@plt>:
  402110:	ff 25 72 7f 00 00    	jmpq   *0x7f72(%rip)        # 40a088 <SDL_RWFromFile>
  402116:	68 0e 00 00 00       	pushq  $0xe
  40211b:	e9 00 ff ff ff       	jmpq   402020 <.plt>

0000000000402120 <SDL_GetCurrentDisplayMode@plt>:
  402120:	ff 25 6a 7f 00 00    	jmpq   *0x7f6a(%rip)        # 40a090 <SDL_GetCurrentDisplayMode>
  402126:	68 0f 00 00 00       	pushq  $0xf
  40212b:	e9 f0 fe ff ff       	jmpq   402020 <.plt>

0000000000402130 <SDL_RenderFillRect@plt>:
  402130:	ff 25 62 7f 00 00    	jmpq   *0x7f62(%rip)        # 40a098 <SDL_RenderFillRect>
  402136:	68 10 00 00 00       	pushq  $0x10
  40213b:	e9 e0 fe ff ff       	jmpq   402020 <.plt>

0000000000402140 <TTF_Init@plt>:
  402140:	ff 25 5a 7f 00 00    	jmpq   *0x7f5a(%rip)        # 40a0a0 <TTF_Init>
  402146:	68 11 00 00 00       	pushq  $0x11
  40214b:	e9 d0 fe ff ff       	jmpq   402020 <.plt>

0000000000402150 <strncpy@plt>:
  402150:	ff 25 52 7f 00 00    	jmpq   *0x7f52(%rip)        # 40a0a8 <strncpy@GLIBC_2.2.5>
  402156:	68 12 00 00 00       	pushq  $0x12
  40215b:	e9 c0 fe ff ff       	jmpq   402020 <.plt>

0000000000402160 <__strncpy_chk@plt>:
  402160:	ff 25 4a 7f 00 00    	jmpq   *0x7f4a(%rip)        # 40a0b0 <__strncpy_chk@GLIBC_2.3.4>
  402166:	68 13 00 00 00       	pushq  $0x13
  40216b:	e9 b0 fe ff ff       	jmpq   402020 <.plt>

0000000000402170 <__sprintf_chk@plt>:
  402170:	ff 25 42 7f 00 00    	jmpq   *0x7f42(%rip)        # 40a0b8 <__sprintf_chk@GLIBC_2.3.4>
  402176:	68 14 00 00 00       	pushq  $0x14
  40217b:	e9 a0 fe ff ff       	jmpq   402020 <.plt>

0000000000402180 <SDL_PollEvent@plt>:
  402180:	ff 25 3a 7f 00 00    	jmpq   *0x7f3a(%rip)        # 40a0c0 <SDL_PollEvent>
  402186:	68 15 00 00 00       	pushq  $0x15
  40218b:	e9 90 fe ff ff       	jmpq   402020 <.plt>

0000000000402190 <__snprintf_chk@plt>:
  402190:	ff 25 32 7f 00 00    	jmpq   *0x7f32(%rip)        # 40a0c8 <__snprintf_chk@GLIBC_2.3.4>
  402196:	68 16 00 00 00       	pushq  $0x16
  40219b:	e9 80 fe ff ff       	jmpq   402020 <.plt>

00000000004021a0 <sincos@plt>:
  4021a0:	ff 25 2a 7f 00 00    	jmpq   *0x7f2a(%rip)        # 40a0d0 <sincos@GLIBC_2.2.5>
  4021a6:	68 17 00 00 00       	pushq  $0x17
  4021ab:	e9 70 fe ff ff       	jmpq   402020 <.plt>

00000000004021b0 <SDL_DestroyTexture@plt>:
  4021b0:	ff 25 22 7f 00 00    	jmpq   *0x7f22(%rip)        # 40a0d8 <SDL_DestroyTexture>
  4021b6:	68 18 00 00 00       	pushq  $0x18
  4021bb:	e9 60 fe ff ff       	jmpq   402020 <.plt>

00000000004021c0 <SDL_GetError@plt>:
  4021c0:	ff 25 1a 7f 00 00    	jmpq   *0x7f1a(%rip)        # 40a0e0 <SDL_GetError>
  4021c6:	68 19 00 00 00       	pushq  $0x19
  4021cb:	e9 50 fe ff ff       	jmpq   402020 <.plt>

00000000004021d0 <SDL_SetRenderDrawBlendMode@plt>:
  4021d0:	ff 25 12 7f 00 00    	jmpq   *0x7f12(%rip)        # 40a0e8 <SDL_SetRenderDrawBlendMode>
  4021d6:	68 1a 00 00 00       	pushq  $0x1a
  4021db:	e9 40 fe ff ff       	jmpq   402020 <.plt>

00000000004021e0 <connect@plt>:
  4021e0:	ff 25 0a 7f 00 00    	jmpq   *0x7f0a(%rip)        # 40a0f0 <connect@GLIBC_2.2.5>
  4021e6:	68 1b 00 00 00       	pushq  $0x1b
  4021eb:	e9 30 fe ff ff       	jmpq   402020 <.plt>

00000000004021f0 <TTF_SizeText@plt>:
  4021f0:	ff 25 02 7f 00 00    	jmpq   *0x7f02(%rip)        # 40a0f8 <TTF_SizeText>
  4021f6:	68 1c 00 00 00       	pushq  $0x1c
  4021fb:	e9 20 fe ff ff       	jmpq   402020 <.plt>

0000000000402200 <SDL_Init@plt>:
  402200:	ff 25 fa 7e 00 00    	jmpq   *0x7efa(%rip)        # 40a100 <SDL_Init>
  402206:	68 1d 00 00 00       	pushq  $0x1d
  40220b:	e9 10 fe ff ff       	jmpq   402020 <.plt>

0000000000402210 <SDL_RenderDrawPoint@plt>:
  402210:	ff 25 f2 7e 00 00    	jmpq   *0x7ef2(%rip)        # 40a108 <SDL_RenderDrawPoint>
  402216:	68 1e 00 00 00       	pushq  $0x1e
  40221b:	e9 00 fe ff ff       	jmpq   402020 <.plt>

0000000000402220 <SDL_LoadBMP_RW@plt>:
  402220:	ff 25 ea 7e 00 00    	jmpq   *0x7eea(%rip)        # 40a110 <SDL_LoadBMP_RW>
  402226:	68 1f 00 00 00       	pushq  $0x1f
  40222b:	e9 f0 fd ff ff       	jmpq   402020 <.plt>

0000000000402230 <SDL_FreeSurface@plt>:
  402230:	ff 25 e2 7e 00 00    	jmpq   *0x7ee2(%rip)        # 40a118 <SDL_FreeSurface>
  402236:	68 20 00 00 00       	pushq  $0x20
  40223b:	e9 e0 fd ff ff       	jmpq   402020 <.plt>

0000000000402240 <SDL_RenderClear@plt>:
  402240:	ff 25 da 7e 00 00    	jmpq   *0x7eda(%rip)        # 40a120 <SDL_RenderClear>
  402246:	68 21 00 00 00       	pushq  $0x21
  40224b:	e9 d0 fd ff ff       	jmpq   402020 <.plt>

0000000000402250 <__stack_chk_fail@plt>:
  402250:	ff 25 d2 7e 00 00    	jmpq   *0x7ed2(%rip)        # 40a128 <__stack_chk_fail@GLIBC_2.4>
  402256:	68 22 00 00 00       	pushq  $0x22
  40225b:	e9 c0 fd ff ff       	jmpq   402020 <.plt>

0000000000402260 <SDL_RenderCopy@plt>:
  402260:	ff 25 ca 7e 00 00    	jmpq   *0x7eca(%rip)        # 40a130 <SDL_RenderCopy>
  402266:	68 23 00 00 00       	pushq  $0x23
  40226b:	e9 b0 fd ff ff       	jmpq   402020 <.plt>

0000000000402270 <TTF_RenderText_Blended@plt>:
  402270:	ff 25 c2 7e 00 00    	jmpq   *0x7ec2(%rip)        # 40a138 <TTF_RenderText_Blended>
  402276:	68 24 00 00 00       	pushq  $0x24
  40227b:	e9 a0 fd ff ff       	jmpq   402020 <.plt>

0000000000402280 <free@plt>:
  402280:	ff 25 ba 7e 00 00    	jmpq   *0x7eba(%rip)        # 40a140 <free@GLIBC_2.2.5>
  402286:	68 25 00 00 00       	pushq  $0x25
  40228b:	e9 90 fd ff ff       	jmpq   402020 <.plt>

0000000000402290 <exit@plt>:
  402290:	ff 25 b2 7e 00 00    	jmpq   *0x7eb2(%rip)        # 40a148 <exit@GLIBC_2.2.5>
  402296:	68 26 00 00 00       	pushq  $0x26
  40229b:	e9 80 fd ff ff       	jmpq   402020 <.plt>

00000000004022a0 <TTF_CloseFont@plt>:
  4022a0:	ff 25 aa 7e 00 00    	jmpq   *0x7eaa(%rip)        # 40a150 <TTF_CloseFont>
  4022a6:	68 27 00 00 00       	pushq  $0x27
  4022ab:	e9 70 fd ff ff       	jmpq   402020 <.plt>

00000000004022b0 <malloc@plt>:
  4022b0:	ff 25 a2 7e 00 00    	jmpq   *0x7ea2(%rip)        # 40a158 <malloc@GLIBC_2.2.5>
  4022b6:	68 28 00 00 00       	pushq  $0x28
  4022bb:	e9 60 fd ff ff       	jmpq   402020 <.plt>

00000000004022c0 <SDL_CreateTextureFromSurface@plt>:
  4022c0:	ff 25 9a 7e 00 00    	jmpq   *0x7e9a(%rip)        # 40a160 <SDL_CreateTextureFromSurface>
  4022c6:	68 29 00 00 00       	pushq  $0x29
  4022cb:	e9 50 fd ff ff       	jmpq   402020 <.plt>

00000000004022d0 <ioctl@plt>:
  4022d0:	ff 25 92 7e 00 00    	jmpq   *0x7e92(%rip)        # 40a168 <ioctl@GLIBC_2.2.5>
  4022d6:	68 2a 00 00 00       	pushq  $0x2a
  4022db:	e9 40 fd ff ff       	jmpq   402020 <.plt>

00000000004022e0 <usleep@plt>:
  4022e0:	ff 25 8a 7e 00 00    	jmpq   *0x7e8a(%rip)        # 40a170 <usleep@GLIBC_2.2.5>
  4022e6:	68 2b 00 00 00       	pushq  $0x2b
  4022eb:	e9 30 fd ff ff       	jmpq   402020 <.plt>

00000000004022f0 <SDL_SetRenderDrawColor@plt>:
  4022f0:	ff 25 82 7e 00 00    	jmpq   *0x7e82(%rip)        # 40a178 <SDL_SetRenderDrawColor>
  4022f6:	68 2c 00 00 00       	pushq  $0x2c
  4022fb:	e9 20 fd ff ff       	jmpq   402020 <.plt>

0000000000402300 <read@plt>:
  402300:	ff 25 7a 7e 00 00    	jmpq   *0x7e7a(%rip)        # 40a180 <read@GLIBC_2.2.5>
  402306:	68 2d 00 00 00       	pushq  $0x2d
  40230b:	e9 10 fd ff ff       	jmpq   402020 <.plt>

0000000000402310 <puts@plt>:
  402310:	ff 25 72 7e 00 00    	jmpq   *0x7e72(%rip)        # 40a188 <puts@GLIBC_2.2.5>
  402316:	68 2e 00 00 00       	pushq  $0x2e
  40231b:	e9 00 fd ff ff       	jmpq   402020 <.plt>

0000000000402320 <strnlen@plt>:
  402320:	ff 25 6a 7e 00 00    	jmpq   *0x7e6a(%rip)        # 40a190 <strnlen@GLIBC_2.2.5>
  402326:	68 2f 00 00 00       	pushq  $0x2f
  40232b:	e9 f0 fc ff ff       	jmpq   402020 <.plt>

0000000000402330 <gettimeofday@plt>:
  402330:	ff 25 62 7e 00 00    	jmpq   *0x7e62(%rip)        # 40a198 <gettimeofday@GLIBC_2.2.5>
  402336:	68 30 00 00 00       	pushq  $0x30
  40233b:	e9 e0 fc ff ff       	jmpq   402020 <.plt>

0000000000402340 <__fprintf_chk@plt>:
  402340:	ff 25 5a 7e 00 00    	jmpq   *0x7e5a(%rip)        # 40a1a0 <__fprintf_chk@GLIBC_2.3.4>
  402346:	68 31 00 00 00       	pushq  $0x31
  40234b:	e9 d0 fc ff ff       	jmpq   402020 <.plt>

0000000000402350 <inet_pton@plt>:
  402350:	ff 25 52 7e 00 00    	jmpq   *0x7e52(%rip)        # 40a1a8 <inet_pton@GLIBC_2.2.5>
  402356:	68 32 00 00 00       	pushq  $0x32
  40235b:	e9 c0 fc ff ff       	jmpq   402020 <.plt>

0000000000402360 <qsort@plt>:
  402360:	ff 25 4a 7e 00 00    	jmpq   *0x7e4a(%rip)        # 40a1b0 <qsort@GLIBC_2.2.5>
  402366:	68 33 00 00 00       	pushq  $0x33
  40236b:	e9 b0 fc ff ff       	jmpq   402020 <.plt>

0000000000402370 <fwrite@plt>:
  402370:	ff 25 42 7e 00 00    	jmpq   *0x7e42(%rip)        # 40a1b8 <fwrite@GLIBC_2.2.5>
  402376:	68 34 00 00 00       	pushq  $0x34
  40237b:	e9 a0 fc ff ff       	jmpq   402020 <.plt>

0000000000402380 <close@plt>:
  402380:	ff 25 3a 7e 00 00    	jmpq   *0x7e3a(%rip)        # 40a1c0 <close@GLIBC_2.2.5>
  402386:	68 35 00 00 00       	pushq  $0x35
  40238b:	e9 90 fc ff ff       	jmpq   402020 <.plt>

0000000000402390 <SDL_GetRenderDrawColor@plt>:
  402390:	ff 25 32 7e 00 00    	jmpq   *0x7e32(%rip)        # 40a1c8 <SDL_GetRenderDrawColor>
  402396:	68 36 00 00 00       	pushq  $0x36
  40239b:	e9 80 fc ff ff       	jmpq   402020 <.plt>

Disassembly of section .text:

00000000004023a0 <main>:
  4023a0:	f3 0f 1e fa          	endbr64 
  4023a4:	48 83 ec 08          	sub    $0x8,%rsp
  4023a8:	48 8d 05 8f 4d 00 00 	lea    0x4d8f(%rip),%rax        # 40713e <_IO_stdin_used+0x13e>
  4023af:	83 ff 01             	cmp    $0x1,%edi
  4023b2:	7e 04                	jle    4023b8 <main+0x18>
  4023b4:	48 8b 46 08          	mov    0x8(%rsi),%rax
  4023b8:	48 89 05 69 f3 01 00 	mov    %rax,0x1f369(%rip)        # 421728 <username>
  4023bf:	e8 2c 08 00 00       	callq  402bf0 <setup_fullscreen_window>
  4023c4:	e8 57 0c 00 00       	callq  403020 <setup_assets>
  4023c9:	e8 f2 2d 00 00       	callq  4051c0 <setup_io>
  4023ce:	e8 7d 05 00 00       	callq  402950 <setup_socket>
  4023d3:	e8 38 07 00 00       	callq  402b10 <send_handshake>
  4023d8:	e8 b3 2e 00 00       	callq  405290 <handle_events>
  4023dd:	e8 2e 0d 00 00       	callq  403110 <cleanup_assets>
  4023e2:	e8 89 09 00 00       	callq  402d70 <cleanup_window>
  4023e7:	8b 3d 3b 80 00 00    	mov    0x803b(%rip),%edi        # 40a428 <socket_fd>
  4023ed:	e8 8e ff ff ff       	callq  402380 <close@plt>
  4023f2:	31 c0                	xor    %eax,%eax
  4023f4:	48 83 c4 08          	add    $0x8,%rsp
  4023f8:	c3                   	retq   
  4023f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402400 <_start>:
  402400:	f3 0f 1e fa          	endbr64 
  402404:	31 ed                	xor    %ebp,%ebp
  402406:	49 89 d1             	mov    %rdx,%r9
  402409:	5e                   	pop    %rsi
  40240a:	48 89 e2             	mov    %rsp,%rdx
  40240d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  402411:	50                   	push   %rax
  402412:	54                   	push   %rsp
  402413:	49 c7 c0 50 61 40 00 	mov    $0x406150,%r8
  40241a:	48 c7 c1 e0 60 40 00 	mov    $0x4060e0,%rcx
  402421:	48 c7 c7 a0 23 40 00 	mov    $0x4023a0,%rdi
  402428:	ff 15 c2 7b 00 00    	callq  *0x7bc2(%rip)        # 409ff0 <__libc_start_main@GLIBC_2.2.5>
  40242e:	f4                   	hlt    
  40242f:	90                   	nop

0000000000402430 <_dl_relocate_static_pie>:
  402430:	f3 0f 1e fa          	endbr64 
  402434:	c3                   	retq   
  402435:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40243c:	00 00 00 
  40243f:	90                   	nop

0000000000402440 <deregister_tm_clones>:
  402440:	b8 d8 a3 40 00       	mov    $0x40a3d8,%eax
  402445:	48 3d d8 a3 40 00    	cmp    $0x40a3d8,%rax
  40244b:	74 13                	je     402460 <deregister_tm_clones+0x20>
  40244d:	b8 00 00 00 00       	mov    $0x0,%eax
  402452:	48 85 c0             	test   %rax,%rax
  402455:	74 09                	je     402460 <deregister_tm_clones+0x20>
  402457:	bf d8 a3 40 00       	mov    $0x40a3d8,%edi
  40245c:	ff e0                	jmpq   *%rax
  40245e:	66 90                	xchg   %ax,%ax
  402460:	c3                   	retq   
  402461:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402468:	00 00 00 00 
  40246c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402470 <register_tm_clones>:
  402470:	be d8 a3 40 00       	mov    $0x40a3d8,%esi
  402475:	48 81 ee d8 a3 40 00 	sub    $0x40a3d8,%rsi
  40247c:	48 89 f0             	mov    %rsi,%rax
  40247f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  402483:	48 c1 f8 03          	sar    $0x3,%rax
  402487:	48 01 c6             	add    %rax,%rsi
  40248a:	48 d1 fe             	sar    %rsi
  40248d:	74 11                	je     4024a0 <register_tm_clones+0x30>
  40248f:	b8 00 00 00 00       	mov    $0x0,%eax
  402494:	48 85 c0             	test   %rax,%rax
  402497:	74 07                	je     4024a0 <register_tm_clones+0x30>
  402499:	bf d8 a3 40 00       	mov    $0x40a3d8,%edi
  40249e:	ff e0                	jmpq   *%rax
  4024a0:	c3                   	retq   
  4024a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4024a8:	00 00 00 00 
  4024ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004024b0 <__do_global_dtors_aux>:
  4024b0:	f3 0f 1e fa          	endbr64 
  4024b4:	80 3d 2d 7f 00 00 00 	cmpb   $0x0,0x7f2d(%rip)        # 40a3e8 <completed.8060>
  4024bb:	75 13                	jne    4024d0 <__do_global_dtors_aux+0x20>
  4024bd:	55                   	push   %rbp
  4024be:	48 89 e5             	mov    %rsp,%rbp
  4024c1:	e8 7a ff ff ff       	callq  402440 <deregister_tm_clones>
  4024c6:	c6 05 1b 7f 00 00 01 	movb   $0x1,0x7f1b(%rip)        # 40a3e8 <completed.8060>
  4024cd:	5d                   	pop    %rbp
  4024ce:	c3                   	retq   
  4024cf:	90                   	nop
  4024d0:	c3                   	retq   
  4024d1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4024d8:	00 00 00 00 
  4024dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004024e0 <frame_dummy>:
  4024e0:	f3 0f 1e fa          	endbr64 
  4024e4:	eb 8a                	jmp    402470 <register_tm_clones>

00000000004024e6 <read_u8>:
  4024e6:	48 8b 07             	mov    (%rdi),%rax
  4024e9:	44 0f b6 00          	movzbl (%rax),%r8d
  4024ed:	48 83 c0 01          	add    $0x1,%rax
  4024f1:	48 89 07             	mov    %rax,(%rdi)
  4024f4:	44 89 c0             	mov    %r8d,%eax
  4024f7:	c3                   	retq   

00000000004024f8 <read_u16>:
  4024f8:	48 8b 07             	mov    (%rdi),%rax
  4024fb:	44 0f b7 00          	movzwl (%rax),%r8d
  4024ff:	48 83 c0 02          	add    $0x2,%rax
  402503:	48 89 07             	mov    %rax,(%rdi)
  402506:	44 89 c0             	mov    %r8d,%eax
  402509:	c3                   	retq   

000000000040250a <read_u32>:
  40250a:	48 8b 07             	mov    (%rdi),%rax
  40250d:	44 8b 00             	mov    (%rax),%r8d
  402510:	48 83 c0 04          	add    $0x4,%rax
  402514:	48 89 07             	mov    %rax,(%rdi)
  402517:	44 89 c0             	mov    %r8d,%eax
  40251a:	c3                   	retq   

000000000040251b <read_u64>:
  40251b:	48 8b 07             	mov    (%rdi),%rax
  40251e:	4c 8b 00             	mov    (%rax),%r8
  402521:	48 83 c0 08          	add    $0x8,%rax
  402525:	48 89 07             	mov    %rax,(%rdi)
  402528:	4c 89 c0             	mov    %r8,%rax
  40252b:	c3                   	retq   

000000000040252c <read_f32>:
  40252c:	48 8b 07             	mov    (%rdi),%rax
  40252f:	f3 0f 10 00          	movss  (%rax),%xmm0
  402533:	48 83 c0 04          	add    $0x4,%rax
  402537:	48 89 07             	mov    %rax,(%rdi)
  40253a:	c3                   	retq   

000000000040253b <read_f64>:
  40253b:	48 8b 07             	mov    (%rdi),%rax
  40253e:	f2 0f 10 00          	movsd  (%rax),%xmm0
  402542:	48 83 c0 08          	add    $0x8,%rax
  402546:	48 89 07             	mov    %rax,(%rdi)
  402549:	c3                   	retq   

000000000040254a <write_u8>:
  40254a:	48 8b 07             	mov    (%rdi),%rax
  40254d:	40 88 30             	mov    %sil,(%rax)
  402550:	48 83 07 01          	addq   $0x1,(%rdi)
  402554:	c3                   	retq   

0000000000402555 <write_u16>:
  402555:	48 8b 07             	mov    (%rdi),%rax
  402558:	66 89 30             	mov    %si,(%rax)
  40255b:	48 83 07 02          	addq   $0x2,(%rdi)
  40255f:	c3                   	retq   

0000000000402560 <write_u32>:
  402560:	48 8b 07             	mov    (%rdi),%rax
  402563:	89 30                	mov    %esi,(%rax)
  402565:	48 83 07 04          	addq   $0x4,(%rdi)
  402569:	c3                   	retq   

000000000040256a <write_u64>:
  40256a:	48 8b 07             	mov    (%rdi),%rax
  40256d:	48 89 30             	mov    %rsi,(%rax)
  402570:	48 83 07 08          	addq   $0x8,(%rdi)
  402574:	c3                   	retq   

0000000000402575 <write_f32>:
  402575:	48 8b 07             	mov    (%rdi),%rax
  402578:	f3 0f 11 00          	movss  %xmm0,(%rax)
  40257c:	48 83 07 04          	addq   $0x4,(%rdi)
  402580:	c3                   	retq   

0000000000402581 <write_f64>:
  402581:	48 8b 07             	mov    (%rdi),%rax
  402584:	f2 0f 11 00          	movsd  %xmm0,(%rax)
  402588:	48 83 07 08          	addq   $0x8,(%rdi)
  40258c:	c3                   	retq   

000000000040258d <set_nonblocking>:
  40258d:	48 83 ec 18          	sub    $0x18,%rsp
  402591:	be 21 54 00 00       	mov    $0x5421,%esi
  402596:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40259b:	31 c0                	xor    %eax,%eax
  40259d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%rsp)
  4025a4:	00 
  4025a5:	e8 26 fd ff ff       	callq  4022d0 <ioctl@plt>
  4025aa:	48 83 c4 18          	add    $0x18,%rsp

00000000004025ae <random_int>:
  4025ae:	48 83 ec 08          	sub    $0x8,%rsp
  4025b2:	89 fb                	mov    %edi,%ebx
  4025b4:	41 89 f6             	mov    %esi,%r14d
  4025b7:	31 c0                	xor    %eax,%eax
  4025b9:	e8 f2 fa ff ff       	callq  4020b0 <rand@plt>
  4025be:	41 29 de             	sub    %ebx,%r14d
  4025c1:	67 41 8d 76 01       	lea    0x1(%r14d),%esi
  4025c6:	31 d2                	xor    %edx,%edx
  4025c8:	f7 f6                	div    %esi
  4025ca:	8d 04 1a             	lea    (%rdx,%rbx,1),%eax
  4025cd:	48 83 c4 08          	add    $0x8,%rsp
  4025d1:	c3                   	retq   

00000000004025d2 <SharedPtr_own>:
  4025d2:	48 83 07 01          	addq   $0x1,(%rdi)
  4025d6:	c3                   	retq   

00000000004025d7 <SharedPtr_disown>:
  4025d7:	48 8b 07             	mov    (%rdi),%rax
  4025da:	48 85 c0             	test   %rax,%rax
  4025dd:	74 4d                	je     40262c <SharedPtr_disown+0x55>
  4025df:	48 83 ec 08          	sub    $0x8,%rsp
  4025e3:	49 89 ff             	mov    %rdi,%r15
  4025e6:	48 83 f8 01          	cmp    $0x1,%rax
  4025ea:	74 4c                	je     402638 <SharedPtr_disown+0x61>
  4025ec:	48 83 2f 01          	subq   $0x1,(%rdi)
  4025f0:	48 83 c4 08          	add    $0x8,%rsp
  4025f4:	c3                   	retq   
  4025f5:	53                   	push   %rbx
  4025f6:	68 61 72 65 64       	pushq  $0x64657261
  4025fb:	50                   	push   %rax
  4025fc:	74 72                	je     402670 <Bullet_is_active+0x4>
  4025fe:	5f                   	pop    %rdi
  4025ff:	72 65                	jb     402666 <SharedPtr_create+0x16>
  402601:	6c                   	insb   (%dx),%es:(%rdi)
  402602:	65 61                	gs (bad) 
  402604:	73 65                	jae    40266b <dt+0x3>
  402606:	28 29                	sub    %ch,(%rcx)
  402608:	20 63 61             	and    %ah,0x61(%rbx)
  40260b:	6c                   	insb   (%dx),%es:(%rdi)
  40260c:	6c                   	insb   (%dx),%es:(%rdi)
  40260d:	65 64 20 6f 6e       	gs and %ch,%fs:0x6e(%rdi)
  402612:	20 61 20             	and    %ah,0x20(%rcx)
  402615:	70 6f                	jo     402686 <move_bullet+0x12>
  402617:	69 6e 74 65 72 20 77 	imul   $0x77207265,0x74(%rsi),%ebp
  40261e:	69 74 68 20 30 20 68 	imul   $0x61682030,0x20(%rax,%rbp,2),%esi
  402625:	61 
  402626:	6e                   	outsb  %ds:(%rsi),(%dx)
  402627:	64 6c                	fs insb (%dx),%es:(%rdi)
  402629:	65 73 00             	gs jae 40262c <SharedPtr_disown+0x55>
  40262c:	48 8b 3d c2 ff ff ff 	mov    -0x3e(%rip),%rdi        # 4025f5 <SharedPtr_disown+0x1e>
  402633:	e9 d8 fc ff ff       	jmpq   402310 <puts@plt>
  402638:	49 89 ff             	mov    %rdi,%r15
  40263b:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  40263f:	e8 3c fc ff ff       	callq  402280 <free@plt>
  402644:	4c 89 ff             	mov    %r15,%rdi
  402647:	48 83 c4 08          	add    $0x8,%rsp
  40264b:	e9 30 fc ff ff       	jmpq   402280 <free@plt>

0000000000402650 <SharedPtr_create>:
  402650:	49 89 ff             	mov    %rdi,%r15
  402653:	49 89 f6             	mov    %rsi,%r14
  402656:	bf 10 00 00 00       	mov    $0x10,%edi
  40265b:	e8 50 fc ff ff       	callq  4022b0 <malloc@plt>
  402660:	4c 89 30             	mov    %r14,(%rax)
  402663:	4c 89 78 08          	mov    %r15,0x8(%rax)
  402667:	c3                   	retq   

0000000000402668 <dt>:
  402668:	00 40 9c             	add    %al,-0x64(%rax)
  40266b:	45                   	rex.RB

000000000040266c <Bullet_is_active>:
  40266c:	0f b6 47 08          	movzbl 0x8(%rdi),%eax
  402670:	83 f0 01             	xor    $0x1,%eax
  402673:	c3                   	retq   

0000000000402674 <move_bullet>:
  402674:	48 83 ec 18          	sub    $0x18,%rsp
  402678:	49 89 ff             	mov    %rdi,%r15
  40267b:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40267f:	f3 0f 5a 47 14       	cvtss2sd 0x14(%rdi),%xmm0
  402684:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  402689:	48 89 e6             	mov    %rsp,%rsi
  40268c:	e8 0f fb ff ff       	callq  4021a0 <sincos@plt>
  402691:	f3 41 0f 7e 47 14    	movq   0x14(%r15),%xmm0
  402697:	66 0f 10 0c 24       	movupd (%rsp),%xmm1
  40269c:	0f c6 c0 e5          	shufps $0xe5,%xmm0,%xmm0
  4026a0:	66 0f 5a c9          	cvtpd2ps %xmm1,%xmm1
  4026a4:	0f 59 c1             	mulps  %xmm1,%xmm0
  4026a7:	f3 0f 10 0c 25 08 a4 	movss  0x40a408,%xmm1
  4026ae:	40 00 
  4026b0:	0f c6 c9 e0          	shufps $0xe0,%xmm1,%xmm1
  4026b4:	0f 59 c1             	mulps  %xmm1,%xmm0
  4026b7:	f3 41 0f 7e 4f 0c    	movq   0xc(%r15),%xmm1
  4026bd:	0f 58 c1             	addps  %xmm1,%xmm0
  4026c0:	41 0f 13 47 0c       	movlps %xmm0,0xc(%r15)
  4026c5:	48 83 c4 18          	add    $0x18,%rsp
  4026c9:	c3                   	retq   

00000000004026ca <add_bullet>:
  4026ca:	4c 8b 3c 25 d0 a3 40 	mov    0x40a3d0,%r15
  4026d1:	00 
  4026d2:	48 8b 04 25 00 a4 40 	mov    0x40a400,%rax
  4026d9:	00 
  4026da:	48 8d 0c 80          	lea    (%rax,%rax,4),%rcx
  4026de:	4d 8d 3c cf          	lea    (%r15,%rcx,8),%r15
  4026e2:	49 89 3f             	mov    %rdi,(%r15)
  4026e5:	41 c6 47 08 00       	movb   $0x0,0x8(%r15)
  4026ea:	0f 14 d3             	unpcklps %xmm3,%xmm2
  4026ed:	0f 14 c1             	unpcklps %xmm1,%xmm0
  4026f0:	0f 16 c2             	movlhps %xmm2,%xmm0
  4026f3:	41 0f 11 47 0c       	movups %xmm0,0xc(%r15)
  4026f8:	41 88 77 1c          	mov    %sil,0x1c(%r15)
  4026fc:	41 89 57 20          	mov    %edx,0x20(%r15)
  402700:	48 83 c0 01          	add    $0x1,%rax
  402704:	48 89 04 25 00 a4 40 	mov    %rax,0x40a400
  40270b:	00 
  40270c:	c3                   	retq   

000000000040270d <copy_bullet>:
  40270d:	f3 0f 6f 06          	movdqu (%rsi),%xmm0
  402711:	0f 11 07             	movups %xmm0,(%rdi)
  402714:	f3 0f 6f 4e 10       	movdqu 0x10(%rsi),%xmm1
  402719:	0f 11 4f 10          	movups %xmm1,0x10(%rdi)
  40271d:	48 8b 46 20          	mov    0x20(%rsi),%rax
  402721:	48 89 47 20          	mov    %rax,0x20(%rdi)
  402725:	c3                   	retq   

0000000000402726 <del_bullet>:
  402726:	c6 47 08 01          	movb   $0x1,0x8(%rdi)
  40272a:	c3                   	retq   

000000000040272b <del_bullet_by_id>:
  40272b:	48 8b 14 25 00 a4 40 	mov    0x40a400,%rdx
  402732:	00 
  402733:	48 8b 04 25 d0 a3 40 	mov    0x40a3d0,%rax
  40273a:	00 
  40273b:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  40273f:	48 8d 14 d0          	lea    (%rax,%rdx,8),%rdx
  402743:	48 39 d0             	cmp    %rdx,%rax
  402746:	72 0a                	jb     402752 <del_bullet_by_id+0x27>
  402748:	c3                   	retq   
  402749:	48 83 c0 28          	add    $0x28,%rax
  40274d:	48 39 d0             	cmp    %rdx,%rax
  402750:	73 09                	jae    40275b <del_bullet_by_id+0x30>
  402752:	48 39 38             	cmp    %rdi,(%rax)
  402755:	75 f2                	jne    402749 <del_bullet_by_id+0x1e>
  402757:	c6 40 08 01          	movb   $0x1,0x8(%rax)
  40275b:	c3                   	retq   

000000000040275c <update_bullets>:
  40275c:	48 8b 04 25 00 a4 40 	mov    0x40a400,%rax
  402763:	00 
  402764:	48 85 c0             	test   %rax,%rax
  402767:	0f 84 8f 00 00 00    	je     4027fc <update_bullets+0xa0>
  40276d:	41 54                	push   %r12
  40276f:	55                   	push   %rbp
  402770:	53                   	push   %rbx
  402771:	31 db                	xor    %ebx,%ebx
  402773:	45 31 e4             	xor    %r12d,%r12d
  402776:	48 8b 14 25 d0 a3 40 	mov    0x40a3d0,%rdx
  40277d:	00 
  40277e:	48 8d 04 9b          	lea    (%rbx,%rbx,4),%rax
  402782:	48 8d 2c c2          	lea    (%rdx,%rax,8),%rbp
  402786:	48 89 ef             	mov    %rbp,%rdi
  402789:	e8 e6 fe ff ff       	callq  402674 <move_bullet>
  40278e:	f3 0f 10 45 0c       	movss  0xc(%rbp),%xmm0
  402793:	66 0f ef c9          	pxor   %xmm1,%xmm1
  402797:	0f 2f c1             	comiss %xmm1,%xmm0
  40279a:	76 23                	jbe    4027bf <update_bullets+0x63>
  40279c:	f3 0f 10 14 25 68 26 	movss  0x402668,%xmm2
  4027a3:	40 00 
  4027a5:	0f 2f d0             	comiss %xmm0,%xmm2
  4027a8:	76 15                	jbe    4027bf <update_bullets+0x63>
  4027aa:	f3 0f 10 45 10       	movss  0x10(%rbp),%xmm0
  4027af:	0f 2f c1             	comiss %xmm1,%xmm0
  4027b2:	76 0b                	jbe    4027bf <update_bullets+0x63>
  4027b4:	0f 2f d0             	comiss %xmm0,%xmm2
  4027b7:	76 06                	jbe    4027bf <update_bullets+0x63>
  4027b9:	80 7d 08 00          	cmpb   $0x0,0x8(%rbp)
  4027bd:	74 3e                	je     4027fd <update_bullets+0xa1>
  4027bf:	48 83 c3 01          	add    $0x1,%rbx
  4027c3:	48 39 1c 25 00 a4 40 	cmp    %rbx,0x40a400
  4027ca:	00 
  4027cb:	77 a9                	ja     402776 <update_bullets+0x1a>
  4027cd:	49 63 c4             	movslq %r12d,%rax
  4027d0:	48 89 04 25 00 a4 40 	mov    %rax,0x40a400
  4027d7:	00 
  4027d8:	48 8b 14 25 d0 a3 40 	mov    0x40a3d0,%rdx
  4027df:	00 
  4027e0:	48 8b 04 25 c8 a3 40 	mov    0x40a3c8,%rax
  4027e7:	00 
  4027e8:	48 89 14 25 c8 a3 40 	mov    %rdx,0x40a3c8
  4027ef:	00 
  4027f0:	48 89 04 25 d0 a3 40 	mov    %rax,0x40a3d0
  4027f7:	00 
  4027f8:	5b                   	pop    %rbx
  4027f9:	5d                   	pop    %rbp
  4027fa:	41 5c                	pop    %r12
  4027fc:	c3                   	retq   
  4027fd:	49 63 c4             	movslq %r12d,%rax
  402800:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  402804:	48 8b 04 25 c8 a3 40 	mov    0x40a3c8,%rax
  40280b:	00 
  40280c:	48 8d 3c d0          	lea    (%rax,%rdx,8),%rdi
  402810:	48 89 ee             	mov    %rbp,%rsi
  402813:	e8 f5 fe ff ff       	callq  40270d <copy_bullet>
  402818:	48 83 c3 01          	add    $0x1,%rbx
  40281c:	41 83 c4 01          	add    $0x1,%r12d
  402820:	48 39 1c 25 00 a4 40 	cmp    %rbx,0x40a400
  402827:	00 
  402828:	0f 87 48 ff ff ff    	ja     402776 <update_bullets+0x1a>
  40282e:	eb 9d                	jmp    4027cd <update_bullets+0x71>

0000000000402830 <add_drop>:
  402830:	4c 8b 04 25 e0 a1 40 	mov    0x40a1e0,%r8
  402837:	00 
  402838:	4c 8d 14 25 e8 a1 40 	lea    0x40a1e8,%r10
  40283f:	00 
  402840:	4f 8d 0c 40          	lea    (%r8,%r8,2),%r9
  402844:	43 89 3c ca          	mov    %edi,(%r10,%r9,8)
  402848:	43 89 74 ca 04       	mov    %esi,0x4(%r10,%r9,8)
  40284d:	43 89 54 ca 08       	mov    %edx,0x8(%r10,%r9,8)
  402852:	4b 89 4c ca 10       	mov    %rcx,0x10(%r10,%r9,8)
  402857:	49 83 c0 01          	add    $0x1,%r8
  40285b:	4c 89 04 25 e0 a1 40 	mov    %r8,0x40a1e0
  402862:	00 
  402863:	4b 8d 04 ca          	lea    (%r10,%r9,8),%rax
  402867:	c3                   	retq   

0000000000402868 <copy_drop>:
  402868:	48 8b 06             	mov    (%rsi),%rax
  40286b:	48 89 07             	mov    %rax,(%rdi)
  40286e:	8b 46 08             	mov    0x8(%rsi),%eax
  402871:	89 47 08             	mov    %eax,0x8(%rdi)
  402874:	48 8b 46 10          	mov    0x10(%rsi),%rax
  402878:	48 89 47 10          	mov    %rax,0x10(%rdi)
  40287c:	c3                   	retq   

000000000040287d <del_drop>:
  40287d:	48 83 ec 08          	sub    $0x8,%rsp
  402881:	48 8d 14 25 e8 a1 40 	lea    0x40a1e8,%rdx
  402888:	00 
  402889:	48 8b 04 25 e0 a1 40 	mov    0x40a1e0,%rax
  402890:	00 
  402891:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
  402895:	48 89 0c 25 e0 a1 40 	mov    %rcx,0x40a1e0
  40289c:	00 
  40289d:	48 8d 34 49          	lea    (%rcx,%rcx,2),%rsi
  4028a1:	48 c1 e6 03          	shl    $0x3,%rsi
  4028a5:	48 01 d6             	add    %rdx,%rsi
  4028a8:	e8 bb ff ff ff       	callq  402868 <copy_drop>
  4028ad:	48 83 c4 08          	add    $0x8,%rsp
  4028b1:	c3                   	retq   

00000000004028b2 <del_drop_by_id>:
  4028b2:	48 83 ec 08          	sub    $0x8,%rsp
  4028b6:	48 89 f8             	mov    %rdi,%rax
  4028b9:	48 8d 3c 25 e8 a1 40 	lea    0x40a1e8,%rdi
  4028c0:	00 
  4028c1:	eb 04                	jmp    4028c7 <del_drop_by_id+0x15>
  4028c3:	48 83 c7 18          	add    $0x18,%rdi
  4028c7:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
  4028cb:	48 39 c8             	cmp    %rcx,%rax
  4028ce:	75 f3                	jne    4028c3 <del_drop_by_id+0x11>
  4028d0:	e8 a8 ff ff ff       	callq  40287d <del_drop>
  4028d5:	48 83 c4 08          	add    $0x8,%rsp
  4028d9:	c3                   	retq   

00000000004028da <drops_full>:
  4028da:	48 83 3c 25 e0 a1 40 	cmpq   $0x14,0x40a1e0
  4028e1:	00 14 
  4028e3:	0f 94 c0             	sete   %al
  4028e6:	c3                   	retq   

00000000004028e7 <copy_powerup>:
  4028e7:	8b 06                	mov    (%rsi),%eax
  4028e9:	89 07                	mov    %eax,(%rdi)
  4028eb:	48 8b 46 08          	mov    0x8(%rsi),%rax
  4028ef:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4028f3:	c3                   	retq   
  4028f4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4028fb:	00 00 00 
  4028fe:	66 90                	xchg   %ax,%ax

0000000000402900 <LeaderboardEntry_cmp>:
  402900:	f3 0f 1e fa          	endbr64 
  402904:	0f b7 46 10          	movzwl 0x10(%rsi),%eax
  402908:	0f b7 57 10          	movzwl 0x10(%rdi),%edx
  40290c:	29 d0                	sub    %edx,%eax
  40290e:	c3                   	retq   
  40290f:	90                   	nop

0000000000402910 <load_font.part.0>:
  402910:	50                   	push   %rax
  402911:	58                   	pop    %rax
  402912:	48 83 ec 08          	sub    $0x8,%rsp
  402916:	e8 a5 f8 ff ff       	callq  4021c0 <SDL_GetError@plt>
  40291b:	48 8b 3d be 7a 00 00 	mov    0x7abe(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402922:	be 01 00 00 00       	mov    $0x1,%esi
  402927:	48 8d 15 d6 46 00 00 	lea    0x46d6(%rip),%rdx        # 407004 <_IO_stdin_used+0x4>
  40292e:	48 89 c1             	mov    %rax,%rcx
  402931:	31 c0                	xor    %eax,%eax
  402933:	e8 08 fa ff ff       	callq  402340 <__fprintf_chk@plt>
  402938:	bf 01 00 00 00       	mov    $0x1,%edi
  40293d:	e8 4e f9 ff ff       	callq  402290 <exit@plt>
  402942:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402949:	00 00 00 00 
  40294d:	0f 1f 00             	nopl   (%rax)

0000000000402950 <setup_socket>:
  402950:	f3 0f 1e fa          	endbr64 
  402954:	55                   	push   %rbp
  402955:	31 d2                	xor    %edx,%edx
  402957:	be 01 00 00 00       	mov    $0x1,%esi
  40295c:	bf 02 00 00 00       	mov    $0x2,%edi
  402961:	48 83 ec 20          	sub    $0x20,%rsp
  402965:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40296c:	00 00 
  40296e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402973:	31 c0                	xor    %eax,%eax
  402975:	e8 26 f7 ff ff       	callq  4020a0 <socket@plt>
  40297a:	89 05 a8 7a 00 00    	mov    %eax,0x7aa8(%rip)        # 40a428 <socket_fd>
  402980:	85 c0                	test   %eax,%eax
  402982:	0f 88 b6 00 00 00    	js     402a3e <setup_socket+0xee>
  402988:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
  40298d:	bf 02 00 00 00       	mov    $0x2,%edi
  402992:	48 89 e5             	mov    %rsp,%rbp
  402995:	c7 04 24 02 00 10 92 	movl   $0x92100002,(%rsp)
  40299c:	48 8d 35 7a 46 00 00 	lea    0x467a(%rip),%rsi        # 40701d <_IO_stdin_used+0x1d>
  4029a3:	e8 a8 f9 ff ff       	callq  402350 <inet_pton@plt>
  4029a8:	85 c0                	test   %eax,%eax
  4029aa:	7e 67                	jle    402a13 <setup_socket+0xc3>
  4029ac:	8b 3d 76 7a 00 00    	mov    0x7a76(%rip),%edi        # 40a428 <socket_fd>
  4029b2:	ba 10 00 00 00       	mov    $0x10,%edx
  4029b7:	48 89 ee             	mov    %rbp,%rsi
  4029ba:	e8 21 f8 ff ff       	callq  4021e0 <connect@plt>
  4029bf:	85 c0                	test   %eax,%eax
  4029c1:	78 25                	js     4029e8 <setup_socket+0x98>
  4029c3:	8b 3d 5f 7a 00 00    	mov    0x7a5f(%rip),%edi        # 40a428 <socket_fd>
  4029c9:	e8 bf fb ff ff       	callq  40258d <set_nonblocking>
  4029ce:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4029d3:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4029da:	00 00 
  4029dc:	75 78                	jne    402a56 <setup_socket+0x106>
  4029de:	48 83 c4 20          	add    $0x20,%rsp
  4029e2:	5d                   	pop    %rbp
  4029e3:	c3                   	retq   
  4029e4:	0f 1f 40 00          	nopl   0x0(%rax)
  4029e8:	e8 63 f6 ff ff       	callq  402050 <__errno_location@plt>
  4029ed:	8b 38                	mov    (%rax),%edi
  4029ef:	e8 cc f6 ff ff       	callq  4020c0 <strerror@plt>
  4029f4:	48 8b 3d e5 79 00 00 	mov    0x79e5(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  4029fb:	be 01 00 00 00       	mov    $0x1,%esi
  402a00:	48 8d 15 99 47 00 00 	lea    0x4799(%rip),%rdx        # 4071a0 <_IO_stdin_used+0x1a0>
  402a07:	48 89 c1             	mov    %rax,%rcx
  402a0a:	31 c0                	xor    %eax,%eax
  402a0c:	e8 2f f9 ff ff       	callq  402340 <__fprintf_chk@plt>
  402a11:	eb b0                	jmp    4029c3 <setup_socket+0x73>
  402a13:	48 8d 0d 03 46 00 00 	lea    0x4603(%rip),%rcx        # 40701d <_IO_stdin_used+0x1d>
  402a1a:	48 8d 15 4f 47 00 00 	lea    0x474f(%rip),%rdx        # 407170 <_IO_stdin_used+0x170>
  402a21:	48 8b 3d b8 79 00 00 	mov    0x79b8(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402a28:	be 01 00 00 00       	mov    $0x1,%esi
  402a2d:	31 c0                	xor    %eax,%eax
  402a2f:	e8 0c f9 ff ff       	callq  402340 <__fprintf_chk@plt>
  402a34:	bf 01 00 00 00       	mov    $0x1,%edi
  402a39:	e8 52 f8 ff ff       	callq  402290 <exit@plt>
  402a3e:	e8 0d f6 ff ff       	callq  402050 <__errno_location@plt>
  402a43:	8b 38                	mov    (%rax),%edi
  402a45:	e8 76 f6 ff ff       	callq  4020c0 <strerror@plt>
  402a4a:	48 8d 15 ff 46 00 00 	lea    0x46ff(%rip),%rdx        # 407150 <_IO_stdin_used+0x150>
  402a51:	48 89 c1             	mov    %rax,%rcx
  402a54:	eb cb                	jmp    402a21 <setup_socket+0xd1>
  402a56:	e8 f5 f7 ff ff       	callq  402250 <__stack_chk_fail@plt>
  402a5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000402a60 <write_to_socket>:
  402a60:	f3 0f 1e fa          	endbr64 
  402a64:	41 54                	push   %r12
  402a66:	49 89 d4             	mov    %rdx,%r12
  402a69:	e8 62 f6 ff ff       	callq  4020d0 <write@plt>
  402a6e:	48 85 c0             	test   %rax,%rax
  402a71:	78 0d                	js     402a80 <write_to_socket+0x20>
  402a73:	41 5c                	pop    %r12
  402a75:	c3                   	retq   
  402a76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402a7d:	00 00 00 
  402a80:	e8 cb f5 ff ff       	callq  402050 <__errno_location@plt>
  402a85:	8b 38                	mov    (%rax),%edi
  402a87:	e8 34 f6 ff ff       	callq  4020c0 <strerror@plt>
  402a8c:	48 8b 3d 4d 79 00 00 	mov    0x794d(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402a93:	4c 89 e1             	mov    %r12,%rcx
  402a96:	48 8d 15 33 47 00 00 	lea    0x4733(%rip),%rdx        # 4071d0 <_IO_stdin_used+0x1d0>
  402a9d:	49 89 c0             	mov    %rax,%r8
  402aa0:	be 01 00 00 00       	mov    $0x1,%esi
  402aa5:	31 c0                	xor    %eax,%eax
  402aa7:	41 5c                	pop    %r12
  402aa9:	e9 92 f8 ff ff       	jmpq   402340 <__fprintf_chk@plt>
  402aae:	66 90                	xchg   %ax,%ax

0000000000402ab0 <read_from_socket>:
  402ab0:	f3 0f 1e fa          	endbr64 
  402ab4:	41 54                	push   %r12
  402ab6:	e8 45 f8 ff ff       	callq  402300 <read@plt>
  402abb:	49 89 c4             	mov    %rax,%r12
  402abe:	48 85 c0             	test   %rax,%rax
  402ac1:	78 0d                	js     402ad0 <read_from_socket+0x20>
  402ac3:	4c 89 e0             	mov    %r12,%rax
  402ac6:	41 5c                	pop    %r12
  402ac8:	c3                   	retq   
  402ac9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402ad0:	e8 7b f5 ff ff       	callq  402050 <__errno_location@plt>
  402ad5:	45 31 e4             	xor    %r12d,%r12d
  402ad8:	83 38 0b             	cmpl   $0xb,(%rax)
  402adb:	74 e6                	je     402ac3 <read_from_socket+0x13>
  402add:	48 8b 0d fc 78 00 00 	mov    0x78fc(%rip),%rcx        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402ae4:	ba 20 00 00 00       	mov    $0x20,%edx
  402ae9:	be 01 00 00 00       	mov    $0x1,%esi
  402aee:	48 8d 3d 13 47 00 00 	lea    0x4713(%rip),%rdi        # 407208 <_IO_stdin_used+0x208>
  402af5:	e8 76 f8 ff ff       	callq  402370 <fwrite@plt>
  402afa:	4c 89 e0             	mov    %r12,%rax
  402afd:	41 5c                	pop    %r12
  402aff:	c3                   	retq   

0000000000402b00 <cleanup_socket>:
  402b00:	f3 0f 1e fa          	endbr64 
  402b04:	8b 3d 1e 79 00 00    	mov    0x791e(%rip),%edi        # 40a428 <socket_fd>
  402b0a:	e9 71 f8 ff ff       	jmpq   402380 <close@plt>
  402b0f:	90                   	nop

0000000000402b10 <send_handshake>:
  402b10:	f3 0f 1e fa          	endbr64 
  402b14:	41 54                	push   %r12
  402b16:	31 f6                	xor    %esi,%esi
  402b18:	55                   	push   %rbp
  402b19:	48 83 ec 38          	sub    $0x38,%rsp
  402b1d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b24:	00 00 
  402b26:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  402b2b:	31 c0                	xor    %eax,%eax
  402b2d:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
  402b32:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  402b37:	4c 89 e7             	mov    %r12,%rdi
  402b3a:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
  402b3f:	e8 06 fa ff ff       	callq  40254a <write_u8>
  402b44:	48 8b 3d dd eb 01 00 	mov    0x1ebdd(%rip),%rdi        # 421728 <username>
  402b4b:	be 0f 00 00 00       	mov    $0xf,%esi
  402b50:	e8 cb f7 ff ff       	callq  402320 <strnlen@plt>
  402b55:	4c 89 e7             	mov    %r12,%rdi
  402b58:	48 89 c6             	mov    %rax,%rsi
  402b5b:	e8 ea f9 ff ff       	callq  40254a <write_u8>
  402b60:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402b65:	ba 0f 00 00 00       	mov    $0xf,%edx
  402b6a:	48 8b 35 b7 eb 01 00 	mov    0x1ebb7(%rip),%rsi        # 421728 <username>
  402b71:	e8 da f5 ff ff       	callq  402150 <strncpy@plt>
  402b76:	8b 3d ac 78 00 00    	mov    0x78ac(%rip),%edi        # 40a428 <socket_fd>
  402b7c:	ba 11 00 00 00       	mov    $0x11,%edx
  402b81:	48 89 ee             	mov    %rbp,%rsi
  402b84:	e8 47 f5 ff ff       	callq  4020d0 <write@plt>
  402b89:	48 85 c0             	test   %rax,%rax
  402b8c:	78 22                	js     402bb0 <send_handshake+0xa0>
  402b8e:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  402b93:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402b9a:	00 00 
  402b9c:	75 42                	jne    402be0 <send_handshake+0xd0>
  402b9e:	48 83 c4 38          	add    $0x38,%rsp
  402ba2:	5d                   	pop    %rbp
  402ba3:	41 5c                	pop    %r12
  402ba5:	c3                   	retq   
  402ba6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402bad:	00 00 00 
  402bb0:	e8 9b f4 ff ff       	callq  402050 <__errno_location@plt>
  402bb5:	8b 38                	mov    (%rax),%edi
  402bb7:	e8 04 f5 ff ff       	callq  4020c0 <strerror@plt>
  402bbc:	b9 11 00 00 00       	mov    $0x11,%ecx
  402bc1:	be 01 00 00 00       	mov    $0x1,%esi
  402bc6:	48 8b 3d 13 78 00 00 	mov    0x7813(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402bcd:	49 89 c0             	mov    %rax,%r8
  402bd0:	48 8d 15 f9 45 00 00 	lea    0x45f9(%rip),%rdx        # 4071d0 <_IO_stdin_used+0x1d0>
  402bd7:	31 c0                	xor    %eax,%eax
  402bd9:	e8 62 f7 ff ff       	callq  402340 <__fprintf_chk@plt>
  402bde:	eb ae                	jmp    402b8e <send_handshake+0x7e>
  402be0:	e8 6b f6 ff ff       	callq  402250 <__stack_chk_fail@plt>
  402be5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402bec:	00 00 00 00 

0000000000402bf0 <setup_fullscreen_window>:
  402bf0:	f3 0f 1e fa          	endbr64 
  402bf4:	48 83 ec 28          	sub    $0x28,%rsp
  402bf8:	bf 20 00 00 00       	mov    $0x20,%edi
  402bfd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402c04:	00 00 
  402c06:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402c0b:	31 c0                	xor    %eax,%eax
  402c0d:	e8 ee f5 ff ff       	callq  402200 <SDL_Init@plt>
  402c12:	85 c0                	test   %eax,%eax
  402c14:	0f 88 36 01 00 00    	js     402d50 <setup_fullscreen_window+0x160>
  402c1a:	48 89 e6             	mov    %rsp,%rsi
  402c1d:	31 ff                	xor    %edi,%edi
  402c1f:	e8 fc f4 ff ff       	callq  402120 <SDL_GetCurrentDisplayMode@plt>
  402c24:	8b 44 24 04          	mov    0x4(%rsp),%eax
  402c28:	8b 74 24 0c          	mov    0xc(%rsp),%esi
  402c2c:	31 d2                	xor    %edx,%edx
  402c2e:	48 8d 3d 0e 44 00 00 	lea    0x440e(%rip),%rdi        # 407043 <_IO_stdin_used+0x43>
  402c35:	41 b9 02 00 00 00    	mov    $0x2,%r9d
  402c3b:	89 c1                	mov    %eax,%ecx
  402c3d:	89 35 cd ea 01 00    	mov    %esi,0x1eacd(%rip)        # 421710 <refresh_rate>
  402c43:	c1 e9 1f             	shr    $0x1f,%ecx
  402c46:	01 c1                	add    %eax,%ecx
  402c48:	8b 44 24 08          	mov    0x8(%rsp),%eax
  402c4c:	d1 f9                	sar    %ecx
  402c4e:	41 89 c0             	mov    %eax,%r8d
  402c51:	89 0d c9 ea 01 00    	mov    %ecx,0x1eac9(%rip)        # 421720 <width>
  402c57:	41 c1 e8 1f          	shr    $0x1f,%r8d
  402c5b:	41 01 c0             	add    %eax,%r8d
  402c5e:	b8 40 42 0f 00       	mov    $0xf4240,%eax
  402c63:	f7 f6                	div    %esi
  402c65:	41 d1 f8             	sar    %r8d
  402c68:	ba 00 00 ff 2f       	mov    $0x2fff0000,%edx
  402c6d:	be 00 00 ff 2f       	mov    $0x2fff0000,%esi
  402c72:	44 89 05 a7 77 00 00 	mov    %r8d,0x77a7(%rip)        # 40a420 <height>
  402c79:	89 05 c1 ea 01 00    	mov    %eax,0x1eac1(%rip)        # 421740 <frame_time_usec>
  402c7f:	e8 dc f3 ff ff       	callq  402060 <SDL_CreateWindow@plt>
  402c84:	48 89 05 35 d8 01 00 	mov    %rax,0x1d835(%rip)        # 4204c0 <window>
  402c8b:	48 89 c7             	mov    %rax,%rdi
  402c8e:	48 85 c0             	test   %rax,%rax
  402c91:	0f 84 a8 00 00 00    	je     402d3f <setup_fullscreen_window+0x14f>
  402c97:	ba 02 00 00 00       	mov    $0x2,%edx
  402c9c:	be ff ff ff ff       	mov    $0xffffffff,%esi
  402ca1:	e8 9a f3 ff ff       	callq  402040 <SDL_CreateRenderer@plt>
  402ca6:	48 89 05 8b ea 01 00 	mov    %rax,0x1ea8b(%rip)        # 421738 <renderer>
  402cad:	48 89 c7             	mov    %rax,%rdi
  402cb0:	48 85 c0             	test   %rax,%rax
  402cb3:	74 33                	je     402ce8 <setup_fullscreen_window+0xf8>
  402cb5:	be 01 00 00 00       	mov    $0x1,%esi
  402cba:	e8 11 f5 ff ff       	callq  4021d0 <SDL_SetRenderDrawBlendMode@plt>
  402cbf:	e8 7c f4 ff ff       	callq  402140 <TTF_Init@plt>
  402cc4:	85 c0                	test   %eax,%eax
  402cc6:	78 4b                	js     402d13 <setup_fullscreen_window+0x123>
  402cc8:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  402ccd:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402cd4:	00 00 
  402cd6:	0f 85 85 00 00 00    	jne    402d61 <setup_fullscreen_window+0x171>
  402cdc:	48 83 c4 28          	add    $0x28,%rsp
  402ce0:	c3                   	retq   
  402ce1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402ce8:	e8 d3 f4 ff ff       	callq  4021c0 <SDL_GetError@plt>
  402ced:	48 8b 3d ec 76 00 00 	mov    0x76ec(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402cf4:	be 01 00 00 00       	mov    $0x1,%esi
  402cf9:	48 8d 15 67 43 00 00 	lea    0x4367(%rip),%rdx        # 407067 <_IO_stdin_used+0x67>
  402d00:	48 89 c1             	mov    %rax,%rcx
  402d03:	31 c0                	xor    %eax,%eax
  402d05:	e8 36 f6 ff ff       	callq  402340 <__fprintf_chk@plt>
  402d0a:	48 8b 3d 27 ea 01 00 	mov    0x1ea27(%rip),%rdi        # 421738 <renderer>
  402d11:	eb a2                	jmp    402cb5 <setup_fullscreen_window+0xc5>
  402d13:	e8 a8 f4 ff ff       	callq  4021c0 <SDL_GetError@plt>
  402d18:	48 8d 15 11 45 00 00 	lea    0x4511(%rip),%rdx        # 407230 <_IO_stdin_used+0x230>
  402d1f:	48 89 c1             	mov    %rax,%rcx
  402d22:	48 8b 3d b7 76 00 00 	mov    0x76b7(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  402d29:	be 01 00 00 00       	mov    $0x1,%esi
  402d2e:	31 c0                	xor    %eax,%eax
  402d30:	e8 0b f6 ff ff       	callq  402340 <__fprintf_chk@plt>
  402d35:	bf 01 00 00 00       	mov    $0x1,%edi
  402d3a:	e8 51 f5 ff ff       	callq  402290 <exit@plt>
  402d3f:	e8 7c f4 ff ff       	callq  4021c0 <SDL_GetError@plt>
  402d44:	48 8d 15 01 43 00 00 	lea    0x4301(%rip),%rdx        # 40704c <_IO_stdin_used+0x4c>
  402d4b:	48 89 c1             	mov    %rax,%rcx
  402d4e:	eb d2                	jmp    402d22 <setup_fullscreen_window+0x132>
  402d50:	e8 6b f4 ff ff       	callq  4021c0 <SDL_GetError@plt>
  402d55:	48 8d 15 cb 42 00 00 	lea    0x42cb(%rip),%rdx        # 407027 <_IO_stdin_used+0x27>
  402d5c:	48 89 c1             	mov    %rax,%rcx
  402d5f:	eb c1                	jmp    402d22 <setup_fullscreen_window+0x132>
  402d61:	e8 ea f4 ff ff       	callq  402250 <__stack_chk_fail@plt>
  402d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d6d:	00 00 00 

0000000000402d70 <cleanup_window>:
  402d70:	f3 0f 1e fa          	endbr64 
  402d74:	48 83 ec 08          	sub    $0x8,%rsp
  402d78:	48 8b 3d 41 d7 01 00 	mov    0x1d741(%rip),%rdi        # 4204c0 <window>
  402d7f:	e8 ac f2 ff ff       	callq  402030 <SDL_DestroyWindow@plt>
  402d84:	48 8b 3d ad e9 01 00 	mov    0x1e9ad(%rip),%rdi        # 421738 <renderer>
  402d8b:	e8 70 f3 ff ff       	callq  402100 <SDL_DestroyRenderer@plt>
  402d90:	e8 5b f3 ff ff       	callq  4020f0 <TTF_Quit@plt>
  402d95:	48 83 c4 08          	add    $0x8,%rsp
  402d99:	e9 d2 f2 ff ff       	jmpq   402070 <SDL_Quit@plt>
  402d9e:	66 90                	xchg   %ax,%ax

0000000000402da0 <now>:
  402da0:	f3 0f 1e fa          	endbr64 
  402da4:	48 83 ec 28          	sub    $0x28,%rsp
  402da8:	31 f6                	xor    %esi,%esi
  402daa:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402db1:	00 00 
  402db3:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402db8:	31 c0                	xor    %eax,%eax
  402dba:	48 89 e7             	mov    %rsp,%rdi
  402dbd:	e8 6e f5 ff ff       	callq  402330 <gettimeofday@plt>
  402dc2:	48 69 04 24 40 42 0f 	imul   $0xf4240,(%rsp),%rax
  402dc9:	00 
  402dca:	48 03 44 24 08       	add    0x8(%rsp),%rax
  402dcf:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  402dd4:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  402ddb:	00 00 
  402ddd:	75 05                	jne    402de4 <now+0x44>
  402ddf:	48 83 c4 28          	add    $0x28,%rsp
  402de3:	c3                   	retq   
  402de4:	e8 67 f4 ff ff       	callq  402250 <__stack_chk_fail@plt>
  402de9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402df0 <compute_avg_fps>:
  402df0:	f3 0f 1e fa          	endbr64 
  402df4:	f3 0f 6f 05 4c 76 00 	movdqu 0x764c(%rip),%xmm0        # 40a448 <frame_times+0x8>
  402dfb:	00 
  402dfc:	f3 0f 6f 0d 54 76 00 	movdqu 0x7654(%rip),%xmm1        # 40a458 <frame_times+0x18>
  402e03:	00 
  402e04:	66 0f fb 05 34 76 00 	psubq  0x7634(%rip),%xmm0        # 40a440 <frame_times>
  402e0b:	00 
  402e0c:	66 0f fb 0d 3c 76 00 	psubq  0x763c(%rip),%xmm1        # 40a450 <frame_times+0x10>
  402e13:	00 
  402e14:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  402e18:	66 0f 6f c8          	movdqa %xmm0,%xmm1
  402e1c:	66 0f 73 d9 08       	psrldq $0x8,%xmm1
  402e21:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  402e25:	f2 0f 10 0d 7b 46 00 	movsd  0x467b(%rip),%xmm1        # 4074a8 <_IO_stdin_used+0x4a8>
  402e2c:	00 
  402e2d:	66 48 0f 7e c0       	movq   %xmm0,%rax
  402e32:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402e36:	48 c1 e8 02          	shr    $0x2,%rax
  402e3a:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  402e3f:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  402e43:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402e47:	f2 0f 5a c1          	cvtsd2ss %xmm1,%xmm0
  402e4b:	f3 0f 11 05 dd e8 01 	movss  %xmm0,0x1e8dd(%rip)        # 421730 <fps>
  402e52:	00 
  402e53:	c3                   	retq   
  402e54:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402e5b:	00 00 00 00 
  402e5f:	90                   	nop

0000000000402e60 <init_timings>:
  402e60:	f3 0f 1e fa          	endbr64 
  402e64:	48 83 ec 28          	sub    $0x28,%rsp
  402e68:	31 f6                	xor    %esi,%esi
  402e6a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402e71:	00 00 
  402e73:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402e78:	31 c0                	xor    %eax,%eax
  402e7a:	48 89 e7             	mov    %rsp,%rdi
  402e7d:	e8 ae f4 ff ff       	callq  402330 <gettimeofday@plt>
  402e82:	48 69 04 24 40 42 0f 	imul   $0xf4240,(%rsp),%rax
  402e89:	00 
  402e8a:	48 03 44 24 08       	add    0x8(%rsp),%rax
  402e8f:	48 c7 05 26 76 00 00 	movq   $0x1,0x7626(%rip)        # 40a4c0 <frame_times_index>
  402e96:	01 00 00 00 
  402e9a:	48 89 05 9f 75 00 00 	mov    %rax,0x759f(%rip)        # 40a440 <frame_times>
  402ea1:	48 89 05 60 d6 01 00 	mov    %rax,0x1d660(%rip)        # 420508 <last_server_tick_time>
  402ea8:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  402ead:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402eb4:	00 00 
  402eb6:	75 05                	jne    402ebd <init_timings+0x5d>
  402eb8:	48 83 c4 28          	add    $0x28,%rsp
  402ebc:	c3                   	retq   
  402ebd:	e8 8e f3 ff ff       	callq  402250 <__stack_chk_fail@plt>
  402ec2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402ec9:	00 00 00 00 
  402ecd:	0f 1f 00             	nopl   (%rax)

0000000000402ed0 <add_frame_time>:
  402ed0:	f3 0f 1e fa          	endbr64 
  402ed4:	48 8b 05 e5 75 00 00 	mov    0x75e5(%rip),%rax        # 40a4c0 <frame_times_index>
  402edb:	48 83 f8 05          	cmp    $0x5,%rax
  402edf:	74 5f                	je     402f40 <add_frame_time+0x70>
  402ee1:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
  402ee5:	48 8d 70 01          	lea    0x1(%rax),%rsi
  402ee9:	48 8d 15 50 75 00 00 	lea    0x7550(%rip),%rdx        # 40a440 <frame_times>
  402ef0:	48 89 3c c2          	mov    %rdi,(%rdx,%rax,8)
  402ef4:	48 2b 3c ca          	sub    (%rdx,%rcx,8),%rdi
  402ef8:	78 26                	js     402f20 <add_frame_time+0x50>
  402efa:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402efe:	f3 48 0f 2a c7       	cvtsi2ss %rdi,%xmm0
  402f03:	f3 0f 5e 05 ad 45 00 	divss  0x45ad(%rip),%xmm0        # 4074b8 <_IO_stdin_used+0x4b8>
  402f0a:	00 
  402f0b:	48 89 35 ae 75 00 00 	mov    %rsi,0x75ae(%rip)        # 40a4c0 <frame_times_index>
  402f12:	f3 0f 11 05 ee 74 00 	movss  %xmm0,0x74ee(%rip)        # 40a408 <dt>
  402f19:	00 
  402f1a:	c3                   	retq   
  402f1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402f20:	48 89 f8             	mov    %rdi,%rax
  402f23:	83 e7 01             	and    $0x1,%edi
  402f26:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402f2a:	48 d1 e8             	shr    %rax
  402f2d:	48 09 f8             	or     %rdi,%rax
  402f30:	f3 48 0f 2a c0       	cvtsi2ss %rax,%xmm0
  402f35:	f3 0f 58 c0          	addss  %xmm0,%xmm0
  402f39:	eb c8                	jmp    402f03 <add_frame_time+0x33>
  402f3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402f40:	f3 0f 6f 05 00 75 00 	movdqu 0x7500(%rip),%xmm0        # 40a448 <frame_times+0x8>
  402f47:	00 
  402f48:	f3 0f 6f 0d 08 75 00 	movdqu 0x7508(%rip),%xmm1        # 40a458 <frame_times+0x18>
  402f4f:	00 
  402f50:	be 02 00 00 00       	mov    $0x2,%esi
  402f55:	31 c9                	xor    %ecx,%ecx
  402f57:	66 0f fb 05 e1 74 00 	psubq  0x74e1(%rip),%xmm0        # 40a440 <frame_times>
  402f5e:	00 
  402f5f:	66 0f fb 0d e9 74 00 	psubq  0x74e9(%rip),%xmm1        # 40a450 <frame_times+0x10>
  402f66:	00 
  402f67:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  402f6b:	66 0f 6f c8          	movdqa %xmm0,%xmm1
  402f6f:	66 0f 73 d9 08       	psrldq $0x8,%xmm1
  402f74:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  402f78:	f2 0f 10 0d 28 45 00 	movsd  0x4528(%rip),%xmm1        # 4074a8 <_IO_stdin_used+0x4a8>
  402f7f:	00 
  402f80:	66 48 0f 7e c0       	movq   %xmm0,%rax
  402f85:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402f89:	48 c1 e8 02          	shr    $0x2,%rax
  402f8d:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  402f92:	48 8b 05 c7 74 00 00 	mov    0x74c7(%rip),%rax        # 40a460 <frame_times+0x20>
  402f99:	48 89 05 a0 74 00 00 	mov    %rax,0x74a0(%rip)        # 40a440 <frame_times>
  402fa0:	b8 01 00 00 00       	mov    $0x1,%eax
  402fa5:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  402fa9:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402fad:	f2 0f 5a c1          	cvtsd2ss %xmm1,%xmm0
  402fb1:	f3 0f 11 05 77 e7 01 	movss  %xmm0,0x1e777(%rip)        # 421730 <fps>
  402fb8:	00 
  402fb9:	e9 2b ff ff ff       	jmpq   402ee9 <add_frame_time+0x19>
  402fbe:	66 90                	xchg   %ax,%ax

0000000000402fc0 <load_font>:
  402fc0:	f3 0f 1e fa          	endbr64 
  402fc4:	48 83 ec 08          	sub    $0x8,%rsp
  402fc8:	e8 13 f1 ff ff       	callq  4020e0 <TTF_OpenFont@plt>
  402fcd:	48 85 c0             	test   %rax,%rax
  402fd0:	74 05                	je     402fd7 <load_font+0x17>
  402fd2:	48 83 c4 08          	add    $0x8,%rsp
  402fd6:	c3                   	retq   
  402fd7:	e8 34 f9 ff ff       	callq  402910 <load_font.part.0>
  402fdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402fe0 <free_font>:
  402fe0:	f3 0f 1e fa          	endbr64 
  402fe4:	e9 b7 f2 ff ff       	jmpq   4022a0 <TTF_CloseFont@plt>
  402fe9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402ff0 <load_bmp>:
  402ff0:	f3 0f 1e fa          	endbr64 
  402ff4:	48 83 ec 08          	sub    $0x8,%rsp
  402ff8:	48 8d 35 85 40 00 00 	lea    0x4085(%rip),%rsi        # 407084 <_IO_stdin_used+0x84>
  402fff:	e8 0c f1 ff ff       	callq  402110 <SDL_RWFromFile@plt>
  403004:	be 01 00 00 00       	mov    $0x1,%esi
  403009:	48 83 c4 08          	add    $0x8,%rsp
  40300d:	48 89 c7             	mov    %rax,%rdi
  403010:	e9 0b f2 ff ff       	jmpq   402220 <SDL_LoadBMP_RW@plt>
  403015:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40301c:	00 00 00 00 

0000000000403020 <setup_assets>:
  403020:	f3 0f 1e fa          	endbr64 
  403024:	48 83 ec 08          	sub    $0x8,%rsp
  403028:	be 10 00 00 00       	mov    $0x10,%esi
  40302d:	48 8d 3d 53 40 00 00 	lea    0x4053(%rip),%rdi        # 407087 <_IO_stdin_used+0x87>
  403034:	e8 a7 f0 ff ff       	callq  4020e0 <TTF_OpenFont@plt>
  403039:	48 85 c0             	test   %rax,%rax
  40303c:	0f 84 c9 00 00 00    	je     40310b <setup_assets+0xeb>
  403042:	be 14 00 00 00       	mov    $0x14,%esi
  403047:	48 8d 3d 39 40 00 00 	lea    0x4039(%rip),%rdi        # 407087 <_IO_stdin_used+0x87>
  40304e:	48 89 05 93 14 01 00 	mov    %rax,0x11493(%rip)        # 4144e8 <font_16px>
  403055:	e8 86 f0 ff ff       	callq  4020e0 <TTF_OpenFont@plt>
  40305a:	48 85 c0             	test   %rax,%rax
  40305d:	0f 84 a8 00 00 00    	je     40310b <setup_assets+0xeb>
  403063:	48 8d 35 1a 40 00 00 	lea    0x401a(%rip),%rsi        # 407084 <_IO_stdin_used+0x84>
  40306a:	48 8d 3d 2b 40 00 00 	lea    0x402b(%rip),%rdi        # 40709c <_IO_stdin_used+0x9c>
  403071:	48 89 05 d0 e6 01 00 	mov    %rax,0x1e6d0(%rip)        # 421748 <font_20px>
  403078:	e8 93 f0 ff ff       	callq  402110 <SDL_RWFromFile@plt>
  40307d:	be 01 00 00 00       	mov    $0x1,%esi
  403082:	48 89 c7             	mov    %rax,%rdi
  403085:	e8 96 f1 ff ff       	callq  402220 <SDL_LoadBMP_RW@plt>
  40308a:	48 8d 35 f3 3f 00 00 	lea    0x3ff3(%rip),%rsi        # 407084 <_IO_stdin_used+0x84>
  403091:	48 8d 3d 19 40 00 00 	lea    0x4019(%rip),%rdi        # 4070b1 <_IO_stdin_used+0xb1>
  403098:	48 89 05 41 14 01 00 	mov    %rax,0x11441(%rip)        # 4144e0 <drop_heal_pack>
  40309f:	e8 6c f0 ff ff       	callq  402110 <SDL_RWFromFile@plt>
  4030a4:	be 01 00 00 00       	mov    $0x1,%esi
  4030a9:	48 89 c7             	mov    %rax,%rdi
  4030ac:	e8 6f f1 ff ff       	callq  402220 <SDL_LoadBMP_RW@plt>
  4030b1:	48 8d 35 cc 3f 00 00 	lea    0x3fcc(%rip),%rsi        # 407084 <_IO_stdin_used+0x84>
  4030b8:	48 8d 3d 0b 40 00 00 	lea    0x400b(%rip),%rdi        # 4070ca <_IO_stdin_used+0xca>
  4030bf:	48 89 05 52 e6 01 00 	mov    %rax,0x1e652(%rip)        # 421718 <drop_fast_shooting>
  4030c6:	e8 45 f0 ff ff       	callq  402110 <SDL_RWFromFile@plt>
  4030cb:	be 01 00 00 00       	mov    $0x1,%esi
  4030d0:	48 89 c7             	mov    %rax,%rdi
  4030d3:	e8 48 f1 ff ff       	callq  402220 <SDL_LoadBMP_RW@plt>
  4030d8:	48 8d 35 a5 3f 00 00 	lea    0x3fa5(%rip),%rsi        # 407084 <_IO_stdin_used+0x84>
  4030df:	48 8d 3d fb 3f 00 00 	lea    0x3ffb(%rip),%rdi        # 4070e1 <_IO_stdin_used+0xe1>
  4030e6:	48 89 05 7b 73 00 00 	mov    %rax,0x737b(%rip)        # 40a468 <drop_big_bullets>
  4030ed:	e8 1e f0 ff ff       	callq  402110 <SDL_RWFromFile@plt>
  4030f2:	be 01 00 00 00       	mov    $0x1,%esi
  4030f7:	48 89 c7             	mov    %rax,%rdi
  4030fa:	e8 21 f1 ff ff       	callq  402220 <SDL_LoadBMP_RW@plt>
  4030ff:	48 89 05 fa d3 01 00 	mov    %rax,0x1d3fa(%rip)        # 420500 <drop_super_speed>
  403106:	48 83 c4 08          	add    $0x8,%rsp
  40310a:	c3                   	retq   
  40310b:	e8 00 f8 ff ff       	callq  402910 <load_font.part.0>

0000000000403110 <cleanup_assets>:
  403110:	f3 0f 1e fa          	endbr64 
  403114:	48 83 ec 08          	sub    $0x8,%rsp
  403118:	48 8b 3d c9 13 01 00 	mov    0x113c9(%rip),%rdi        # 4144e8 <font_16px>
  40311f:	e8 7c f1 ff ff       	callq  4022a0 <TTF_CloseFont@plt>
  403124:	48 8b 3d 1d e6 01 00 	mov    0x1e61d(%rip),%rdi        # 421748 <font_20px>
  40312b:	e8 70 f1 ff ff       	callq  4022a0 <TTF_CloseFont@plt>
  403130:	48 8b 3d a9 13 01 00 	mov    0x113a9(%rip),%rdi        # 4144e0 <drop_heal_pack>
  403137:	e8 f4 f0 ff ff       	callq  402230 <SDL_FreeSurface@plt>
  40313c:	48 8b 3d d5 e5 01 00 	mov    0x1e5d5(%rip),%rdi        # 421718 <drop_fast_shooting>
  403143:	e8 e8 f0 ff ff       	callq  402230 <SDL_FreeSurface@plt>
  403148:	48 8b 3d 19 73 00 00 	mov    0x7319(%rip),%rdi        # 40a468 <drop_big_bullets>
  40314f:	e8 dc f0 ff ff       	callq  402230 <SDL_FreeSurface@plt>
  403154:	48 8b 3d a5 d3 01 00 	mov    0x1d3a5(%rip),%rdi        # 420500 <drop_super_speed>
  40315b:	48 83 c4 08          	add    $0x8,%rsp
  40315f:	e9 cc f0 ff ff       	jmpq   402230 <SDL_FreeSurface@plt>
  403164:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40316b:	00 00 00 00 
  40316f:	90                   	nop

0000000000403170 <render_frame>:
  403170:	f3 0f 1e fa          	endbr64 
  403174:	48 8b 3d bd e5 01 00 	mov    0x1e5bd(%rip),%rdi        # 421738 <renderer>
  40317b:	e9 10 ef ff ff       	jmpq   402090 <SDL_RenderPresent@plt>

0000000000403180 <set_colour_rgb>:
  403180:	f3 0f 1e fa          	endbr64 
  403184:	0f b6 ca             	movzbl %dl,%ecx
  403187:	40 0f b6 d6          	movzbl %sil,%edx
  40318b:	40 0f b6 f7          	movzbl %dil,%esi
  40318f:	48 8b 3d a2 e5 01 00 	mov    0x1e5a2(%rip),%rdi        # 421738 <renderer>
  403196:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  40319c:	e9 4f f1 ff ff       	jmpq   4022f0 <SDL_SetRenderDrawColor@plt>
  4031a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031a8:	00 00 00 00 
  4031ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004031b0 <set_colour_rgba>:
  4031b0:	f3 0f 1e fa          	endbr64 
  4031b4:	41 89 c8             	mov    %ecx,%r8d
  4031b7:	0f b6 ca             	movzbl %dl,%ecx
  4031ba:	40 0f b6 d6          	movzbl %sil,%edx
  4031be:	40 0f b6 f7          	movzbl %dil,%esi
  4031c2:	48 8b 3d 6f e5 01 00 	mov    0x1e56f(%rip),%rdi        # 421738 <renderer>
  4031c9:	45 0f b6 c0          	movzbl %r8b,%r8d
  4031cd:	e9 1e f1 ff ff       	jmpq   4022f0 <SDL_SetRenderDrawColor@plt>
  4031d2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031d9:	00 00 00 00 
  4031dd:	0f 1f 00             	nopl   (%rax)

00000000004031e0 <fill_rect>:
  4031e0:	f3 0f 1e fa          	endbr64 
  4031e4:	48 83 ec 28          	sub    $0x28,%rsp
  4031e8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4031ef:	00 00 
  4031f1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4031f6:	31 c0                	xor    %eax,%eax
  4031f8:	89 3c 24             	mov    %edi,(%rsp)
  4031fb:	48 8b 3d 36 e5 01 00 	mov    0x1e536(%rip),%rdi        # 421738 <renderer>
  403202:	89 74 24 04          	mov    %esi,0x4(%rsp)
  403206:	48 89 e6             	mov    %rsp,%rsi
  403209:	89 54 24 08          	mov    %edx,0x8(%rsp)
  40320d:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
  403211:	e8 1a ef ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403216:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40321b:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403222:	00 00 
  403224:	75 05                	jne    40322b <fill_rect+0x4b>
  403226:	48 83 c4 28          	add    $0x28,%rsp
  40322a:	c3                   	retq   
  40322b:	e8 20 f0 ff ff       	callq  402250 <__stack_chk_fail@plt>

0000000000403230 <stroke_rect>:
  403230:	f3 0f 1e fa          	endbr64 
  403234:	41 57                	push   %r15
  403236:	41 89 d7             	mov    %edx,%r15d
  403239:	89 f2                	mov    %esi,%edx
  40323b:	41 56                	push   %r14
  40323d:	41 55                	push   %r13
  40323f:	45 89 c5             	mov    %r8d,%r13d
  403242:	41 54                	push   %r12
  403244:	41 d1 ed             	shr    %r13d
  403247:	41 89 cc             	mov    %ecx,%r12d
  40324a:	43 8d 0c 38          	lea    (%r8,%r15,1),%ecx
  40324e:	55                   	push   %rbp
  40324f:	44 29 ef             	sub    %r13d,%edi
  403252:	44 29 ea             	sub    %r13d,%edx
  403255:	41 01 f5             	add    %esi,%r13d
  403258:	53                   	push   %rbx
  403259:	89 fd                	mov    %edi,%ebp
  40325b:	44 89 c3             	mov    %r8d,%ebx
  40325e:	48 83 ec 38          	sub    $0x38,%rsp
  403262:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403269:	00 00 
  40326b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  403270:	31 c0                	xor    %eax,%eax
  403272:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
  403277:	89 7c 24 10          	mov    %edi,0x10(%rsp)
  40327b:	48 8b 3d b6 e4 01 00 	mov    0x1e4b6(%rip),%rdi        # 421738 <renderer>
  403282:	4c 89 f6             	mov    %r14,%rsi
  403285:	44 89 44 24 1c       	mov    %r8d,0x1c(%rsp)
  40328a:	89 54 24 14          	mov    %edx,0x14(%rsp)
  40328e:	89 54 24 0c          	mov    %edx,0xc(%rsp)
  403292:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
  403296:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
  40329a:	e8 91 ee ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  40329f:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  4032a3:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
  4032a7:	4c 89 f6             	mov    %r14,%rsi
  4032aa:	48 8b 3d 87 e4 01 00 	mov    0x1e487(%rip),%rdi        # 421738 <renderer>
  4032b1:	89 6c 24 10          	mov    %ebp,0x10(%rsp)
  4032b5:	44 01 e2             	add    %r12d,%edx
  4032b8:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
  4032bc:	41 29 dc             	sub    %ebx,%r12d
  4032bf:	89 54 24 14          	mov    %edx,0x14(%rsp)
  4032c3:	89 5c 24 1c          	mov    %ebx,0x1c(%rsp)
  4032c7:	e8 64 ee ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  4032cc:	48 8b 3d 65 e4 01 00 	mov    0x1e465(%rip),%rdi        # 421738 <renderer>
  4032d3:	4c 89 f6             	mov    %r14,%rsi
  4032d6:	89 6c 24 10          	mov    %ebp,0x10(%rsp)
  4032da:	44 89 6c 24 14       	mov    %r13d,0x14(%rsp)
  4032df:	44 01 fd             	add    %r15d,%ebp
  4032e2:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
  4032e6:	44 89 64 24 1c       	mov    %r12d,0x1c(%rsp)
  4032eb:	e8 40 ee ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  4032f0:	48 8b 3d 41 e4 01 00 	mov    0x1e441(%rip),%rdi        # 421738 <renderer>
  4032f7:	4c 89 f6             	mov    %r14,%rsi
  4032fa:	89 6c 24 10          	mov    %ebp,0x10(%rsp)
  4032fe:	44 89 6c 24 14       	mov    %r13d,0x14(%rsp)
  403303:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
  403307:	44 89 64 24 1c       	mov    %r12d,0x1c(%rsp)
  40330c:	e8 1f ee ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403311:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  403316:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40331d:	00 00 
  40331f:	75 0f                	jne    403330 <stroke_rect+0x100>
  403321:	48 83 c4 38          	add    $0x38,%rsp
  403325:	5b                   	pop    %rbx
  403326:	5d                   	pop    %rbp
  403327:	41 5c                	pop    %r12
  403329:	41 5d                	pop    %r13
  40332b:	41 5e                	pop    %r14
  40332d:	41 5f                	pop    %r15
  40332f:	c3                   	retq   
  403330:	e8 1b ef ff ff       	callq  402250 <__stack_chk_fail@plt>
  403335:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40333c:	00 00 00 00 

0000000000403340 <rotate_point_around_point>:
  403340:	f3 0f 1e fa          	endbr64 
  403344:	41 55                	push   %r13
  403346:	41 89 d5             	mov    %edx,%r13d
  403349:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  40334d:	41 54                	push   %r12
  40334f:	41 89 fc             	mov    %edi,%r12d
  403352:	55                   	push   %rbp
  403353:	89 f5                	mov    %esi,%ebp
  403355:	45 29 ec             	sub    %r13d,%r12d
  403358:	53                   	push   %rbx
  403359:	89 cb                	mov    %ecx,%ebx
  40335b:	29 dd                	sub    %ebx,%ebp
  40335d:	48 83 ec 18          	sub    $0x18,%rsp
  403361:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  403366:	48 89 e6             	mov    %rsp,%rsi
  403369:	e8 32 ee ff ff       	callq  4021a0 <sincos@plt>
  40336e:	66 0f ef db          	pxor   %xmm3,%xmm3
  403372:	66 0f ef d2          	pxor   %xmm2,%xmm2
  403376:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40337a:	f3 41 0f 2a dc       	cvtsi2ss %r12d,%xmm3
  40337f:	66 0f ef ed          	pxor   %xmm5,%xmm5
  403383:	f2 0f 5a 44 24 08    	cvtsd2ss 0x8(%rsp),%xmm0
  403389:	0f 28 e0             	movaps %xmm0,%xmm4
  40338c:	f3 0f 2a d5          	cvtsi2ss %ebp,%xmm2
  403390:	f2 0f 5a 2c 24       	cvtsd2ss (%rsp),%xmm5
  403395:	0f 28 cd             	movaps %xmm5,%xmm1
  403398:	48 83 c4 18          	add    $0x18,%rsp
  40339c:	f3 0f 59 cb          	mulss  %xmm3,%xmm1
  4033a0:	f3 0f 59 e2          	mulss  %xmm2,%xmm4
  4033a4:	f3 0f 59 c3          	mulss  %xmm3,%xmm0
  4033a8:	f3 0f 59 d5          	mulss  %xmm5,%xmm2
  4033ac:	f3 0f 5c cc          	subss  %xmm4,%xmm1
  4033b0:	66 0f ef e4          	pxor   %xmm4,%xmm4
  4033b4:	f3 41 0f 2a e5       	cvtsi2ss %r13d,%xmm4
  4033b9:	f3 0f 58 c2          	addss  %xmm2,%xmm0
  4033bd:	f3 0f 58 cc          	addss  %xmm4,%xmm1
  4033c1:	f3 0f 2c d1          	cvttss2si %xmm1,%edx
  4033c5:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4033c9:	f3 0f 2a cb          	cvtsi2ss %ebx,%xmm1
  4033cd:	5b                   	pop    %rbx
  4033ce:	5d                   	pop    %rbp
  4033cf:	41 5c                	pop    %r12
  4033d1:	41 5d                	pop    %r13
  4033d3:	89 d2                	mov    %edx,%edx
  4033d5:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  4033d9:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  4033dd:	48 c1 e0 20          	shl    $0x20,%rax
  4033e1:	48 09 d0             	or     %rdx,%rax
  4033e4:	c3                   	retq   
  4033e5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033ec:	00 00 00 00 

00000000004033f0 <filled_rotated_rect>:
  4033f0:	f3 0f 1e fa          	endbr64 
  4033f4:	41 57                	push   %r15
  4033f6:	41 56                	push   %r14
  4033f8:	41 55                	push   %r13
  4033fa:	41 54                	push   %r12
  4033fc:	44 8d 24 3a          	lea    (%rdx,%rdi,1),%r12d
  403400:	55                   	push   %rbp
  403401:	53                   	push   %rbx
  403402:	48 83 ec 38          	sub    $0x38,%rsp
  403406:	41 39 fc             	cmp    %edi,%r12d
  403409:	0f 86 ff 00 00 00    	jbe    40350e <filled_rotated_rect+0x11e>
  40340f:	8d 1c 31             	lea    (%rcx,%rsi,1),%ebx
  403412:	41 89 f5             	mov    %esi,%r13d
  403415:	39 de                	cmp    %ebx,%esi
  403417:	0f 83 f1 00 00 00    	jae    40350e <filled_rotated_rect+0x11e>
  40341d:	89 fd                	mov    %edi,%ebp
  40341f:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  403424:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  403429:	45 89 ce             	mov    %r9d,%r14d
  40342c:	45 89 c7             	mov    %r8d,%r15d
  40342f:	44 29 c5             	sub    %r8d,%ebp
  403432:	45 29 c4             	sub    %r8d,%r12d
  403435:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  403439:	e8 62 ed ff ff       	callq  4021a0 <sincos@plt>
  40343e:	66 0f ef ff          	pxor   %xmm7,%xmm7
  403442:	44 29 f3             	sub    %r14d,%ebx
  403445:	f2 0f 5a 7c 24 28    	cvtsd2ss 0x28(%rsp),%xmm7
  40344b:	f3 0f 11 7c 24 08    	movss  %xmm7,0x8(%rsp)
  403451:	66 0f ef ff          	pxor   %xmm7,%xmm7
  403455:	f2 0f 5a 7c 24 20    	cvtsd2ss 0x20(%rsp),%xmm7
  40345b:	f3 0f 11 7c 24 0c    	movss  %xmm7,0xc(%rsp)
  403461:	66 0f ef ff          	pxor   %xmm7,%xmm7
  403465:	f3 41 0f 2a ff       	cvtsi2ss %r15d,%xmm7
  40346a:	f3 0f 11 7c 24 18    	movss  %xmm7,0x18(%rsp)
  403470:	66 0f ef ff          	pxor   %xmm7,%xmm7
  403474:	f3 41 0f 2a fe       	cvtsi2ss %r14d,%xmm7
  403479:	f3 0f 11 7c 24 1c    	movss  %xmm7,0x1c(%rsp)
  40347f:	90                   	nop
  403480:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403484:	f3 0f 10 74 24 0c    	movss  0xc(%rsp),%xmm6
  40348a:	45 89 ef             	mov    %r13d,%r15d
  40348d:	f3 0f 2a c5          	cvtsi2ss %ebp,%xmm0
  403491:	45 29 f7             	sub    %r14d,%r15d
  403494:	f3 0f 59 f0          	mulss  %xmm0,%xmm6
  403498:	f3 0f 59 44 24 08    	mulss  0x8(%rsp),%xmm0
  40349e:	f3 0f 11 74 24 10    	movss  %xmm6,0x10(%rsp)
  4034a4:	f3 0f 11 44 24 14    	movss  %xmm0,0x14(%rsp)
  4034aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4034b0:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4034b4:	f3 0f 10 44 24 0c    	movss  0xc(%rsp),%xmm0
  4034ba:	48 8b 3d 77 e2 01 00 	mov    0x1e277(%rip),%rdi        # 421738 <renderer>
  4034c1:	f3 41 0f 2a cf       	cvtsi2ss %r15d,%xmm1
  4034c6:	41 83 c7 01          	add    $0x1,%r15d
  4034ca:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
  4034ce:	f3 0f 58 44 24 14    	addss  0x14(%rsp),%xmm0
  4034d4:	f3 0f 59 4c 24 08    	mulss  0x8(%rsp),%xmm1
  4034da:	f3 0f 58 44 24 1c    	addss  0x1c(%rsp),%xmm0
  4034e0:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  4034e4:	f3 0f 10 44 24 10    	movss  0x10(%rsp),%xmm0
  4034ea:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  4034ee:	f3 0f 58 44 24 18    	addss  0x18(%rsp),%xmm0
  4034f4:	f3 0f 2c f0          	cvttss2si %xmm0,%esi
  4034f8:	e8 13 ed ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  4034fd:	44 39 fb             	cmp    %r15d,%ebx
  403500:	75 ae                	jne    4034b0 <filled_rotated_rect+0xc0>
  403502:	83 c5 01             	add    $0x1,%ebp
  403505:	41 39 ec             	cmp    %ebp,%r12d
  403508:	0f 85 72 ff ff ff    	jne    403480 <filled_rotated_rect+0x90>
  40350e:	48 83 c4 38          	add    $0x38,%rsp
  403512:	5b                   	pop    %rbx
  403513:	5d                   	pop    %rbp
  403514:	41 5c                	pop    %r12
  403516:	41 5d                	pop    %r13
  403518:	41 5e                	pop    %r14
  40351a:	41 5f                	pop    %r15
  40351c:	c3                   	retq   
  40351d:	0f 1f 00             	nopl   (%rax)

0000000000403520 <stroke_circle>:
  403520:	f3 0f 1e fa          	endbr64 
  403524:	41 57                	push   %r15
  403526:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
  403529:	b9 01 00 00 00       	mov    $0x1,%ecx
  40352e:	41 56                	push   %r14
  403530:	29 c1                	sub    %eax,%ecx
  403532:	41 55                	push   %r13
  403534:	41 54                	push   %r12
  403536:	55                   	push   %rbp
  403537:	53                   	push   %rbx
  403538:	89 d3                	mov    %edx,%ebx
  40353a:	48 83 ec 28          	sub    $0x28,%rsp
  40353e:	89 3c 24             	mov    %edi,(%rsp)
  403541:	89 74 24 04          	mov    %esi,0x4(%rsp)
  403545:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  403549:	83 eb 01             	sub    $0x1,%ebx
  40354c:	0f 88 4e 01 00 00    	js     4036a0 <stroke_circle+0x180>
  403552:	44 8d 24 1e          	lea    (%rsi,%rbx,1),%r12d
  403556:	31 ed                	xor    %ebp,%ebp
  403558:	44 8d 2c 1f          	lea    (%rdi,%rbx,1),%r13d
  40355c:	41 89 ff             	mov    %edi,%r15d
  40355f:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%rsp)
  403566:	00 
  403567:	45 89 e6             	mov    %r12d,%r14d
  40356a:	41 89 f4             	mov    %esi,%r12d
  40356d:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%rsp)
  403574:	00 
  403575:	0f 1f 00             	nopl   (%rax)
  403578:	48 8b 3d b9 e1 01 00 	mov    0x1e1b9(%rip),%rdi        # 421738 <renderer>
  40357f:	44 89 e2             	mov    %r12d,%edx
  403582:	44 89 ee             	mov    %r13d,%esi
  403585:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
  403589:	e8 82 ec ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  40358e:	44 8b 44 24 04       	mov    0x4(%rsp),%r8d
  403593:	48 8b 3d 9e e1 01 00 	mov    0x1e19e(%rip),%rdi        # 421738 <renderer>
  40359a:	44 89 ee             	mov    %r13d,%esi
  40359d:	41 29 e8             	sub    %ebp,%r8d
  4035a0:	44 89 c2             	mov    %r8d,%edx
  4035a3:	44 89 44 24 0c       	mov    %r8d,0xc(%rsp)
  4035a8:	e8 63 ec ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  4035ad:	8b 34 24             	mov    (%rsp),%esi
  4035b0:	48 8b 3d 81 e1 01 00 	mov    0x1e181(%rip),%rdi        # 421738 <renderer>
  4035b7:	44 89 e2             	mov    %r12d,%edx
  4035ba:	29 de                	sub    %ebx,%esi
  4035bc:	89 74 24 08          	mov    %esi,0x8(%rsp)
  4035c0:	e8 4b ec ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  4035c5:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
  4035ca:	8b 74 24 08          	mov    0x8(%rsp),%esi
  4035ce:	48 8b 3d 63 e1 01 00 	mov    0x1e163(%rip),%rdi        # 421738 <renderer>
  4035d5:	44 89 c2             	mov    %r8d,%edx
  4035d8:	e8 33 ec ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  4035dd:	48 8b 3d 54 e1 01 00 	mov    0x1e154(%rip),%rdi        # 421738 <renderer>
  4035e4:	44 89 f2             	mov    %r14d,%edx
  4035e7:	44 89 fe             	mov    %r15d,%esi
  4035ea:	e8 21 ec ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  4035ef:	44 8b 44 24 04       	mov    0x4(%rsp),%r8d
  4035f4:	48 8b 3d 3d e1 01 00 	mov    0x1e13d(%rip),%rdi        # 421738 <renderer>
  4035fb:	44 89 fe             	mov    %r15d,%esi
  4035fe:	41 29 d8             	sub    %ebx,%r8d
  403601:	44 89 c2             	mov    %r8d,%edx
  403604:	44 89 44 24 0c       	mov    %r8d,0xc(%rsp)
  403609:	e8 02 ec ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  40360e:	8b 34 24             	mov    (%rsp),%esi
  403611:	48 8b 3d 20 e1 01 00 	mov    0x1e120(%rip),%rdi        # 421738 <renderer>
  403618:	44 89 f2             	mov    %r14d,%edx
  40361b:	29 ee                	sub    %ebp,%esi
  40361d:	89 74 24 08          	mov    %esi,0x8(%rsp)
  403621:	e8 ea eb ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  403626:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
  40362b:	8b 74 24 08          	mov    0x8(%rsp),%esi
  40362f:	48 8b 3d 02 e1 01 00 	mov    0x1e102(%rip),%rdi        # 421738 <renderer>
  403636:	44 89 c2             	mov    %r8d,%edx
  403639:	e8 d2 eb ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  40363e:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
  403642:	85 c9                	test   %ecx,%ecx
  403644:	7e 2a                	jle    403670 <stroke_circle+0x150>
  403646:	83 44 24 14 02       	addl   $0x2,0x14(%rsp)
  40364b:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40364f:	83 eb 01             	sub    $0x1,%ebx
  403652:	2b 4c 24 1c          	sub    0x1c(%rsp),%ecx
  403656:	01 c1                	add    %eax,%ecx
  403658:	39 eb                	cmp    %ebp,%ebx
  40365a:	7c 44                	jl     4036a0 <stroke_circle+0x180>
  40365c:	8b 04 24             	mov    (%rsp),%eax
  40365f:	44 8d 2c 18          	lea    (%rax,%rbx,1),%r13d
  403663:	8b 44 24 04          	mov    0x4(%rsp),%eax
  403667:	44 8d 34 18          	lea    (%rax,%rbx,1),%r14d
  40366b:	e9 08 ff ff ff       	jmpq   403578 <stroke_circle+0x58>
  403670:	8b 44 24 18          	mov    0x18(%rsp),%eax
  403674:	83 c5 01             	add    $0x1,%ebp
  403677:	01 c1                	add    %eax,%ecx
  403679:	83 c0 02             	add    $0x2,%eax
  40367c:	89 44 24 18          	mov    %eax,0x18(%rsp)
  403680:	39 dd                	cmp    %ebx,%ebp
  403682:	7f 1c                	jg     4036a0 <stroke_circle+0x180>
  403684:	44 8b 44 24 04       	mov    0x4(%rsp),%r8d
  403689:	8b 34 24             	mov    (%rsp),%esi
  40368c:	45 8d 24 28          	lea    (%r8,%rbp,1),%r12d
  403690:	44 8d 3c 2e          	lea    (%rsi,%rbp,1),%r15d
  403694:	e9 df fe ff ff       	jmpq   403578 <stroke_circle+0x58>
  403699:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4036a0:	48 83 c4 28          	add    $0x28,%rsp
  4036a4:	5b                   	pop    %rbx
  4036a5:	5d                   	pop    %rbp
  4036a6:	41 5c                	pop    %r12
  4036a8:	41 5d                	pop    %r13
  4036aa:	41 5e                	pop    %r14
  4036ac:	41 5f                	pop    %r15
  4036ae:	c3                   	retq   
  4036af:	90                   	nop

00000000004036b0 <fill_circle>:
  4036b0:	f3 0f 1e fa          	endbr64 
  4036b4:	41 57                	push   %r15
  4036b6:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
  4036b9:	41 56                	push   %r14
  4036bb:	41 55                	push   %r13
  4036bd:	41 54                	push   %r12
  4036bf:	41 89 d4             	mov    %edx,%r12d
  4036c2:	55                   	push   %rbp
  4036c3:	44 0f af e2          	imul   %edx,%r12d
  4036c7:	53                   	push   %rbx
  4036c8:	48 83 ec 18          	sub    $0x18,%rsp
  4036cc:	89 74 24 08          	mov    %esi,0x8(%rsp)
  4036d0:	89 54 24 0c          	mov    %edx,0xc(%rsp)
  4036d4:	85 c0                	test   %eax,%eax
  4036d6:	7e 5f                	jle    403737 <fill_circle+0x87>
  4036d8:	41 89 d6             	mov    %edx,%r14d
  4036db:	89 d5                	mov    %edx,%ebp
  4036dd:	44 8d 2c 17          	lea    (%rdi,%rdx,1),%r13d
  4036e1:	41 29 c6             	sub    %eax,%r14d
  4036e4:	0f 1f 40 00          	nopl   0x0(%rax)
  4036e8:	41 89 ef             	mov    %ebp,%r15d
  4036eb:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
  4036ef:	44 0f af fd          	imul   %ebp,%r15d
  4036f3:	eb 0b                	jmp    403700 <fill_circle+0x50>
  4036f5:	0f 1f 00             	nopl   (%rax)
  4036f8:	83 eb 01             	sub    $0x1,%ebx
  4036fb:	44 39 f3             	cmp    %r14d,%ebx
  4036fe:	74 2b                	je     40372b <fill_circle+0x7b>
  403700:	89 d8                	mov    %ebx,%eax
  403702:	0f af c3             	imul   %ebx,%eax
  403705:	44 01 f8             	add    %r15d,%eax
  403708:	44 39 e0             	cmp    %r12d,%eax
  40370b:	7f eb                	jg     4036f8 <fill_circle+0x48>
  40370d:	8b 44 24 08          	mov    0x8(%rsp),%eax
  403711:	48 8b 3d 20 e0 01 00 	mov    0x1e020(%rip),%rdi        # 421738 <renderer>
  403718:	44 89 ee             	mov    %r13d,%esi
  40371b:	8d 14 18             	lea    (%rax,%rbx,1),%edx
  40371e:	83 eb 01             	sub    $0x1,%ebx
  403721:	e8 ea ea ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  403726:	44 39 f3             	cmp    %r14d,%ebx
  403729:	75 d5                	jne    403700 <fill_circle+0x50>
  40372b:	83 ed 01             	sub    $0x1,%ebp
  40372e:	41 83 ed 01          	sub    $0x1,%r13d
  403732:	44 39 f5             	cmp    %r14d,%ebp
  403735:	75 b1                	jne    4036e8 <fill_circle+0x38>
  403737:	48 83 c4 18          	add    $0x18,%rsp
  40373b:	5b                   	pop    %rbx
  40373c:	5d                   	pop    %rbp
  40373d:	41 5c                	pop    %r12
  40373f:	41 5d                	pop    %r13
  403741:	41 5e                	pop    %r14
  403743:	41 5f                	pop    %r15
  403745:	c3                   	retq   
  403746:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40374d:	00 00 00 

0000000000403750 <render_surface>:
  403750:	f3 0f 1e fa          	endbr64 
  403754:	41 56                	push   %r14
  403756:	41 89 f6             	mov    %esi,%r14d
  403759:	48 89 fe             	mov    %rdi,%rsi
  40375c:	41 55                	push   %r13
  40375e:	41 89 d5             	mov    %edx,%r13d
  403761:	41 54                	push   %r12
  403763:	41 89 cc             	mov    %ecx,%r12d
  403766:	55                   	push   %rbp
  403767:	53                   	push   %rbx
  403768:	44 89 c3             	mov    %r8d,%ebx
  40376b:	48 83 ec 20          	sub    $0x20,%rsp
  40376f:	48 8b 3d c2 df 01 00 	mov    0x1dfc2(%rip),%rdi        # 421738 <renderer>
  403776:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40377d:	00 00 
  40377f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  403784:	31 c0                	xor    %eax,%eax
  403786:	e8 35 eb ff ff       	callq  4022c0 <SDL_CreateTextureFromSurface@plt>
  40378b:	31 d2                	xor    %edx,%edx
  40378d:	48 89 e1             	mov    %rsp,%rcx
  403790:	44 89 34 24          	mov    %r14d,(%rsp)
  403794:	48 8b 3d 9d df 01 00 	mov    0x1df9d(%rip),%rdi        # 421738 <renderer>
  40379b:	48 89 c5             	mov    %rax,%rbp
  40379e:	48 89 c6             	mov    %rax,%rsi
  4037a1:	44 89 6c 24 04       	mov    %r13d,0x4(%rsp)
  4037a6:	44 89 64 24 08       	mov    %r12d,0x8(%rsp)
  4037ab:	89 5c 24 0c          	mov    %ebx,0xc(%rsp)
  4037af:	e8 ac ea ff ff       	callq  402260 <SDL_RenderCopy@plt>
  4037b4:	48 89 ef             	mov    %rbp,%rdi
  4037b7:	e8 f4 e9 ff ff       	callq  4021b0 <SDL_DestroyTexture@plt>
  4037bc:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4037c1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4037c8:	00 00 
  4037ca:	75 0d                	jne    4037d9 <render_surface+0x89>
  4037cc:	48 83 c4 20          	add    $0x20,%rsp
  4037d0:	5b                   	pop    %rbx
  4037d1:	5d                   	pop    %rbp
  4037d2:	41 5c                	pop    %r12
  4037d4:	41 5d                	pop    %r13
  4037d6:	41 5e                	pop    %r14
  4037d8:	c3                   	retq   
  4037d9:	e8 72 ea ff ff       	callq  402250 <__stack_chk_fail@plt>
  4037de:	66 90                	xchg   %ax,%ax

00000000004037e0 <render_text>:
  4037e0:	f3 0f 1e fa          	endbr64 
  4037e4:	41 55                	push   %r13
  4037e6:	41 89 d5             	mov    %edx,%r13d
  4037e9:	41 54                	push   %r12
  4037eb:	49 89 f4             	mov    %rsi,%r12
  4037ee:	55                   	push   %rbp
  4037ef:	48 89 fd             	mov    %rdi,%rbp
  4037f2:	53                   	push   %rbx
  4037f3:	89 cb                	mov    %ecx,%ebx
  4037f5:	48 83 ec 38          	sub    $0x38,%rsp
  4037f9:	48 8b 3d 38 df 01 00 	mov    0x1df38(%rip),%rdi        # 421738 <renderer>
  403800:	4c 8d 44 24 0f       	lea    0xf(%rsp),%r8
  403805:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  40380a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403811:	00 00 
  403813:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  403818:	31 c0                	xor    %eax,%eax
  40381a:	48 8d 4c 24 0e       	lea    0xe(%rsp),%rcx
  40381f:	48 8d 54 24 0d       	lea    0xd(%rsp),%rdx
  403824:	e8 67 eb ff ff       	callq  402390 <SDL_GetRenderDrawColor@plt>
  403829:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40382e:	4c 89 e6             	mov    %r12,%rsi
  403831:	48 89 ef             	mov    %rbp,%rdi
  403834:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
  403839:	e8 b2 e9 ff ff       	callq  4021f0 <TTF_SizeText@plt>
  40383e:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  403842:	4c 89 e6             	mov    %r12,%rsi
  403845:	48 89 ef             	mov    %rbp,%rdi
  403848:	e8 23 ea ff ff       	callq  402270 <TTF_RenderText_Blended@plt>
  40384d:	48 8b 3d e4 de 01 00 	mov    0x1dee4(%rip),%rdi        # 421738 <renderer>
  403854:	48 89 c6             	mov    %rax,%rsi
  403857:	49 89 c4             	mov    %rax,%r12
  40385a:	e8 61 ea ff ff       	callq  4022c0 <SDL_CreateTextureFromSurface@plt>
  40385f:	31 d2                	xor    %edx,%edx
  403861:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  403866:	89 5c 24 14          	mov    %ebx,0x14(%rsp)
  40386a:	48 89 c5             	mov    %rax,%rbp
  40386d:	8b 44 24 04          	mov    0x4(%rsp),%eax
  403871:	48 8b 3d c0 de 01 00 	mov    0x1dec0(%rip),%rdi        # 421738 <renderer>
  403878:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
  40387d:	48 89 ee             	mov    %rbp,%rsi
  403880:	89 44 24 18          	mov    %eax,0x18(%rsp)
  403884:	8b 44 24 08          	mov    0x8(%rsp),%eax
  403888:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40388c:	e8 cf e9 ff ff       	callq  402260 <SDL_RenderCopy@plt>
  403891:	4c 89 e7             	mov    %r12,%rdi
  403894:	e8 97 e9 ff ff       	callq  402230 <SDL_FreeSurface@plt>
  403899:	48 89 ef             	mov    %rbp,%rdi
  40389c:	e8 0f e9 ff ff       	callq  4021b0 <SDL_DestroyTexture@plt>
  4038a1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4038a6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4038ad:	00 00 
  4038af:	75 0b                	jne    4038bc <render_text+0xdc>
  4038b1:	48 83 c4 38          	add    $0x38,%rsp
  4038b5:	5b                   	pop    %rbx
  4038b6:	5d                   	pop    %rbp
  4038b7:	41 5c                	pop    %r12
  4038b9:	41 5d                	pop    %r13
  4038bb:	c3                   	retq   
  4038bc:	e8 8f e9 ff ff       	callq  402250 <__stack_chk_fail@plt>
  4038c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038c8:	00 00 00 00 
  4038cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004038d0 <render_text_centred>:
  4038d0:	f3 0f 1e fa          	endbr64 
  4038d4:	41 55                	push   %r13
  4038d6:	41 89 cd             	mov    %ecx,%r13d
  4038d9:	41 54                	push   %r12
  4038db:	49 89 f4             	mov    %rsi,%r12
  4038de:	55                   	push   %rbp
  4038df:	48 89 fd             	mov    %rdi,%rbp
  4038e2:	53                   	push   %rbx
  4038e3:	89 d3                	mov    %edx,%ebx
  4038e5:	48 83 ec 38          	sub    $0x38,%rsp
  4038e9:	48 8b 3d 48 de 01 00 	mov    0x1de48(%rip),%rdi        # 421738 <renderer>
  4038f0:	4c 8d 44 24 0f       	lea    0xf(%rsp),%r8
  4038f5:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  4038fa:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403901:	00 00 
  403903:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  403908:	31 c0                	xor    %eax,%eax
  40390a:	48 8d 4c 24 0e       	lea    0xe(%rsp),%rcx
  40390f:	48 8d 54 24 0d       	lea    0xd(%rsp),%rdx
  403914:	e8 77 ea ff ff       	callq  402390 <SDL_GetRenderDrawColor@plt>
  403919:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40391e:	4c 89 e6             	mov    %r12,%rsi
  403921:	48 89 ef             	mov    %rbp,%rdi
  403924:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
  403929:	e8 c2 e8 ff ff       	callq  4021f0 <TTF_SizeText@plt>
  40392e:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  403932:	4c 89 e6             	mov    %r12,%rsi
  403935:	48 89 ef             	mov    %rbp,%rdi
  403938:	e8 33 e9 ff ff       	callq  402270 <TTF_RenderText_Blended@plt>
  40393d:	48 8b 3d f4 dd 01 00 	mov    0x1ddf4(%rip),%rdi        # 421738 <renderer>
  403944:	48 89 c6             	mov    %rax,%rsi
  403947:	49 89 c4             	mov    %rax,%r12
  40394a:	e8 71 e9 ff ff       	callq  4022c0 <SDL_CreateTextureFromSurface@plt>
  40394f:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
  403953:	31 d2                	xor    %edx,%edx
  403955:	44 89 6c 24 14       	mov    %r13d,0x14(%rsp)
  40395a:	48 89 c5             	mov    %rax,%rbp
  40395d:	48 8b 3d d4 dd 01 00 	mov    0x1ddd4(%rip),%rdi        # 421738 <renderer>
  403964:	89 c8                	mov    %ecx,%eax
  403966:	48 89 ee             	mov    %rbp,%rsi
  403969:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
  40396d:	c1 e8 1f             	shr    $0x1f,%eax
  403970:	01 c8                	add    %ecx,%eax
  403972:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  403977:	d1 f8                	sar    %eax
  403979:	29 c3                	sub    %eax,%ebx
  40397b:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40397f:	89 5c 24 10          	mov    %ebx,0x10(%rsp)
  403983:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  403987:	e8 d4 e8 ff ff       	callq  402260 <SDL_RenderCopy@plt>
  40398c:	4c 89 e7             	mov    %r12,%rdi
  40398f:	e8 9c e8 ff ff       	callq  402230 <SDL_FreeSurface@plt>
  403994:	48 89 ef             	mov    %rbp,%rdi
  403997:	e8 14 e8 ff ff       	callq  4021b0 <SDL_DestroyTexture@plt>
  40399c:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4039a1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4039a8:	00 00 
  4039aa:	75 0b                	jne    4039b7 <render_text_centred+0xe7>
  4039ac:	48 83 c4 38          	add    $0x38,%rsp
  4039b0:	5b                   	pop    %rbx
  4039b1:	5d                   	pop    %rbp
  4039b2:	41 5c                	pop    %r12
  4039b4:	41 5d                	pop    %r13
  4039b6:	c3                   	retq   
  4039b7:	e8 94 e8 ff ff       	callq  402250 <__stack_chk_fail@plt>
  4039bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004039c0 <render_text_right>:
  4039c0:	f3 0f 1e fa          	endbr64 
  4039c4:	41 55                	push   %r13
  4039c6:	41 89 cd             	mov    %ecx,%r13d
  4039c9:	41 54                	push   %r12
  4039cb:	49 89 f4             	mov    %rsi,%r12
  4039ce:	55                   	push   %rbp
  4039cf:	48 89 fd             	mov    %rdi,%rbp
  4039d2:	53                   	push   %rbx
  4039d3:	89 d3                	mov    %edx,%ebx
  4039d5:	48 83 ec 38          	sub    $0x38,%rsp
  4039d9:	48 8b 3d 58 dd 01 00 	mov    0x1dd58(%rip),%rdi        # 421738 <renderer>
  4039e0:	4c 8d 44 24 0f       	lea    0xf(%rsp),%r8
  4039e5:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  4039ea:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4039f1:	00 00 
  4039f3:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4039f8:	31 c0                	xor    %eax,%eax
  4039fa:	48 8d 4c 24 0e       	lea    0xe(%rsp),%rcx
  4039ff:	48 8d 54 24 0d       	lea    0xd(%rsp),%rdx
  403a04:	e8 87 e9 ff ff       	callq  402390 <SDL_GetRenderDrawColor@plt>
  403a09:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  403a0e:	4c 89 e6             	mov    %r12,%rsi
  403a11:	48 89 ef             	mov    %rbp,%rdi
  403a14:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
  403a19:	e8 d2 e7 ff ff       	callq  4021f0 <TTF_SizeText@plt>
  403a1e:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  403a22:	4c 89 e6             	mov    %r12,%rsi
  403a25:	48 89 ef             	mov    %rbp,%rdi
  403a28:	e8 43 e8 ff ff       	callq  402270 <TTF_RenderText_Blended@plt>
  403a2d:	48 8b 3d 04 dd 01 00 	mov    0x1dd04(%rip),%rdi        # 421738 <renderer>
  403a34:	48 89 c6             	mov    %rax,%rsi
  403a37:	49 89 c4             	mov    %rax,%r12
  403a3a:	e8 81 e8 ff ff       	callq  4022c0 <SDL_CreateTextureFromSurface@plt>
  403a3f:	48 8b 3d f2 dc 01 00 	mov    0x1dcf2(%rip),%rdi        # 421738 <renderer>
  403a46:	31 d2                	xor    %edx,%edx
  403a48:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  403a4d:	48 89 c5             	mov    %rax,%rbp
  403a50:	8b 44 24 04          	mov    0x4(%rsp),%eax
  403a54:	44 89 6c 24 14       	mov    %r13d,0x14(%rsp)
  403a59:	48 89 ee             	mov    %rbp,%rsi
  403a5c:	29 c3                	sub    %eax,%ebx
  403a5e:	89 44 24 18          	mov    %eax,0x18(%rsp)
  403a62:	8b 44 24 08          	mov    0x8(%rsp),%eax
  403a66:	89 5c 24 10          	mov    %ebx,0x10(%rsp)
  403a6a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  403a6e:	e8 ed e7 ff ff       	callq  402260 <SDL_RenderCopy@plt>
  403a73:	4c 89 e7             	mov    %r12,%rdi
  403a76:	e8 b5 e7 ff ff       	callq  402230 <SDL_FreeSurface@plt>
  403a7b:	48 89 ef             	mov    %rbp,%rdi
  403a7e:	e8 2d e7 ff ff       	callq  4021b0 <SDL_DestroyTexture@plt>
  403a83:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  403a88:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403a8f:	00 00 
  403a91:	75 0b                	jne    403a9e <render_text_right+0xde>
  403a93:	48 83 c4 38          	add    $0x38,%rsp
  403a97:	5b                   	pop    %rbx
  403a98:	5d                   	pop    %rbp
  403a99:	41 5c                	pop    %r12
  403a9b:	41 5d                	pop    %r13
  403a9d:	c3                   	retq   
  403a9e:	e8 ad e7 ff ff       	callq  402250 <__stack_chk_fail@plt>
  403aa3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403aaa:	00 00 00 00 
  403aae:	66 90                	xchg   %ax,%ax

0000000000403ab0 <render_tank>:
  403ab0:	f3 0f 1e fa          	endbr64 
  403ab4:	41 57                	push   %r15
  403ab6:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403aba:	ba 46 00 00 00       	mov    $0x46,%edx
  403abf:	b9 4a 00 00 00       	mov    $0x4a,%ecx
  403ac4:	41 56                	push   %r14
  403ac6:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403acc:	be 40 00 00 00       	mov    $0x40,%esi
  403ad1:	41 55                	push   %r13
  403ad3:	41 54                	push   %r12
  403ad5:	55                   	push   %rbp
  403ad6:	48 89 fd             	mov    %rdi,%rbp
  403ad9:	53                   	push   %rbx
  403ada:	48 83 ec 48          	sub    $0x48,%rsp
  403ade:	8b 05 3c dc 01 00    	mov    0x1dc3c(%rip),%eax        # 421720 <width>
  403ae4:	f3 0f 10 07          	movss  (%rdi),%xmm0
  403ae8:	f3 0f 5c 05 f0 c9 01 	subss  0x1c9f0(%rip),%xmm0        # 4204e0 <player>
  403aef:	00 
  403af0:	d1 e8                	shr    %eax
  403af2:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  403af6:	8b 05 24 69 00 00    	mov    0x6924(%rip),%eax        # 40a420 <height>
  403afc:	d1 e8                	shr    %eax
  403afe:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  403b02:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403b06:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  403b0a:	f3 44 0f 2c e0       	cvttss2si %xmm0,%r12d
  403b0f:	f3 0f 10 47 04       	movss  0x4(%rdi),%xmm0
  403b14:	f3 0f 5c 05 c8 c9 01 	subss  0x1c9c8(%rip),%xmm0        # 4204e4 <player+0x4>
  403b1b:	00 
  403b1c:	48 8b 3d 15 dc 01 00 	mov    0x1dc15(%rip),%rdi        # 421738 <renderer>
  403b23:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  403b27:	f3 0f 2c d8          	cvttss2si %xmm0,%ebx
  403b2b:	e8 c0 e7 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403b30:	41 8d 44 24 28       	lea    0x28(%r12),%eax
  403b35:	41 8d 54 24 14       	lea    0x14(%r12),%edx
  403b3a:	f3 0f 10 45 08       	movss  0x8(%rbp),%xmm0
  403b3f:	39 d0                	cmp    %edx,%eax
  403b41:	0f 86 30 01 00 00    	jbe    403c77 <render_tank+0x1c7>
  403b47:	8d 4b f8             	lea    -0x8(%rbx),%ecx
  403b4a:	44 8d 73 08          	lea    0x8(%rbx),%r14d
  403b4e:	41 39 ce             	cmp    %ecx,%r14d
  403b51:	0f 86 20 01 00 00    	jbe    403c77 <render_tank+0x1c7>
  403b57:	41 8d 54 24 15       	lea    0x15(%r12),%edx
  403b5c:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  403b61:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  403b65:	41 bf 14 00 00 00    	mov    $0x14,%r15d
  403b6b:	39 d0                	cmp    %edx,%eax
  403b6d:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  403b72:	19 c0                	sbb    %eax,%eax
  403b74:	83 e0 ed             	and    $0xffffffed,%eax
  403b77:	83 c0 28             	add    $0x28,%eax
  403b7a:	89 44 24 20          	mov    %eax,0x20(%rsp)
  403b7e:	e8 1d e6 ff ff       	callq  4021a0 <sincos@plt>
  403b83:	66 0f ef ed          	pxor   %xmm5,%xmm5
  403b87:	66 0f ef f6          	pxor   %xmm6,%xmm6
  403b8b:	8d 43 f9             	lea    -0x7(%rbx),%eax
  403b8e:	f3 0f 2a f3          	cvtsi2ss %ebx,%xmm6
  403b92:	89 44 24 24          	mov    %eax,0x24(%rsp)
  403b96:	66 0f ef db          	pxor   %xmm3,%xmm3
  403b9a:	66 0f ef d2          	pxor   %xmm2,%xmm2
  403b9e:	f3 41 0f 2a ec       	cvtsi2ss %r12d,%xmm5
  403ba3:	f2 0f 5a 5c 24 38    	cvtsd2ss 0x38(%rsp),%xmm3
  403ba9:	f2 0f 5a 54 24 30    	cvtsd2ss 0x30(%rsp),%xmm2
  403baf:	f3 0f 11 74 24 2c    	movss  %xmm6,0x2c(%rsp)
  403bb5:	f3 0f 11 6c 24 28    	movss  %xmm5,0x28(%rsp)
  403bbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  403bc0:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403bc4:	44 3b 74 24 24       	cmp    0x24(%rsp),%r14d
  403bc9:	0f 28 e2             	movaps %xmm2,%xmm4
  403bcc:	f3 41 0f 2a c7       	cvtsi2ss %r15d,%xmm0
  403bd1:	45 19 ed             	sbb    %r13d,%r13d
  403bd4:	41 83 e5 f1          	and    $0xfffffff1,%r13d
  403bd8:	41 8d 45 08          	lea    0x8(%r13),%eax
  403bdc:	41 bd f8 ff ff ff    	mov    $0xfffffff8,%r13d
  403be2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  403be6:	f3 0f 59 e0          	mulss  %xmm0,%xmm4
  403bea:	f3 0f 59 c3          	mulss  %xmm3,%xmm0
  403bee:	f3 0f 11 44 24 10    	movss  %xmm0,0x10(%rsp)
  403bf4:	0f 1f 40 00          	nopl   0x0(%rax)
  403bf8:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403bfc:	0f 28 c2             	movaps %xmm2,%xmm0
  403bff:	48 8b 3d 32 db 01 00 	mov    0x1db32(%rip),%rdi        # 421738 <renderer>
  403c06:	f3 0f 11 54 24 1c    	movss  %xmm2,0x1c(%rsp)
  403c0c:	f3 41 0f 2a cd       	cvtsi2ss %r13d,%xmm1
  403c11:	f3 0f 11 5c 24 18    	movss  %xmm3,0x18(%rsp)
  403c17:	41 83 c5 01          	add    $0x1,%r13d
  403c1b:	f3 0f 11 64 24 14    	movss  %xmm4,0x14(%rsp)
  403c21:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
  403c25:	f3 0f 59 cb          	mulss  %xmm3,%xmm1
  403c29:	f3 0f 58 44 24 10    	addss  0x10(%rsp),%xmm0
  403c2f:	f3 0f 58 44 24 2c    	addss  0x2c(%rsp),%xmm0
  403c35:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  403c39:	0f 28 c4             	movaps %xmm4,%xmm0
  403c3c:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  403c40:	f3 0f 58 44 24 28    	addss  0x28(%rsp),%xmm0
  403c46:	f3 0f 2c f0          	cvttss2si %xmm0,%esi
  403c4a:	e8 c1 e5 ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  403c4f:	44 39 6c 24 0c       	cmp    %r13d,0xc(%rsp)
  403c54:	f3 0f 10 64 24 14    	movss  0x14(%rsp),%xmm4
  403c5a:	f3 0f 10 5c 24 18    	movss  0x18(%rsp),%xmm3
  403c60:	f3 0f 10 54 24 1c    	movss  0x1c(%rsp),%xmm2
  403c66:	75 90                	jne    403bf8 <render_tank+0x148>
  403c68:	41 83 c7 01          	add    $0x1,%r15d
  403c6c:	44 39 7c 24 20       	cmp    %r15d,0x20(%rsp)
  403c71:	0f 85 49 ff ff ff    	jne    403bc0 <render_tank+0x110>
  403c77:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403c7d:	b9 fc 00 00 00       	mov    $0xfc,%ecx
  403c82:	ba 98 00 00 00       	mov    $0x98,%edx
  403c87:	48 8b 3d aa da 01 00 	mov    0x1daaa(%rip),%rdi        # 421738 <renderer>
  403c8e:	be 03 00 00 00       	mov    $0x3,%esi
  403c93:	41 bd 14 00 00 00    	mov    $0x14,%r13d
  403c99:	e8 52 e6 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403c9e:	48 8b 3d 93 da 01 00 	mov    0x1da93(%rip),%rdi        # 421738 <renderer>
  403ca5:	0f 1f 00             	nopl   (%rax)
  403ca8:	44 89 e8             	mov    %r13d,%eax
  403cab:	41 be 14 00 00 00    	mov    $0x14,%r14d
  403cb1:	47 8d 3c 2c          	lea    (%r12,%r13,1),%r15d
  403cb5:	41 0f af c5          	imul   %r13d,%eax
  403cb9:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  403cbd:	eb 0b                	jmp    403cca <render_tank+0x21a>
  403cbf:	90                   	nop
  403cc0:	41 83 ee 01          	sub    $0x1,%r14d
  403cc4:	41 83 fe ec          	cmp    $0xffffffec,%r14d
  403cc8:	74 2f                	je     403cf9 <render_tank+0x249>
  403cca:	44 89 f0             	mov    %r14d,%eax
  403ccd:	41 0f af c6          	imul   %r14d,%eax
  403cd1:	03 44 24 0c          	add    0xc(%rsp),%eax
  403cd5:	3d 90 01 00 00       	cmp    $0x190,%eax
  403cda:	7f e4                	jg     403cc0 <render_tank+0x210>
  403cdc:	42 8d 14 33          	lea    (%rbx,%r14,1),%edx
  403ce0:	44 89 fe             	mov    %r15d,%esi
  403ce3:	41 83 ee 01          	sub    $0x1,%r14d
  403ce7:	e8 24 e5 ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  403cec:	48 8b 3d 45 da 01 00 	mov    0x1da45(%rip),%rdi        # 421738 <renderer>
  403cf3:	41 83 fe ec          	cmp    $0xffffffec,%r14d
  403cf7:	75 d1                	jne    403cca <render_tank+0x21a>
  403cf9:	41 83 ed 01          	sub    $0x1,%r13d
  403cfd:	41 83 fd ec          	cmp    $0xffffffec,%r13d
  403d01:	75 a5                	jne    403ca8 <render_tank+0x1f8>
  403d03:	b9 40 00 00 00       	mov    $0x40,%ecx
  403d08:	ba 40 00 00 00       	mov    $0x40,%edx
  403d0d:	be 40 00 00 00       	mov    $0x40,%esi
  403d12:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403d18:	e8 d3 e5 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403d1d:	8d 4b c8             	lea    -0x38(%rbx),%ecx
  403d20:	48 8d 75 0e          	lea    0xe(%rbp),%rsi
  403d24:	44 89 e2             	mov    %r12d,%edx
  403d27:	48 8b 3d ba 07 01 00 	mov    0x107ba(%rip),%rdi        # 4144e8 <font_16px>
  403d2e:	48 83 c4 48          	add    $0x48,%rsp
  403d32:	5b                   	pop    %rbx
  403d33:	5d                   	pop    %rbp
  403d34:	41 5c                	pop    %r12
  403d36:	41 5d                	pop    %r13
  403d38:	41 5e                	pop    %r14
  403d3a:	41 5f                	pop    %r15
  403d3c:	e9 8f fb ff ff       	jmpq   4038d0 <render_text_centred>
  403d41:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d48:	00 00 00 00 
  403d4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000403d50 <render_health_bar>:
  403d50:	f3 0f 1e fa          	endbr64 
  403d54:	41 56                	push   %r14
  403d56:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403d5a:	49 89 fe             	mov    %rdi,%r14
  403d5d:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403d63:	41 55                	push   %r13
  403d65:	31 c9                	xor    %ecx,%ecx
  403d67:	31 d2                	xor    %edx,%edx
  403d69:	31 f6                	xor    %esi,%esi
  403d6b:	41 54                	push   %r12
  403d6d:	55                   	push   %rbp
  403d6e:	53                   	push   %rbx
  403d6f:	48 83 ec 20          	sub    $0x20,%rsp
  403d73:	f3 0f 10 07          	movss  (%rdi),%xmm0
  403d77:	f3 0f 5c 05 61 c7 01 	subss  0x1c761(%rip),%xmm0        # 4204e0 <player>
  403d7e:	00 
  403d7f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403d86:	00 00 
  403d88:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  403d8d:	31 c0                	xor    %eax,%eax
  403d8f:	8b 05 8b d9 01 00    	mov    0x1d98b(%rip),%eax        # 421720 <width>
  403d95:	d1 e8                	shr    %eax
  403d97:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  403d9b:	8b 05 7f 66 00 00    	mov    0x667f(%rip),%eax        # 40a420 <height>
  403da1:	d1 e8                	shr    %eax
  403da3:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  403da7:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403dab:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  403daf:	f3 0f 2c d8          	cvttss2si %xmm0,%ebx
  403db3:	f3 0f 10 47 04       	movss  0x4(%rdi),%xmm0
  403db8:	48 8b 3d 79 d9 01 00 	mov    0x1d979(%rip),%rdi        # 421738 <renderer>
  403dbf:	f3 0f 5c 05 1d c7 01 	subss  0x1c71d(%rip),%xmm0        # 4204e4 <player+0x4>
  403dc6:	00 
  403dc7:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  403dcb:	44 8d 6b e8          	lea    -0x18(%rbx),%r13d
  403dcf:	f3 0f 2c e8          	cvttss2si %xmm0,%ebp
  403dd3:	e8 18 e5 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403dd8:	8d 7b e7             	lea    -0x19(%rbx),%edi
  403ddb:	41 b8 02 00 00 00    	mov    $0x2,%r8d
  403de1:	b9 0a 00 00 00       	mov    $0xa,%ecx
  403de6:	ba 32 00 00 00       	mov    $0x32,%edx
  403deb:	8d 75 2b             	lea    0x2b(%rbp),%esi
  403dee:	44 8d 65 2c          	lea    0x2c(%rbp),%r12d
  403df2:	e8 39 f4 ff ff       	callq  403230 <stroke_rect>
  403df7:	41 0f b6 46 0c       	movzbl 0xc(%r14),%eax
  403dfc:	84 c0                	test   %al,%al
  403dfe:	0f 88 9c 00 00 00    	js     403ea0 <render_health_bar+0x150>
  403e04:	48 8b 3d 2d d9 01 00 	mov    0x1d92d(%rip),%rdi        # 421738 <renderer>
  403e0b:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403e11:	3c 3f                	cmp    $0x3f,%al
  403e13:	77 73                	ja     403e88 <render_health_bar+0x138>
  403e15:	b9 3c 00 00 00       	mov    $0x3c,%ecx
  403e1a:	ba 3c 00 00 00       	mov    $0x3c,%edx
  403e1f:	be c2 00 00 00       	mov    $0xc2,%esi
  403e24:	e8 c7 e4 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403e29:	41 0f b6 46 0c       	movzbl 0xc(%r14),%eax
  403e2e:	ba 81 80 80 80       	mov    $0x80808081,%edx
  403e33:	48 89 e6             	mov    %rsp,%rsi
  403e36:	44 89 2c 24          	mov    %r13d,(%rsp)
  403e3a:	48 8b 3d f7 d8 01 00 	mov    0x1d8f7(%rip),%rdi        # 421738 <renderer>
  403e41:	44 89 64 24 04       	mov    %r12d,0x4(%rsp)
  403e46:	8d 04 40             	lea    (%rax,%rax,2),%eax
  403e49:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%rsp)
  403e50:	00 
  403e51:	c1 e0 04             	shl    $0x4,%eax
  403e54:	48 0f af c2          	imul   %rdx,%rax
  403e58:	48 c1 e8 27          	shr    $0x27,%rax
  403e5c:	89 44 24 08          	mov    %eax,0x8(%rsp)
  403e60:	e8 cb e2 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403e65:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  403e6a:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403e71:	00 00 
  403e73:	75 51                	jne    403ec6 <render_health_bar+0x176>
  403e75:	48 83 c4 20          	add    $0x20,%rsp
  403e79:	5b                   	pop    %rbx
  403e7a:	5d                   	pop    %rbp
  403e7b:	41 5c                	pop    %r12
  403e7d:	41 5d                	pop    %r13
  403e7f:	41 5e                	pop    %r14
  403e81:	c3                   	retq   
  403e82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403e88:	b9 2a 00 00 00       	mov    $0x2a,%ecx
  403e8d:	ba 8f 00 00 00       	mov    $0x8f,%edx
  403e92:	be c9 00 00 00       	mov    $0xc9,%esi
  403e97:	e8 54 e4 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403e9c:	eb 8b                	jmp    403e29 <render_health_bar+0xd9>
  403e9e:	66 90                	xchg   %ax,%ax
  403ea0:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403ea6:	b9 52 00 00 00       	mov    $0x52,%ecx
  403eab:	ba a8 00 00 00       	mov    $0xa8,%edx
  403eb0:	48 8b 3d 81 d8 01 00 	mov    0x1d881(%rip),%rdi        # 421738 <renderer>
  403eb7:	be 32 00 00 00       	mov    $0x32,%esi
  403ebc:	e8 2f e4 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403ec1:	e9 63 ff ff ff       	jmpq   403e29 <render_health_bar+0xd9>
  403ec6:	e8 85 e3 ff ff       	callq  402250 <__stack_chk_fail@plt>
  403ecb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000403ed0 <render_map_border>:
  403ed0:	f3 0f 1e fa          	endbr64 
  403ed4:	41 57                	push   %r15
  403ed6:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403eda:	66 0f ef d2          	pxor   %xmm2,%xmm2
  403ede:	31 c9                	xor    %ecx,%ecx
  403ee0:	41 56                	push   %r14
  403ee2:	0f 28 c2             	movaps %xmm2,%xmm0
  403ee5:	31 d2                	xor    %edx,%edx
  403ee7:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  403eed:	49 bf 92 13 00 00 0a 	movabs $0xa00001392,%r15
  403ef4:	00 00 00 
  403ef7:	41 55                	push   %r13
  403ef9:	31 f6                	xor    %esi,%esi
  403efb:	41 54                	push   %r12
  403efd:	55                   	push   %rbp
  403efe:	53                   	push   %rbx
  403eff:	48 83 ec 28          	sub    $0x28,%rsp
  403f03:	f3 0f 5c 05 d5 c5 01 	subss  0x1c5d5(%rip),%xmm0        # 4204e0 <player>
  403f0a:	00 
  403f0b:	f3 0f 5c 15 d1 c5 01 	subss  0x1c5d1(%rip),%xmm2        # 4204e4 <player+0x4>
  403f12:	00 
  403f13:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403f1a:	00 00 
  403f1c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  403f21:	31 c0                	xor    %eax,%eax
  403f23:	8b 05 f7 d7 01 00    	mov    0x1d7f7(%rip),%eax        # 421720 <width>
  403f29:	48 8b 3d 08 d8 01 00 	mov    0x1d808(%rip),%rdi        # 421738 <renderer>
  403f30:	49 89 e4             	mov    %rsp,%r12
  403f33:	d1 e8                	shr    %eax
  403f35:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  403f39:	8b 05 e1 64 00 00    	mov    0x64e1(%rip),%eax        # 40a420 <height>
  403f3f:	d1 e8                	shr    %eax
  403f41:	f3 0f 58 c8          	addss  %xmm0,%xmm1
  403f45:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403f49:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
  403f4d:	f3 0f 2c e9          	cvttss2si %xmm1,%ebp
  403f51:	f3 0f 58 c2          	addss  %xmm2,%xmm0
  403f55:	44 8d 75 fb          	lea    -0x5(%rbp),%r14d
  403f59:	81 c5 83 13 00 00    	add    $0x1383,%ebp
  403f5f:	f3 0f 2c d8          	cvttss2si %xmm0,%ebx
  403f63:	e8 88 e3 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  403f68:	48 8b 3d c9 d7 01 00 	mov    0x1d7c9(%rip),%rdi        # 421738 <renderer>
  403f6f:	4c 89 e6             	mov    %r12,%rsi
  403f72:	44 89 34 24          	mov    %r14d,(%rsp)
  403f76:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
  403f7b:	8d 43 fb             	lea    -0x5(%rbx),%eax
  403f7e:	44 8d 6b 05          	lea    0x5(%rbx),%r13d
  403f82:	81 c3 83 13 00 00    	add    $0x1383,%ebx
  403f88:	89 44 24 04          	mov    %eax,0x4(%rsp)
  403f8c:	e8 9f e1 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403f91:	48 8b 3d a0 d7 01 00 	mov    0x1d7a0(%rip),%rdi        # 421738 <renderer>
  403f98:	4c 89 e6             	mov    %r12,%rsi
  403f9b:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  403f9f:	48 bb 0a 00 00 00 7e 	movabs $0x137e0000000a,%rbx
  403fa6:	13 00 00 
  403fa9:	44 89 34 24          	mov    %r14d,(%rsp)
  403fad:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
  403fb2:	e8 79 e1 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403fb7:	48 8b 3d 7a d7 01 00 	mov    0x1d77a(%rip),%rdi        # 421738 <renderer>
  403fbe:	4c 89 e6             	mov    %r12,%rsi
  403fc1:	44 89 34 24          	mov    %r14d,(%rsp)
  403fc5:	44 89 6c 24 04       	mov    %r13d,0x4(%rsp)
  403fca:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
  403fcf:	e8 5c e1 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403fd4:	48 8b 3d 5d d7 01 00 	mov    0x1d75d(%rip),%rdi        # 421738 <renderer>
  403fdb:	4c 89 e6             	mov    %r12,%rsi
  403fde:	89 2c 24             	mov    %ebp,(%rsp)
  403fe1:	44 89 6c 24 04       	mov    %r13d,0x4(%rsp)
  403fe6:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
  403feb:	e8 40 e1 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  403ff0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  403ff5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403ffc:	00 00 
  403ffe:	75 0f                	jne    40400f <render_map_border+0x13f>
  404000:	48 83 c4 28          	add    $0x28,%rsp
  404004:	5b                   	pop    %rbx
  404005:	5d                   	pop    %rbp
  404006:	41 5c                	pop    %r12
  404008:	41 5d                	pop    %r13
  40400a:	41 5e                	pop    %r14
  40400c:	41 5f                	pop    %r15
  40400e:	c3                   	retq   
  40400f:	e8 3c e2 ff ff       	callq  402250 <__stack_chk_fail@plt>
  404014:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40401b:	00 00 00 00 
  40401f:	90                   	nop

0000000000404020 <render_map_grid>:
  404020:	f3 0f 1e fa          	endbr64 
  404024:	41 55                	push   %r13
  404026:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  40402c:	b9 c0 00 00 00       	mov    $0xc0,%ecx
  404031:	45 31 ed             	xor    %r13d,%r13d
  404034:	41 54                	push   %r12
  404036:	ba c0 00 00 00       	mov    $0xc0,%edx
  40403b:	be c0 00 00 00       	mov    $0xc0,%esi
  404040:	49 bc 01 00 00 00 88 	movabs $0x138800000001,%r12
  404047:	13 00 00 
  40404a:	55                   	push   %rbp
  40404b:	53                   	push   %rbx
  40404c:	48 8d 1d 8d c4 01 00 	lea    0x1c48d(%rip),%rbx        # 4204e0 <player>
  404053:	48 83 ec 28          	sub    $0x28,%rsp
  404057:	48 8b 3d da d6 01 00 	mov    0x1d6da(%rip),%rdi        # 421738 <renderer>
  40405e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404065:	00 00 
  404067:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40406c:	31 c0                	xor    %eax,%eax
  40406e:	48 89 e5             	mov    %rsp,%rbp
  404071:	e8 7a e2 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404076:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40407d:	00 00 00 
  404080:	66 0f ef c0          	pxor   %xmm0,%xmm0
  404084:	66 0f ef c9          	pxor   %xmm1,%xmm1
  404088:	8b 05 92 63 00 00    	mov    0x6392(%rip),%eax        # 40a420 <height>
  40408e:	f3 0f 5c 0d 4e c4 01 	subss  0x1c44e(%rip),%xmm1        # 4204e4 <player+0x4>
  404095:	00 
  404096:	8b 15 84 d6 01 00    	mov    0x1d684(%rip),%edx        # 421720 <width>
  40409c:	48 8b 3d 95 d6 01 00 	mov    0x1d695(%rip),%rdi        # 421738 <renderer>
  4040a3:	48 89 ee             	mov    %rbp,%rsi
  4040a6:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  4040ab:	d1 e8                	shr    %eax
  4040ad:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
  4040b1:	d1 ea                	shr    %edx
  4040b3:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  4040b7:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4040bb:	f3 0f 2a ca          	cvtsi2ss %edx,%xmm1
  4040bf:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  4040c3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4040c7:	f3 49 0f 2a c5       	cvtsi2ss %r13,%xmm0
  4040cc:	f3 0f 5c 03          	subss  (%rbx),%xmm0
  4040d0:	49 83 c5 32          	add    $0x32,%r13
  4040d4:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  4040d8:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4040dc:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  4040e0:	89 14 24             	mov    %edx,(%rsp)
  4040e3:	e8 48 e0 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  4040e8:	49 81 fd 88 13 00 00 	cmp    $0x1388,%r13
  4040ef:	75 8f                	jne    404080 <render_map_grid+0x60>
  4040f1:	49 bc 88 13 00 00 01 	movabs $0x100001388,%r12
  4040f8:	00 00 00 
  4040fb:	45 31 ed             	xor    %r13d,%r13d
  4040fe:	66 90                	xchg   %ax,%ax
  404100:	66 0f ef c9          	pxor   %xmm1,%xmm1
  404104:	66 0f ef c0          	pxor   %xmm0,%xmm0
  404108:	48 89 ee             	mov    %rbp,%rsi
  40410b:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  404110:	8b 05 0a 63 00 00    	mov    0x630a(%rip),%eax        # 40a420 <height>
  404116:	f3 49 0f 2a c5       	cvtsi2ss %r13,%xmm0
  40411b:	f3 0f 5c 05 c1 c3 01 	subss  0x1c3c1(%rip),%xmm0        # 4204e4 <player+0x4>
  404122:	00 
  404123:	49 83 c5 32          	add    $0x32,%r13
  404127:	48 8b 3d 0a d6 01 00 	mov    0x1d60a(%rip),%rdi        # 421738 <renderer>
  40412e:	d1 e8                	shr    %eax
  404130:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  404134:	8b 05 e6 d5 01 00    	mov    0x1d5e6(%rip),%eax        # 421720 <width>
  40413a:	d1 e8                	shr    %eax
  40413c:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  404140:	66 0f ef c9          	pxor   %xmm1,%xmm1
  404144:	f3 0f 5c 0b          	subss  (%rbx),%xmm1
  404148:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  40414c:	66 0f ef c0          	pxor   %xmm0,%xmm0
  404150:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
  404154:	89 54 24 04          	mov    %edx,0x4(%rsp)
  404158:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  40415c:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  404160:	89 04 24             	mov    %eax,(%rsp)
  404163:	e8 c8 df ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  404168:	49 81 fd 88 13 00 00 	cmp    $0x1388,%r13
  40416f:	75 8f                	jne    404100 <render_map_grid+0xe0>
  404171:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  404176:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40417d:	00 00 
  40417f:	75 0b                	jne    40418c <render_map_grid+0x16c>
  404181:	48 83 c4 28          	add    $0x28,%rsp
  404185:	5b                   	pop    %rbx
  404186:	5d                   	pop    %rbp
  404187:	41 5c                	pop    %r12
  404189:	41 5d                	pop    %r13
  40418b:	c3                   	retq   
  40418c:	e8 bf e0 ff ff       	callq  402250 <__stack_chk_fail@plt>
  404191:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404198:	00 00 00 00 
  40419c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004041a0 <render_bullets>:
  4041a0:	f3 0f 1e fa          	endbr64 
  4041a4:	48 83 3d 54 62 00 00 	cmpq   $0x0,0x6254(%rip)        # 40a400 <n_bullets>
  4041ab:	00 
  4041ac:	0f 84 7e 01 00 00    	je     404330 <render_bullets+0x190>
  4041b2:	41 57                	push   %r15
  4041b4:	41 56                	push   %r14
  4041b6:	41 55                	push   %r13
  4041b8:	45 31 ed             	xor    %r13d,%r13d
  4041bb:	41 54                	push   %r12
  4041bd:	45 31 e4             	xor    %r12d,%r12d
  4041c0:	55                   	push   %rbp
  4041c1:	53                   	push   %rbx
  4041c2:	48 83 ec 28          	sub    $0x28,%rsp
  4041c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4041cd:	00 00 00 
  4041d0:	4c 8b 35 f9 61 00 00 	mov    0x61f9(%rip),%r14        # 40a3d0 <bullets>
  4041d7:	48 8d 05 02 c3 01 00 	lea    0x1c302(%rip),%rax        # 4204e0 <player>
  4041de:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4041e2:	48 8b 3d 4f d5 01 00 	mov    0x1d54f(%rip),%rdi        # 421738 <renderer>
  4041e9:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  4041ef:	4d 01 ee             	add    %r13,%r14
  4041f2:	f3 41 0f 10 46 0c    	movss  0xc(%r14),%xmm0
  4041f8:	f3 0f 5c 00          	subss  (%rax),%xmm0
  4041fc:	8b 05 1e d5 01 00    	mov    0x1d51e(%rip),%eax        # 421720 <width>
  404202:	d1 e8                	shr    %eax
  404204:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  404208:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  40420c:	66 0f ef c9          	pxor   %xmm1,%xmm1
  404210:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  404214:	f3 41 0f 10 46 10    	movss  0x10(%r14),%xmm0
  40421a:	f3 0f 5c 05 c2 c2 01 	subss  0x1c2c2(%rip),%xmm0        # 4204e4 <player+0x4>
  404221:	00 
  404222:	89 44 24 14          	mov    %eax,0x14(%rsp)
  404226:	8b 05 f4 61 00 00    	mov    0x61f4(%rip),%eax        # 40a420 <height>
  40422c:	d1 e8                	shr    %eax
  40422e:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  404232:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  404236:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  40423a:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40423e:	8b 05 cc c2 01 00    	mov    0x1c2cc(%rip),%eax        # 420510 <client_id>
  404244:	41 39 46 20          	cmp    %eax,0x20(%r14)
  404248:	0f 84 c2 00 00 00    	je     404310 <render_bullets+0x170>
  40424e:	b9 78 00 00 00       	mov    $0x78,%ecx
  404253:	ba 78 00 00 00       	mov    $0x78,%edx
  404258:	be ff 00 00 00       	mov    $0xff,%esi
  40425d:	e8 8e e0 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404262:	45 0f b6 7e 1c       	movzbl 0x1c(%r14),%r15d
  404267:	44 89 f8             	mov    %r15d,%eax
  40426a:	44 89 fb             	mov    %r15d,%ebx
  40426d:	45 89 fe             	mov    %r15d,%r14d
  404270:	41 0f af c7          	imul   %r15d,%eax
  404274:	f7 db                	neg    %ebx
  404276:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40427a:	45 85 ff             	test   %r15d,%r15d
  40427d:	74 64                	je     4042e3 <render_bullets+0x143>
  40427f:	90                   	nop
  404280:	44 89 f0             	mov    %r14d,%eax
  404283:	44 89 f9             	mov    %r15d,%ecx
  404286:	41 0f af c6          	imul   %r14d,%eax
  40428a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40428e:	8b 44 24 14          	mov    0x14(%rsp),%eax
  404292:	42 8d 2c 30          	lea    (%rax,%r14,1),%ebp
  404296:	eb 0f                	jmp    4042a7 <render_bullets+0x107>
  404298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40429f:	00 
  4042a0:	83 e9 01             	sub    $0x1,%ecx
  4042a3:	39 d9                	cmp    %ebx,%ecx
  4042a5:	74 33                	je     4042da <render_bullets+0x13a>
  4042a7:	89 c8                	mov    %ecx,%eax
  4042a9:	0f af c1             	imul   %ecx,%eax
  4042ac:	03 44 24 0c          	add    0xc(%rsp),%eax
  4042b0:	39 44 24 1c          	cmp    %eax,0x1c(%rsp)
  4042b4:	7c ea                	jl     4042a0 <render_bullets+0x100>
  4042b6:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4042ba:	48 8b 3d 77 d4 01 00 	mov    0x1d477(%rip),%rdi        # 421738 <renderer>
  4042c1:	89 ee                	mov    %ebp,%esi
  4042c3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
  4042c7:	8d 14 08             	lea    (%rax,%rcx,1),%edx
  4042ca:	e8 41 df ff ff       	callq  402210 <SDL_RenderDrawPoint@plt>
  4042cf:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
  4042d3:	83 e9 01             	sub    $0x1,%ecx
  4042d6:	39 d9                	cmp    %ebx,%ecx
  4042d8:	75 cd                	jne    4042a7 <render_bullets+0x107>
  4042da:	41 83 ee 01          	sub    $0x1,%r14d
  4042de:	44 39 f3             	cmp    %r14d,%ebx
  4042e1:	75 9d                	jne    404280 <render_bullets+0xe0>
  4042e3:	49 83 c4 01          	add    $0x1,%r12
  4042e7:	49 83 c5 28          	add    $0x28,%r13
  4042eb:	4c 39 25 0e 61 00 00 	cmp    %r12,0x610e(%rip)        # 40a400 <n_bullets>
  4042f2:	0f 87 d8 fe ff ff    	ja     4041d0 <render_bullets+0x30>
  4042f8:	48 83 c4 28          	add    $0x28,%rsp
  4042fc:	5b                   	pop    %rbx
  4042fd:	5d                   	pop    %rbp
  4042fe:	41 5c                	pop    %r12
  404300:	41 5d                	pop    %r13
  404302:	41 5e                	pop    %r14
  404304:	41 5f                	pop    %r15
  404306:	c3                   	retq   
  404307:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40430e:	00 00 
  404310:	b9 ff 00 00 00       	mov    $0xff,%ecx
  404315:	ba 78 00 00 00       	mov    $0x78,%edx
  40431a:	be 78 00 00 00       	mov    $0x78,%esi
  40431f:	e8 cc df ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404324:	e9 39 ff ff ff       	jmpq   404262 <render_bullets+0xc2>
  404329:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404330:	c3                   	retq   
  404331:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404338:	00 00 00 00 
  40433c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000404340 <send_bullet>:
  404340:	f3 0f 1e fa          	endbr64 
  404344:	41 54                	push   %r12
  404346:	be 02 00 00 00       	mov    $0x2,%esi
  40434b:	55                   	push   %rbp
  40434c:	48 83 ec 38          	sub    $0x38,%rsp
  404350:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  404355:	f3 0f 11 54 24 04    	movss  %xmm2,0x4(%rsp)
  40435b:	4c 8d 64 24 1b       	lea    0x1b(%rsp),%r12
  404360:	f3 0f 11 4c 24 08    	movss  %xmm1,0x8(%rsp)
  404366:	48 89 ef             	mov    %rbp,%rdi
  404369:	f3 0f 11 44 24 0c    	movss  %xmm0,0xc(%rsp)
  40436f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404376:	00 00 
  404378:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40437d:	31 c0                	xor    %eax,%eax
  40437f:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
  404384:	e8 c1 e1 ff ff       	callq  40254a <write_u8>
  404389:	f3 0f 10 44 24 0c    	movss  0xc(%rsp),%xmm0
  40438f:	48 89 ef             	mov    %rbp,%rdi
  404392:	e8 de e1 ff ff       	callq  402575 <write_f32>
  404397:	f3 0f 10 4c 24 08    	movss  0x8(%rsp),%xmm1
  40439d:	48 89 ef             	mov    %rbp,%rdi
  4043a0:	0f 28 c1             	movaps %xmm1,%xmm0
  4043a3:	e8 cd e1 ff ff       	callq  402575 <write_f32>
  4043a8:	f3 0f 10 54 24 04    	movss  0x4(%rsp),%xmm2
  4043ae:	48 89 ef             	mov    %rbp,%rdi
  4043b1:	0f 28 c2             	movaps %xmm2,%xmm0
  4043b4:	e8 bc e1 ff ff       	callq  402575 <write_f32>
  4043b9:	8b 3d 69 60 00 00    	mov    0x6069(%rip),%edi        # 40a428 <socket_fd>
  4043bf:	ba 0d 00 00 00       	mov    $0xd,%edx
  4043c4:	4c 89 e6             	mov    %r12,%rsi
  4043c7:	e8 04 dd ff ff       	callq  4020d0 <write@plt>
  4043cc:	48 85 c0             	test   %rax,%rax
  4043cf:	78 1f                	js     4043f0 <send_bullet+0xb0>
  4043d1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4043d6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4043dd:	00 00 
  4043df:	75 3f                	jne    404420 <send_bullet+0xe0>
  4043e1:	48 83 c4 38          	add    $0x38,%rsp
  4043e5:	5d                   	pop    %rbp
  4043e6:	41 5c                	pop    %r12
  4043e8:	c3                   	retq   
  4043e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4043f0:	e8 5b dc ff ff       	callq  402050 <__errno_location@plt>
  4043f5:	8b 38                	mov    (%rax),%edi
  4043f7:	e8 c4 dc ff ff       	callq  4020c0 <strerror@plt>
  4043fc:	b9 0d 00 00 00       	mov    $0xd,%ecx
  404401:	be 01 00 00 00       	mov    $0x1,%esi
  404406:	48 8b 3d d3 5f 00 00 	mov    0x5fd3(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  40440d:	49 89 c0             	mov    %rax,%r8
  404410:	48 8d 15 b9 2d 00 00 	lea    0x2db9(%rip),%rdx        # 4071d0 <_IO_stdin_used+0x1d0>
  404417:	31 c0                	xor    %eax,%eax
  404419:	e8 22 df ff ff       	callq  402340 <__fprintf_chk@plt>
  40441e:	eb b1                	jmp    4043d1 <send_bullet+0x91>
  404420:	e8 2b de ff ff       	callq  402250 <__stack_chk_fail@plt>
  404425:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40442c:	00 00 00 00 

0000000000404430 <translate>:
  404430:	f3 0f 1e fa          	endbr64 
  404434:	8b 05 e6 5f 00 00    	mov    0x5fe6(%rip),%eax        # 40a420 <height>
  40443a:	66 0f ef d2          	pxor   %xmm2,%xmm2
  40443e:	f3 0f 5c 0d 9e c0 01 	subss  0x1c09e(%rip),%xmm1        # 4204e4 <player+0x4>
  404445:	00 
  404446:	8b 15 d4 d2 01 00    	mov    0x1d2d4(%rip),%edx        # 421720 <width>
  40444c:	f3 0f 5c 05 8c c0 01 	subss  0x1c08c(%rip),%xmm0        # 4204e0 <player>
  404453:	00 
  404454:	d1 e8                	shr    %eax
  404456:	f3 0f 2a d0          	cvtsi2ss %eax,%xmm2
  40445a:	d1 ea                	shr    %edx
  40445c:	f3 0f 58 d1          	addss  %xmm1,%xmm2
  404460:	66 0f ef c9          	pxor   %xmm1,%xmm1
  404464:	f3 0f 2a ca          	cvtsi2ss %edx,%xmm1
  404468:	f3 0f 2c c2          	cvttss2si %xmm2,%eax
  40446c:	f3 0f 58 c8          	addss  %xmm0,%xmm1
  404470:	48 89 c1             	mov    %rax,%rcx
  404473:	f3 0f 2c d1          	cvttss2si %xmm1,%edx
  404477:	48 c1 e1 20          	shl    $0x20,%rcx
  40447b:	89 d0                	mov    %edx,%eax
  40447d:	48 09 c8             	or     %rcx,%rax
  404480:	c3                   	retq   
  404481:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404488:	00 00 00 00 
  40448c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000404490 <untranslate>:
  404490:	f3 0f 1e fa          	endbr64 
  404494:	8b 05 86 5f 00 00    	mov    0x5f86(%rip),%eax        # 40a420 <height>
  40449a:	66 0f ef c9          	pxor   %xmm1,%xmm1
  40449e:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4044a2:	8b 15 78 d2 01 00    	mov    0x1d278(%rip),%edx        # 421720 <width>
  4044a8:	f3 0f 2a c6          	cvtsi2ss %esi,%xmm0
  4044ac:	f3 0f 58 05 30 c0 01 	addss  0x1c030(%rip),%xmm0        # 4204e4 <player+0x4>
  4044b3:	00 
  4044b4:	d1 e8                	shr    %eax
  4044b6:	d1 ea                	shr    %edx
  4044b8:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  4044bc:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  4044c0:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4044c4:	f3 0f 2a ca          	cvtsi2ss %edx,%xmm1
  4044c8:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  4044cc:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4044d0:	f3 0f 2a c7          	cvtsi2ss %edi,%xmm0
  4044d4:	f3 0f 58 05 04 c0 01 	addss  0x1c004(%rip),%xmm0        # 4204e0 <player>
  4044db:	00 
  4044dc:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  4044e0:	48 89 c1             	mov    %rax,%rcx
  4044e3:	48 c1 e1 20          	shl    $0x20,%rcx
  4044e7:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  4044eb:	89 d0                	mov    %edx,%eax
  4044ed:	48 09 c8             	or     %rcx,%rax
  4044f0:	c3                   	retq   
  4044f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044f8:	00 00 00 00 
  4044fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000404500 <get_player_speed>:
  404500:	f3 0f 1e fa          	endbr64 
  404504:	80 3d ed 5e 00 00 00 	cmpb   $0x0,0x5eed(%rip)        # 40a3f8 <super_speed_enabled>
  40450b:	f3 0f 10 05 a9 2f 00 	movss  0x2fa9(%rip),%xmm0        # 4074bc <_IO_stdin_used+0x4bc>
  404512:	00 
  404513:	75 08                	jne    40451d <get_player_speed+0x1d>
  404515:	f3 0f 10 05 a3 2f 00 	movss  0x2fa3(%rip),%xmm0        # 4074c0 <_IO_stdin_used+0x4c0>
  40451c:	00 
  40451d:	c3                   	retq   
  40451e:	66 90                	xchg   %ax,%ax

0000000000404520 <update_player>:
  404520:	f3 0f 1e fa          	endbr64 
  404524:	80 3d c1 bf 01 00 00 	cmpb   $0x0,0x1bfc1(%rip)        # 4204ec <player+0xc>
  40452b:	0f 84 37 01 00 00    	je     404668 <update_player+0x148>
  404531:	41 89 f8             	mov    %edi,%r8d
  404534:	41 89 f1             	mov    %esi,%r9d
  404537:	48 83 ec 08          	sub    $0x8,%rsp
  40453b:	41 c0 f8 07          	sar    $0x7,%r8b
  40453f:	41 c0 f9 07          	sar    $0x7,%r9b
  404543:	44 89 c0             	mov    %r8d,%eax
  404546:	31 f8                	xor    %edi,%eax
  404548:	44 29 c0             	sub    %r8d,%eax
  40454b:	44 0f b6 c0          	movzbl %al,%r8d
  40454f:	44 89 c8             	mov    %r9d,%eax
  404552:	31 f0                	xor    %esi,%eax
  404554:	44 29 c8             	sub    %r9d,%eax
  404557:	0f b6 c0             	movzbl %al,%eax
  40455a:	44 01 c0             	add    %r8d,%eax
  40455d:	83 f8 02             	cmp    $0x2,%eax
  404560:	0f 84 ea 00 00 00    	je     404650 <update_player+0x130>
  404566:	f3 0f 10 05 52 2f 00 	movss  0x2f52(%rip),%xmm0        # 4074c0 <_IO_stdin_used+0x4c0>
  40456d:	00 
  40456e:	f3 0f 10 15 46 2f 00 	movss  0x2f46(%rip),%xmm2        # 4074bc <_IO_stdin_used+0x4bc>
  404575:	00 
  404576:	80 3d 7b 5e 00 00 00 	cmpb   $0x0,0x5e7b(%rip)        # 40a3f8 <super_speed_enabled>
  40457d:	75 03                	jne    404582 <update_player+0x62>
  40457f:	0f 28 d0             	movaps %xmm0,%xmm2
  404582:	40 0f be ff          	movsbl %dil,%edi
  404586:	66 0f ef c9          	pxor   %xmm1,%xmm1
  40458a:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40458e:	40 0f be f6          	movsbl %sil,%esi
  404592:	f3 0f 2a cf          	cvtsi2ss %edi,%xmm1
  404596:	f3 0f 10 1d 6a 5e 00 	movss  0x5e6a(%rip),%xmm3        # 40a408 <dt>
  40459d:	00 
  40459e:	f3 0f 2a c6          	cvtsi2ss %esi,%xmm0
  4045a2:	f3 0f 59 ca          	mulss  %xmm2,%xmm1
  4045a6:	f3 0f 59 c2          	mulss  %xmm2,%xmm0
  4045aa:	66 0f ef d2          	pxor   %xmm2,%xmm2
  4045ae:	f3 0f 59 cb          	mulss  %xmm3,%xmm1
  4045b2:	f3 0f 58 0d 26 bf 01 	addss  0x1bf26(%rip),%xmm1        # 4204e0 <player>
  4045b9:	00 
  4045ba:	f3 0f 59 c3          	mulss  %xmm3,%xmm0
  4045be:	f3 0f 58 05 1e bf 01 	addss  0x1bf1e(%rip),%xmm0        # 4204e4 <player+0x4>
  4045c5:	00 
  4045c6:	0f 2f d1             	comiss %xmm1,%xmm2
  4045c9:	f3 0f 11 0d 0f bf 01 	movss  %xmm1,0x1bf0f(%rip)        # 4204e0 <player>
  4045d0:	00 
  4045d1:	f3 0f 11 05 0b bf 01 	movss  %xmm0,0x1bf0b(%rip)        # 4204e4 <player+0x4>
  4045d8:	00 
  4045d9:	0f 87 a1 00 00 00    	ja     404680 <update_player+0x160>
  4045df:	0f 2f 0d e6 2e 00 00 	comiss 0x2ee6(%rip),%xmm1        # 4074cc <_IO_stdin_used+0x4cc>
  4045e6:	76 0a                	jbe    4045f2 <update_player+0xd2>
  4045e8:	c7 05 ee be 01 00 00 	movl   $0x459c4000,0x1beee(%rip)        # 4204e0 <player>
  4045ef:	40 9c 45 
  4045f2:	0f 2f d0             	comiss %xmm0,%xmm2
  4045f5:	77 79                	ja     404670 <update_player+0x150>
  4045f7:	0f 2f 05 ce 2e 00 00 	comiss 0x2ece(%rip),%xmm0        # 4074cc <_IO_stdin_used+0x4cc>
  4045fe:	76 0a                	jbe    40460a <update_player+0xea>
  404600:	c7 05 da be 01 00 00 	movl   $0x459c4000,0x1beda(%rip)        # 4204e4 <player+0x4>
  404607:	40 9c 45 
  40460a:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40460e:	66 0f ef c9          	pxor   %xmm1,%xmm1
  404612:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
  404616:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
  40461a:	e8 61 da ff ff       	callq  402080 <atan2@plt>
  40461f:	48 8d 3d ba be 01 00 	lea    0x1beba(%rip),%rdi        # 4204e0 <player>
  404626:	f2 0f 5a c0          	cvtsd2ss %xmm0,%xmm0
  40462a:	f3 0f 11 05 b6 be 01 	movss  %xmm0,0x1beb6(%rip)        # 4204e8 <player+0x8>
  404631:	00 
  404632:	e8 79 f4 ff ff       	callq  403ab0 <render_tank>
  404637:	48 8d 3d a2 be 01 00 	lea    0x1bea2(%rip),%rdi        # 4204e0 <player>
  40463e:	48 83 c4 08          	add    $0x8,%rsp
  404642:	e9 09 f7 ff ff       	jmpq   403d50 <render_health_bar>
  404647:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40464e:	00 00 
  404650:	f3 0f 10 05 6c 2e 00 	movss  0x2e6c(%rip),%xmm0        # 4074c4 <_IO_stdin_used+0x4c4>
  404657:	00 
  404658:	f3 0f 10 15 68 2e 00 	movss  0x2e68(%rip),%xmm2        # 4074c8 <_IO_stdin_used+0x4c8>
  40465f:	00 
  404660:	e9 11 ff ff ff       	jmpq   404576 <update_player+0x56>
  404665:	0f 1f 00             	nopl   (%rax)
  404668:	c3                   	retq   
  404669:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404670:	c7 05 6a be 01 00 00 	movl   $0x0,0x1be6a(%rip)        # 4204e4 <player+0x4>
  404677:	00 00 00 
  40467a:	eb 8e                	jmp    40460a <update_player+0xea>
  40467c:	0f 1f 40 00          	nopl   0x0(%rax)
  404680:	c7 05 56 be 01 00 00 	movl   $0x0,0x1be56(%rip)        # 4204e0 <player>
  404687:	00 00 00 
  40468a:	e9 63 ff ff ff       	jmpq   4045f2 <update_player+0xd2>
  40468f:	90                   	nop

0000000000404690 <send_position_tick>:
  404690:	f3 0f 1e fa          	endbr64 
  404694:	41 54                	push   %r12
  404696:	be 01 00 00 00       	mov    $0x1,%esi
  40469b:	55                   	push   %rbp
  40469c:	48 83 ec 28          	sub    $0x28,%rsp
  4046a0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4046a7:	00 00 
  4046a9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4046ae:	31 c0                	xor    %eax,%eax
  4046b0:	48 89 e5             	mov    %rsp,%rbp
  4046b3:	4c 8d 64 24 0b       	lea    0xb(%rsp),%r12
  4046b8:	48 89 ef             	mov    %rbp,%rdi
  4046bb:	4c 89 24 24          	mov    %r12,(%rsp)
  4046bf:	e8 86 de ff ff       	callq  40254a <write_u8>
  4046c4:	f3 0f 10 05 14 be 01 	movss  0x1be14(%rip),%xmm0        # 4204e0 <player>
  4046cb:	00 
  4046cc:	48 89 ef             	mov    %rbp,%rdi
  4046cf:	e8 a1 de ff ff       	callq  402575 <write_f32>
  4046d4:	f3 0f 10 05 08 be 01 	movss  0x1be08(%rip),%xmm0        # 4204e4 <player+0x4>
  4046db:	00 
  4046dc:	48 89 ef             	mov    %rbp,%rdi
  4046df:	e8 91 de ff ff       	callq  402575 <write_f32>
  4046e4:	f3 0f 10 05 fc bd 01 	movss  0x1bdfc(%rip),%xmm0        # 4204e8 <player+0x8>
  4046eb:	00 
  4046ec:	48 89 ef             	mov    %rbp,%rdi
  4046ef:	e8 81 de ff ff       	callq  402575 <write_f32>
  4046f4:	8b 3d 2e 5d 00 00    	mov    0x5d2e(%rip),%edi        # 40a428 <socket_fd>
  4046fa:	ba 0d 00 00 00       	mov    $0xd,%edx
  4046ff:	4c 89 e6             	mov    %r12,%rsi
  404702:	e8 c9 d9 ff ff       	callq  4020d0 <write@plt>
  404707:	48 85 c0             	test   %rax,%rax
  40470a:	78 1c                	js     404728 <send_position_tick+0x98>
  40470c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  404711:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  404718:	00 00 
  40471a:	75 3c                	jne    404758 <send_position_tick+0xc8>
  40471c:	48 83 c4 28          	add    $0x28,%rsp
  404720:	5d                   	pop    %rbp
  404721:	41 5c                	pop    %r12
  404723:	c3                   	retq   
  404724:	0f 1f 40 00          	nopl   0x0(%rax)
  404728:	e8 23 d9 ff ff       	callq  402050 <__errno_location@plt>
  40472d:	8b 38                	mov    (%rax),%edi
  40472f:	e8 8c d9 ff ff       	callq  4020c0 <strerror@plt>
  404734:	b9 0d 00 00 00       	mov    $0xd,%ecx
  404739:	be 01 00 00 00       	mov    $0x1,%esi
  40473e:	48 8b 3d 9b 5c 00 00 	mov    0x5c9b(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  404745:	49 89 c0             	mov    %rax,%r8
  404748:	48 8d 15 81 2a 00 00 	lea    0x2a81(%rip),%rdx        # 4071d0 <_IO_stdin_used+0x1d0>
  40474f:	31 c0                	xor    %eax,%eax
  404751:	e8 ea db ff ff       	callq  402340 <__fprintf_chk@plt>
  404756:	eb b4                	jmp    40470c <send_position_tick+0x7c>
  404758:	e8 f3 da ff ff       	callq  402250 <__stack_chk_fail@plt>
  40475d:	0f 1f 00             	nopl   (%rax)

0000000000404760 <delete_other_players>:
  404760:	f3 0f 1e fa          	endbr64 
  404764:	c6 05 8e 5c 00 00 00 	movb   $0x0,0x5c8e(%rip)        # 40a3f9 <num_other_players>
  40476b:	c3                   	retq   
  40476c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000404770 <add_other_player>:
  404770:	f3 0f 1e fa          	endbr64 
  404774:	0f b6 05 7e 5c 00 00 	movzbl 0x5c7e(%rip),%eax        # 40a3f9 <num_other_players>
  40477b:	53                   	push   %rbx
  40477c:	41 89 f0             	mov    %esi,%r8d
  40477f:	48 89 ce             	mov    %rcx,%rsi
  404782:	48 8d 0d 77 9d 01 00 	lea    0x19d77(%rip),%rcx        # 41e500 <other_players>
  404789:	48 89 c3             	mov    %rax,%rbx
  40478c:	48 c1 e0 05          	shl    $0x5,%rax
  404790:	48 01 c8             	add    %rcx,%rax
  404793:	40 88 78 0c          	mov    %dil,0xc(%rax)
  404797:	88 50 0d             	mov    %dl,0xd(%rax)
  40479a:	0f b6 d2             	movzbl %dl,%edx
  40479d:	66 44 89 40 1e       	mov    %r8w,0x1e(%rax)
  4047a2:	f3 0f 11 00          	movss  %xmm0,(%rax)
  4047a6:	f3 0f 11 48 04       	movss  %xmm1,0x4(%rax)
  4047ab:	f3 0f 11 50 08       	movss  %xmm2,0x8(%rax)
  4047b0:	0f b6 c3             	movzbl %bl,%eax
  4047b3:	83 c3 01             	add    $0x1,%ebx
  4047b6:	48 c1 e0 05          	shl    $0x5,%rax
  4047ba:	48 8d 7c 01 0e       	lea    0xe(%rcx,%rax,1),%rdi
  4047bf:	b9 0f 00 00 00       	mov    $0xf,%ecx
  4047c4:	e8 97 d9 ff ff       	callq  402160 <__strncpy_chk@plt>
  4047c9:	88 1d 2a 5c 00 00    	mov    %bl,0x5c2a(%rip)        # 40a3f9 <num_other_players>
  4047cf:	5b                   	pop    %rbx
  4047d0:	c3                   	retq   
  4047d1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047d8:	00 00 00 00 
  4047dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004047e0 <update_other_players>:
  4047e0:	f3 0f 1e fa          	endbr64 
  4047e4:	80 3d 0e 5c 00 00 00 	cmpb   $0x0,0x5c0e(%rip)        # 40a3f9 <num_other_players>
  4047eb:	74 43                	je     404830 <update_other_players+0x50>
  4047ed:	41 54                	push   %r12
  4047ef:	4c 8d 25 0a 9d 01 00 	lea    0x19d0a(%rip),%r12        # 41e500 <other_players>
  4047f6:	55                   	push   %rbp
  4047f7:	53                   	push   %rbx
  4047f8:	31 db                	xor    %ebx,%ebx
  4047fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  404800:	0f b6 eb             	movzbl %bl,%ebp
  404803:	83 c3 01             	add    $0x1,%ebx
  404806:	48 c1 e5 05          	shl    $0x5,%rbp
  40480a:	4c 01 e5             	add    %r12,%rbp
  40480d:	48 89 ef             	mov    %rbp,%rdi
  404810:	e8 9b f2 ff ff       	callq  403ab0 <render_tank>
  404815:	48 89 ef             	mov    %rbp,%rdi
  404818:	e8 33 f5 ff ff       	callq  403d50 <render_health_bar>
  40481d:	38 1d d6 5b 00 00    	cmp    %bl,0x5bd6(%rip)        # 40a3f9 <num_other_players>
  404823:	77 db                	ja     404800 <update_other_players+0x20>
  404825:	5b                   	pop    %rbx
  404826:	5d                   	pop    %rbp
  404827:	41 5c                	pop    %r12
  404829:	c3                   	retq   
  40482a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  404830:	c3                   	retq   
  404831:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404838:	00 00 00 00 
  40483c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000404840 <render_drops>:
  404840:	f3 0f 1e fa          	endbr64 
  404844:	41 57                	push   %r15
  404846:	41 56                	push   %r14
  404848:	41 55                	push   %r13
  40484a:	41 54                	push   %r12
  40484c:	4c 8d 25 95 59 00 00 	lea    0x5995(%rip),%r12        # 40a1e8 <drops>
  404853:	55                   	push   %rbp
  404854:	53                   	push   %rbx
  404855:	48 83 ec 28          	sub    $0x28,%rsp
  404859:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404860:	00 00 
  404862:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  404867:	31 c0                	xor    %eax,%eax
  404869:	48 8b 05 70 59 00 00 	mov    0x5970(%rip),%rax        # 40a1e0 <n_drops>
  404870:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
  404874:	49 8d 04 c4          	lea    (%r12,%rax,8),%rax
  404878:	4c 39 e0             	cmp    %r12,%rax
  40487b:	0f 86 1f 01 00 00    	jbe    4049a0 <render_drops+0x160>
  404881:	49 bd 1e 00 00 00 1e 	movabs $0x1e0000001e,%r13
  404888:	00 00 00 
  40488b:	4d 89 e6             	mov    %r12,%r14
  40488e:	e9 be 00 00 00       	jmpq   404951 <render_drops+0x111>
  404893:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  404898:	48 8b 35 79 ce 01 00 	mov    0x1ce79(%rip),%rsi        # 421718 <drop_fast_shooting>
  40489f:	85 c9                	test   %ecx,%ecx
  4048a1:	48 0f 44 35 37 fc 00 	cmove  0xfc37(%rip),%rsi        # 4144e0 <drop_heal_pack>
  4048a8:	00 
  4048a9:	8b 05 71 5b 00 00    	mov    0x5b71(%rip),%eax        # 40a420 <height>
  4048af:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4048b3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4048b7:	48 8b 3d 7a ce 01 00 	mov    0x1ce7a(%rip),%rdi        # 421738 <renderer>
  4048be:	f3 41 0f 2a 46 04    	cvtsi2ssl 0x4(%r14),%xmm0
  4048c4:	f3 0f 5c 05 18 bc 01 	subss  0x1bc18(%rip),%xmm0        # 4204e4 <player+0x4>
  4048cb:	00 
  4048cc:	d1 e8                	shr    %eax
  4048ce:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  4048d2:	8b 05 48 ce 01 00    	mov    0x1ce48(%rip),%eax        # 421720 <width>
  4048d8:	d1 e8                	shr    %eax
  4048da:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  4048de:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4048e2:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
  4048e6:	f3 0f 2c d8          	cvttss2si %xmm0,%ebx
  4048ea:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4048ee:	f3 41 0f 2a 06       	cvtsi2ssl (%r14),%xmm0
  4048f3:	f3 0f 5c 05 e5 bb 01 	subss  0x1bbe5(%rip),%xmm0        # 4204e0 <player>
  4048fa:	00 
  4048fb:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  4048ff:	83 eb 0f             	sub    $0xf,%ebx
  404902:	f3 0f 2c e8          	cvttss2si %xmm0,%ebp
  404906:	e8 b5 d9 ff ff       	callq  4022c0 <SDL_CreateTextureFromSurface@plt>
  40490b:	48 89 e1             	mov    %rsp,%rcx
  40490e:	31 d2                	xor    %edx,%edx
  404910:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  404914:	48 8b 3d 1d ce 01 00 	mov    0x1ce1d(%rip),%rdi        # 421738 <renderer>
  40491b:	49 89 c7             	mov    %rax,%r15
  40491e:	48 89 c6             	mov    %rax,%rsi
  404921:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
  404926:	83 ed 0f             	sub    $0xf,%ebp
  404929:	89 2c 24             	mov    %ebp,(%rsp)
  40492c:	e8 2f d9 ff ff       	callq  402260 <SDL_RenderCopy@plt>
  404931:	4c 89 ff             	mov    %r15,%rdi
  404934:	e8 77 d8 ff ff       	callq  4021b0 <SDL_DestroyTexture@plt>
  404939:	48 8b 05 a0 58 00 00 	mov    0x58a0(%rip),%rax        # 40a1e0 <n_drops>
  404940:	49 83 c6 18          	add    $0x18,%r14
  404944:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
  404948:	49 8d 04 c4          	lea    (%r12,%rax,8),%rax
  40494c:	49 39 c6             	cmp    %rax,%r14
  40494f:	73 4f                	jae    4049a0 <render_drops+0x160>
  404951:	41 8b 4e 08          	mov    0x8(%r14),%ecx
  404955:	83 f9 02             	cmp    $0x2,%ecx
  404958:	74 36                	je     404990 <render_drops+0x150>
  40495a:	0f 86 38 ff ff ff    	jbe    404898 <render_drops+0x58>
  404960:	48 8b 35 99 bb 01 00 	mov    0x1bb99(%rip),%rsi        # 420500 <drop_super_speed>
  404967:	83 f9 03             	cmp    $0x3,%ecx
  40496a:	0f 84 39 ff ff ff    	je     4048a9 <render_drops+0x69>
  404970:	48 8b 3d 69 5a 00 00 	mov    0x5a69(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  404977:	48 8d 15 7a 27 00 00 	lea    0x277a(%rip),%rdx        # 4070f8 <_IO_stdin_used+0xf8>
  40497e:	be 01 00 00 00       	mov    $0x1,%esi
  404983:	31 c0                	xor    %eax,%eax
  404985:	e8 b6 d9 ff ff       	callq  402340 <__fprintf_chk@plt>
  40498a:	eb ad                	jmp    404939 <render_drops+0xf9>
  40498c:	0f 1f 40 00          	nopl   0x0(%rax)
  404990:	48 8b 35 d1 5a 00 00 	mov    0x5ad1(%rip),%rsi        # 40a468 <drop_big_bullets>
  404997:	e9 0d ff ff ff       	jmpq   4048a9 <render_drops+0x69>
  40499c:	0f 1f 40 00          	nopl   0x0(%rax)
  4049a0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4049a5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4049ac:	00 00 
  4049ae:	75 0f                	jne    4049bf <render_drops+0x17f>
  4049b0:	48 83 c4 28          	add    $0x28,%rsp
  4049b4:	5b                   	pop    %rbx
  4049b5:	5d                   	pop    %rbp
  4049b6:	41 5c                	pop    %r12
  4049b8:	41 5d                	pop    %r13
  4049ba:	41 5e                	pop    %r14
  4049bc:	41 5f                	pop    %r15
  4049be:	c3                   	retq   
  4049bf:	e8 8c d8 ff ff       	callq  402250 <__stack_chk_fail@plt>
  4049c4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049cb:	00 00 00 00 
  4049cf:	90                   	nop

00000000004049d0 <del_powerup>:
  4049d0:	f3 0f 1e fa          	endbr64 
  4049d4:	83 3f 03             	cmpl   $0x3,(%rdi)
  4049d7:	75 07                	jne    4049e0 <del_powerup+0x10>
  4049d9:	c6 05 18 5a 00 00 00 	movb   $0x0,0x5a18(%rip)        # 40a3f8 <super_speed_enabled>
  4049e0:	48 8b 05 09 5a 00 00 	mov    0x5a09(%rip),%rax        # 40a3f0 <n_powerups>
  4049e7:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  4049eb:	48 8d 05 8e 5a 00 00 	lea    0x5a8e(%rip),%rax        # 40a480 <powerups>
  4049f2:	48 89 35 f7 59 00 00 	mov    %rsi,0x59f7(%rip)        # 40a3f0 <n_powerups>
  4049f9:	48 c1 e6 04          	shl    $0x4,%rsi
  4049fd:	48 01 c6             	add    %rax,%rsi
  404a00:	e9 e2 de ff ff       	jmpq   4028e7 <copy_powerup>
  404a05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a0c:	00 00 00 00 

0000000000404a10 <activate_powerup>:
  404a10:	f3 0f 1e fa          	endbr64 
  404a14:	55                   	push   %rbp
  404a15:	53                   	push   %rbx
  404a16:	89 fb                	mov    %edi,%ebx
  404a18:	48 83 ec 28          	sub    $0x28,%rsp
  404a1c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404a23:	00 00 
  404a25:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  404a2a:	31 c0                	xor    %eax,%eax
  404a2c:	48 8b 05 bd 59 00 00 	mov    0x59bd(%rip),%rax        # 40a3f0 <n_powerups>
  404a33:	48 85 c0             	test   %rax,%rax
  404a36:	74 46                	je     404a7e <activate_powerup+0x6e>
  404a38:	39 3d 42 5a 00 00    	cmp    %edi,0x5a42(%rip)        # 40a480 <powerups>
  404a3e:	0f 84 95 00 00 00    	je     404ad9 <activate_powerup+0xc9>
  404a44:	48 83 f8 01          	cmp    $0x1,%rax
  404a48:	0f 86 b9 00 00 00    	jbe    404b07 <activate_powerup+0xf7>
  404a4e:	3b 3d 3c 5a 00 00    	cmp    0x5a3c(%rip),%edi        # 40a490 <powerups+0x10>
  404a54:	0f 84 b7 00 00 00    	je     404b11 <activate_powerup+0x101>
  404a5a:	48 83 f8 02          	cmp    $0x2,%rax
  404a5e:	74 1e                	je     404a7e <activate_powerup+0x6e>
  404a60:	3b 3d 3a 5a 00 00    	cmp    0x5a3a(%rip),%edi        # 40a4a0 <powerups+0x20>
  404a66:	0f 84 ac 00 00 00    	je     404b18 <activate_powerup+0x108>
  404a6c:	48 83 f8 03          	cmp    $0x3,%rax
  404a70:	74 0c                	je     404a7e <activate_powerup+0x6e>
  404a72:	39 3d 38 5a 00 00    	cmp    %edi,0x5a38(%rip)        # 40a4b0 <powerups+0x30>
  404a78:	0f 84 a1 00 00 00    	je     404b1f <activate_powerup+0x10f>
  404a7e:	48 c1 e0 04          	shl    $0x4,%rax
  404a82:	48 8d 2d f7 59 00 00 	lea    0x59f7(%rip),%rbp        # 40a480 <powerups>
  404a89:	48 89 e7             	mov    %rsp,%rdi
  404a8c:	31 f6                	xor    %esi,%esi
  404a8e:	48 01 c5             	add    %rax,%rbp
  404a91:	89 5d 00             	mov    %ebx,0x0(%rbp)
  404a94:	e8 97 d8 ff ff       	callq  402330 <gettimeofday@plt>
  404a99:	48 69 04 24 40 42 0f 	imul   $0xf4240,(%rsp),%rax
  404aa0:	00 
  404aa1:	48 03 44 24 08       	add    0x8(%rsp),%rax
  404aa6:	48 83 05 42 59 00 00 	addq   $0x1,0x5942(%rip)        # 40a3f0 <n_powerups>
  404aad:	01 
  404aae:	48 89 45 08          	mov    %rax,0x8(%rbp)
  404ab2:	83 fb 03             	cmp    $0x3,%ebx
  404ab5:	74 19                	je     404ad0 <activate_powerup+0xc0>
  404ab7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  404abc:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  404ac3:	00 00 
  404ac5:	75 5f                	jne    404b26 <activate_powerup+0x116>
  404ac7:	48 83 c4 28          	add    $0x28,%rsp
  404acb:	5b                   	pop    %rbx
  404acc:	5d                   	pop    %rbp
  404acd:	c3                   	retq   
  404ace:	66 90                	xchg   %ax,%ax
  404ad0:	c6 05 21 59 00 00 01 	movb   $0x1,0x5921(%rip)        # 40a3f8 <super_speed_enabled>
  404ad7:	eb de                	jmp    404ab7 <activate_powerup+0xa7>
  404ad9:	31 db                	xor    %ebx,%ebx
  404adb:	48 89 e7             	mov    %rsp,%rdi
  404ade:	31 f6                	xor    %esi,%esi
  404ae0:	e8 4b d8 ff ff       	callq  402330 <gettimeofday@plt>
  404ae5:	48 89 da             	mov    %rbx,%rdx
  404ae8:	48 69 04 24 40 42 0f 	imul   $0xf4240,(%rsp),%rax
  404aef:	00 
  404af0:	48 8d 0d 89 59 00 00 	lea    0x5989(%rip),%rcx        # 40a480 <powerups>
  404af7:	48 03 44 24 08       	add    0x8(%rsp),%rax
  404afc:	48 c1 e2 04          	shl    $0x4,%rdx
  404b00:	48 89 44 11 08       	mov    %rax,0x8(%rcx,%rdx,1)
  404b05:	eb b0                	jmp    404ab7 <activate_powerup+0xa7>
  404b07:	b8 01 00 00 00       	mov    $0x1,%eax
  404b0c:	e9 6d ff ff ff       	jmpq   404a7e <activate_powerup+0x6e>
  404b11:	bb 01 00 00 00       	mov    $0x1,%ebx
  404b16:	eb c3                	jmp    404adb <activate_powerup+0xcb>
  404b18:	bb 02 00 00 00       	mov    $0x2,%ebx
  404b1d:	eb bc                	jmp    404adb <activate_powerup+0xcb>
  404b1f:	bb 03 00 00 00       	mov    $0x3,%ebx
  404b24:	eb b5                	jmp    404adb <activate_powerup+0xcb>
  404b26:	e8 25 d7 ff ff       	callq  402250 <__stack_chk_fail@plt>
  404b2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000404b30 <has_powerup>:
  404b30:	f3 0f 1e fa          	endbr64 
  404b34:	48 8b 05 b5 58 00 00 	mov    0x58b5(%rip),%rax        # 40a3f0 <n_powerups>
  404b3b:	48 85 c0             	test   %rax,%rax
  404b3e:	74 38                	je     404b78 <has_powerup+0x48>
  404b40:	39 3d 3a 59 00 00    	cmp    %edi,0x593a(%rip)        # 40a480 <powerups>
  404b46:	74 38                	je     404b80 <has_powerup+0x50>
  404b48:	48 83 f8 01          	cmp    $0x1,%rax
  404b4c:	76 2a                	jbe    404b78 <has_powerup+0x48>
  404b4e:	3b 3d 3c 59 00 00    	cmp    0x593c(%rip),%edi        # 40a490 <powerups+0x10>
  404b54:	74 2a                	je     404b80 <has_powerup+0x50>
  404b56:	48 83 f8 02          	cmp    $0x2,%rax
  404b5a:	74 1c                	je     404b78 <has_powerup+0x48>
  404b5c:	3b 3d 3e 59 00 00    	cmp    0x593e(%rip),%edi        # 40a4a0 <powerups+0x20>
  404b62:	74 1c                	je     404b80 <has_powerup+0x50>
  404b64:	48 83 f8 03          	cmp    $0x3,%rax
  404b68:	74 0e                	je     404b78 <has_powerup+0x48>
  404b6a:	39 3d 40 59 00 00    	cmp    %edi,0x5940(%rip)        # 40a4b0 <powerups+0x30>
  404b70:	0f 94 c0             	sete   %al
  404b73:	c3                   	retq   
  404b74:	0f 1f 40 00          	nopl   0x0(%rax)
  404b78:	31 c0                	xor    %eax,%eax
  404b7a:	c3                   	retq   
  404b7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  404b80:	b8 01 00 00 00       	mov    $0x1,%eax
  404b85:	c3                   	retq   
  404b86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  404b8d:	00 00 00 

0000000000404b90 <render_powerup_bar>:
  404b90:	f3 0f 1e fa          	endbr64 
  404b94:	41 56                	push   %r14
  404b96:	40 0f b6 f6          	movzbl %sil,%esi
  404b9a:	49 be d0 00 00 00 04 	movabs $0x4000000d0,%r14
  404ba1:	00 00 00 
  404ba4:	41 55                	push   %r13
  404ba6:	41 bd c8 00 00 00    	mov    $0xc8,%r13d
  404bac:	41 54                	push   %r12
  404bae:	55                   	push   %rbp
  404baf:	48 89 fd             	mov    %rdi,%rbp
  404bb2:	53                   	push   %rbx
  404bb3:	48 83 ec 20          	sub    $0x20,%rsp
  404bb7:	8b 1d 63 58 00 00    	mov    0x5863(%rip),%ebx        # 40a420 <height>
  404bbd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404bc4:	00 00 
  404bc6:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  404bcb:	31 c0                	xor    %eax,%eax
  404bcd:	49 89 e4             	mov    %rsp,%r12
  404bd0:	8d 44 b6 05          	lea    0x5(%rsi,%rsi,4),%eax
  404bd4:	31 f6                	xor    %esi,%esi
  404bd6:	c1 e0 03             	shl    $0x3,%eax
  404bd9:	4c 89 e7             	mov    %r12,%rdi
  404bdc:	29 c3                	sub    %eax,%ebx
  404bde:	e8 4d d7 ff ff       	callq  402330 <gettimeofday@plt>
  404be3:	48 69 04 24 40 42 0f 	imul   $0xf4240,(%rsp),%rax
  404bea:	00 
  404beb:	48 03 44 24 08       	add    0x8(%rsp),%rax
  404bf0:	31 f6                	xor    %esi,%esi
  404bf2:	48 2b 45 08          	sub    0x8(%rbp),%rax
  404bf6:	48 8b 3d 3b cb 01 00 	mov    0x1cb3b(%rip),%rdi        # 421738 <renderer>
  404bfd:	48 b9 bd 42 7a e5 d5 	movabs $0xd6bf94d5e57a42bd,%rcx
  404c04:	94 bf d6 
  404c07:	41 b8 a0 00 00 00    	mov    $0xa0,%r8d
  404c0d:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  404c11:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  404c15:	48 c1 e2 03          	shl    $0x3,%rdx
  404c19:	48 89 d0             	mov    %rdx,%rax
  404c1c:	48 f7 e1             	mul    %rcx
  404c1f:	31 c9                	xor    %ecx,%ecx
  404c21:	48 c1 ea 17          	shr    $0x17,%rdx
  404c25:	41 29 d5             	sub    %edx,%r13d
  404c28:	31 d2                	xor    %edx,%edx
  404c2a:	e8 c1 d6 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404c2f:	8d 43 fc             	lea    -0x4(%rbx),%eax
  404c32:	4c 89 e6             	mov    %r12,%rsi
  404c35:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
  404c3a:	48 8b 3d f7 ca 01 00 	mov    0x1caf7(%rip),%rdi        # 421738 <renderer>
  404c41:	c7 04 24 06 00 00 00 	movl   $0x6,(%rsp)
  404c48:	89 44 24 04          	mov    %eax,0x4(%rsp)
  404c4c:	e8 df d4 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  404c51:	8d 43 1e             	lea    0x1e(%rbx),%eax
  404c54:	4c 89 e6             	mov    %r12,%rsi
  404c57:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
  404c5c:	48 8b 3d d5 ca 01 00 	mov    0x1cad5(%rip),%rdi        # 421738 <renderer>
  404c63:	89 44 24 04          	mov    %eax,0x4(%rsp)
  404c67:	49 be 04 00 00 00 1e 	movabs $0x1e00000004,%r14
  404c6e:	00 00 00 
  404c71:	c7 04 24 06 00 00 00 	movl   $0x6,(%rsp)
  404c78:	e8 b3 d4 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  404c7d:	48 8b 3d b4 ca 01 00 	mov    0x1cab4(%rip),%rdi        # 421738 <renderer>
  404c84:	4c 89 e6             	mov    %r12,%rsi
  404c87:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  404c8b:	c7 04 24 06 00 00 00 	movl   $0x6,(%rsp)
  404c92:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
  404c97:	e8 94 d4 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  404c9c:	48 8b 3d 95 ca 01 00 	mov    0x1ca95(%rip),%rdi        # 421738 <renderer>
  404ca3:	4c 89 e6             	mov    %r12,%rsi
  404ca6:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  404caa:	c7 04 24 d2 00 00 00 	movl   $0xd2,(%rsp)
  404cb1:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
  404cb6:	e8 75 d4 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  404cbb:	8b 4d 00             	mov    0x0(%rbp),%ecx
  404cbe:	83 f9 02             	cmp    $0x2,%ecx
  404cc1:	74 4d                	je     404d10 <render_powerup_bar+0x180>
  404cc3:	83 f9 03             	cmp    $0x3,%ecx
  404cc6:	0f 84 14 01 00 00    	je     404de0 <render_powerup_bar+0x250>
  404ccc:	83 f9 01             	cmp    $0x1,%ecx
  404ccf:	0f 84 db 00 00 00    	je     404db0 <render_powerup_bar+0x220>
  404cd5:	48 8b 3d 04 57 00 00 	mov    0x5704(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  404cdc:	48 8d 15 2e 24 00 00 	lea    0x242e(%rip),%rdx        # 407111 <_IO_stdin_used+0x111>
  404ce3:	be 01 00 00 00       	mov    $0x1,%esi
  404ce8:	31 c0                	xor    %eax,%eax
  404cea:	e8 51 d6 ff ff       	callq  402340 <__fprintf_chk@plt>
  404cef:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  404cf4:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  404cfb:	00 00 
  404cfd:	0f 85 0a 01 00 00    	jne    404e0d <render_powerup_bar+0x27d>
  404d03:	48 83 c4 20          	add    $0x20,%rsp
  404d07:	5b                   	pop    %rbx
  404d08:	5d                   	pop    %rbp
  404d09:	41 5c                	pop    %r12
  404d0b:	41 5d                	pop    %r13
  404d0d:	41 5e                	pop    %r14
  404d0f:	c3                   	retq   
  404d10:	41 b8 a0 00 00 00    	mov    $0xa0,%r8d
  404d16:	b9 59 00 00 00       	mov    $0x59,%ecx
  404d1b:	ba d0 00 00 00       	mov    $0xd0,%edx
  404d20:	48 8b 3d 11 ca 01 00 	mov    0x1ca11(%rip),%rdi        # 421738 <renderer>
  404d27:	be 7f 00 00 00       	mov    $0x7f,%esi
  404d2c:	e8 bf d5 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404d31:	48 8b 2d 30 57 00 00 	mov    0x5730(%rip),%rbp        # 40a468 <drop_big_bullets>
  404d38:	48 8b 3d f9 c9 01 00 	mov    0x1c9f9(%rip),%rdi        # 421738 <renderer>
  404d3f:	4c 89 e6             	mov    %r12,%rsi
  404d42:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  404d46:	83 c3 05             	add    $0x5,%ebx
  404d49:	c7 04 24 0a 00 00 00 	movl   $0xa,(%rsp)
  404d50:	44 89 6c 24 08       	mov    %r13d,0x8(%rsp)
  404d55:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%rsp)
  404d5c:	00 
  404d5d:	e8 ce d3 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  404d62:	48 8b 3d cf c9 01 00 	mov    0x1c9cf(%rip),%rdi        # 421738 <renderer>
  404d69:	48 89 ee             	mov    %rbp,%rsi
  404d6c:	e8 4f d5 ff ff       	callq  4022c0 <SDL_CreateTextureFromSurface@plt>
  404d71:	4c 89 e1             	mov    %r12,%rcx
  404d74:	31 d2                	xor    %edx,%edx
  404d76:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  404d7a:	48 89 c5             	mov    %rax,%rbp
  404d7d:	48 8b 3d b4 c9 01 00 	mov    0x1c9b4(%rip),%rdi        # 421738 <renderer>
  404d84:	48 b8 14 00 00 00 14 	movabs $0x1400000014,%rax
  404d8b:	00 00 00 
  404d8e:	c7 04 24 0f 00 00 00 	movl   $0xf,(%rsp)
  404d95:	48 89 ee             	mov    %rbp,%rsi
  404d98:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  404d9d:	e8 be d4 ff ff       	callq  402260 <SDL_RenderCopy@plt>
  404da2:	48 89 ef             	mov    %rbp,%rdi
  404da5:	e8 06 d4 ff ff       	callq  4021b0 <SDL_DestroyTexture@plt>
  404daa:	e9 40 ff ff ff       	jmpq   404cef <render_powerup_bar+0x15f>
  404daf:	90                   	nop
  404db0:	41 b8 a0 00 00 00    	mov    $0xa0,%r8d
  404db6:	b9 f2 00 00 00       	mov    $0xf2,%ecx
  404dbb:	ba b8 00 00 00       	mov    $0xb8,%edx
  404dc0:	48 8b 3d 71 c9 01 00 	mov    0x1c971(%rip),%rdi        # 421738 <renderer>
  404dc7:	be 77 00 00 00       	mov    $0x77,%esi
  404dcc:	e8 1f d5 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404dd1:	48 8b 2d 40 c9 01 00 	mov    0x1c940(%rip),%rbp        # 421718 <drop_fast_shooting>
  404dd8:	e9 5b ff ff ff       	jmpq   404d38 <render_powerup_bar+0x1a8>
  404ddd:	0f 1f 00             	nopl   (%rax)
  404de0:	41 b8 a0 00 00 00    	mov    $0xa0,%r8d
  404de6:	b9 7e 00 00 00       	mov    $0x7e,%ecx
  404deb:	ba d4 00 00 00       	mov    $0xd4,%edx
  404df0:	48 8b 3d 41 c9 01 00 	mov    0x1c941(%rip),%rdi        # 421738 <renderer>
  404df7:	be f5 00 00 00       	mov    $0xf5,%esi
  404dfc:	e8 ef d4 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  404e01:	48 8b 2d f8 b6 01 00 	mov    0x1b6f8(%rip),%rbp        # 420500 <drop_super_speed>
  404e08:	e9 2b ff ff ff       	jmpq   404d38 <render_powerup_bar+0x1a8>
  404e0d:	e8 3e d4 ff ff       	callq  402250 <__stack_chk_fail@plt>
  404e12:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e19:	00 00 00 00 
  404e1d:	0f 1f 00             	nopl   (%rax)

0000000000404e20 <update_powerups>:
  404e20:	f3 0f 1e fa          	endbr64 
  404e24:	41 54                	push   %r12
  404e26:	31 f6                	xor    %esi,%esi
  404e28:	55                   	push   %rbp
  404e29:	53                   	push   %rbx
  404e2a:	48 83 ec 20          	sub    $0x20,%rsp
  404e2e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404e35:	00 00 
  404e37:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  404e3c:	31 c0                	xor    %eax,%eax
  404e3e:	48 89 e7             	mov    %rsp,%rdi
  404e41:	e8 ea d4 ff ff       	callq  402330 <gettimeofday@plt>
  404e46:	48 8b 35 a3 55 00 00 	mov    0x55a3(%rip),%rsi        # 40a3f0 <n_powerups>
  404e4d:	48 69 2c 24 40 42 0f 	imul   $0xf4240,(%rsp),%rbp
  404e54:	00 
  404e55:	48 03 6c 24 08       	add    0x8(%rsp),%rbp
  404e5a:	48 85 f6             	test   %rsi,%rsi
  404e5d:	74 72                	je     404ed1 <update_powerups+0xb1>
  404e5f:	45 31 e4             	xor    %r12d,%r12d
  404e62:	48 8d 1d 17 56 00 00 	lea    0x5617(%rip),%rbx        # 40a480 <powerups>
  404e69:	eb 34                	jmp    404e9f <update_powerups+0x7f>
  404e6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  404e70:	83 3f 03             	cmpl   $0x3,(%rdi)
  404e73:	75 07                	jne    404e7c <update_powerups+0x5c>
  404e75:	c6 05 7c 55 00 00 00 	movb   $0x0,0x557c(%rip)        # 40a3f8 <super_speed_enabled>
  404e7c:	48 83 ee 01          	sub    $0x1,%rsi
  404e80:	48 89 35 69 55 00 00 	mov    %rsi,0x5569(%rip)        # 40a3f0 <n_powerups>
  404e87:	48 c1 e6 04          	shl    $0x4,%rsi
  404e8b:	48 01 de             	add    %rbx,%rsi
  404e8e:	e8 54 da ff ff       	callq  4028e7 <copy_powerup>
  404e93:	48 8b 35 56 55 00 00 	mov    0x5556(%rip),%rsi        # 40a3f0 <n_powerups>
  404e9a:	4c 39 e6             	cmp    %r12,%rsi
  404e9d:	76 32                	jbe    404ed1 <update_powerups+0xb1>
  404e9f:	4c 89 e7             	mov    %r12,%rdi
  404ea2:	48 89 e8             	mov    %rbp,%rax
  404ea5:	48 c1 e7 04          	shl    $0x4,%rdi
  404ea9:	48 01 df             	add    %rbx,%rdi
  404eac:	48 2b 47 08          	sub    0x8(%rdi),%rax
  404eb0:	48 3d 80 96 98 00    	cmp    $0x989680,%rax
  404eb6:	77 b8                	ja     404e70 <update_powerups+0x50>
  404eb8:	41 0f b6 f4          	movzbl %r12b,%esi
  404ebc:	49 83 c4 01          	add    $0x1,%r12
  404ec0:	e8 cb fc ff ff       	callq  404b90 <render_powerup_bar>
  404ec5:	48 8b 35 24 55 00 00 	mov    0x5524(%rip),%rsi        # 40a3f0 <n_powerups>
  404ecc:	4c 39 e6             	cmp    %r12,%rsi
  404ecf:	77 ce                	ja     404e9f <update_powerups+0x7f>
  404ed1:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  404ed6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  404edd:	00 00 
  404edf:	75 09                	jne    404eea <update_powerups+0xca>
  404ee1:	48 83 c4 20          	add    $0x20,%rsp
  404ee5:	5b                   	pop    %rbx
  404ee6:	5d                   	pop    %rbp
  404ee7:	41 5c                	pop    %r12
  404ee9:	c3                   	retq   
  404eea:	e8 61 d3 ff ff       	callq  402250 <__stack_chk_fail@plt>
  404eef:	90                   	nop

0000000000404ef0 <render_leaderboard>:
  404ef0:	f3 0f 1e fa          	endbr64 
  404ef4:	41 57                	push   %r15
  404ef6:	b9 10 00 00 00       	mov    $0x10,%ecx
  404efb:	48 8d 35 ec b5 01 00 	lea    0x1b5ec(%rip),%rsi        # 4204ee <player+0xe>
  404f02:	48 8d 3d 17 b6 01 00 	lea    0x1b617(%rip),%rdi        # 420520 <leaderboard>
  404f09:	41 56                	push   %r14
  404f0b:	4c 8d 35 0e b6 01 00 	lea    0x1b60e(%rip),%r14        # 420520 <leaderboard>
  404f12:	41 55                	push   %r13
  404f14:	41 54                	push   %r12
  404f16:	55                   	push   %rbp
  404f17:	53                   	push   %rbx
  404f18:	48 83 ec 38          	sub    $0x38,%rsp
  404f1c:	0f b6 15 ca b5 01 00 	movzbl 0x1b5ca(%rip),%edx        # 4204ed <player+0xd>
  404f23:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404f2a:	00 00 
  404f2c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  404f31:	31 c0                	xor    %eax,%eax
  404f33:	48 89 d3             	mov    %rdx,%rbx
  404f36:	e8 25 d2 ff ff       	callq  402160 <__strncpy_chk@plt>
  404f3b:	0f b7 05 bc b5 01 00 	movzwl 0x1b5bc(%rip),%eax        # 4204fe <player+0x1e>
  404f42:	41 c6 04 1e 00       	movb   $0x0,(%r14,%rbx,1)
  404f47:	44 0f b6 2d aa 54 00 	movzbl 0x54aa(%rip),%r13d        # 40a3f9 <num_other_players>
  404f4e:	00 
  404f4f:	66 89 05 da b5 01 00 	mov    %ax,0x1b5da(%rip)        # 420530 <leaderboard+0x10>
  404f56:	4d 85 ed             	test   %r13,%r13
  404f59:	0f 84 19 01 00 00    	je     405078 <render_leaderboard+0x188>
  404f5f:	4d 89 ef             	mov    %r13,%r15
  404f62:	49 8d 7e 12          	lea    0x12(%r14),%rdi
  404f66:	bb 01 00 00 00       	mov    $0x1,%ebx
  404f6b:	48 8d 2d 9c 95 01 00 	lea    0x1959c(%rip),%rbp        # 41e50e <other_players+0xe>
  404f72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  404f78:	0f b6 55 ff          	movzbl -0x1(%rbp),%edx
  404f7c:	48 89 ee             	mov    %rbp,%rsi
  404f7f:	b9 10 00 00 00       	mov    $0x10,%ecx
  404f84:	48 83 c5 20          	add    $0x20,%rbp
  404f88:	49 89 d4             	mov    %rdx,%r12
  404f8b:	e8 d0 d1 ff ff       	callq  402160 <__strncpy_chk@plt>
  404f90:	48 8d 14 db          	lea    (%rbx,%rbx,8),%rdx
  404f94:	49 8d 14 56          	lea    (%r14,%rdx,2),%rdx
  404f98:	48 89 c7             	mov    %rax,%rdi
  404f9b:	48 89 d8             	mov    %rbx,%rax
  404f9e:	48 83 c3 01          	add    $0x1,%rbx
  404fa2:	42 c6 04 22 00       	movb   $0x0,(%rdx,%r12,1)
  404fa7:	0f b7 55 f0          	movzwl -0x10(%rbp),%edx
  404fab:	48 83 c7 12          	add    $0x12,%rdi
  404faf:	66 89 57 fe          	mov    %dx,-0x2(%rdi)
  404fb3:	49 39 c5             	cmp    %rax,%r13
  404fb6:	75 c0                	jne    404f78 <render_leaderboard+0x88>
  404fb8:	49 8d 77 01          	lea    0x1(%r15),%rsi
  404fbc:	48 8d 0d 3d d9 ff ff 	lea    -0x26c3(%rip),%rcx        # 402900 <LeaderboardEntry_cmp>
  404fc3:	ba 12 00 00 00       	mov    $0x12,%edx
  404fc8:	31 db                	xor    %ebx,%ebx
  404fca:	49 89 e4             	mov    %rsp,%r12
  404fcd:	48 8d 3d 4c b5 01 00 	lea    0x1b54c(%rip),%rdi        # 420520 <leaderboard>
  404fd4:	48 8d 2d 45 b5 01 00 	lea    0x1b545(%rip),%rbp        # 420520 <leaderboard>
  404fdb:	e8 80 d3 ff ff       	callq  402360 <qsort@plt>
  404fe0:	48 8b 3d 51 c7 01 00 	mov    0x1c751(%rip),%rdi        # 421738 <renderer>
  404fe7:	31 c9                	xor    %ecx,%ecx
  404fe9:	31 d2                	xor    %edx,%edx
  404feb:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  404ff1:	be ff 00 00 00       	mov    $0xff,%esi
  404ff6:	4c 8d 2d 2d 21 00 00 	lea    0x212d(%rip),%r13        # 40712a <_IO_stdin_used+0x12a>
  404ffd:	e8 ee d2 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  405002:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405008:	44 0f b7 4d 10       	movzwl 0x10(%rbp),%r9d
  40500d:	49 89 e8             	mov    %rbp,%r8
  405010:	4c 89 e9             	mov    %r13,%rcx
  405013:	ba 20 00 00 00       	mov    $0x20,%edx
  405018:	be 01 00 00 00       	mov    $0x1,%esi
  40501d:	4c 89 e7             	mov    %r12,%rdi
  405020:	31 c0                	xor    %eax,%eax
  405022:	48 83 c5 12          	add    $0x12,%rbp
  405026:	e8 45 d1 ff ff       	callq  402170 <__sprintf_chk@plt>
  40502b:	6b cb 1e             	imul   $0x1e,%ebx,%ecx
  40502e:	4c 89 e6             	mov    %r12,%rsi
  405031:	48 83 c3 01          	add    $0x1,%rbx
  405035:	8b 15 e5 c6 01 00    	mov    0x1c6e5(%rip),%edx        # 421720 <width>
  40503b:	48 8b 3d 06 c7 01 00 	mov    0x1c706(%rip),%rdi        # 421748 <font_20px>
  405042:	e8 79 e9 ff ff       	callq  4039c0 <render_text_right>
  405047:	0f b6 05 ab 53 00 00 	movzbl 0x53ab(%rip),%eax        # 40a3f9 <num_other_players>
  40504e:	48 39 d8             	cmp    %rbx,%rax
  405051:	73 b5                	jae    405008 <render_leaderboard+0x118>
  405053:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  405058:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40505f:	00 00 
  405061:	75 1f                	jne    405082 <render_leaderboard+0x192>
  405063:	48 83 c4 38          	add    $0x38,%rsp
  405067:	5b                   	pop    %rbx
  405068:	5d                   	pop    %rbp
  405069:	41 5c                	pop    %r12
  40506b:	41 5d                	pop    %r13
  40506d:	41 5e                	pop    %r14
  40506f:	41 5f                	pop    %r15
  405071:	c3                   	retq   
  405072:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405078:	be 01 00 00 00       	mov    $0x1,%esi
  40507d:	e9 3a ff ff ff       	jmpq   404fbc <render_leaderboard+0xcc>
  405082:	e8 c9 d1 ff ff       	callq  402250 <__stack_chk_fail@plt>
  405087:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40508e:	00 00 

0000000000405090 <clear_screen>:
  405090:	f3 0f 1e fa          	endbr64 
  405094:	48 83 ec 28          	sub    $0x28,%rsp
  405098:	48 8b 3d 99 c6 01 00 	mov    0x1c699(%rip),%rdi        # 421738 <renderer>
  40509f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4050a6:	00 00 
  4050a8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4050ad:	31 c0                	xor    %eax,%eax
  4050af:	e8 8c d1 ff ff       	callq  402240 <SDL_RenderClear@plt>
  4050b4:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  4050ba:	b9 ff 00 00 00       	mov    $0xff,%ecx
  4050bf:	48 8b 3d 72 c6 01 00 	mov    0x1c672(%rip),%rdi        # 421738 <renderer>
  4050c6:	ba ff 00 00 00       	mov    $0xff,%edx
  4050cb:	be ff 00 00 00       	mov    $0xff,%esi
  4050d0:	e8 1b d2 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  4050d5:	8b 05 45 c6 01 00    	mov    0x1c645(%rip),%eax        # 421720 <width>
  4050db:	48 89 e6             	mov    %rsp,%rsi
  4050de:	48 8b 3d 53 c6 01 00 	mov    0x1c653(%rip),%rdi        # 421738 <renderer>
  4050e5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4050ec:	00 
  4050ed:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4050f1:	8b 05 29 53 00 00    	mov    0x5329(%rip),%eax        # 40a420 <height>
  4050f7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4050fb:	e8 30 d0 ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  405100:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  405105:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40510c:	00 00 
  40510e:	75 05                	jne    405115 <clear_screen+0x85>
  405110:	48 83 c4 28          	add    $0x28,%rsp
  405114:	c3                   	retq   
  405115:	e8 36 d1 ff ff       	callq  402250 <__stack_chk_fail@plt>
  40511a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000405120 <render_fps_counter>:
  405120:	f3 0f 1e fa          	endbr64 
  405124:	55                   	push   %rbp
  405125:	b9 10 00 00 00       	mov    $0x10,%ecx
  40512a:	ba 01 00 00 00       	mov    $0x1,%edx
  40512f:	be 10 00 00 00       	mov    $0x10,%esi
  405134:	4c 8d 05 f8 1f 00 00 	lea    0x1ff8(%rip),%r8        # 407133 <_IO_stdin_used+0x133>
  40513b:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40513f:	48 83 ec 20          	sub    $0x20,%rsp
  405143:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40514a:	00 00 
  40514c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  405151:	31 c0                	xor    %eax,%eax
  405153:	48 89 e5             	mov    %rsp,%rbp
  405156:	b8 01 00 00 00       	mov    $0x1,%eax
  40515b:	f3 0f 5a 05 cd c5 01 	cvtss2sd 0x1c5cd(%rip),%xmm0        # 421730 <fps>
  405162:	00 
  405163:	48 89 ef             	mov    %rbp,%rdi
  405166:	e8 25 d0 ff ff       	callq  402190 <__snprintf_chk@plt>
  40516b:	48 8b 3d c6 c5 01 00 	mov    0x1c5c6(%rip),%rdi        # 421738 <renderer>
  405172:	31 c9                	xor    %ecx,%ecx
  405174:	31 d2                	xor    %edx,%edx
  405176:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  40517c:	be ff 00 00 00       	mov    $0xff,%esi
  405181:	e8 6a d1 ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  405186:	48 8b 3d bb c5 01 00 	mov    0x1c5bb(%rip),%rdi        # 421748 <font_20px>
  40518d:	31 c9                	xor    %ecx,%ecx
  40518f:	31 d2                	xor    %edx,%edx
  405191:	48 89 ee             	mov    %rbp,%rsi
  405194:	e8 47 e6 ff ff       	callq  4037e0 <render_text>
  405199:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40519e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4051a5:	00 00 
  4051a7:	75 06                	jne    4051af <render_fps_counter+0x8f>
  4051a9:	48 83 c4 20          	add    $0x20,%rsp
  4051ad:	5d                   	pop    %rbp
  4051ae:	c3                   	retq   
  4051af:	e8 9c d0 ff ff       	callq  402250 <__stack_chk_fail@plt>
  4051b4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4051bb:	00 00 00 00 
  4051bf:	90                   	nop

00000000004051c0 <setup_io>:
  4051c0:	f3 0f 1e fa          	endbr64 
  4051c4:	55                   	push   %rbp
  4051c5:	be 0f 00 00 00       	mov    $0xf,%esi
  4051ca:	48 83 ec 20          	sub    $0x20,%rsp
  4051ce:	48 8b 2d 53 c5 01 00 	mov    0x1c553(%rip),%rbp        # 421728 <username>
  4051d5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4051dc:	00 00 
  4051de:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4051e3:	31 c0                	xor    %eax,%eax
  4051e5:	c6 05 00 b3 01 00 00 	movb   $0x0,0x1b300(%rip)        # 4204ec <player+0xc>
  4051ec:	48 b8 00 40 1c 45 00 	movabs $0x451c4000451c4000,%rax
  4051f3:	40 1c 45 
  4051f6:	48 89 ef             	mov    %rbp,%rdi
  4051f9:	48 89 05 e0 b2 01 00 	mov    %rax,0x1b2e0(%rip)        # 4204e0 <player>
  405200:	c7 05 de b2 01 00 00 	movl   $0x0,0x1b2de(%rip)        # 4204e8 <player+0x8>
  405207:	00 00 00 
  40520a:	e8 11 d1 ff ff       	callq  402320 <strnlen@plt>
  40520f:	ba 0f 00 00 00       	mov    $0xf,%edx
  405214:	48 89 ee             	mov    %rbp,%rsi
  405217:	48 8d 3d d0 b2 01 00 	lea    0x1b2d0(%rip),%rdi        # 4204ee <player+0xe>
  40521e:	88 05 c9 b2 01 00    	mov    %al,0x1b2c9(%rip)        # 4204ed <player+0xd>
  405224:	e8 27 cf ff ff       	callq  402150 <strncpy@plt>
  405229:	31 f6                	xor    %esi,%esi
  40522b:	48 89 e7             	mov    %rsp,%rdi
  40522e:	c7 05 38 52 00 00 c4 	movl   $0x9c4,0x5238(%rip)        # 40a470 <raw_mouse_y>
  405235:	09 00 00 
  405238:	c7 05 e2 51 00 00 ff 	movl   $0x7fffffff,0x51e2(%rip)        # 40a424 <raw_mouse_x>
  40523f:	ff ff 7f 
  405242:	e8 e9 d0 ff ff       	callq  402330 <gettimeofday@plt>
  405247:	48 69 04 24 40 42 0f 	imul   $0xf4240,(%rsp),%rax
  40524e:	00 
  40524f:	48 03 44 24 08       	add    0x8(%rsp),%rax
  405254:	48 c7 05 61 52 00 00 	movq   $0x1,0x5261(%rip)        # 40a4c0 <frame_times_index>
  40525b:	01 00 00 00 
  40525f:	48 89 05 da 51 00 00 	mov    %rax,0x51da(%rip)        # 40a440 <frame_times>
  405266:	48 89 05 9b b2 01 00 	mov    %rax,0x1b29b(%rip)        # 420508 <last_server_tick_time>
  40526d:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  405272:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  405279:	00 00 
  40527b:	75 06                	jne    405283 <setup_io+0xc3>
  40527d:	48 83 c4 20          	add    $0x20,%rsp
  405281:	5d                   	pop    %rbp
  405282:	c3                   	retq   
  405283:	e8 c8 cf ff ff       	callq  402250 <__stack_chk_fail@plt>
  405288:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40528f:	00 

0000000000405290 <handle_events>:
  405290:	f3 0f 1e fa          	endbr64 
  405294:	41 57                	push   %r15
  405296:	41 56                	push   %r14
  405298:	41 55                	push   %r13
  40529a:	41 54                	push   %r12
  40529c:	55                   	push   %rbp
  40529d:	53                   	push   %rbx
  40529e:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  4052a5:	48 83 0c 24 00       	orq    $0x0,(%rsp)
  4052aa:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  4052b1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4052b8:	00 00 
  4052ba:	48 89 84 24 e8 10 00 	mov    %rax,0x10e8(%rsp)
  4052c1:	00 
  4052c2:	31 c0                	xor    %eax,%eax
  4052c4:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  4052c9:	c6 44 24 3b 00       	movb   $0x0,0x3b(%rsp)
  4052ce:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  4052d3:	48 8d 84 24 80 00 00 	lea    0x80(%rsp),%rax
  4052da:	00 
  4052db:	c6 44 24 3c 00       	movb   $0x0,0x3c(%rsp)
  4052e0:	c6 44 24 3e 00       	movb   $0x0,0x3e(%rsp)
  4052e5:	c6 44 24 3f 00       	movb   $0x0,0x3f(%rsp)
  4052ea:	c6 44 24 3d 00       	movb   $0x0,0x3d(%rsp)
  4052ef:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
  4052f6:	00 00 
  4052f8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4052fd:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  405302:	31 f6                	xor    %esi,%esi
  405304:	45 31 e4             	xor    %r12d,%r12d
  405307:	e8 24 d0 ff ff       	callq  402330 <gettimeofday@plt>
  40530c:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
  405311:	48 8b 6c 24 78       	mov    0x78(%rsp),%rbp
  405316:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40531d:	00 00 00 
  405320:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  405325:	e8 56 ce ff ff       	callq  402180 <SDL_PollEvent@plt>
  40532a:	85 c0                	test   %eax,%eax
  40532c:	74 72                	je     4053a0 <handle_events+0x110>
  40532e:	8b 84 24 80 00 00 00 	mov    0x80(%rsp),%eax
  405335:	3d 01 03 00 00       	cmp    $0x301,%eax
  40533a:	0f 84 30 04 00 00    	je     405770 <handle_events+0x4e0>
  405340:	0f 87 fa 03 00 00    	ja     405740 <handle_events+0x4b0>
  405346:	3d 00 01 00 00       	cmp    $0x100,%eax
  40534b:	0f 84 6f 04 00 00    	je     4057c0 <handle_events+0x530>
  405351:	3d 00 03 00 00       	cmp    $0x300,%eax
  405356:	75 c8                	jne    405320 <handle_events+0x90>
  405358:	8b 84 24 90 00 00 00 	mov    0x90(%rsp),%eax
  40535f:	83 f8 16             	cmp    $0x16,%eax
  405362:	0f 84 78 0b 00 00    	je     405ee0 <handle_events+0xc50>
  405368:	0f 87 32 04 00 00    	ja     4057a0 <handle_events+0x510>
  40536e:	83 f8 04             	cmp    $0x4,%eax
  405371:	0f 84 c9 04 00 00    	je     405840 <handle_events+0x5b0>
  405377:	0f b6 74 24 3c       	movzbl 0x3c(%rsp),%esi
  40537c:	83 f8 07             	cmp    $0x7,%eax
  40537f:	b8 01 00 00 00       	mov    $0x1,%eax
  405384:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  405389:	0f 44 f0             	cmove  %eax,%esi
  40538c:	40 88 74 24 3c       	mov    %sil,0x3c(%rsp)
  405391:	e8 ea cd ff ff       	callq  402180 <SDL_PollEvent@plt>
  405396:	85 c0                	test   %eax,%eax
  405398:	75 94                	jne    40532e <handle_events+0x9e>
  40539a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4053a0:	48 8b 3d 91 c3 01 00 	mov    0x1c391(%rip),%rdi        # 421738 <renderer>
  4053a7:	45 31 e4             	xor    %r12d,%r12d
  4053aa:	e8 91 ce ff ff       	callq  402240 <SDL_RenderClear@plt>
  4053af:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  4053b5:	b9 ff 00 00 00       	mov    $0xff,%ecx
  4053ba:	48 8b 3d 77 c3 01 00 	mov    0x1c377(%rip),%rdi        # 421738 <renderer>
  4053c1:	ba ff 00 00 00       	mov    $0xff,%edx
  4053c6:	be ff 00 00 00       	mov    $0xff,%esi
  4053cb:	e8 20 cf ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  4053d0:	8b 05 4a c3 01 00    	mov    0x1c34a(%rip),%eax        # 421720 <width>
  4053d6:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  4053db:	48 c7 44 24 70 00 00 	movq   $0x0,0x70(%rsp)
  4053e2:	00 00 
  4053e4:	48 8b 3d 4d c3 01 00 	mov    0x1c34d(%rip),%rdi        # 421738 <renderer>
  4053eb:	89 44 24 78          	mov    %eax,0x78(%rsp)
  4053ef:	8b 05 2b 50 00 00    	mov    0x502b(%rip),%eax        # 40a420 <height>
  4053f5:	89 44 24 7c          	mov    %eax,0x7c(%rsp)
  4053f9:	e8 32 cd ff ff       	callq  402130 <SDL_RenderFillRect@plt>
  4053fe:	e8 1d ec ff ff       	callq  404020 <render_map_grid>
  405403:	e8 c8 ea ff ff       	callq  403ed0 <render_map_border>
  405408:	8b 05 62 50 00 00    	mov    0x5062(%rip),%eax        # 40a470 <raw_mouse_y>
  40540e:	f3 0f 10 35 ca b0 01 	movss  0x1b0ca(%rip),%xmm6        # 4204e0 <player>
  405415:	00 
  405416:	f3 0f 10 3d c6 b0 01 	movss  0x1b0c6(%rip),%xmm7        # 4204e4 <player+0x4>
  40541d:	00 
  40541e:	44 8b 35 fb c2 01 00 	mov    0x1c2fb(%rip),%r14d        # 421720 <width>
  405425:	89 04 24             	mov    %eax,(%rsp)
  405428:	8b 05 f6 4f 00 00    	mov    0x4ff6(%rip),%eax        # 40a424 <raw_mouse_x>
  40542e:	44 8b 3d eb 4f 00 00 	mov    0x4feb(%rip),%r15d        # 40a420 <height>
  405435:	f3 0f 11 74 24 10    	movss  %xmm6,0x10(%rsp)
  40543b:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40543f:	f3 0f 11 7c 24 14    	movss  %xmm7,0x14(%rsp)
  405445:	e8 f6 f3 ff ff       	callq  404840 <render_drops>
  40544a:	80 3d a8 4f 00 00 00 	cmpb   $0x0,0x4fa8(%rip)        # 40a3f9 <num_other_players>
  405451:	74 34                	je     405487 <handle_events+0x1f7>
  405453:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  405458:	45 0f b6 ec          	movzbl %r12b,%r13d
  40545c:	48 8d 05 9d 90 01 00 	lea    0x1909d(%rip),%rax        # 41e500 <other_players>
  405463:	41 83 c4 01          	add    $0x1,%r12d
  405467:	49 c1 e5 05          	shl    $0x5,%r13
  40546b:	49 01 c5             	add    %rax,%r13
  40546e:	4c 89 ef             	mov    %r13,%rdi
  405471:	e8 3a e6 ff ff       	callq  403ab0 <render_tank>
  405476:	4c 89 ef             	mov    %r13,%rdi
  405479:	e8 d2 e8 ff ff       	callq  403d50 <render_health_bar>
  40547e:	44 3a 25 74 4f 00 00 	cmp    0x4f74(%rip),%r12b        # 40a3f9 <num_other_players>
  405485:	72 d1                	jb     405458 <handle_events+0x1c8>
  405487:	80 3d 5e b0 01 00 00 	cmpb   $0x0,0x1b05e(%rip)        # 4204ec <player+0xc>
  40548e:	0f 84 8e 01 00 00    	je     405622 <handle_events+0x392>
  405494:	0f b6 54 24 3c       	movzbl 0x3c(%rsp),%edx
  405499:	2a 54 24 3e          	sub    0x3e(%rsp),%dl
  40549d:	89 d1                	mov    %edx,%ecx
  40549f:	0f b6 74 24 3f       	movzbl 0x3f(%rsp),%esi
  4054a4:	40 2a 74 24 3d       	sub    0x3d(%rsp),%sil
  4054a9:	c0 f9 07             	sar    $0x7,%cl
  4054ac:	89 f7                	mov    %esi,%edi
  4054ae:	89 c8                	mov    %ecx,%eax
  4054b0:	40 c0 ff 07          	sar    $0x7,%dil
  4054b4:	31 d0                	xor    %edx,%eax
  4054b6:	29 c8                	sub    %ecx,%eax
  4054b8:	89 f9                	mov    %edi,%ecx
  4054ba:	31 f1                	xor    %esi,%ecx
  4054bc:	0f b6 c0             	movzbl %al,%eax
  4054bf:	29 f9                	sub    %edi,%ecx
  4054c1:	0f b6 c9             	movzbl %cl,%ecx
  4054c4:	01 c8                	add    %ecx,%eax
  4054c6:	83 f8 02             	cmp    $0x2,%eax
  4054c9:	0f 84 b4 0a 00 00    	je     405f83 <handle_events+0xcf3>
  4054cf:	f3 0f 10 05 e9 1f 00 	movss  0x1fe9(%rip),%xmm0        # 4074c0 <_IO_stdin_used+0x4c0>
  4054d6:	00 
  4054d7:	f3 0f 10 1d dd 1f 00 	movss  0x1fdd(%rip),%xmm3        # 4074bc <_IO_stdin_used+0x4bc>
  4054de:	00 
  4054df:	80 3d 12 4f 00 00 00 	cmpb   $0x0,0x4f12(%rip)        # 40a3f8 <super_speed_enabled>
  4054e6:	75 03                	jne    4054eb <handle_events+0x25b>
  4054e8:	0f 28 d8             	movaps %xmm0,%xmm3
  4054eb:	0f be d2             	movsbl %dl,%edx
  4054ee:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4054f2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4054f6:	40 0f be c6          	movsbl %sil,%eax
  4054fa:	f3 0f 2a ca          	cvtsi2ss %edx,%xmm1
  4054fe:	f3 0f 10 2d 02 4f 00 	movss  0x4f02(%rip),%xmm5        # 40a408 <dt>
  405505:	00 
  405506:	f3 0f 10 25 d2 af 01 	movss  0x1afd2(%rip),%xmm4        # 4204e0 <player>
  40550d:	00 
  40550e:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
  405512:	f3 0f 10 15 ca af 01 	movss  0x1afca(%rip),%xmm2        # 4204e4 <player+0x4>
  405519:	00 
  40551a:	f3 0f 59 cb          	mulss  %xmm3,%xmm1
  40551e:	f3 0f 59 c3          	mulss  %xmm3,%xmm0
  405522:	f3 0f 59 cd          	mulss  %xmm5,%xmm1
  405526:	f3 0f 59 c5          	mulss  %xmm5,%xmm0
  40552a:	66 0f ef ed          	pxor   %xmm5,%xmm5
  40552e:	f3 0f 58 cc          	addss  %xmm4,%xmm1
  405532:	f3 0f 58 c2          	addss  %xmm2,%xmm0
  405536:	0f 2f e9             	comiss %xmm1,%xmm5
  405539:	f3 0f 11 0d 9f af 01 	movss  %xmm1,0x1af9f(%rip)        # 4204e0 <player>
  405540:	00 
  405541:	f3 0f 11 05 9b af 01 	movss  %xmm0,0x1af9b(%rip)        # 4204e4 <player+0x4>
  405548:	00 
  405549:	0f 87 25 0a 00 00    	ja     405f74 <handle_events+0xce4>
  40554f:	0f 2f 0d 76 1f 00 00 	comiss 0x1f76(%rip),%xmm1        # 4074cc <_IO_stdin_used+0x4cc>
  405556:	76 0a                	jbe    405562 <handle_events+0x2d2>
  405558:	c7 05 7e af 01 00 00 	movl   $0x459c4000,0x1af7e(%rip)        # 4204e0 <player>
  40555f:	40 9c 45 
  405562:	66 0f ef f6          	pxor   %xmm6,%xmm6
  405566:	0f 2f f0             	comiss %xmm0,%xmm6
  405569:	0f 87 f6 09 00 00    	ja     405f65 <handle_events+0xcd5>
  40556f:	0f 2f 05 56 1f 00 00 	comiss 0x1f56(%rip),%xmm0        # 4074cc <_IO_stdin_used+0x4cc>
  405576:	76 0a                	jbe    405582 <handle_events+0x2f2>
  405578:	c7 05 62 af 01 00 00 	movl   $0x459c4000,0x1af62(%rip)        # 4204e4 <player+0x4>
  40557f:	40 9c 45 
  405582:	41 d1 ee             	shr    %r14d
  405585:	66 0f ef c9          	pxor   %xmm1,%xmm1
  405589:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40558d:	41 d1 ef             	shr    %r15d
  405590:	f3 41 0f 2a ce       	cvtsi2ss %r14d,%xmm1
  405595:	f3 0f 2a 44 24 08    	cvtsi2ssl 0x8(%rsp),%xmm0
  40559b:	f3 0f 58 44 24 10    	addss  0x10(%rsp),%xmm0
  4055a1:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  4055a5:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4055a9:	f3 41 0f 2a cf       	cvtsi2ss %r15d,%xmm1
  4055ae:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  4055b2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4055b6:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
  4055ba:	f3 0f 5c c4          	subss  %xmm4,%xmm0
  4055be:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  4055c2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4055c6:	f3 0f 2a 04 24       	cvtsi2ssl (%rsp),%xmm0
  4055cb:	f3 0f 58 44 24 14    	addss  0x14(%rsp),%xmm0
  4055d1:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  4055d5:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4055d9:	f2 0f 2a c8          	cvtsi2sd %eax,%xmm1
  4055dd:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  4055e1:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4055e5:	f3 0f 2a c2          	cvtsi2ss %edx,%xmm0
  4055e9:	f3 0f 5c c2          	subss  %xmm2,%xmm0
  4055ed:	f3 0f 2c d0          	cvttss2si %xmm0,%edx
  4055f1:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4055f5:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
  4055f9:	e8 82 ca ff ff       	callq  402080 <atan2@plt>
  4055fe:	48 8d 3d db ae 01 00 	lea    0x1aedb(%rip),%rdi        # 4204e0 <player>
  405605:	f2 0f 5a c0          	cvtsd2ss %xmm0,%xmm0
  405609:	f3 0f 11 05 d7 ae 01 	movss  %xmm0,0x1aed7(%rip)        # 4204e8 <player+0x8>
  405610:	00 
  405611:	e8 9a e4 ff ff       	callq  403ab0 <render_tank>
  405616:	48 8d 3d c3 ae 01 00 	lea    0x1aec3(%rip),%rdi        # 4204e0 <player>
  40561d:	e8 2e e7 ff ff       	callq  403d50 <render_health_bar>
  405622:	48 69 db 40 42 0f 00 	imul   $0xf4240,%rbx,%rbx
  405629:	48 8d 04 2b          	lea    (%rbx,%rbp,1),%rax
  40562d:	48 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%rbp
  405634:	00 
  405635:	48 89 c3             	mov    %rax,%rbx
  405638:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  40563d:	e8 1a d1 ff ff       	callq  40275c <update_bullets>
  405642:	e8 59 eb ff ff       	callq  4041a0 <render_bullets>
  405647:	e8 d4 f7 ff ff       	callq  404e20 <update_powerups>
  40564c:	e8 9f f8 ff ff       	callq  404ef0 <render_leaderboard>
  405651:	4c 8d 05 db 1a 00 00 	lea    0x1adb(%rip),%r8        # 407133 <_IO_stdin_used+0x133>
  405658:	b9 10 00 00 00       	mov    $0x10,%ecx
  40565d:	48 89 ef             	mov    %rbp,%rdi
  405660:	ba 01 00 00 00       	mov    $0x1,%edx
  405665:	be 10 00 00 00       	mov    $0x10,%esi
  40566a:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40566e:	b8 01 00 00 00       	mov    $0x1,%eax
  405673:	f3 0f 5a 05 b5 c0 01 	cvtss2sd 0x1c0b5(%rip),%xmm0        # 421730 <fps>
  40567a:	00 
  40567b:	e8 10 cb ff ff       	callq  402190 <__snprintf_chk@plt>
  405680:	31 c9                	xor    %ecx,%ecx
  405682:	48 8b 3d af c0 01 00 	mov    0x1c0af(%rip),%rdi        # 421738 <renderer>
  405689:	41 b8 ff 00 00 00    	mov    $0xff,%r8d
  40568f:	31 d2                	xor    %edx,%edx
  405691:	be ff 00 00 00       	mov    $0xff,%esi
  405696:	e8 55 cc ff ff       	callq  4022f0 <SDL_SetRenderDrawColor@plt>
  40569b:	48 8b 3d a6 c0 01 00 	mov    0x1c0a6(%rip),%rdi        # 421748 <font_20px>
  4056a2:	31 c9                	xor    %ecx,%ecx
  4056a4:	31 d2                	xor    %edx,%edx
  4056a6:	48 89 ee             	mov    %rbp,%rsi
  4056a9:	e8 32 e1 ff ff       	callq  4037e0 <render_text>
  4056ae:	48 8b 3d 83 c0 01 00 	mov    0x1c083(%rip),%rdi        # 421738 <renderer>
  4056b5:	e8 d6 c9 ff ff       	callq  402090 <SDL_RenderPresent@plt>
  4056ba:	48 89 d8             	mov    %rbx,%rax
  4056bd:	48 2b 05 44 ae 01 00 	sub    0x1ae44(%rip),%rax        # 420508 <last_server_tick_time>
  4056c4:	48 3d 0f 27 00 00    	cmp    $0x270f,%rax
  4056ca:	0f 87 78 07 00 00    	ja     405e48 <handle_events+0xbb8>
  4056d0:	80 7c 24 3b 00       	cmpb   $0x0,0x3b(%rsp)
  4056d5:	0f 85 ad 06 00 00    	jne    405d88 <handle_events+0xaf8>
  4056db:	8b 3d 47 4d 00 00    	mov    0x4d47(%rip),%edi        # 40a428 <socket_fd>
  4056e1:	48 8d 9c 24 e0 00 00 	lea    0xe0(%rsp),%rbx
  4056e8:	00 
  4056e9:	ba 00 10 00 00       	mov    $0x1000,%edx
  4056ee:	48 89 de             	mov    %rbx,%rsi
  4056f1:	e8 0a cc ff ff       	callq  402300 <read@plt>
  4056f6:	49 89 c4             	mov    %rax,%r12
  4056f9:	48 85 c0             	test   %rax,%rax
  4056fc:	0f 88 4e 06 00 00    	js     405d50 <handle_events+0xac0>
  405702:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
  405707:	0f 84 6c 01 00 00    	je     405879 <handle_events+0x5e9>
  40570d:	48 8d 5c 24 68       	lea    0x68(%rsp),%rbx
  405712:	4c 8d 2d 67 1d 00 00 	lea    0x1d67(%rip),%r13        # 407480 <_IO_stdin_used+0x480>
  405719:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405720:	48 89 df             	mov    %rbx,%rdi
  405723:	e8 be cd ff ff       	callq  4024e6 <read_u8>
  405728:	3c 08                	cmp    $0x8,%al
  40572a:	0f 87 43 07 00 00    	ja     405e73 <handle_events+0xbe3>
  405730:	0f b6 c0             	movzbl %al,%eax
  405733:	49 63 44 85 00       	movslq 0x0(%r13,%rax,4),%rax
  405738:	4c 01 e8             	add    %r13,%rax
  40573b:	3e ff e0             	notrack jmpq *%rax
  40573e:	66 90                	xchg   %ax,%ax
  405740:	3d 00 04 00 00       	cmp    $0x400,%eax
  405745:	0f 85 d5 fb ff ff    	jne    405320 <handle_events+0x90>
  40574b:	8b 84 24 94 00 00 00 	mov    0x94(%rsp),%eax
  405752:	89 05 cc 4c 00 00    	mov    %eax,0x4ccc(%rip)        # 40a424 <raw_mouse_x>
  405758:	8b 84 24 98 00 00 00 	mov    0x98(%rsp),%eax
  40575f:	89 05 0b 4d 00 00    	mov    %eax,0x4d0b(%rip)        # 40a470 <raw_mouse_y>
  405765:	e9 b6 fb ff ff       	jmpq   405320 <handle_events+0x90>
  40576a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405770:	8b 84 24 90 00 00 00 	mov    0x90(%rsp),%eax
  405777:	83 f8 16             	cmp    $0x16,%eax
  40577a:	0f 84 50 07 00 00    	je     405ed0 <handle_events+0xc40>
  405780:	77 6e                	ja     4057f0 <handle_events+0x560>
  405782:	83 f8 04             	cmp    $0x4,%eax
  405785:	0f 84 a5 00 00 00    	je     405830 <handle_events+0x5a0>
  40578b:	83 f8 07             	cmp    $0x7,%eax
  40578e:	0f b6 44 24 3c       	movzbl 0x3c(%rsp),%eax
  405793:	41 0f 44 c4          	cmove  %r12d,%eax
  405797:	88 44 24 3c          	mov    %al,0x3c(%rsp)
  40579b:	e9 80 fb ff ff       	jmpq   405320 <handle_events+0x90>
  4057a0:	83 f8 1a             	cmp    $0x1a,%eax
  4057a3:	74 7b                	je     405820 <handle_events+0x590>
  4057a5:	0f b6 74 24 3b       	movzbl 0x3b(%rsp),%esi
  4057aa:	83 f8 2c             	cmp    $0x2c,%eax
  4057ad:	b8 01 00 00 00       	mov    $0x1,%eax
  4057b2:	0f 44 f0             	cmove  %eax,%esi
  4057b5:	40 88 74 24 3b       	mov    %sil,0x3b(%rsp)
  4057ba:	e9 61 fb ff ff       	jmpq   405320 <handle_events+0x90>
  4057bf:	90                   	nop
  4057c0:	48 8b 84 24 e8 10 00 	mov    0x10e8(%rsp),%rax
  4057c7:	00 
  4057c8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4057cf:	00 00 
  4057d1:	0f 85 f8 08 00 00    	jne    4060cf <handle_events+0xe3f>
  4057d7:	48 81 c4 f8 10 00 00 	add    $0x10f8,%rsp
  4057de:	5b                   	pop    %rbx
  4057df:	5d                   	pop    %rbp
  4057e0:	41 5c                	pop    %r12
  4057e2:	41 5d                	pop    %r13
  4057e4:	41 5e                	pop    %r14
  4057e6:	41 5f                	pop    %r15
  4057e8:	c3                   	retq   
  4057e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4057f0:	83 f8 1a             	cmp    $0x1a,%eax
  4057f3:	74 1b                	je     405810 <handle_events+0x580>
  4057f5:	83 f8 2c             	cmp    $0x2c,%eax
  4057f8:	0f b6 44 24 3b       	movzbl 0x3b(%rsp),%eax
  4057fd:	41 0f 44 c4          	cmove  %r12d,%eax
  405801:	88 44 24 3b          	mov    %al,0x3b(%rsp)
  405805:	e9 16 fb ff ff       	jmpq   405320 <handle_events+0x90>
  40580a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405810:	c6 44 24 3d 00       	movb   $0x0,0x3d(%rsp)
  405815:	e9 06 fb ff ff       	jmpq   405320 <handle_events+0x90>
  40581a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405820:	c6 44 24 3d 01       	movb   $0x1,0x3d(%rsp)
  405825:	e9 f6 fa ff ff       	jmpq   405320 <handle_events+0x90>
  40582a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405830:	c6 44 24 3e 00       	movb   $0x0,0x3e(%rsp)
  405835:	e9 e6 fa ff ff       	jmpq   405320 <handle_events+0x90>
  40583a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405840:	c6 44 24 3e 01       	movb   $0x1,0x3e(%rsp)
  405845:	e9 d6 fa ff ff       	jmpq   405320 <handle_events+0x90>
  40584a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405850:	49 83 fc 08          	cmp    $0x8,%r12
  405854:	0f 8e 53 08 00 00    	jle    4060ad <handle_events+0xe1d>
  40585a:	48 89 df             	mov    %rbx,%rdi
  40585d:	49 83 ec 09          	sub    $0x9,%r12
  405861:	e8 b5 cc ff ff       	callq  40251b <read_u64>
  405866:	48 89 c7             	mov    %rax,%rdi
  405869:	e8 44 d0 ff ff       	callq  4028b2 <del_drop_by_id>
  40586e:	66 90                	xchg   %ax,%ax
  405870:	4d 85 e4             	test   %r12,%r12
  405873:	0f 8f a7 fe ff ff    	jg     405720 <handle_events+0x490>
  405879:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  40587e:	31 f6                	xor    %esi,%esi
  405880:	e8 ab ca ff ff       	callq  402330 <gettimeofday@plt>
  405885:	48 8b 15 34 4c 00 00 	mov    0x4c34(%rip),%rdx        # 40a4c0 <frame_times_index>
  40588c:	48 69 44 24 70 40 42 	imul   $0xf4240,0x70(%rsp),%rax
  405893:	0f 00 
  405895:	48 03 44 24 78       	add    0x78(%rsp),%rax
  40589a:	48 83 fa 05          	cmp    $0x5,%rdx
  40589e:	0f 84 6c 06 00 00    	je     405f10 <handle_events+0xc80>
  4058a4:	48 8d 72 ff          	lea    -0x1(%rdx),%rsi
  4058a8:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
  4058ac:	48 8d 0d 8d 4b 00 00 	lea    0x4b8d(%rip),%rcx        # 40a440 <frame_times>
  4058b3:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
  4058b7:	48 89 c2             	mov    %rax,%rdx
  4058ba:	48 2b 14 f1          	sub    (%rcx,%rsi,8),%rdx
  4058be:	0f 88 2c 06 00 00    	js     405ef0 <handle_events+0xc60>
  4058c4:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4058c8:	f3 48 0f 2a c2       	cvtsi2ss %rdx,%xmm0
  4058cd:	48 89 3d ec 4b 00 00 	mov    %rdi,0x4bec(%rip)        # 40a4c0 <frame_times_index>
  4058d4:	8b 3d 66 be 01 00    	mov    0x1be66(%rip),%edi        # 421740 <frame_time_usec>
  4058da:	f3 0f 5e 05 d6 1b 00 	divss  0x1bd6(%rip),%xmm0        # 4074b8 <_IO_stdin_used+0x4b8>
  4058e1:	00 
  4058e2:	48 03 7c 24 48       	add    0x48(%rsp),%rdi
  4058e7:	f3 0f 11 05 19 4b 00 	movss  %xmm0,0x4b19(%rip)        # 40a408 <dt>
  4058ee:	00 
  4058ef:	48 29 c7             	sub    %rax,%rdi
  4058f2:	48 85 ff             	test   %rdi,%rdi
  4058f5:	0f 8e 02 fa ff ff    	jle    4052fd <handle_events+0x6d>
  4058fb:	e8 e0 c9 ff ff       	callq  4022e0 <usleep@plt>
  405900:	e9 f8 f9 ff ff       	jmpq   4052fd <handle_events+0x6d>
  405905:	0f 1f 00             	nopl   (%rax)
  405908:	49 83 fc 08          	cmp    $0x8,%r12
  40590c:	0f 8e 79 07 00 00    	jle    40608b <handle_events+0xdfb>
  405912:	48 89 df             	mov    %rbx,%rdi
  405915:	49 83 ec 09          	sub    $0x9,%r12
  405919:	e8 fd cb ff ff       	callq  40251b <read_u64>
  40591e:	48 89 04 24          	mov    %rax,(%rsp)
  405922:	48 85 c0             	test   %rax,%rax
  405925:	0f 84 45 ff ff ff    	je     405870 <handle_events+0x5e0>
  40592b:	45 31 ff             	xor    %r15d,%r15d
  40592e:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  405933:	4d 89 fc             	mov    %r15,%r12
  405936:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40593d:	00 00 00 
  405940:	48 89 df             	mov    %rbx,%rdi
  405943:	49 83 c4 01          	add    $0x1,%r12
  405947:	e8 be cb ff ff       	callq  40250a <read_u32>
  40594c:	48 89 df             	mov    %rbx,%rdi
  40594f:	41 89 c6             	mov    %eax,%r14d
  405952:	e8 b3 cb ff ff       	callq  40250a <read_u32>
  405957:	48 89 df             	mov    %rbx,%rdi
  40595a:	41 89 c7             	mov    %eax,%r15d
  40595d:	e8 84 cb ff ff       	callq  4024e6 <read_u8>
  405962:	48 89 df             	mov    %rbx,%rdi
  405965:	89 c5                	mov    %eax,%ebp
  405967:	e8 af cb ff ff       	callq  40251b <read_u64>
  40596c:	40 0f b6 d5          	movzbl %bpl,%edx
  405970:	44 89 fe             	mov    %r15d,%esi
  405973:	44 89 f7             	mov    %r14d,%edi
  405976:	48 89 c1             	mov    %rax,%rcx
  405979:	e8 b2 ce ff ff       	callq  402830 <add_drop>
  40597e:	4c 39 24 24          	cmp    %r12,(%rsp)
  405982:	75 bc                	jne    405940 <handle_events+0x6b0>
  405984:	48 8b 34 24          	mov    (%rsp),%rsi
  405988:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
  40598d:	48 89 f0             	mov    %rsi,%rax
  405990:	48 f7 d8             	neg    %rax
  405993:	48 c1 e0 04          	shl    $0x4,%rax
  405997:	48 29 f0             	sub    %rsi,%rax
  40599a:	49 01 c4             	add    %rax,%r12
  40599d:	e9 ce fe ff ff       	jmpq   405870 <handle_events+0x5e0>
  4059a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4059a8:	49 83 fc 08          	cmp    $0x8,%r12
  4059ac:	0f 8e b7 06 00 00    	jle    406069 <handle_events+0xdd9>
  4059b2:	48 89 df             	mov    %rbx,%rdi
  4059b5:	49 83 ec 09          	sub    $0x9,%r12
  4059b9:	e8 6e cb ff ff       	callq  40252c <read_f32>
  4059be:	48 8d 05 1b ab 01 00 	lea    0x1ab1b(%rip),%rax        # 4204e0 <player>
  4059c5:	48 89 df             	mov    %rbx,%rdi
  4059c8:	f3 0f 11 00          	movss  %xmm0,(%rax)
  4059cc:	e8 5b cb ff ff       	callq  40252c <read_f32>
  4059d1:	c6 05 14 ab 01 00 ff 	movb   $0xff,0x1ab14(%rip)        # 4204ec <player+0xc>
  4059d8:	f3 0f 11 05 04 ab 01 	movss  %xmm0,0x1ab04(%rip)        # 4204e4 <player+0x4>
  4059df:	00 
  4059e0:	e9 8b fe ff ff       	jmpq   405870 <handle_events+0x5e0>
  4059e5:	0f 1f 00             	nopl   (%rax)
  4059e8:	c6 05 fd aa 01 00 00 	movb   $0x0,0x1aafd(%rip)        # 4204ec <player+0xc>
  4059ef:	49 83 ec 01          	sub    $0x1,%r12
  4059f3:	e9 78 fe ff ff       	jmpq   405870 <handle_events+0x5e0>
  4059f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4059ff:	00 
  405a00:	49 83 fc 08          	cmp    $0x8,%r12
  405a04:	0f 8e 3d 06 00 00    	jle    406047 <handle_events+0xdb7>
  405a0a:	48 89 df             	mov    %rbx,%rdi
  405a0d:	45 31 f6             	xor    %r14d,%r14d
  405a10:	e8 06 cb ff ff       	callq  40251b <read_u64>
  405a15:	48 89 c5             	mov    %rax,%rbp
  405a18:	48 85 c0             	test   %rax,%rax
  405a1b:	74 1c                	je     405a39 <handle_events+0x7a9>
  405a1d:	0f 1f 00             	nopl   (%rax)
  405a20:	48 89 df             	mov    %rbx,%rdi
  405a23:	49 83 c6 01          	add    $0x1,%r14
  405a27:	e8 ef ca ff ff       	callq  40251b <read_u64>
  405a2c:	48 89 c7             	mov    %rax,%rdi
  405a2f:	e8 f7 cc ff ff       	callq  40272b <del_bullet_by_id>
  405a34:	4c 39 f5             	cmp    %r14,%rbp
  405a37:	75 e7                	jne    405a20 <handle_events+0x790>
  405a39:	49 83 ec 09          	sub    $0x9,%r12
  405a3d:	48 c1 e5 03          	shl    $0x3,%rbp
  405a41:	49 29 ec             	sub    %rbp,%r12
  405a44:	e9 27 fe ff ff       	jmpq   405870 <handle_events+0x5e0>
  405a49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405a50:	49 83 fc 1d          	cmp    $0x1d,%r12
  405a54:	0f 8e cb 05 00 00    	jle    406025 <handle_events+0xd95>
  405a5a:	48 89 df             	mov    %rbx,%rdi
  405a5d:	49 83 ec 1e          	sub    $0x1e,%r12
  405a61:	e8 b5 ca ff ff       	callq  40251b <read_u64>
  405a66:	48 89 df             	mov    %rbx,%rdi
  405a69:	49 89 c6             	mov    %rax,%r14
  405a6c:	e8 bb ca ff ff       	callq  40252c <read_f32>
  405a71:	48 89 df             	mov    %rbx,%rdi
  405a74:	f3 0f 11 44 24 14    	movss  %xmm0,0x14(%rsp)
  405a7a:	e8 ad ca ff ff       	callq  40252c <read_f32>
  405a7f:	48 89 df             	mov    %rbx,%rdi
  405a82:	f3 0f 11 44 24 10    	movss  %xmm0,0x10(%rsp)
  405a88:	e8 9f ca ff ff       	callq  40252c <read_f32>
  405a8d:	48 89 df             	mov    %rbx,%rdi
  405a90:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%rsp)
  405a96:	e8 4b ca ff ff       	callq  4024e6 <read_u8>
  405a9b:	48 89 df             	mov    %rbx,%rdi
  405a9e:	89 c5                	mov    %eax,%ebp
  405aa0:	e8 87 ca ff ff       	callq  40252c <read_f32>
  405aa5:	48 89 df             	mov    %rbx,%rdi
  405aa8:	f3 0f 11 04 24       	movss  %xmm0,(%rsp)
  405aad:	e8 58 ca ff ff       	callq  40250a <read_u32>
  405ab2:	f3 0f 10 64 24 14    	movss  0x14(%rsp),%xmm4
  405ab8:	f3 0f 10 1c 24       	movss  (%rsp),%xmm3
  405abd:	40 0f b6 f5          	movzbl %bpl,%esi
  405ac1:	f3 0f 10 54 24 08    	movss  0x8(%rsp),%xmm2
  405ac7:	f3 0f 10 4c 24 10    	movss  0x10(%rsp),%xmm1
  405acd:	89 c2                	mov    %eax,%edx
  405acf:	4c 89 f7             	mov    %r14,%rdi
  405ad2:	0f 28 c4             	movaps %xmm4,%xmm0
  405ad5:	e8 f0 cb ff ff       	callq  4026ca <add_bullet>
  405ada:	e9 91 fd ff ff       	jmpq   405870 <handle_events+0x5e0>
  405adf:	90                   	nop
  405ae0:	49 83 fc 04          	cmp    $0x4,%r12
  405ae4:	0f 8e 19 05 00 00    	jle    406003 <handle_events+0xd73>
  405aea:	48 89 df             	mov    %rbx,%rdi
  405aed:	49 83 ec 05          	sub    $0x5,%r12
  405af1:	e8 f0 c9 ff ff       	callq  4024e6 <read_u8>
  405af6:	48 89 df             	mov    %rbx,%rdi
  405af9:	88 05 ed a9 01 00    	mov    %al,0x1a9ed(%rip)        # 4204ec <player+0xc>
  405aff:	e8 f4 c9 ff ff       	callq  4024f8 <read_u16>
  405b04:	48 89 df             	mov    %rbx,%rdi
  405b07:	66 89 05 f0 a9 01 00 	mov    %ax,0x1a9f0(%rip)        # 4204fe <player+0x1e>
  405b0e:	e8 d3 c9 ff ff       	callq  4024e6 <read_u8>
  405b13:	c6 05 df 48 00 00 00 	movb   $0x0,0x48df(%rip)        # 40a3f9 <num_other_players>
  405b1a:	88 44 24 3a          	mov    %al,0x3a(%rsp)
  405b1e:	84 c0                	test   %al,%al
  405b20:	0f 84 4a fd ff ff    	je     405870 <handle_events+0x5e0>
  405b26:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
  405b2b:	45 31 ff             	xor    %r15d,%r15d
  405b2e:	4c 8d b4 24 c1 00 00 	lea    0xc1(%rsp),%r14
  405b35:	00 
  405b36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  405b3d:	00 00 00 
  405b40:	48 89 df             	mov    %rbx,%rdi
  405b43:	41 83 c7 01          	add    $0x1,%r15d
  405b47:	e8 e0 c9 ff ff       	callq  40252c <read_f32>
  405b4c:	48 89 df             	mov    %rbx,%rdi
  405b4f:	f3 0f 11 44 24 1c    	movss  %xmm0,0x1c(%rsp)
  405b55:	e8 d2 c9 ff ff       	callq  40252c <read_f32>
  405b5a:	48 89 df             	mov    %rbx,%rdi
  405b5d:	f3 0f 11 44 24 18    	movss  %xmm0,0x18(%rsp)
  405b63:	e8 c4 c9 ff ff       	callq  40252c <read_f32>
  405b68:	48 89 df             	mov    %rbx,%rdi
  405b6b:	f3 0f 11 44 24 14    	movss  %xmm0,0x14(%rsp)
  405b71:	e8 70 c9 ff ff       	callq  4024e6 <read_u8>
  405b76:	48 89 df             	mov    %rbx,%rdi
  405b79:	88 44 24 10          	mov    %al,0x10(%rsp)
  405b7d:	e8 76 c9 ff ff       	callq  4024f8 <read_u16>
  405b82:	48 89 df             	mov    %rbx,%rdi
  405b85:	41 89 c2             	mov    %eax,%r10d
  405b88:	44 89 54 24 08       	mov    %r10d,0x8(%rsp)
  405b8d:	e8 54 c9 ff ff       	callq  4024e6 <read_u8>
  405b92:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
  405b97:	b9 0f 00 00 00       	mov    $0xf,%ecx
  405b9c:	4c 89 f7             	mov    %r14,%rdi
  405b9f:	0f b6 d0             	movzbl %al,%edx
  405ba2:	49 89 d4             	mov    %rdx,%r12
  405ba5:	48 89 ee             	mov    %rbp,%rsi
  405ba8:	48 89 14 24          	mov    %rdx,(%rsp)
  405bac:	e8 af c5 ff ff       	callq  402160 <__strncpy_chk@plt>
  405bb1:	48 8b 14 24          	mov    (%rsp),%rdx
  405bb5:	41 0f b6 c4          	movzbl %r12b,%eax
  405bb9:	4c 89 f6             	mov    %r14,%rsi
  405bbc:	48 83 c0 10          	add    $0x10,%rax
  405bc0:	48 29 44 24 20       	sub    %rax,0x20(%rsp)
  405bc5:	0f b6 05 2d 48 00 00 	movzbl 0x482d(%rip),%eax        # 40a3f9 <num_other_players>
  405bcc:	48 8d 0d 2d 89 01 00 	lea    0x1892d(%rip),%rcx        # 41e500 <other_players>
  405bd3:	48 01 d5             	add    %rdx,%rbp
  405bd6:	f3 0f 10 54 24 1c    	movss  0x1c(%rsp),%xmm2
  405bdc:	44 8b 54 24 08       	mov    0x8(%rsp),%r10d
  405be1:	48 89 6c 24 68       	mov    %rbp,0x68(%rsp)
  405be6:	f3 0f 10 4c 24 18    	movss  0x18(%rsp),%xmm1
  405bec:	48 89 c5             	mov    %rax,%rbp
  405bef:	48 c1 e0 05          	shl    $0x5,%rax
  405bf3:	f3 0f 10 44 24 14    	movss  0x14(%rsp),%xmm0
  405bf9:	44 0f b6 4c 24 10    	movzbl 0x10(%rsp),%r9d
  405bff:	48 01 c8             	add    %rcx,%rax
  405c02:	66 44 89 50 1e       	mov    %r10w,0x1e(%rax)
  405c07:	44 88 48 0c          	mov    %r9b,0xc(%rax)
  405c0b:	44 88 60 0d          	mov    %r12b,0xd(%rax)
  405c0f:	f3 0f 11 10          	movss  %xmm2,(%rax)
  405c13:	f3 0f 11 48 04       	movss  %xmm1,0x4(%rax)
  405c18:	f3 0f 11 40 08       	movss  %xmm0,0x8(%rax)
  405c1d:	40 0f b6 c5          	movzbl %bpl,%eax
  405c21:	83 c5 01             	add    $0x1,%ebp
  405c24:	48 c1 e0 05          	shl    $0x5,%rax
  405c28:	48 8d 7c 01 0e       	lea    0xe(%rcx,%rax,1),%rdi
  405c2d:	b9 0f 00 00 00       	mov    $0xf,%ecx
  405c32:	e8 29 c5 ff ff       	callq  402160 <__strncpy_chk@plt>
  405c37:	40 88 2d bb 47 00 00 	mov    %bpl,0x47bb(%rip)        # 40a3f9 <num_other_players>
  405c3e:	44 38 7c 24 3a       	cmp    %r15b,0x3a(%rsp)
  405c43:	0f 85 f7 fe ff ff    	jne    405b40 <handle_events+0x8b0>
  405c49:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
  405c4e:	e9 1d fc ff ff       	jmpq   405870 <handle_events+0x5e0>
  405c53:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  405c58:	49 83 fc 04          	cmp    $0x4,%r12
  405c5c:	0f 8e 7f 03 00 00    	jle    405fe1 <handle_events+0xd51>
  405c62:	48 89 df             	mov    %rbx,%rdi
  405c65:	49 83 ec 05          	sub    $0x5,%r12
  405c69:	e8 9c c8 ff ff       	callq  40250a <read_u32>
  405c6e:	89 05 9c a8 01 00    	mov    %eax,0x1a89c(%rip)        # 420510 <client_id>
  405c74:	e9 f7 fb ff ff       	jmpq   405870 <handle_events+0x5e0>
  405c79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405c80:	49 83 fc 01          	cmp    $0x1,%r12
  405c84:	0f 84 33 03 00 00    	je     405fbd <handle_events+0xd2d>
  405c8a:	48 89 df             	mov    %rbx,%rdi
  405c8d:	e8 54 c8 ff ff       	callq  4024e6 <read_u8>
  405c92:	44 0f b6 f0          	movzbl %al,%r14d
  405c96:	48 8b 05 53 47 00 00 	mov    0x4753(%rip),%rax        # 40a3f0 <n_powerups>
  405c9d:	48 85 c0             	test   %rax,%rax
  405ca0:	74 52                	je     405cf4 <handle_events+0xa64>
  405ca2:	48 8d 35 d7 47 00 00 	lea    0x47d7(%rip),%rsi        # 40a480 <powerups>
  405ca9:	44 3b 36             	cmp    (%rsi),%r14d
  405cac:	0f 84 f0 02 00 00    	je     405fa2 <handle_events+0xd12>
  405cb2:	48 83 f8 01          	cmp    $0x1,%rax
  405cb6:	0f 86 ed 02 00 00    	jbe    405fa9 <handle_events+0xd19>
  405cbc:	44 3b 35 cd 47 00 00 	cmp    0x47cd(%rip),%r14d        # 40a490 <powerups+0x10>
  405cc3:	0f 84 ea 02 00 00    	je     405fb3 <handle_events+0xd23>
  405cc9:	48 83 f8 02          	cmp    $0x2,%rax
  405ccd:	74 25                	je     405cf4 <handle_events+0xa64>
  405ccf:	44 3b 35 ca 47 00 00 	cmp    0x47ca(%rip),%r14d        # 40a4a0 <powerups+0x20>
  405cd6:	0f 84 bc 01 00 00    	je     405e98 <handle_events+0xc08>
  405cdc:	48 83 f8 03          	cmp    $0x3,%rax
  405ce0:	74 12                	je     405cf4 <handle_events+0xa64>
  405ce2:	44 3b 35 c7 47 00 00 	cmp    0x47c7(%rip),%r14d        # 40a4b0 <powerups+0x30>
  405ce9:	bd 03 00 00 00       	mov    $0x3,%ebp
  405cee:	0f 84 a9 01 00 00    	je     405e9d <handle_events+0xc0d>
  405cf4:	48 c1 e0 04          	shl    $0x4,%rax
  405cf8:	48 8d 35 81 47 00 00 	lea    0x4781(%rip),%rsi        # 40a480 <powerups>
  405cff:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  405d04:	48 8d 2c 06          	lea    (%rsi,%rax,1),%rbp
  405d08:	31 f6                	xor    %esi,%esi
  405d0a:	44 89 75 00          	mov    %r14d,0x0(%rbp)
  405d0e:	e8 1d c6 ff ff       	callq  402330 <gettimeofday@plt>
  405d13:	48 83 05 d5 46 00 00 	addq   $0x1,0x46d5(%rip)        # 40a3f0 <n_powerups>
  405d1a:	01 
  405d1b:	48 69 44 24 70 40 42 	imul   $0xf4240,0x70(%rsp),%rax
  405d22:	0f 00 
  405d24:	48 03 44 24 78       	add    0x78(%rsp),%rax
  405d29:	48 89 45 08          	mov    %rax,0x8(%rbp)
  405d2d:	41 83 fe 03          	cmp    $0x3,%r14d
  405d31:	75 0d                	jne    405d40 <handle_events+0xab0>
  405d33:	c6 05 be 46 00 00 01 	movb   $0x1,0x46be(%rip)        # 40a3f8 <super_speed_enabled>
  405d3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405d40:	49 83 ec 02          	sub    $0x2,%r12
  405d44:	e9 27 fb ff ff       	jmpq   405870 <handle_events+0x5e0>
  405d49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405d50:	e8 fb c2 ff ff       	callq  402050 <__errno_location@plt>
  405d55:	83 38 0b             	cmpl   $0xb,(%rax)
  405d58:	0f 84 3a 02 00 00    	je     405f98 <handle_events+0xd08>
  405d5e:	48 8b 0d 7b 46 00 00 	mov    0x467b(%rip),%rcx        # 40a3e0 <stderr@@GLIBC_2.2.5>
  405d65:	ba 20 00 00 00       	mov    $0x20,%edx
  405d6a:	be 01 00 00 00       	mov    $0x1,%esi
  405d6f:	48 8d 3d 92 14 00 00 	lea    0x1492(%rip),%rdi        # 407208 <_IO_stdin_used+0x208>
  405d76:	e8 f5 c5 ff ff       	callq  402370 <fwrite@plt>
  405d7b:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
  405d80:	e9 f4 fa ff ff       	jmpq   405879 <handle_events+0x5e9>
  405d85:	0f 1f 00             	nopl   (%rax)
  405d88:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  405d8d:	31 f6                	xor    %esi,%esi
  405d8f:	e8 9c c5 ff ff       	callq  402330 <gettimeofday@plt>
  405d94:	48 69 44 24 70 40 42 	imul   $0xf4240,0x70(%rsp),%rax
  405d9b:	0f 00 
  405d9d:	48 03 44 24 78       	add    0x78(%rsp),%rax
  405da2:	48 2b 44 24 40       	sub    0x40(%rsp),%rax
  405da7:	48 3d 9f 86 01 00    	cmp    $0x1869f,%rax
  405dad:	0f 86 28 f9 ff ff    	jbe    4056db <handle_events+0x44b>
  405db3:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  405db8:	f3 0f 10 15 28 a7 01 	movss  0x1a728(%rip),%xmm2        # 4204e8 <player+0x8>
  405dbf:	00 
  405dc0:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  405dc5:	66 0f ef c0          	pxor   %xmm0,%xmm0
  405dc9:	f3 0f 5a c2          	cvtss2sd %xmm2,%xmm0
  405dcd:	f3 0f 11 14 24       	movss  %xmm2,(%rsp)
  405dd2:	e8 c9 c3 ff ff       	callq  4021a0 <sincos@plt>
  405dd7:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
  405ddd:	66 0f ef c9          	pxor   %xmm1,%xmm1
  405de1:	f2 0f 10 1d c7 16 00 	movsd  0x16c7(%rip),%xmm3        # 4074b0 <_IO_stdin_used+0x4b0>
  405de8:	00 
  405de9:	f3 0f 5a 0d f3 a6 01 	cvtss2sd 0x1a6f3(%rip),%xmm1        # 4204e4 <player+0x4>
  405df0:	00 
  405df1:	f3 0f 10 14 24       	movss  (%rsp),%xmm2
  405df6:	f2 0f 59 c3          	mulsd  %xmm3,%xmm0
  405dfa:	f2 0f 59 5c 24 50    	mulsd  0x50(%rsp),%xmm3
  405e00:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
  405e04:	66 0f ef c0          	pxor   %xmm0,%xmm0
  405e08:	f3 0f 5a 05 d0 a6 01 	cvtss2sd 0x1a6d0(%rip),%xmm0        # 4204e0 <player>
  405e0f:	00 
  405e10:	f2 0f 58 c3          	addsd  %xmm3,%xmm0
  405e14:	f2 0f 5a c9          	cvtsd2ss %xmm1,%xmm1
  405e18:	f2 0f 5a c0          	cvtsd2ss %xmm0,%xmm0
  405e1c:	e8 1f e5 ff ff       	callq  404340 <send_bullet>
  405e21:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  405e26:	31 f6                	xor    %esi,%esi
  405e28:	e8 03 c5 ff ff       	callq  402330 <gettimeofday@plt>
  405e2d:	48 69 44 24 70 40 42 	imul   $0xf4240,0x70(%rsp),%rax
  405e34:	0f 00 
  405e36:	48 03 44 24 78       	add    0x78(%rsp),%rax
  405e3b:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  405e40:	e9 96 f8 ff ff       	jmpq   4056db <handle_events+0x44b>
  405e45:	0f 1f 00             	nopl   (%rax)
  405e48:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  405e4d:	31 f6                	xor    %esi,%esi
  405e4f:	e8 dc c4 ff ff       	callq  402330 <gettimeofday@plt>
  405e54:	48 69 44 24 70 40 42 	imul   $0xf4240,0x70(%rsp),%rax
  405e5b:	0f 00 
  405e5d:	48 03 44 24 78       	add    0x78(%rsp),%rax
  405e62:	48 89 05 9f a6 01 00 	mov    %rax,0x1a69f(%rip)        # 420508 <last_server_tick_time>
  405e69:	e8 22 e8 ff ff       	callq  404690 <send_position_tick>
  405e6e:	e9 5d f8 ff ff       	jmpq   4056d0 <handle_events+0x440>
  405e73:	48 8b 3d 66 45 00 00 	mov    0x4566(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  405e7a:	0f b6 c8             	movzbl %al,%ecx
  405e7d:	4d 89 e0             	mov    %r12,%r8
  405e80:	31 c0                	xor    %eax,%eax
  405e82:	48 8d 15 b7 15 00 00 	lea    0x15b7(%rip),%rdx        # 407440 <_IO_stdin_used+0x440>
  405e89:	be 01 00 00 00       	mov    $0x1,%esi
  405e8e:	e8 ad c4 ff ff       	callq  402340 <__fprintf_chk@plt>
  405e93:	e9 88 f8 ff ff       	jmpq   405720 <handle_events+0x490>
  405e98:	bd 02 00 00 00       	mov    $0x2,%ebp
  405e9d:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  405ea2:	31 f6                	xor    %esi,%esi
  405ea4:	e8 87 c4 ff ff       	callq  402330 <gettimeofday@plt>
  405ea9:	48 89 ea             	mov    %rbp,%rdx
  405eac:	48 8d 35 cd 45 00 00 	lea    0x45cd(%rip),%rsi        # 40a480 <powerups>
  405eb3:	48 69 44 24 70 40 42 	imul   $0xf4240,0x70(%rsp),%rax
  405eba:	0f 00 
  405ebc:	48 c1 e2 04          	shl    $0x4,%rdx
  405ec0:	48 03 44 24 78       	add    0x78(%rsp),%rax
  405ec5:	48 89 44 16 08       	mov    %rax,0x8(%rsi,%rdx,1)
  405eca:	e9 71 fe ff ff       	jmpq   405d40 <handle_events+0xab0>
  405ecf:	90                   	nop
  405ed0:	c6 44 24 3f 00       	movb   $0x0,0x3f(%rsp)
  405ed5:	e9 46 f4 ff ff       	jmpq   405320 <handle_events+0x90>
  405eda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405ee0:	c6 44 24 3f 01       	movb   $0x1,0x3f(%rsp)
  405ee5:	e9 36 f4 ff ff       	jmpq   405320 <handle_events+0x90>
  405eea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405ef0:	48 89 d1             	mov    %rdx,%rcx
  405ef3:	83 e2 01             	and    $0x1,%edx
  405ef6:	66 0f ef c0          	pxor   %xmm0,%xmm0
  405efa:	48 d1 e9             	shr    %rcx
  405efd:	48 09 d1             	or     %rdx,%rcx
  405f00:	f3 48 0f 2a c1       	cvtsi2ss %rcx,%xmm0
  405f05:	f3 0f 58 c0          	addss  %xmm0,%xmm0
  405f09:	e9 bf f9 ff ff       	jmpq   4058cd <handle_events+0x63d>
  405f0e:	66 90                	xchg   %ax,%ax
  405f10:	48 8b 35 49 45 00 00 	mov    0x4549(%rip),%rsi        # 40a460 <frame_times+0x20>
  405f17:	66 0f ef c9          	pxor   %xmm1,%xmm1
  405f1b:	f2 0f 10 05 85 15 00 	movsd  0x1585(%rip),%xmm0        # 4074a8 <_IO_stdin_used+0x4a8>
  405f22:	00 
  405f23:	48 8d 0d 16 45 00 00 	lea    0x4516(%rip),%rcx        # 40a440 <frame_times>
  405f2a:	bf 02 00 00 00       	mov    $0x2,%edi
  405f2f:	48 89 f2             	mov    %rsi,%rdx
  405f32:	48 2b 15 07 45 00 00 	sub    0x4507(%rip),%rdx        # 40a440 <frame_times>
  405f39:	48 89 35 00 45 00 00 	mov    %rsi,0x4500(%rip)        # 40a440 <frame_times>
  405f40:	31 f6                	xor    %esi,%esi
  405f42:	48 c1 ea 02          	shr    $0x2,%rdx
  405f46:	f2 48 0f 2a ca       	cvtsi2sd %rdx,%xmm1
  405f4b:	ba 01 00 00 00       	mov    $0x1,%edx
  405f50:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  405f54:	f2 0f 5a c0          	cvtsd2ss %xmm0,%xmm0
  405f58:	f3 0f 11 05 d0 b7 01 	movss  %xmm0,0x1b7d0(%rip)        # 421730 <fps>
  405f5f:	00 
  405f60:	e9 4e f9 ff ff       	jmpq   4058b3 <handle_events+0x623>
  405f65:	c7 05 75 a5 01 00 00 	movl   $0x0,0x1a575(%rip)        # 4204e4 <player+0x4>
  405f6c:	00 00 00 
  405f6f:	e9 0e f6 ff ff       	jmpq   405582 <handle_events+0x2f2>
  405f74:	c7 05 62 a5 01 00 00 	movl   $0x0,0x1a562(%rip)        # 4204e0 <player>
  405f7b:	00 00 00 
  405f7e:	e9 df f5 ff ff       	jmpq   405562 <handle_events+0x2d2>
  405f83:	f3 0f 10 05 39 15 00 	movss  0x1539(%rip),%xmm0        # 4074c4 <_IO_stdin_used+0x4c4>
  405f8a:	00 
  405f8b:	f3 0f 10 1d 35 15 00 	movss  0x1535(%rip),%xmm3        # 4074c8 <_IO_stdin_used+0x4c8>
  405f92:	00 
  405f93:	e9 47 f5 ff ff       	jmpq   4054df <handle_events+0x24f>
  405f98:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
  405f9d:	e9 d7 f8 ff ff       	jmpq   405879 <handle_events+0x5e9>
  405fa2:	31 ed                	xor    %ebp,%ebp
  405fa4:	e9 f4 fe ff ff       	jmpq   405e9d <handle_events+0xc0d>
  405fa9:	b8 01 00 00 00       	mov    $0x1,%eax
  405fae:	e9 41 fd ff ff       	jmpq   405cf4 <handle_events+0xa64>
  405fb3:	bd 01 00 00 00       	mov    $0x1,%ebp
  405fb8:	e9 e0 fe ff ff       	jmpq   405e9d <handle_events+0xc0d>
  405fbd:	48 8b 3d 1c 44 00 00 	mov    0x441c(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  405fc4:	b9 01 00 00 00       	mov    $0x1,%ecx
  405fc9:	48 8d 15 38 14 00 00 	lea    0x1438(%rip),%rdx        # 407408 <_IO_stdin_used+0x408>
  405fd0:	31 c0                	xor    %eax,%eax
  405fd2:	be 01 00 00 00       	mov    $0x1,%esi
  405fd7:	e8 64 c3 ff ff       	callq  402340 <__fprintf_chk@plt>
  405fdc:	e9 98 f8 ff ff       	jmpq   405879 <handle_events+0x5e9>
  405fe1:	48 8b 3d f8 43 00 00 	mov    0x43f8(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  405fe8:	4c 89 e1             	mov    %r12,%rcx
  405feb:	be 01 00 00 00       	mov    $0x1,%esi
  405ff0:	31 c0                	xor    %eax,%eax
  405ff2:	48 8d 15 5f 12 00 00 	lea    0x125f(%rip),%rdx        # 407258 <_IO_stdin_used+0x258>
  405ff9:	e8 42 c3 ff ff       	callq  402340 <__fprintf_chk@plt>
  405ffe:	e9 76 f8 ff ff       	jmpq   405879 <handle_events+0x5e9>
  406003:	48 8b 3d d6 43 00 00 	mov    0x43d6(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  40600a:	4c 89 e1             	mov    %r12,%rcx
  40600d:	be 01 00 00 00       	mov    $0x1,%esi
  406012:	31 c0                	xor    %eax,%eax
  406014:	48 8d 15 75 12 00 00 	lea    0x1275(%rip),%rdx        # 407290 <_IO_stdin_used+0x290>
  40601b:	e8 20 c3 ff ff       	callq  402340 <__fprintf_chk@plt>
  406020:	e9 54 f8 ff ff       	jmpq   405879 <handle_events+0x5e9>
  406025:	48 8b 3d b4 43 00 00 	mov    0x43b4(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  40602c:	4c 89 e1             	mov    %r12,%rcx
  40602f:	be 01 00 00 00       	mov    $0x1,%esi
  406034:	31 c0                	xor    %eax,%eax
  406036:	48 8d 15 93 12 00 00 	lea    0x1293(%rip),%rdx        # 4072d0 <_IO_stdin_used+0x2d0>
  40603d:	e8 fe c2 ff ff       	callq  402340 <__fprintf_chk@plt>
  406042:	e9 32 f8 ff ff       	jmpq   405879 <handle_events+0x5e9>
  406047:	48 8b 3d 92 43 00 00 	mov    0x4392(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  40604e:	4c 89 e1             	mov    %r12,%rcx
  406051:	be 01 00 00 00       	mov    $0x1,%esi
  406056:	31 c0                	xor    %eax,%eax
  406058:	48 8d 15 b1 12 00 00 	lea    0x12b1(%rip),%rdx        # 407310 <_IO_stdin_used+0x310>
  40605f:	e8 dc c2 ff ff       	callq  402340 <__fprintf_chk@plt>
  406064:	e9 10 f8 ff ff       	jmpq   405879 <handle_events+0x5e9>
  406069:	48 8b 3d 70 43 00 00 	mov    0x4370(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  406070:	4c 89 e1             	mov    %r12,%rcx
  406073:	be 01 00 00 00       	mov    $0x1,%esi
  406078:	31 c0                	xor    %eax,%eax
  40607a:	48 8d 15 cf 12 00 00 	lea    0x12cf(%rip),%rdx        # 407350 <_IO_stdin_used+0x350>
  406081:	e8 ba c2 ff ff       	callq  402340 <__fprintf_chk@plt>
  406086:	e9 ee f7 ff ff       	jmpq   405879 <handle_events+0x5e9>
  40608b:	48 8b 3d 4e 43 00 00 	mov    0x434e(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  406092:	4c 89 e1             	mov    %r12,%rcx
  406095:	be 01 00 00 00       	mov    $0x1,%esi
  40609a:	31 c0                	xor    %eax,%eax
  40609c:	48 8d 15 e5 12 00 00 	lea    0x12e5(%rip),%rdx        # 407388 <_IO_stdin_used+0x388>
  4060a3:	e8 98 c2 ff ff       	callq  402340 <__fprintf_chk@plt>
  4060a8:	e9 cc f7 ff ff       	jmpq   405879 <handle_events+0x5e9>
  4060ad:	48 8b 3d 2c 43 00 00 	mov    0x432c(%rip),%rdi        # 40a3e0 <stderr@@GLIBC_2.2.5>
  4060b4:	4c 89 e1             	mov    %r12,%rcx
  4060b7:	be 01 00 00 00       	mov    $0x1,%esi
  4060bc:	31 c0                	xor    %eax,%eax
  4060be:	48 8d 15 03 13 00 00 	lea    0x1303(%rip),%rdx        # 4073c8 <_IO_stdin_used+0x3c8>
  4060c5:	e8 76 c2 ff ff       	callq  402340 <__fprintf_chk@plt>
  4060ca:	e9 aa f7 ff ff       	jmpq   405879 <handle_events+0x5e9>
  4060cf:	e8 7c c1 ff ff       	callq  402250 <__stack_chk_fail@plt>
  4060d4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4060db:	00 00 00 
  4060de:	66 90                	xchg   %ax,%ax

00000000004060e0 <__libc_csu_init>:
  4060e0:	f3 0f 1e fa          	endbr64 
  4060e4:	41 57                	push   %r15
  4060e6:	4c 8d 3d f3 3c 00 00 	lea    0x3cf3(%rip),%r15        # 409de0 <__frame_dummy_init_array_entry>
  4060ed:	41 56                	push   %r14
  4060ef:	49 89 d6             	mov    %rdx,%r14
  4060f2:	41 55                	push   %r13
  4060f4:	49 89 f5             	mov    %rsi,%r13
  4060f7:	41 54                	push   %r12
  4060f9:	41 89 fc             	mov    %edi,%r12d
  4060fc:	55                   	push   %rbp
  4060fd:	48 8d 2d e4 3c 00 00 	lea    0x3ce4(%rip),%rbp        # 409de8 <__do_global_dtors_aux_fini_array_entry>
  406104:	53                   	push   %rbx
  406105:	4c 29 fd             	sub    %r15,%rbp
  406108:	48 83 ec 08          	sub    $0x8,%rsp
  40610c:	e8 ef be ff ff       	callq  402000 <_init>
  406111:	48 c1 fd 03          	sar    $0x3,%rbp
  406115:	74 1f                	je     406136 <__libc_csu_init+0x56>
  406117:	31 db                	xor    %ebx,%ebx
  406119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  406120:	4c 89 f2             	mov    %r14,%rdx
  406123:	4c 89 ee             	mov    %r13,%rsi
  406126:	44 89 e7             	mov    %r12d,%edi
  406129:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  40612d:	48 83 c3 01          	add    $0x1,%rbx
  406131:	48 39 dd             	cmp    %rbx,%rbp
  406134:	75 ea                	jne    406120 <__libc_csu_init+0x40>
  406136:	48 83 c4 08          	add    $0x8,%rsp
  40613a:	5b                   	pop    %rbx
  40613b:	5d                   	pop    %rbp
  40613c:	41 5c                	pop    %r12
  40613e:	41 5d                	pop    %r13
  406140:	41 5e                	pop    %r14
  406142:	41 5f                	pop    %r15
  406144:	c3                   	retq   
  406145:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40614c:	00 00 00 00 

0000000000406150 <__libc_csu_fini>:
  406150:	f3 0f 1e fa          	endbr64 
  406154:	c3                   	retq   

Disassembly of section .fini:

0000000000406158 <_fini>:
  406158:	f3 0f 1e fa          	endbr64 
  40615c:	48 83 ec 08          	sub    $0x8,%rsp
  406160:	48 83 c4 08          	add    $0x8,%rsp
  406164:	c3                   	retq   
