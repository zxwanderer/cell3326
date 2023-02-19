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

// ------------- interrupt tabs
  ORG INT_TABLE
    align 256
    ASSERT $ = INT_TABLE
    ds 257,0

// ------------- im2 routines
	ASSERT $ < INT_VECTOR
	ORG INT_VECTOR
include "_im2_routines.asm"
_all_end equ $

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '--main.asm---------------------------------------'
display 'Code:      ', code, '-', code_end, ', size: ', /D, code_end - code
display 'Static:    ', static, '-', static_end,', size: ', /D, static_end - static
display 'Dynamic:   ', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
display '[Free]     ', dynamic_end+1, '-', INT_TABLE-1, ', size: ', /D, INT_TABLE - dynamic_end
display '-----------------------------------------'
display 'INT_TABLE: ', INT_TABLE, "-", INT_TABLE+256-1
display 'INT_VECTOR:', INT_VECTOR, "-", INT_VECTOR
display '[Free]     ', _all_end, '-', #FFFF, ', size: ', /D, 0x10000 - _all_end

	savesna SNA_FILENAME, PROGRAM_ORG
  LABELSLIST labels.txt
  