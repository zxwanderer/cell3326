  include "_defines_h.asm"
  include "../zx-core/libs/im2/im2_h.asm"

start:
  DI
  ; IM2_INIT_JP INT_VECTOR, Interrupts

INT_VECTOR_h equ high INT_VECTOR
INT_VECTOR_h_1 equ INT_VECTOR_h + 1
INT_VECTOR_END equ INT_VECTOR + 257

INT_ROUTINE equ INT_VECTOR_h_1 * 256 + INT_VECTOR_h_1
INT_ROUTINE_END equ INT_ROUTINE + 3

  LD HL, INT_VECTOR
  LD B,0
  LD A, INT_VECTOR_h_1
.init_loop:
  LD (HL),A
  INC HL
  DJNZ .init_loop
  LD (HL),A
  LD H, INT_VECTOR_h_1
  LD L,H
  LD (HL),#C3
  INC HL
  LD DE, Interrupts
  LD (HL),E
  INC HL
  LD (HL),D
  LD A, INT_VECTOR_h
  LD I,A
  IM 2
  EI

  LD SP, STACK_TOP
.loop
  inc a
  out (#fe), a
  jp .loop
