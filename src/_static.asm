
  include "framework/Cell/calc_ptr_by_index.asm"

	include "screen/addr_to_attr.asm"
	include "screen/clear.asm"
	include "screen/calc_down_pos.asm"
	include "screen/set_colors.asm"
  include "screen/pos_to_scr.asm"
  include "screen/clear_rows.asm"

	include "tables/scan_by_index.asm"

  include "tiles16/show.asm"
	include "tiles16/index_to_ptr.asm"
	include "tiles16/show_screen.asm"
  include "tiles16/copy_to_buffer.asm"

  include "view/view_h.asm"
  include "view/center.asm"
  
  include "map/move_calc_xy.asm"
  include "map/calc_pos.asm"
  include "map/set.asm"

	include "text/text68.asm"

  include "keyboard/scan_keys.asm"
  include "keyboard/wait_unpress_long.asm"

  include "lang/lang_ru.asm"

  include "logic/Events/EventsMap.asm"
  include "logic/Heroes/Hero.asm"
  include "logic/Cells/Cells.asm"
  include "logic/Items/Items.asm"
  
  include "math/mul_ADE.asm"
  include "ScreenFX.asm"
  
  include "cell_types_data.asm"

  include "cells/_index.asm"

TILE_SET:
  incbin "tiles.bin"

; (!) код плеера должен быть в быстрой памяти как Shiru сказал (!!!)
; На 48K это просто любая память выше 32768, на оригинальных 128K 
; есть сложности: на 128K и +2 медленные страницы 1,3,5,7; 
; на +2A и +3 медленные страницы 4,5,6,7. Т.е. для корректной работы 
; на всех оригинальных моделях плеер надо обязательно поместить в страницу 0 или 2.
; На данный момент подключается аккурат во 2ю страницу ( FX_SET )

FX_SET:
  include "fx/demoFX.asm"
FX_SET_END

TRITONE:
  include "beeper/tritone/play.asm"
TRITONE_END

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
