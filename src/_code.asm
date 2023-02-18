start:
  LD HL, music_startgame.data
  CALL Tritone.play

	CALL TILE16_SHOW_SCREEN

loop:
  jp loop

index: db 0
