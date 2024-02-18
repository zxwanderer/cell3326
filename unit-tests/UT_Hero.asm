  include "../src/_defines_h.asm"

  include "../zx-core/libs/map/Directions_h.asm"
  include "../src/Hero_h.asm"
  include "../src/Hero.asm"

 MODULE TestSuite_Hero

UT_Hero_struct:
  LD IX, HEROES_SET
  LD HL, (IX+Hero.pos)
  nop ; ASSERTION  H == 4
  nop ; ASSERTION  L == 3

  LD A, (IX+Hero.dir)
  nop ; ASSERTION  A == dir_up
  TC_END

  include "../src/heroes_data.asm"

 ENDMODULE
