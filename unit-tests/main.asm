  DEVICE ZXSPECTRUM48

  SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

  org #6000

main:
  ld sp, stack_top
  xor a

.loop
  inc a
  out (#fe), a
  jr .loop
  
  include "../zx-core/libs/unit-tests/unit_tests.inc"
  include "../zx-core/libs/unit-tests/stack.asm"
  include "unit-tests.asm"

  include "UT_Cells.asm"
  include "UT_Hero.asm"

  SAVESNA "z80-sample-program.sna", main
