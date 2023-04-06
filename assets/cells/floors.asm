
Floor_3.spr equ 3
Floor_4.spr equ 4
Floor_8.spr equ 8
Floor_22.spr equ 22
Floor_23.spr equ 23

  SETUP_CELL_TYPE_N Floor_3.spr, Floor_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Floor_4.spr, Floor_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Floor_8.spr, Floor_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Floor_22.spr, Floor_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Floor_23.spr, Floor_cell_name, Floor_actions

Floor_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0

reaction_stand:
  JP check_act_yes
