  include "_defines_h.asm"
  include "../zx-core/libs/stack/push_pop_h.asm"

static:
  include "code.asm"
  include "static.asm"
  include "interrupts.asm"
static_end equ $-1

dynamic:
  include "dynamic.asm"
dynamic_end equ $-1

ORG INT_TABLE
  IM2_TABLE INT_VECTOR_HIGH
INT_TABLE_END

ORG INT_VECTOR
  IM2_JP_ROUTINES Interrupts
INT_VECTOR_END

ORG STACK_TOP - STACK_SIZE
stack_start:
  defs STACK_SIZE
ORG STACK_TOP
stack_end: ; #FFFF

display 'PROGRAM_ORG: ', PROGRAM_ORG
display '--------------------------------------------------'
display 'Static:    ', static, '-', static_end,', size: ', /D, static_end - static
display 'FX_SET:    ', FX_SET, '-', FX_SET_END-1,', size: ', /D, FX_SET_END-FX_SET
display 'TRITONE:   ', TRITONE, '-', TRITONE_END-1,', size: ', /D, TRITONE_END-TRITONE
display 'MUSIC:     ', BEEPER_MUSIC, '-', BEEPER_MUSIC_END-1,', size: ', /D, BEEPER_MUSIC_END-BEEPER_MUSIC
display '[Free]     ', p68_font_before, '-', p68_font, ', size: ', /D, p68_font - p68_font_before
display 'Font:      ', p68_font, '-', p68_font_end, ', size: ', /D, p68_font_end - p68_font
display 'Dynamic:   ', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
; display '[Free]     ', dynamic_end+1, '-', INT_TABLE-1, ', size: ', /D, INT_TABLE - dynamic_end

display '---Interrupt---------------------------------------'
display 'TABLE:               ', INT_TABLE, '-', INT_TABLE_END-1,', size: ', /D, INT_TABLE_END - INT_TABLE
display '[Free]               ', INT_TABLE_END, '-', INT_VECTOR-1,', size: ', /D, INT_VECTOR - INT_TABLE_END
display 'ROUTINE:             ', INT_VECTOR, '-', INT_VECTOR_END-1, ', size: ', /D, INT_VECTOR_END - INT_VECTOR
display '[Free]               ', INT_VECTOR_END, '-', 0xFFFF,', size: ', /D, 0xFFFF - INT_VECTOR_END
display '---------------------------------------------------'

  ; savebin "static.bin", code, dynamic-code
  ; savebin "dynamic.bin", dynamic, _all_end-dynamic
