Nippers_60.spr equ 60
Wrench_61.spr equ 61

  SETUP_CELL_TYPE_N Nippers_60.spr, Nippers_item_name, Nippers_actions
  SETUP_CELL_TYPE_N Wrench_61.spr, Wrench_cell_name, Wrench_actions

Nippers_actions:
  db 00

Wrench_actions:
  db 00
