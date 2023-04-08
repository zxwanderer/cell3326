Computer_4.spr equ 4
ComputerOffline_20.spr equ 20
Computer_break_36.spr equ 36

  SETUP_CELL_TYPE_N Computer_4.spr, Computer_cell_name, Computer_online_actions
  SETUP_CELL_TYPE_N ComputerOffline_20.spr, Computer_cell_name, Computer_actions
  SETUP_CELL_TYPE_N Computer_break_36.spr, Computer_break_cell_name, Computer_break_actions

Computer_online_actions:
  defb 0

Computer_actions:
  defb 0

Computer_break_actions:
  defb 0
