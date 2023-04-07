Soft_wall_6.spr equ 6
Soft_wall_88.spr equ 88

Soft_wall_break_77.spr equ 77

  SETUP_CELL_TYPE_N Soft_wall_6.spr, Soft_wall_name, Soft_wall_actions
  SETUP_CELL_TYPE_N Soft_wall_88.spr, Soft_wall_name, Soft_wall_actions
  SETUP_CELL_TYPE_N Soft_wall_break_77.spr, Soft_wall_name, Soft_wall_break_actions

Soft_wall_actions:
  defb 0

Soft_wall_break_actions:
  defb 0
