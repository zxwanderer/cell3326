  include "_defines_h.asm"
  include "../zx-core/libs/im2/im2_lite_h.asm"

start:
  DI
  IM2_INIT INT_TABLE_HIGH
  EI

  LD SP, STACK_TOP
.loop
  halt
  ld a, 1
  out (#fe), a

  halt
  ld a, 2
  out (#fe), a

  jp .loop
