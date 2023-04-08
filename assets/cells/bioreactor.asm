Canister_7.spr equ 7
Canister_113.spr equ 113
CanisterEmpty_29.spr equ 29
CanisterPowered_114.spr equ 114
Generator_73.spr equ 73

  SETUP_CELL_TYPE_N Canister_7.spr, Canister_cell_name, Canister_actions
  SETUP_CELL_TYPE_N Canister_113.spr, Canister_cell_name, Canister_actions
  SETUP_CELL_TYPE_N CanisterEmpty_29.spr, CanisterEmpty_cell_name, CanisterEmpty_actions
  SETUP_CELL_TYPE_N CanisterPowered_114.spr, CanisterPowered_cell_name, CanisterPowered_actions
  SETUP_CELL_TYPE_N Generator_73.spr, Generator_cell_name, Generator_actions

Canister_actions:
  db 00

CanisterEmpty_actions:
  db 00

CanisterPowered_actions:
  db 00

Generator_actions:
  db 00
