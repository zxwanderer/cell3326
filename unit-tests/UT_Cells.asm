  include "../src/CellType_h.asm"

name_ptr equ #CCCC
script_ptr equ #DDDD

Empty_cell_name: db "Empty",0

  include "../src/cells_data.asm"
  include "../src/Cells.asm"

 MODULE TestSuite_Cells

my_cell_defines:
  CellType name_ptr, script_ptr

UT_CellType_struct:
  LD HL, (my_cell_defines)
  nop; ASSERTION HL == name_ptr
  LD HL, (my_cell_defines + 2)  
  nop; ASSERTION HL == script_ptr
  TC_END


UT_CellData_defines:
  LD HL, (CELL_TYPES)
  nop; ASSERTION HL == Empty_cell
  LD HL, (Empty_cell)
  nop; ASSERTION HL == Empty_cell_name
  LD HL, (Empty_cell + 2)
  nop; ASSERTION HL == No_action_reaction
  TC_END


UT_Cells_module:
  LD A, #00
  CALL Cells.get_by_index
  nop; ASSERTION HL == Empty_cell
  LD A, #01
  CALL Cells.get_by_index
  nop; ASSERTION HL == Empty_cell
  TC_END

 ENDMODULE
