Grass_17.spr equ 17
Grass_32.spr equ 32
Grass_65.spr equ 65
Grass_158.spr equ 158

Gravel_80.spr equ 80
Gravel_112.spr equ 112

  SETUP_CELL_TYPE_N Grass_17.spr, Grass_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Grass_32.spr, Grass_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Grass_65.spr, Grass_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Grass_158.spr, Grass_cell_name, Floor_actions

  SETUP_CELL_TYPE_N Gravel_80.spr, Gravel_cell_name, Floor_actions
  SETUP_CELL_TYPE_N Gravel_112.spr, Gravel_cell_name, Floor_actions

Bush_48.spr equ 48
Bush_64.spr equ 64

  SETUP_CELL_TYPE_N Bush_48.spr, Bush_cell_name, Bush_actions
  SETUP_CELL_TYPE_N Bush_64.spr, Bush_cell_name, Bush_actions

Bush_actions:
  defb 0
