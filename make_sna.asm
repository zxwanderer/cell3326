	device zxspectrum48
  
  include "./src/_defines_h.asm"

ORG PROGRAM_ORG
  include "./src/main.asm"

	SAVESNA SNA_FILENAME, PROGRAM_ORG
  LABELSLIST labels.txt
