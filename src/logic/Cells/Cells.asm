  MODULE Cells

; Обработка скрипта активной ячейки
; Константы:
;   HL_PTR_TO_HL - макрос загрузки в HL содержимого ячейки на которую указывает HL
;   TABLE_SCAN_BY_INDEX_PTR - функция поиска указателя по индексу
; На входе:
;   A - действие
;   HL - указатель на описание ячейки
; На выходе:
; retFalse - ничего не нужно делать дальше
call_cell_script:
  LD (.action+1), A
  INC HL
  INC HL ; получили указатель на указатель таблицы action-reaction 
  HL_PTR_TO_HL
  CALL TABLE_SCAN_BY_INDEX_PTR
  JP NC, check_act_no
.action
  LD A, #00
; в HL у нас теперь указатель на обработку action'a
  JP (HL)

  ENDMODULE
