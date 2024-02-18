
  include "../../src/CellType_h.asm"
  include "../../zx-core/libs/result/set_result.asm"

Floor_3.spr equ 3
Floor_5.spr equ 5
Floor_8.spr equ 8
Floor_22.spr equ 22
Floor_23.spr equ 23
Floor_41.spr equ 41
Floor_53.spr equ 53
Floor_54.spr equ 54
Floor_58.spr equ 58
Floor_74.spr equ 74

  DEFINE_SPR_CELL Floor_3.spr, Floor_cell
  DEFINE_SPR_CELL Floor_5.spr, Floor_cell
  DEFINE_SPR_CELL Floor_8.spr, Floor_cell
  DEFINE_SPR_CELL Floor_22.spr, Floor_cell
  DEFINE_SPR_CELL Floor_23.spr, Floor_cell
  DEFINE_SPR_CELL Floor_41.spr, Floor_cell
  DEFINE_SPR_CELL Floor_53.spr, Floor_cell
  DEFINE_SPR_CELL Floor_54.spr, Floor_cell
  DEFINE_SPR_CELL Floor_74.spr, Floor_cell

  SET_CELL_TYPE Floor_cell, Floor_cell_name, Floor_actions

Floor_actions:
  SET_ACTION_REACTON do_stand, ret_true
  defb 0
