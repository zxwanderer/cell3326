
Floor_4.spr equ 4

  SETUP_CELL_TYPE_N Floor_4.spr, Floor_cell_name, Floor_actions

Floor_actions:
  db do_stand
  dw Floor_reaction_move
  defb 0

Floor_reaction_move:
  defb 0
