Electronic_39.spr equ 39
Electronic_break_40.spr equ 40
Cavity_43.spr equ 43

Mentoscanner_56.spr equ 56
ElectonicDestroyed_71.spr equ 71

  SETUP_CELL_TYPE_N Electronic_39.spr, Electronic_cell_name, Electronic_cell_actions
  SETUP_CELL_TYPE_N Electronic_break_40.spr, Electronic_break_name, Electronic_break_actions
  SETUP_CELL_TYPE_N Cavity_43.spr, Cavity_cell_name, Cavity_actions

  SETUP_CELL_TYPE_N Mentoscanner_56.spr, Mentoscanner_cell_name, Mentoscanner_actions

  SETUP_CELL_TYPE_N ElectonicDestroyed_71.spr, ElectonicDestroy_cell_name, ElectonicDestroyed_actions

Electronic_cell_actions:
  db 00

Electronic_break_actions:
  db 00

Cavity_actions:
  db 00

Mentoscanner_actions:
  db 00

ElectonicDestroyed_actions:
  db 00