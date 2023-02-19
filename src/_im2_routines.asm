interr:	
	di
	DO_PUSH_ALL_REGISTRY
	
  ; LD A,1
  ; OUT(#FE), A

	DO_POP_ALL_REGISTRY
	ei
	ret
