Computer_4.spr equ 4
ComputerOffline_20.spr equ 20
Computer_break_36.spr equ 36

  SETUP_CELL_TYPE_N Computer_4.spr, Computer_cell_name, Computer_online_actions
  SETUP_CELL_TYPE_N ComputerOffline_20.spr, Computer_cell_name, Computer_actions
  SETUP_CELL_TYPE_N Computer_break_36.spr, Computer_break_cell_name, Computer_break_actions

Computer_actions:
  defb 0

Computer_break_actions:
  defb 0

Computer_online_actions:
  SET_ACTION_REACTON do_use, Computer_actions_use
  defb 0

Computer_actions_use:
  LD HL, Computer_off_mess
  CALL ScreenFX.show_info_message
  LD A, FX_Computer
  CALL FX_SET
  LD A, ComputerOffline_20.spr
  LD HL, (Hero.LOGIC_MapCell_ptr)
  LD (HL), A
  JP check_act_no
