	device zxspectrum48
  include "_defines_h.asm"

ORG PROGRAM_ORG

code:
  include "_code.asm"

static:
  include "_static.asm"

dynamic:
  include "_dynamic.asm"

_all_end:

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '--main.asm---------------------------------------'
display 'Engine:   ', code, '-', static-1, ', size: ', /D, static-code
display 'Static:   ', static, '-', dynamic-1,', size: ', /D, dynamic-static
display 'Dynamic:  ', dynamic, '-', _all_end-1, ', size: ', /D, _all_end-dynamic
display '-----------------------------------------'
display "interrupt: ", INT_VECTOR, "-", INT_VECTOR+256-1
display '-----------------------------------------'

	savesna SNA_FILENAME, PROGRAM_ORG
