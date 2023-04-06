Computer.spr equ 20
Computer_break.spr equ 36

  SETUP_CELL_TYPE_N Computer.spr, Computer_cell_name, Computer_actions
  SETUP_CELL_TYPE_N Computer_break.spr, Computer_break_cell_name, Computer_break_actions

Computer_actions:
  defb 0

Computer_break_actions:
  defb 0
