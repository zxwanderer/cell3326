  ifndef _TILES_ASM_
  define _TILES_ASM_

  MODULE Tiles

show_screen:
  include "../../zx-core/libs/tiles16/show_screen.asm"

  ENDMODULE

  include "../../zx-core/libs/tiles16/show.asm"
  include "../../zx-core/libs/tiles16/index_to_ptr.asm"

  endif
