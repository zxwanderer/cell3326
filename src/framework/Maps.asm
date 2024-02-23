  ifndef _MAP_ASM_
  define _MAP_ASM_

  MODULE Maps

calc_ptr_by_pos:
  include "../../zx-core/libs/map/calc_pos.asm"

set:
  include "../../zx-core/libs/map/set.asm"

move_calc_xy:
  include "../../zx-core/libs/map/move_calc_xy.asm"

  ENDMODULE

  endif
