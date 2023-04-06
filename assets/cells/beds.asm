Bed.spr equ 19

  SETUP_CELL_TYPE_N Bed.spr, Bed_cell_name, Bed_actions

Bed_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
