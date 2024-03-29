	device zxspectrum48
  include "_defines_h.asm"

ORG PROGRAM_ORG

static:
  incbin "static.bin"
static_end equ $-1

dynamic:
  incbin "dynamic.bin"
dynamic_end equ $-1

dynamic_pack:
  incbin "dynamic.bin.upkr"
dynamic_pack_end equ $-1

_all_end equ $-1

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '-----------------------------------------'
display 'Static:    ', static, '-', static_end,', size: ', /D, static_end - static
display 'Dynamic:   ', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
display 'Pack:      ', dynamic_pack, '-', dynamic_pack_end, ', size: ', /D, dynamic_pack_end - dynamic_pack
display '[Free]     ', _all_end, '-', #FFFF, ', size: ', /D, 0x10000 - _all_end

	; savesna SNA_FILENAME, PROGRAM_ORG
  ; LABELSLIST labels.txt
	savebin BIN_FILENAME, PROGRAM_ORG, $-PROGRAM_ORG 	; BIN_FILENAME defined in Makefile
