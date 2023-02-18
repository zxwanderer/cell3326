start:
  LD HL, music_startgame.data
  CALL Tritone.play

  DI
  LD HL,MAP_SET
  CALL COPY_TO_BUFFER
 
	CALL TILE16_SHOW_SCREEN

 EI

loop:
  jp loop

index: db 0
