start:
  ; LD HL, music_startgame.data
  ; CALL Tritone.play

  DI
  CALL SCREEN_CLEAR
  LD HL, MAP_SET
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
 EI

loop:
  jp loop
