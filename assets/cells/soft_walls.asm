Soft_wall_6.spr equ 6
Soft_wall_87.spr equ 87
Soft_wall_88.spr equ 88

Soft_wall_L_89.spr equ 89
Soft_wall_L2_120.spr equ 120
Soft_wall_L3_136.spr equ 136

Soft_wall_l_102.spr equ 102
Soft_wall_r_106.spr equ 106

Soft_wall_l_up_86.spr equ 86
Soft_wall_r_up_90.spr equ 90

Soft_wall_l_down_119.spr equ 119
Soft_wall_r_down_122.spr equ 122

Soft_wall_break_77.spr equ 77

  SETUP_CELL_TYPE_N Soft_wall_6.spr, Soft_wall_name, Soft_wall_actions
  SETUP_CELL_TYPE_N Soft_wall_87.spr, Soft_wall_name, Soft_wall_actions
  SETUP_CELL_TYPE_N Soft_wall_88.spr, Soft_wall_name, Soft_wall_actions

  SETUP_CELL_TYPE_N Soft_wall_l_102.spr, Soft_wall_name, Soft_wall_l_actions
  SETUP_CELL_TYPE_N Soft_wall_r_106.spr, Soft_wall_name, Soft_wall_r_actions

  SETUP_CELL_TYPE_N Soft_wall_l_up_86.spr, Soft_wall_name, Soft_wall_l_up_actions
  SETUP_CELL_TYPE_N Soft_wall_r_up_90.spr, Soft_wall_name, Soft_wall_r_up_actions

  SETUP_CELL_TYPE_N Soft_wall_l_down_119.spr, Soft_wall_name, Soft_wall_l_down_actions
  SETUP_CELL_TYPE_N Soft_wall_r_down_122.spr, Soft_wall_name, Soft_wall_r_down_actions

  SETUP_CELL_TYPE_N Soft_wall_r_down_122.spr, Soft_wall_name, Soft_wall_r_down_actions

  SETUP_CELL_TYPE_N Soft_wall_L_89.spr, Soft_wall_name, Soft_wall_L_actions
  SETUP_CELL_TYPE_N Soft_wall_L2_120.spr, Soft_wall_name, Soft_wall_L2_actions
  SETUP_CELL_TYPE_N Soft_wall_L3_136.spr, Soft_wall_name, Soft_wall_L3_actions

  SETUP_CELL_TYPE_N Soft_wall_break_77.spr, Soft_wall_name, Soft_wall_break_actions

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

Soft_wall_L_actions:
  defb 00

Soft_wall_L2_actions:
  defb 00

Soft_wall_L3_actions:
  defb 00

