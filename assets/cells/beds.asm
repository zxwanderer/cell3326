Bed.spr equ 19

  SETUP_CELL_TYPE_N Bed.spr, Bed_cell_name, Bed_actions

Bed_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  SET_ACTION_REACTON do_use, Bed_action_use
  defb 0

Bed_action_use:
  CALL ScreenFX.nope_script
  LD HL, Take_bed_mess
  CALL ScreenFX.show_info_message
  JP check_act_no

  