Trash_50.spr equ 50

  SETUP_CELL_TYPE_N Trash_50.spr, Trash_cell_name, Trash_actions

Trash_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
