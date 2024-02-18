MAP_DATA:
  incbin "map.bin"
MAP_DATA_END equ $-1

MAP_MASK:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP
MAP_MASK_END equ $-1

VIEW_BUFFER:
	include "../zx-core/libs/tiles16/view_buffer.asm"
VIEW_BUFFER_END equ $-1

  include "heroes_data.asm"
  
display 'VIEW_BUFFER: ', VIEW_BUFFER
display 'MAP_DATA: ', MAP_DATA
