  include "im2/im2_h.asm"
  include "stack/push_pop_h.asm"
  include "logic/defines_h.asm"
  include "logic/point_h.asm"

start:
  DI

  XOR A
  OUT (#FE),A
  LD A, %00000100
  CALL SCREEN_SET_COLORS

  ; CALL SCREEN_CLEAR

  SetIM2 INT_TABLE, INT_VECTOR
  LD SP, STACK_TOP

	LD DE, #4000
	LD HL, HELLO_TXT
	CALL Text68.print_at

  LD HL, music_startgame.data
  CALL Tritone.play

  EI

loop:
  LD DE, #1515
  CALL VIEW_CENTER

  CALL CELLS_CALC_POS

  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
  JP loop
