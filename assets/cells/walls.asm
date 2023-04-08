Wall_76.spr equ 76
Wall_78.spr equ 78

Wall_l_143.spr equ 143
Wall_r_95.spr equ 95

Wall_l_up_75.spr equ 75
Wall_r_up_79.spr equ 79

Wall_l_down_123.spr equ 123
Wall_r_down_127.spr equ 127

  SETUP_CELL_TYPE_N Wall_76.spr, Wall_cell_name, Wall_actions
  SETUP_CELL_TYPE_N Wall_78.spr, Wall_cell_name, Wall_actions

  SETUP_CELL_TYPE_N Wall_l_143.spr, Wall_cell_name, Wall_actions
  SETUP_CELL_TYPE_N Wall_r_95.spr, Wall_cell_name, Wall_actions

  SETUP_CELL_TYPE_N Wall_l_up_75.spr, Wall_cell_name, Wall_actions
  SETUP_CELL_TYPE_N Wall_r_up_79.spr, Wall_cell_name, Wall_actions

  SETUP_CELL_TYPE_N Wall_l_down_123.spr, Wall_cell_name, Wall_actions
  SETUP_CELL_TYPE_N Wall_r_down_127.spr, Wall_cell_name, Wall_actions

Wall_actions:
  defb 0
