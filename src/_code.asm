  include "im2/im2_h.asm"
  include "stack/push_pop_h.asm"

start:
  DI
  SetIM2 interruptTab, INT_VECTOR
  ; LD SP, #FFFF
  ; LD HL, music_startgame.data
  ; CALL Tritone.play
  EI

  CALL SCREEN_CLEAR

loop:
  HALT
  LD HL, MAP_SET
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
  LD A, 2
  OUT (#FE), A

  jp loop
