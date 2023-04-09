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
  CALL cell_by_dir_ptr
  RET NC;  возвратили false - неправильное направление
  LD DE, MAP_MASK-MAP_DATA
  ADD HL, DE
.update_mask_hl:
  LD A, (HL)
  OR %10000000
  LD (HL), A
  RET

; Смотрим по направлению
; На входе:
;   DE - координаты X и Y
;   A - направление взгляда
; На выходе:
; в HL - указатель на ячейку карты, 
cell_by_dir_ptr:
  CALL MAP_CALC_POS_BY_DIR
  RET NC;  возвратили false - неправильное направление
  CALL MAP_CALC_PTR_BY_POS
  retTrue

  ENDMODULE
