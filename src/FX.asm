  MODULE FX

; Вывести описание ячейки на которую смотрят
look_at_hero_cell:
  LD IX, (Hero.LOGIC_activeHero_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL EventsMap.cell_by_dir
  RET NC;  возвратили false - неправильное направление

	LD DE, #0016
  CALL SCREEN_POS_TO_SCR
  PUSH DE
  LD B, 2
  CALL clean_rows
  POP DE
	LD HL, Empty_cell_name
	CALL Text68.print_at

  RET

; Очистить N строчек экрана
; На входе:
;   в DE - начальный адрес экрана
;   в B - число строчек
clean_rows:
.loop0
  LD A, #00 ; A у нас портится при вызове SCREEN_CALC_DOWN_POS, нужно восстановить 
  PUSH BC
  LD B, 8
  PUSH DE
.loop1:
  PUSH BC
  LD B, 32
  PUSH DE
.loop2:           // рисуем линию в 32 символа
  LD (DE), A
  INC E
  DJNZ .loop2
  POP DE
  INC D
  POP BC
  DJNZ .loop1
  POP DE
  CALL SCREEN_CALC_DOWN_POS
  POP BC
  DJNZ .loop0

  RET
  ENDMODULE
