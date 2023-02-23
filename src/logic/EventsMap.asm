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
  CALL MOVE_CALC_XY
  RET NC;  возвратили false - неправильное направление или действие    
  CALL CELLS_CALC_POS
.update_mask_hl:
    LD A, (HL)
    OR %10000000
    LD (HL), A
    RET
  RET

  ENDMODULE
