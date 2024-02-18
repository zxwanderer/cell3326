  include "../src/CellType_h.asm"

name_ptr equ #CCCC
script_ptr equ #DDDD

Empty_cell_name: db "Empty",0

  include "../src/cells_data.asm"

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
  TC_END


 ENDMODULE
