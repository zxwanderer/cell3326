  ifndef _EVENTS_MAP_ASM_
  define _EVENTS_MAP_ASM_

  include "../../zx-core/libs/result/set_result_h.asm"
  include "./Maps.asm"

  MODULE EventsMap

  MACRO m_look_dir _dir
    PUSH DE
    LD A, _dir
    CALL look_dir
    POP DE
  ENDM
 
; Смотрим во все стороны на одну клетку
lookAround:
  m_look_dir dir_down
  m_look_dir dir_down_left
  m_look_dir dir_left
  m_look_dir dir_up_left
  m_look_dir dir_up
  m_look_dir dir_up_right
  m_look_dir dir_right
  m_look_dir dir_down_right
  m_look_dir dir_center
  RET

; Смотрим по направлению
; На входе:
;   DE - координаты X и Y
;   A - направление взгляда
look_dir:
  CALL Maps.cell_by_dir_ptr
  RET NC;  возвратили false - неправильное направление
  LD DE, MAP_MASK-MAP_DATA
  ADD HL, DE
.update_mask_hl:
  LD A, (HL)
  OR %10000000
  LD (HL), A
  RET

  ENDMODULE

  endif
