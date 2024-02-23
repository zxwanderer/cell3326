  ifndef _VIEW_ASM_
  define _VIEW_ASM_

include "../../zx-core/libs/view/View_h.asm"

  MODULE View

calc_look_at_center:
  include "../../zx-core/libs/view/center.asm"

copy_from_map:
  include "../../zx-core/libs/view/copy_to_buffer.asm"

  ENDMODULE

  endif
