Gold_door_open_34.spr equ 34
Door_open_2.spr equ 110

Gold_door_2.spr equ 2

  SETUP_CELL_TYPE_N Gold_door_2.spr, Door_cell_name, Gold_door_actions

  SETUP_CELL_TYPE_N Gold_door_open_34.spr, Door_cell_name, Door_actions
  SETUP_CELL_TYPE_N Door_open_2.spr, Door_cell_name, Door_actions

Door_actions:
  SET_ACTION_REACTON do_stand, reaction_stand
  defb 0


Gold_door_actions:
  defb 0
