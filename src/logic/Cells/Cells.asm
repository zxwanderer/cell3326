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

call_cell_script:
  XOR A
  INC A
  LD (Scripts.var_ret), A
  RET

  ENDMODULE
