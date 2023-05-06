Gold_door_2.spr equ 2
Green_door_91.spr equ 91

Gold_door_open_34.spr equ 34
Door_open_110.spr equ 110

Gold_door_l_109.spr equ 109
Green_door_l_93.spr equ 93

Gold_door_l_open_111.spr equ 111
Green_door_l_open_94.spr equ 94

WallHole_72.spr equ 72
WallHole_140.spr equ 140

  SETUP_CELL_TYPE_N Gold_door_2.spr, Door_cell_name, Gold_door_actions
  SETUP_CELL_TYPE_N Green_door_91.spr, Door_cell_name, Green_door_actions

  SETUP_CELL_TYPE_N Gold_door_open_34.spr, Door_cell_name, Door_open_actions
  SETUP_CELL_TYPE_N Door_open_110.spr, Door_cell_name, Door_open_actions

  SETUP_CELL_TYPE_N Gold_door_l_109.spr, Door_cell_name, Gold_door_l_actions
  SETUP_CELL_TYPE_N Green_door_l_93.spr, Door_cell_name, Green_door_l_actions

  SETUP_CELL_TYPE_N Gold_door_l_open_111.spr, Door_cell_name, Gold_door_l_open_actions
  SETUP_CELL_TYPE_N Green_door_l_open_94.spr, Door_cell_name, Green_door_l_open_actions

  SETUP_CELL_TYPE_N WallHole_72.spr, WallHole_name, Floor_actions
  SETUP_CELL_TYPE_N WallHole_140.spr, WallHole_name, Floor_actions

Door_open_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0

Gold_door_actions:
  SET_ACTION_REACTON do_use, Gold_door_actions_use
  defb 0

Gold_door_actions_use:
  LD HL, Door_not_open_mess
  CALL ScreenFX.show_info_message
  JP ScreenFX.nope_script

Green_door_actions:
  defb 0

Gold_door_l_actions:
  defb 0

Green_door_l_actions:
  defb 0

Gold_door_l_open_actions:
  defb 0

Green_door_l_open_actions:
  defb 0
