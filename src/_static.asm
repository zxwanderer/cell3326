
  include "beeper/tritone/play.asm"

	include "screen/addr_to_attr.asm"
	
	include "tiles16/show.asm"
	include "tiles16/index_to_ptr.asm"
	include "tiles16/show_screen.asm"

	include "keyboard/wait_key.asm"
	include "keyboard/wait_unkey.asm"

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

VIEW_BUFFER:
	include "tiles16/view_buffer.asm"
