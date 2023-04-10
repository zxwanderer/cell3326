  MODULE ScreenFX

; ; Вывести описание ячейки на которую смотрит герой
; hero_look_at_cell:
;   LD IX, (Hero.LOGIC_ACTIVE_HERO_PTR)
;   LD D, (IX+Hero.pos.x)
;   LD E, (IX+Hero.pos.y)
;   LD (Hero.LOGIC_MapCell_xy),DE
;   LD A, (IX+Hero.dir)
;   CALL EventsMap.cell_by_dir_ptr
;   LD (Hero.LOGIC_MapCell_ptr), HL
;   RET NC;  возвратили false - неправильное направление
;   LD A, (HL)

; Показываем информацию о ячейке
; На входе:
;   A - тип ячейки
show_cell_info:
  CALL CELL_CALC_PTR_BY_INDEX
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
  CALL SCREEN_CLEAR_ROWS
  POP DE
  
  POP HL
	CALL Text68.print_at
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

; ----- показать спрайт на месте действия ( например удар об стенку)
; На входе:
;   A - номер спрайта
fx_action_cell:
    RET
    LD (.active_spr_num+1), A
    LD A, ( Hero.LOGIC_ACTIVE_MAP_POS+Point.y )
    ; LD HL, LOGIC_ViewPos
    SUB (HL)
    ADD A,A ; так как у нас тайлы в 2 ячейки то умножаем результат на два
    LD E,A
    INC HL
    LD A, ( Hero.LOGIC_ACTIVE_MAP_POS+Point.x )
    SUB (HL)
    ADD A,A ; так как у нас тайлы в 2 ячейки то умножаем результат на два
    LD D,A ; в DE - экранная позиция
.active_spr_num:
    LD A, #00

; ----- показать один спрайт на экране ( для эффектов )
; в DE - экранная позиция
; в A - номер спрайта
show_sprite:
    CALL TILE16_INDEX_TO_PTR ; в HL у нас указатель на спрайт
    CALL SCREEN_POS_TO_SCR ; в DE у нас указатель на экран
    CALL TILE16_SHOW
    RET

; На входе 
;   HL - указатель на последовательность sound: db #00, info: dw #0000, set: db #00
sound_show_info_and_set_cell:
  LD A, (HL)
  LD (.fx+1), A
  INC HL
  PUSH HL
  HL_PTR_TO_HL
  LD (.message+1), HL
  POP HL
  INC HL
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
  LD HL, (Hero.LOGIC_ACTIVE_MAP_PTR)
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
