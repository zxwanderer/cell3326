  include "_defines_h.asm"
  include "../zx-core/libs/im2/im2_h.asm"

start:
  DI
  ; IM2_INIT_JP INT_VECTOR, Interrupts

  ; LD SP, STACK_TOP
.loop
  inc a
  out (#fe), a
  jr .loop
