  MACRO SETUP_CELL_TYPE_N _name, _script
._temp equ $; запоминаем адрес
    ORG CELL_TYPES + spr*CellType
    CellType _name, _script
    ORG ._temp
  ENDM
