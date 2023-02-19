  include "im2/im2_h.asm"
  include "stack/push_pop_h.asm"

start:
  DI
  SetIM2 INT_TABLE, INT_VECTOR
  LD SP, STACK_TOP
  ; LD HL, music_startgame.data
  ; CALL Tritone.play
  EI

  XOR A
  OUT (#FE),A
  CALL SCREEN_CLEAR

loop:
  LD HL, MAP_SET
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
  JP loop
