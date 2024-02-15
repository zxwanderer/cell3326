  include "_defines_h.asm"
  include "../zx-core/libs/im2/im2_h.asm"

start:
  DI
  LD SP, STACK_TOP

  IM2_INIT_JP INT_VECTOR, Interrupts

.loop
  inc a
  out (#fe), a
  jr .loop
