	device zxspectrum48
  include "_defines_h.asm"

ORG PROGRAM_ORG

ORG BOOTSTRAP_ORG

bootstrap:
  DI
	DEFINE Upkr.buffer #4000
	LD IX, program_pack
	LD DE, PROGRAM_ORG
  EXX
	CALL Upkr.unpack

  JP PROGRAM_ORG
bootstrap_end equ $-1

unpacker:
	include "unpackers/upkr/unpack.asm"
unpacker_end equ $-1

program_pack:
  incbin "game.bin.upkr"
program_pack_end equ $-1

_all_end equ $-1

display 'PROGRAM_ORG:   ', PROGRAM_ORG
display 'BOOTSTRAP_ORG: ', BOOTSTRAP_ORG
display '-----------------------------------------'
display 'bootstrap:     ', bootstrap, '-', bootstrap_end,', size: ', /D, bootstrap_end - bootstrap
display 'program_pack:  ', program_pack, '-', program_pack_end,', size: ', /D, program_pack_end - program_pack

	savebin 'bootable.bin', BOOTSTRAP_ORG, $-BOOTSTRAP_ORG 	; BIN_FILENAME defined in Makefile
  savesna 'bootable.sna', BOOTSTRAP_ORG