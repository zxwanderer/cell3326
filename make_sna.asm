	device zxspectrum48

ORG PROGRAM_ORG
  include "./src/main.asm"

	SAVESNA SNA_FILENAME, PROGRAM_ORG
  LABELSLIST labels.txt
