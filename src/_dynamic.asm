MAP_SET:
  incbin "map.bin"

MAP_MASK:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP

VIEW_BUFFER:
	include "tiles16/view_buffer.asm"

  include "logic/Heroes/Hero_h.asm"
  include "logic/heroes_data.asm"
  include "logic/logic_vars.asm"
  
display 'VIEW_BUFFER: ', VIEW_BUFFER
display 'MAP_SET: ', MAP_SET
