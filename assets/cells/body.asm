BodyTech.spr equ 10

  SETUP_CELL_TYPE_N BodyTech.spr, BodyTech_cell_name, Body_actions

Body_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
