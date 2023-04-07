BodyTech.spr equ 10
BodyInScaf.spr equ 28
Body.spr equ 27

  SETUP_CELL_TYPE_N BodyTech.spr, BodyTech_cell_name, Body_actions
  SETUP_CELL_TYPE_N BodyInScaf.spr, BodyInScaf_cell_name, Body_actions
  SETUP_CELL_TYPE_N Body.spr, Body_cell_name, Body_actions

Body_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
