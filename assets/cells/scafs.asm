ScafPlace_190.spr equ 190
Scaf_128.spr equ 128
HardScaf_144.spr equ 144

  SETUP_CELL_TYPE_N ScafPlace_190.spr, ScafPlace_cell_name, ScafPlace_actions
  SETUP_CELL_TYPE_N Scaf_128.spr, Scaf_cell_name, Scaf_actions
  SETUP_CELL_TYPE_N HardScaf_144.spr, HardScaf_cell_name, HardScaf_actions

ScafPlace_actions:
  db 00

Scaf_actions:
  db 00

HardScaf_actions:
  db 00
