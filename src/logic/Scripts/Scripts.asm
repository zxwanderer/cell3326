; actions-reactions table:
; action: db #00
; reaction_table: dw #0000

  MODULE Scripts

; На входе:
;   A - индекс
;   HL - указатель на таблицу
; На выходе:
;   HL - найденное значения
;   retFalse - если не нашли Carry = 0
scan_table_by_index:
  LD (.index_set+1), A

.loop
  LD A, (HL)
  AND A  ;проверяем на 0
	JP Z, check_act_no

.index_set:
  CP #00
  JR Z, .found
  INC HL
  INC HL
  INC HL
  JR .loop

.found:
  INC HL ; передвигаем с действия на указатель
  JP check_act_yes

  ENDMODULE
