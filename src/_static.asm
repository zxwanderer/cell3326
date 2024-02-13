
  include "framework/Cell/calc_ptr_by_index.asm"

	include "../zx-core/libs/screen/addr_to_attr.asm"
	include "../zx-core/libs/screen/clear.asm"
	include "../zx-core/libs/screen/calc_down_pos.asm"
	include "../zx-core/libs/screen/set_colors.asm"
  include "../zx-core/libs/screen/pos_to_scr.asm"
  include "../zx-core/libs/screen/clear_rows.asm"

	include "../zx-core/libs/tables/scan_by_index.asm"

  include "../zx-core/libs/tiles16/show.asm"
	include "../zx-core/libs/tiles16/index_to_ptr.asm"
	include "../zx-core/libs/tiles16/show_screen.asm"
  include "../zx-core/libs/tiles16/copy_to_buffer.asm"

  include "../zx-core/libs/view/view_h.asm"
  include "../zx-core/libs/view/center.asm"
  
  include "../zx-core/libs/map/move_calc_xy.asm"
  include "../zx-core/libs/map/calc_pos.asm"
  include "../zx-core/libs/map/set.asm"

	include "../zx-core/libs/text/text68.asm"

  include "../zx-core/libs/keyboard/scan_keys.asm"
  include "../zx-core/libs/keyboard/wait_unpress_long.asm"

  include "../zx-core/libs/math/mul_ADE.asm"

  include "../assets/lang/lang_ru.asm"
  include "../assets/cells/_index.asm"

  include "logic/Events/EventsMap.asm"
  include "logic/Heroes/Hero.asm"
  include "logic/Cells/Cells.asm"
  include "logic/Items/Items.asm"
  
  include "ScreenFX.asm"
  
  include "cell_types_data.asm"

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
  include "../zx-core/libs/beeper/tritone/play.asm"
TRITONE_END

  MODULE music_startgame
data:  
    include "../assets/music/AER/foryou.asm"
  ENDMODULE

  MODULE music_gameover
data:
    include "../assets/music/AER/gameover.asm"
  ENDMODULE

  MODULE music_gameend
data:    
    include "../assets/music/AER/gameend.asm"
  ENDMODULE
