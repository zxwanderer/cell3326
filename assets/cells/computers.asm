Computer_4.spr equ 4
  SETUP_CELL_TYPE_N Computer_4.spr, Computer_cell_name, Computer_online_actions

Computer_online_actions:
  SET_ACTION_REACTON do_use, Computer_actions_use
  defb 0

Computer_actions_use:
  LD HL, computer_off_set
  CALL ScreenFX.show_info_sound_and_set_cell
  CALL ScreenFX.action_ring_explode
  JP check_act_no
computer_off_set:
  dw Computer_off_mess
  db FX_Computer
  db ComputerOffline_20.spr


ComputerOffline_20.spr equ 20
  SETUP_CELL_TYPE_N ComputerOffline_20.spr, Computer_cell_name, Computer_actions

Computer_actions:
  SET_ACTION_REACTON do_use, Computer_offline_actions_use
  defb 0

Computer_offline_actions_use:
  LD HL, computer_offline_use_set
  CALL ScreenFX.show_info_and_sound
  JP check_act_no
computer_offline_use_set:
  dw Computer_off_hit_mess
  db FX_Poweroff


Computer_break_36.spr equ 36
  SETUP_CELL_TYPE_N Computer_break_36.spr, Computer_break_cell_name, Computer_break_actions

Computer_break_actions:
  defb 0

