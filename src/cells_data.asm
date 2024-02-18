  include "CellType_h.asm"
  
CELL_TYPES:
  DUP 256
    dw Empty_cell
  EDUP
CELL_TYPES_END equ $-1

Empty_0.spr equ 0

  DEFINE_SPR_CELL Empty_0.spr, Empty_cell
  
  SET_CELL_TYPE Empty_cell, Empty_cell_name, No_action_reaction

No_action_reaction:
  defb 00
