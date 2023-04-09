  MODULE Cells

; На входе
;   A - номер ячейки (от 0 до #FF)
; На выходе
;   HL - указатель на описание ячейки
cell_by_type_ptr:
  LD DE, CellType
  CALL mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
  RET

; Вызов скрипта ячейки, учитываются активные переменные
; На входе
;   A - номер ячейки
;   Hero.LOGIC_LAST_ACTION - действие
; На выходе:
;   Сохраняем найденный указатель в LOGIC_CellInfo_ptr
call_cell_script_by_num:
  CALL cell_by_type_ptr ; в HL указатель на описание ячейки
  LD (LOGIC_CellInfo_ptr), HL

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
  CALL Scripts.scan_table_by_index
  JP NC, check_act_no
; в HL у нас теперь указатель на указатель на обработку action'a
.next
  HL_PTR_TO_HL
  JP (HL)

  ENDMODULE
