	device zxspectrum48
  include "_defines_h.asm"

ORG PROGRAM_ORG

incbin "static.bin"

incbin "dynamic.bin"

	savesna SNA_FILENAME, PROGRAM_ORG
  LABELSLIST labels.txt
