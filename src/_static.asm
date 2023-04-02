
  include "beeper/tritone/play.asm"

	include "screen/addr_to_attr.asm"
	include "screen/clear.asm"
	include "screen/calc_down_pos.asm"
	include "screen/set_colors.asm"

	include "tiles16/show.asm"
	include "tiles16/index_to_ptr.asm"
	include "tiles16/show_screen.asm"
  include "tiles16/copy_to_buffer.asm"

  include "view/view_h.asm"
  include "view/center.asm"
  
  include "cells/move_calc_xy.asm"
  include "cells/calc_pos.asm"
  include "cells/set.asm"

	include "text/text68.asm"

  include "keyboard/scan_keys.asm"

  include "lang/lang_ru.asm"

  include "logic/Events/EventsMap.asm"
  include "logic/Heroes/Hero.asm"
  
  include "cell_types_data.asm"

  MODULE music_startgame
data:  
    include "music/AER/foryou.asm"
  ENDMODULE

  MODULE music_gameover
data:
    include "music/AER/gameover.asm"
  ENDMODULE

  MODULE music_gameend
data:    
    include "music/AER/gameend.asm"
  ENDMODULE

TILE_SET:
  incbin "tiles.bin"
