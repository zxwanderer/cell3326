  include "im2/im2_h.asm"
  include "stack/push_pop_h.asm"

start:
  DI
  SetIM2 interruptTab, INT_VECTOR
  ; LD HL, music_startgame.data
  ; CALL Tritone.play
  EI

  CALL SCREEN_CLEAR
  LD HL, MAP_SET
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
 EI

loop:
  jp loop
