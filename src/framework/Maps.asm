  ifndef _MAP_ASM_
  define _MAP_ASM_

  MODULE Maps

calc_ptr_by_pos:
  include "../../zx-core/libs/map/calc_pos.asm"

set:
  include "../../zx-core/libs/map/set.asm"

calc_pos_by_dir:
  include "../../zx-core/libs/map/move_calc_xy.asm"

; Смотрим по направлению
; На входе:
;   DE - координаты X и Y
;   A - направление взгляда
; На выходе:
; в HL - указатель на ячейку карты, 
cell_by_dir_ptr:
  CALL calc_pos_by_dir
  ; CALL MAP_CALC_POS_BY_DIR
  RET NC;  возвратили false - неправильное направление
  CALL calc_ptr_by_pos
  ; CALL MAP_CALC_PTR_BY_POS
  retTrue

  ENDMODULE

  endif
