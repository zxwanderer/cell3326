Electronic_39.spr equ 39
Electronic_break_40.spr equ 40
Cavity_43.spr equ 43

  SETUP_CELL_TYPE_N Electronic_39.spr, Electronic_cell_name, Electronic_cell_actions
  SETUP_CELL_TYPE_N Electronic_break_40.spr, Electronic_break_name, Electronic_break_actions
  SETUP_CELL_TYPE_N Cavity_43.spr, Cavity_cell_name, Cavity_cell_actions

Electronic_cell_actions:
  db 00

Electronic_break_actions:
  db 00

Cavity_cell_actions:
  db 00
