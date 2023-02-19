
MAP_SET:
  incbin "map.bin"

VIEW_BUFFER:
	include "tiles16/view_buffer.asm"

display 'VIEW_BUFFER: ', VIEW_BUFFER
display 'MAP_SET: ', MAP_SET
