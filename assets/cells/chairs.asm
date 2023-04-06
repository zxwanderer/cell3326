Chair_51.spr equ 51
Chair_67.spr equ 67
Chair_83.spr equ 83

  SETUP_CELL_TYPE_N Chair_51.spr, Chair_item_name, Chair_actions
  SETUP_CELL_TYPE_N Chair_67.spr, Chair_item_name, Chair_actions
  SETUP_CELL_TYPE_N Chair_83.spr, Chair_item_name, Chair_actions

Chair_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
