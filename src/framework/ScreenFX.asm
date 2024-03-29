  ifndef __SCREEN_FX_ASM_
  define __SCREEN_FX_ASM_

  include "../../assets/fx/demoFX_h.asm"
  include "../../zx-core/libs/registers/hl_ptr_to_hl_h.asm"
  include "../../zx-core/libs/result/set_result_h.asm"
  include "../../zx-core/libs/screen/pos_to_scr.asm"
  include "../../zx-core/libs/screen/clear_rows.asm"
  include "../../zx-core/libs/tiles16/index_to_ptr.asm"
  include "../../zx-core/libs/tiles16/show.asm"
  include "../../zx-core/libs/tiles16/show_screen.asm"

  include "../../zx-core/libs/text/text68.asm"
  include "../../zx-core/libs/text/print_number_hex.asm"
  include "../../zx-core/libs/text/print_number_dec.asm"

  include "./Cells.asm"
  
  MODULE ScreenFX

; Показываем информацию о ячейке
; На входе:
;   A - тип ячейки
show_cell_info:
  ld (.last_cell_index), A
  CALL Cells.get_by_index
  HL_PTR_TO_HL

  PUSH HL
  LD DE, Empty_cell_name
  LD A, H
  CP D
  JP NZ, .not_empty_cell
  LD A, L
  CP E
  JP Z, .is_empty_cell
.not_empty_cell
  POP HL
  JP ScreenFX.show_info_message

.is_empty_cell
  POP HL ; снимаем чтобы не болталось

  LD DE, #0016
  CALL SCREEN_POS_TO_SCR
  PUSH DE

  LD B, 2
  CALL SCREEN_CLEAR_ROWS

  LD DE, print_number_hex
  LD HL, (.last_cell_index)
  CALL PHEX_W
  
  LD DE, print_number_dec
  LD HL, (.last_cell_index)
  CALL PDEC_W

  POP DE

  LD HL, print_number
  CALL Text68.print_at

  RET

.last_cell_index: db 0, 0

print_number: 
print_number_dec:
    defb "00000"
    defb "("
print_number_hex:  
    defb "0000"
    defb ")", 0

; CALL Cells.get_by_index
; так как описание ячейки начинается с указателя на текстовое сообщение,
; нам не нужно загружать индексный регистр и вычислять сдвиг, мы сразу получили
; указатель на указатель на текст сообщения
  ; HL_PTR_TO_HL

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
    LD (.active_spr_num+1), A
    LD A, ( Heroes.LOGIC_ACTIVE_MAP_POS+Point.y )
    LD HL, Heroes.LOGIC_VIEW_POS
    SUB (HL)
    ADD A,A ; так как у нас тайлы в 2 ячейки то умножаем результат на два
    LD E,A
    INC HL
    LD A, ( Heroes.LOGIC_ACTIVE_MAP_POS+Point.x )
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
.fx
  LD A, #00
  CALL FX_SET
.message
  LD HL, #0000
  CALL ScreenFX.show_info_message
.cell_set
  LD A, #00
cell_set_proc:
  LD HL, (Heroes.LOGIC_ACTIVE_MAP_PTR)
  LD (HL), A
  RET

; Отрицательно все
nope_script:
  LD A, FX_Nope
  CALL FX_SET
  retFalse

kick_fault: ; неуспех удара предметом
  LD A, FX_Wall
  CALL FX_SET
  CALL action_ring_explode
  retFalse

kick_cut_fault: ; неуспех резания острым
  LD A, 39
  CALL FX_SET
  CALL action_ring_explode
  LD HL, Kick_shard_mess
  CALL ScreenFX.show_info_message
  retFalse

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

  endif
