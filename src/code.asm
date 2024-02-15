  include "_defines_h.asm"
  include "../zx-core/libs/defines_h.asm"
  include "../zx-core/libs/im2/im2_lite_h.asm"

  ; define SHOW_START_MENU

start:
  DI

  XOR A
  OUT (#FE),A
  LD A, %00000100
  CALL SCREEN_SET_COLORS

  IM2_INIT INT_TABLE_HIGH

init:  
  IFDEF SHOW_START_MENU

  LD SP, STACK_TOP
	LD DE, #4000
	LD HL, HELLO_TXT
	CALL Text68.print_at

  LD HL, music_startgame.data
  CALL Tritone.play

  ENDIF

  EI

.loop
  halt
  ld a, 1
  out (#fe), a

  halt
  ld a, 2
  out (#fe), a

  jp .loop

  include "../zx-core/libs/screen/set_colors.asm"
  include "../zx-core/libs/screen/calc_down_pos.asm"
  include "../zx-core/libs/text/text68.asm"
