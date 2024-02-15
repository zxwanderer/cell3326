  include "_defines_h.asm"
  include "../zx-core/libs/im2/im2_h.asm"

start:
  DI
  IM2_INIT INT_TABLE, INT_VECTOR
  EI

  LD SP, STACK_TOP
  HALT

.loop
  inc a
  out (#fe), a
  jr .loop
