  include "./src/_defines_h.asm"

static:
  include "code.asm"
  include "static.asm"
static_end equ $-1

dynamic:
  include "dynamic.asm"
dynamic_end equ $-1

interrupts:
  include "interrupts.asm"
interrupts_end:

_all_end equ $

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '--------------------------------------------------'
; display 'Code:      ', code, '-', code_end, ', size: ', /D, code_end - code
display 'Static:    ', static, '-', static_end,', size: ', /D, static_end - static
; display 'FX_SET:    ', FX_SET, '-', FX_SET_END-1,', size: ', /D, FX_SET_END-FX_SET
; display 'TRITONE:   ', TRITONE, '-', TRITONE_END-1,', size: ', /D, TRITONE_END-TRITONE
display '[Free]     ', p68_font_before, '-', p68_font, ', size: ', /D, p68_font - p68_font_before
display 'Font:      ', p68_font, '-', p68_font_end, ', size: ', /D, p68_font_end - p68_font
display 'Dynamic:   ', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
; display '[Free]     ', dynamic_end+1, '-', INT_TABLE-1, ', size: ', /D, INT_TABLE - dynamic_end
display '---Interrupt---------------------------------------'
display 'VECTOR:              ', /H, INT_VECTOR_h
display 'POINTER:             ', /H, INT_VECTOR_h_1
display 'TABLE:               ', INT_VECTOR, '-', INT_VECTOR_END-1,', size: ', /D, INT_VECTOR_END - INT_VECTOR
display '[Free]               ', INT_VECTOR_END, '-', INT_ROUTINE-1,', size: ', /D, INT_ROUTINE - INT_VECTOR_END
display 'ROUTINE:             ', INT_ROUTINE, '-', INT_ROUTINE_END-1, ', size: ', /D, INT_ROUTINE_END - INT_ROUTINE
display '[Free]               ', INT_ROUTINE_END, '-', 0xFFFF,', size: ', /D, 0xFFFF - INT_ROUTINE_END
display '---------------------------------------------------'

  ; savebin "static.bin", code, dynamic-code
  ; savebin "dynamic.bin", dynamic, _all_end-dynamic

	; savesna SNA_FILENAME, PROGRAM_ORG
  ; LABELSLIST labels.txt
