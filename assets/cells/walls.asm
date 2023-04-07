Soft_wall_6.spr equ 6
Soft_wall_87.spr equ 87
Soft_wall_88.spr equ 88

Soft_wall_l_102.spr equ 102
Soft_wall_r_106.spr equ 106

Soft_wall_l_up_86.spr equ 86
Soft_wall_r_up_90.spr equ 90

Soft_wall_l_down_119.spr equ 119
Soft_wall_r_down_122.spr equ 122

Soft_wall_break_77.spr equ 77

Wall_76.spr equ 76
Wall_78.spr equ 78

Wall_l_75.spr equ 75
Wall_r_79.spr equ 79

  SETUP_CELL_TYPE_N Soft_wall_6.spr, Soft_wall_name, Soft_wall_actions
  SETUP_CELL_TYPE_N Soft_wall_87.spr, Soft_wall_name, Soft_wall_actions
  SETUP_CELL_TYPE_N Soft_wall_88.spr, Soft_wall_name, Soft_wall_actions

  SETUP_CELL_TYPE_N Soft_wall_l_102.spr, Soft_wall_name, Soft_wall_l_actions
  SETUP_CELL_TYPE_N Soft_wall_r_106.spr, Soft_wall_name, Soft_wall_r_actions

  SETUP_CELL_TYPE_N Soft_wall_l_up_86.spr, Soft_wall_name, Soft_wall_l_up_actions
  SETUP_CELL_TYPE_N Soft_wall_r_up_90.spr, Soft_wall_name, Soft_wall_r_up_actions

  SETUP_CELL_TYPE_N Soft_wall_l_down_119.spr, Soft_wall_name, Soft_wall_l_down_actions
  SETUP_CELL_TYPE_N Soft_wall_r_down_122.spr, Soft_wall_name, Soft_wall_r_down_actions

  SETUP_CELL_TYPE_N Soft_wall_break_77.spr, Soft_wall_name, Soft_wall_break_actions

  SETUP_CELL_TYPE_N Wall_76.spr, Wall_cell_name, Wall_actions
  SETUP_CELL_TYPE_N Wall_78.spr, Wall_cell_name, Soft_wall_actions

  SETUP_CELL_TYPE_N Wall_l_75.spr, Wall_cell_name, Wall_l_actions
  SETUP_CELL_TYPE_N Wall_r_79.spr, Wall_cell_name, Wall_r_actions

Soft_wall_actions:
  defb 0

Soft_wall_l_actions:
  defb 0

Soft_wall_r_actions:
  defb 00

Soft_wall_l_up_actions:
  defb 00

Soft_wall_r_up_actions:
  defb 00

Soft_wall_l_down_actions:
  defb 00

Soft_wall_r_down_actions:
  defb 00

Soft_wall_break_actions:
  defb 0

Wall_actions:
  defb 0

Wall_l_actions:
  defb 0  

Wall_r_actions:
  defb 0
