  MODULE Cells

; Обработка скрипта активной ячейки
; На входе:
;   HL - указатель на описание ячейки
; На выходе:
; retFalse - ничего не нужно делать дальше
call_cell_script:
  INC HL
  INC HL ; получили указатель на указатель таблицы action-reaction 
  HL_PTR_TO_HL
  LD A, (Hero.LOGIC_LAST_ACTION)
  CALL TABLE_SCAN_BY_INDEX_PTR
  JP NC, check_act_no
; в HL у нас теперь указатель на обработку action'a
  JP (HL)

  ENDMODULE
