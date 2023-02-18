start:
  ; LD HL, music_startgame.data
  ; CALL Tritone.play

loop:
  DI
  LD HL, MAP_SET
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
 EI

  jp loop

index: db 0
