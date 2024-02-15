  include "_defines_h.asm"
  include "../zx-core/libs/stack/push_pop_h.asm"
; include "../zx-core/libs/im2/im2_h.asm"

// ------------- interrupt tabs
  ; IM2_ORG_VECTOR_TABLE INT_TABLE

; // ------------- im2 routines
  ; IM2_ROUTINES_ORG_START INT_VECTOR
  ; ld sp, Im2_internal_stack


  ; IM2_ROUTINES_END
Interrupts:
		DI
		LD (_im2_sp_addr), SP
		DO_PUSH_ALL_REGISTRY

  	; xor a
    ; out (#fe), a

    DO_POP_ALL_REGISTRY
_im2_sp_addr: equ $+1
		LD SP, #0000
  	EI
  	RET

ds 100,0
Im2_internal_stack equ $-1
