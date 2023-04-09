  MACRO SETUP_CELL_TYPE_N _spr, _name, _action_reaction_table
.temp equ $; запоминаем адрес
    ORG CELL_TYPES + _spr*CellType
    CellType _name, _action_reaction_table
    ORG .temp
  ENDM

  MACRO SET_ACTION_REACTON _act, _react
    defb _act
    defw _react
  ENDM
