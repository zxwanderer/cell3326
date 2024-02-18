  include "../../src/CellType_h.asm"
  include "../../zx-core/libs/result/set_result.asm"

Grass_17.spr equ 17
Grass_32.spr equ 32
Grass_65.spr equ 65
Grass_158.spr equ 158

Gravel_80.spr equ 80
Gravel_112.spr equ 112

Bush_48.spr equ 48
Bush_64.spr equ 64


  DEFINE_SPR_CELL Grass_17.spr, Grass_cell
  DEFINE_SPR_CELL Grass_32.spr, Grass_cell
  DEFINE_SPR_CELL Grass_65.spr, Grass_cell
  DEFINE_SPR_CELL Grass_158.spr, Grass_cell

  DEFINE_SPR_CELL Gravel_80.spr, Gravel_cell
  DEFINE_SPR_CELL Gravel_112.spr, Gravel_cell

  DEFINE_SPR_CELL Bush_48.spr, Bush_cell
  DEFINE_SPR_CELL Bush_64.spr, Bush_cell

  SET_CELL_TYPE Grass_cell, Grass_cell_name, Floor_actions
  SET_CELL_TYPE Gravel_cell, Gravel_cell_name, Floor_actions
  SET_CELL_TYPE Bush_cell, Bush_cell_name, No_action_reaction

  ; SETUP_CELL_TYPE_N Grass_17.spr, Grass_cell_name, Floor_actions
  ; SETUP_CELL_TYPE_N Grass_32.spr, Grass_cell_name, Floor_actions
  ; SETUP_CELL_TYPE_N Grass_65.spr, Grass_cell_name, Floor_actions
  ; SETUP_CELL_TYPE_N Grass_158.spr, Grass_cell_name, Floor_actions

  ; SETUP_CELL_TYPE_N Gravel_80.spr, Gravel_cell_name, Floor_actions
  ; SETUP_CELL_TYPE_N Gravel_112.spr, Gravel_cell_name, Floor_actions

  ; SETUP_CELL_TYPE_N Bush_48.spr, Bush_cell_name, Bush_actions
  ; SETUP_CELL_TYPE_N Bush_64.spr, Bush_cell_name, Bush_actions

; Bush_actions:
  ; defb 0
