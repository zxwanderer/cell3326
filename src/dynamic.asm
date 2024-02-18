  include "../zx-core/libs/memory/display_size_h.asm"

MAP_DATA:
  incbin "map.bin"
MAP_DATA_END:

MAP_MASK:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP
MAP_MASK_END:

VIEW_BUFFER:
	include "../zx-core/libs/tiles16/view_buffer.asm"
VIEW_BUFFER_END:

  include "heroes_data.asm"

  display '--- Dynamic --------------------------------------'
  DISPLAY_SIZE 'MAP_DATA:    ', MAP_DATA
  DISPLAY_SIZE 'MAP_MASK:    ', MAP_MASK
  DISPLAY_SIZE 'VIEW_BUFFER: ', VIEW_BUFFER
  display '--------------------------------------------------'
