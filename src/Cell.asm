  ifndef __CELL_ASM_
  define __CELL_ASM_

  include "./CellType_h.asm"
  include "../zx-core/libs/math/mul_ADE.asm"

; Получить указатель на описание ячейки по ее номеру
; Константы:
;   CellType - размер структуры описания ячейки
;   CELL_TYPES - указатель на массив с описаниями ячеек
; На входе
;   A - номер ячейки (от 0 до #FF)
; На выходе
;   HL - указатель на описание ячейки

CELL_CALC_PTR_BY_INDEX:
  LD DE, CellType
  CALL mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
  RET

  endif
