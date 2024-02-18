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
  
  ; Reserve stack space
    defw 0  ; WPMEM, 2
stack_bottom:
    defs    STACK_SIZE*2, 0
stack_top:
    ;defw 0
    defw 0  ; WPMEM, 2

  include "../zx-core/libs/unit-tests/unit_tests.inc"
  include "unit-tests.asm"

  include "UT_Cells.asm"
  include "UT_Hero.asm"

  SAVESNA "z80-sample-program.sna", main
