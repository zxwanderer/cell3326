  MODULE ScreenFX

; Вывести описание ячейки на которую смотрят
look_at_hero_cell:
  LD IX, (Hero.LOGIC_activeHero_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD (Hero.LOGIC_MapCell_xy),DE
  LD A, (IX+Hero.dir)
  CALL EventsMap.cell_by_dir_ptr
  LD (Hero.LOGIC_MapCell_ptr), HL
  RET NC;  возвратили false - неправильное направление
  LD A, (HL)

; Показываем информацию о ячейке
; На входе:
;   A - тип ячейки
show_cell_info:
  CALL Cells.cell_by_type_ptr
; так как описание ячейки начинается с указателя на текстовое сообщение,
; нам не нужно загружать индексный регистр и вычислять сдвиг, мы сразу получили
; указатель на указатель на текст сообщения
    LD (.cell_info_ptr+1), HL
.cell_info_ptr:
    LD HL, (#0000)

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


; На входе 
;   HL - указатель на последовательность info: dw #0000, sound: db #00
show_info_and_sound:
  PUSH HL
  HL_PTR_TO_HL
  LD (.message+1), HL
  POP HL
  INC HL
  INC HL
  LD A, (HL)
  LD (.fx+1), A
.message
  LD HL, #0000
  CALL ScreenFX.show_info_message
.fx
  LD A, #00
  CALL FX_SET
  RET

fx_action_cell:
  RET

; На входе 
;   HL - указатель на последовательность info: dw #0000, sound: db #00, set: db #00
show_info_sound_and_set_cell:
  PUSH HL
  HL_PTR_TO_HL
  LD (.message+1), HL
  POP HL
  INC HL
  INC HL
  LD A, (HL)
  LD (.fx+1), A
  INC HL
  LD A, (HL)
  LD (.cell_set+1), A
.message
  LD HL, #0000
  CALL ScreenFX.show_info_message
.fx
  LD A, #00
  CALL FX_SET
.cell_set
  LD A, #00
cell_set_proc:
  LD HL, (Hero.LOGIC_MapCell_ptr)
  LD (HL), A
  RET


; Отрицательно все
nope_script:
  LD A, FX_Nope
  CALL FX_SET
  JP check_act_no

kick_fault: ; неуспех удара предметом
  LD A, FX_Wall
  CALL FX_SET
  CALL action_ring_explode
  JP check_act_no

kick_cut_fault: ; неуспех резания острым
  LD A, 39
  CALL FX_SET
  CALL action_ring_explode
  LD HL, Kick_shard_mess
  CALL ScreenFX.show_info_message
  JP check_act_no

wait_halt_loop:
  HALT
  DJNZ wait_halt_loop
  RET

Ring_expl_1 equ #b0
Ring_expl_2 equ #b1
Ring_expl_3 equ #b2
Ring_expl_4 equ #b3

action_ring_explode:
  LD A, Ring_expl_1
  CALL fx_action_cell
  LD B, 3
  CALL wait_halt_loop

  LD A, Ring_expl_2
  CALL fx_action_cell
  LD B, 3
  CALL wait_halt_loop

  LD A, Ring_expl_3
  CALL fx_action_cell
  LD B, 3
  CALL wait_halt_loop

  LD A, Ring_expl_4
  CALL fx_action_cell
  LD B, 3
  CALL wait_halt_loop

  LD A, Ring_expl_3
  CALL fx_action_cell
  LD B, 1
  CALL wait_halt_loop

  LD A, Ring_expl_2
  CALL fx_action_cell
  LD B, 1
  CALL wait_halt_loop

  LD A, Ring_expl_1
  CALL fx_action_cell
  LD B, 1
  CALL wait_halt_loop
  RET

  ENDMODULE
