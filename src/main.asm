  include "_defines_h.asm"
  include "../zx-core/libs/stack/push_pop_h.asm"

static:
code_start:
  include "code.asm"
code_end:
data_start:
  include "static.asm"
data_end:
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
display 'Static - - - - ', static, '-', static_end,', size: ', /D, static_end - static
display '- Code:        ', code_start, '-', code_end-1,', size: ', /D, code_end - code_start
display '--Data:        ', data_start, '-', data_end-1,', size: ', /D, data_end - data_start
display ' CELLS_SET:    ', CELLS_SET, '-', CELLS_SET_END-1,', size: ', /D, CELLS_SET_END-CELLS_SET
display ' TEXT_SET:     ', TEXT_SET, '-', TEXT_SET_END-1,', size: ', /D, TEXT_SET_END-TEXT_SET
display ' TILE_SET:     ', TILE_SET, '-', TILE_SET_END-1,', size: ', /D, TILE_SET_END-TILE_SET
display ' FX_SET:       ', FX_SET, '-', FX_SET_END-1,', size: ', /D, FX_SET_END-FX_SET
display ' TRITONE:      ', TRITONE, '-', TRITONE_END-1,', size: ', /D, TRITONE_END-TRITONE
display ' MUSIC:        ', BEEPER_MUSIC, '-', BEEPER_MUSIC_END-1,', size: ', /D, BEEPER_MUSIC_END-BEEPER_MUSIC
display '[Free]         ', p68_font_before, '-', p68_font, ', size: ', /D, p68_font - p68_font_before
display ' FONT_SET:     ', p68_font, '-', p68_font_end, ', size: ', /D, p68_font_end - p68_font
display 'Dynamic - - - -', dynamic, '-', dynamic_end, ', size: ', /D, dynamic_end - dynamic
display ' MAP_DATA:     ', MAP_DATA, '-', MAP_DATA_END-1,', size: ', /D, MAP_DATA_END-MAP_DATA
display ' MAP_MASK:     ', MAP_MASK, '-', MAP_MASK_END-1,', size: ', /D, MAP_MASK_END-MAP_MASK
display ' VIEW_BUFFER:  ', VIEW_BUFFER, '-', VIEW_BUFFER_END-1,', size: ', /D, VIEW_BUFFER_END-VIEW_BUFFER
display ' HEROES_DATA:  ', HEROES_DATA, '-', HEROES_DATA_END-1,', size: ', /D, HEROES_DATA_END-HEROES_DATA

; display '[Free]     ', dynamic_end+1, '-', INT_TABLE-1, ', size: ', /D, INT_TABLE - dynamic_end

display '---Interrupt---------------------------------------'
display 'TABLE:               ', INT_TABLE, '-', INT_TABLE_END-1,', size: ', /D, INT_TABLE_END - INT_TABLE
display '[Free]               ', INT_TABLE_END, '-', INT_VECTOR-1,', size: ', /D, INT_VECTOR - INT_TABLE_END
display 'ROUTINE:             ', INT_VECTOR, '-', INT_VECTOR_END-1, ', size: ', /D, INT_VECTOR_END - INT_VECTOR
display '[Free]               ', INT_VECTOR_END, '-', STACK_TOP - STACK_SIZE -1 ,', size: ', /D, STACK_TOP - STACK_SIZE - INT_VECTOR_END
display 'STACK                ', STACK_TOP - STACK_SIZE, '-', STACK_TOP,', size: ', /D,STACK_SIZE
display '---------------------------------------------------'

  ; savebin "static.bin", code, dynamic-code
  ; savebin "dynamic.bin", dynamic, _all_end-dynamic
