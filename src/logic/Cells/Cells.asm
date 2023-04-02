  MODULE Cells

calc_cell_type:
  LD DE, CellType
  CALL mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
  RET

  ENDMODULE
