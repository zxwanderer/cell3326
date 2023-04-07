PDA.spr equ 104

  SETUP_CELL_TYPE_N PDA.spr, PDA_cell_name, Pda_actions

Pda_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0
