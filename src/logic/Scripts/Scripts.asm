; actions-reactions table:
; action: db #00
; reaction_table: dw #0000

  MODULE Scripts

; На входе:
;   A - индекс
;   HL - указатель на таблицу
; На выходе:
;   HL - найденные значения
;   retFalse - если не нашли Carry = 0
scan_table_by_index:
  LD A, (HL)
  AND A  ;проверяем на 0
	JP NZ, .scan
  retFalse
.scan
  RET

; script_default_no:
  ; RET

set_zero_ret:
  XOR A
  LD (Scripts.var_ret), A
  RET

set_one_ret:
  LD A, 1
  LD (Scripts.var_ret), A
  RET

var_ret:
  defb 00

  ENDMODULE


