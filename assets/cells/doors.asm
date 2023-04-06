Door_open.spr equ 34

  SETUP_CELL_TYPE_N Door_open.spr, Door_cell_name, Door_open_actions

Door_open_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
