
AirLand_37.spr equ 37
NavLight_70.spr equ 70

  SETUP_CELL_TYPE_N AirLand_37.spr, AirLand_cell_name, Floor_actions
  SETUP_CELL_TYPE_N NavLight_70.spr, NavLight_cell_name, NavLight_actions

NavLight_actions
  defb 00
