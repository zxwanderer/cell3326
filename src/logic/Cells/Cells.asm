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
; На выходе:
;   Сохраняем найденный указатель в LOGIC_CellInfo_ptr
call_cell_script_by_num:
  CALL cell_by_type_ptr ; в HL указатель на описание ячейки
  LD (LOGIC_CellInfo_ptr+1), HL
LOGIC_CellInfo_ptr:
  LD HL, (#0000)

; Обработка скрипта активной ячейки
; На входе:
;   HL - указатель на описание ячейки
call_cell_script:
  INC HL
  INC HL ; получили указатель на таблицу action-reaction 
  CALL Scripts.scan_table_by_index
  JP NC, Scripts.set_zero_ret ; не нашли действия, выставляем zero чтобы обработка события дальше не пошла в Hero.do

  JP Scripts.set_one_ret
  RET

  ENDMODULE
