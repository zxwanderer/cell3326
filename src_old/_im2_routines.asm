interr:	
	di
	LD (.sp_addr), SP
	DO_PUSH_ALL_REGISTRY
	
  ; LD A,1
  ; OUT(#FE), A

	DO_POP_ALL_REGISTRY
.sp_addr equ $+1
	LD SP, #0000
	ei
	ret
