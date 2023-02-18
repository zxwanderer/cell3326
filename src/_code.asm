start:
  LD HL, music_startgame.data
  CALL Tritone.play

loop:
  LD A, (index)
  INC A
  LD (index), A
  CALL TILE16_INDEX_TO_PTR
  LD DE, #4000
	CALL TILE_16_SHOW
  jp loop

index: db 0
