MAP_DATA:
  incbin "map.bin"

  include "logic/Heroes/Hero_h.asm"
  include "heroes_data.asm"

  ; include "logic/Items/Item_h.asm"
  ; include "logic/Items/ItemType_h.asm"

MAP_MASK:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP

VIEW_BUFFER:
	include "tiles16/view_buffer.asm"
  include "logic_vars_data.asm"
  
display 'VIEW_BUFFER: ', VIEW_BUFFER
display 'MAP_DATA: ', MAP_DATA
