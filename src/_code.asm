start:
  LD HL, music_startgame.data

loop:
  CALL Tritone.play
  jp loop
