  DI
  HALT

static:
  include "static.asm"
static_end equ $-1

dynamic:
  include "dynamic.asm"
dynamic_end equ $-1

_all_end equ $

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '-----------------------------------------'
; display 'Code:      ', code, '-', code_end, ', size: ', /D, code_end - code
display 'Static:    ', static, '-', static_end,', size: ', /D, static_end - static
; display 'FX_SET:    ', FX_SET, '-', FX_SET_END-1,', size: ', /D, FX_SET_END-FX_SET
; display 'TRITONE:   ', TRITONE, '-', TRITONE_END-1,', size: ', /D, TRITONE_END-TRITONE
display '[Free]     ', p68_font_before, '-', p68_font, ', size: ', /D, p68_font - p68_font_before
display 'Font:      ', p68_font, '-', p68_font_end, ', size: ', /D, p68_font_end - p68_font
; display 'Dynamic:   ', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
; display '[Free]     ', dynamic_end+1, '-', INT_TABLE-1, ', size: ', /D, INT_TABLE - dynamic_end
; display '-----------------------------------------'
; display 'INT_TABLE: ', INT_TABLE, "-", INT_TABLE+256-1
; display 'INT_VECTOR:', INT_VECTOR, "-", INT_VECTOR
display '[Free]     ', _all_end, '-', #FFFF, ', size: ', /D, 0x10000 - _all_end

  ; savebin "static.bin", code, dynamic-code
  ; savebin "dynamic.bin", dynamic, _all_end-dynamic

	; savesna SNA_FILENAME, PROGRAM_ORG
  ; LABELSLIST labels.txt
