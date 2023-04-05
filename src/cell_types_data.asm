CELL_TYPES:
  DUP 256
    ; dw Empty_cell_name_ptr
    ; dw 00
    CellType Empty_cell_name, no_way_script
    ; defb 00
  EDUP

no_way_script:
  RET
