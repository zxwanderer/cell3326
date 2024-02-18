  ifndef _CELLS_ASM_
  define _CELLS_ASM_

  include "../zx-core/libs/tables/scan_by_index.asm"

  MODULE Cells


; -------------------------------------------
; Получить указатель на описание ячейки по ее номеру
; Константы:
;   CellType - размер структуры описания ячейки
;   CELL_TYPES - указатель на массив с описаниями ячеек
; На входе
;   A - номер ячейки (от 0 до #FF)
; На выходе
;   HL - указатель на описание ячейки
; -------------------------------------------
get_by_index:
  LD (.index_ptc_cell), A
.index_ptc_cell equ $+2
  LD HL, #0000
  RL L
  RL H
  ; LD DE, CellType
  ; CALL mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
    HL_PTR_TO_HL
  RET

; -------------------------------------------
; Обработка скрипта активной ячейки
; Константы:
;   HL_PTR_TO_HL - макрос загрузки в HL содержимого ячейки на которую указывает HL
;   TABLE_SCAN_BY_INDEX_PTR - функция поиска указателя по индексу
; На входе:
;   A - действие
;   HL - указатель на описание ячейки
; На выходе:
; retFalse - ничего не нужно делать дальше
; -------------------------------------------
call_script:
  LD (.action+1), A
  INC HL
  INC HL ; получили указатель на указатель таблицы action-reaction 
  HL_PTR_TO_HL
  CALL TABLE_SCAN_BY_INDEX_PTR
  retFalse
.action
  LD A, #00
; в HL у нас теперь указатель на обработку action'a
  JP (HL)

  ENDMODULE

  endif
