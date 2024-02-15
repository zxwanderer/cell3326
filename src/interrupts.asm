  include "_defines_h.asm"
  include "../zx-core/libs/im2/im2_h.asm"

; // ------------- interrupt tabs
  IM2_ORG_VECTOR_TABLE INT_TABLE

; // ------------- im2 routines
  IM2_ROUTINES_ORG_START INT_VECTOR
  ld sp, Im2_internal_stack


  IM2_ROUTINES_END
ds 100,0
Im2_internal_stack equ $-1
