  MODULE FX

; Вывести описание ячейки на которую смотрят
look_at_hero_cell:
  LD IX, (Hero.LOGIC_activeHero_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL EventsMap.cell_by_dir_ptr
  RET NC;  возвратили false - неправильное направление
  LD A, (HL)

; Показываем информацию о ячейке
; На входе:
;   A - тип ячейки
show_cell_info:
  CALL Cells.cell_by_type_ptr
; так как описание ячейки начинается с указателя на текстовое сообщение,
; нам не нужно загружать индексный регистр и вычислять сдвиг, мы сразу
; готовы выводить текст

; Показываем текст в двух нижних строчках экрана
; На входе
;   HL - указатель на сообщение
show_info_message:
  PUSH HL

  LD DE, #0016
  CALL SCREEN_POS_TO_SCR
  PUSH DE
  LD B, 2
  CALL clean_rows
  POP DE
  
  POP HL
	; LD HL, Empty_cell_name
  LD HL, CELL_TYPES
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
