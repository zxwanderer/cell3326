Door_open.spr equ 34
Door_open_2.spr equ 110

  SETUP_CELL_TYPE_N Door_open.spr, Door_cell_name, Door_actions
  SETUP_CELL_TYPE_N Door_open_2.spr, Door_cell_name, Door_actions

Door_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
