MAP_DATA:
  incbin "map.bin"

MAP_MASK:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP

VIEW_BUFFER:
	include "../zx-core/libs/tiles16/view_buffer.asm"

  include "heroes_data.asm"
  
display 'VIEW_BUFFER: ', VIEW_BUFFER
display 'MAP_DATA: ', MAP_DATA
