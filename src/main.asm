	device zxspectrum48
  include "_defines_h.asm"

ORG PROGRAM_ORG

code:
  include "_code.asm"
code_end equ $-1

static:
  include "_static.asm"
static_end equ $-1

dynamic:
  include "_dynamic.asm"
dynamic_end equ $-1

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '--main.asm---------------------------------------'
display 'Code:     ', code, '-', code_end, ', size: ', /D, code_end - code
display 'Static:   ', static, '-', static_end,', size: ', /D, static_end - static
display 'Dynamic:  ', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
display '-----------------------------------------'
display "interrupt: ", INT_VECTOR, "-", INT_VECTOR+256-1
display '-----------------------------------------'

	savesna SNA_FILENAME, PROGRAM_ORG
