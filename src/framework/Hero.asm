  ifndef _HERO_ASM_
  define _HERO_ASM_

  include "./Hero/Hero_h.asm"
  include "./EventsMap.asm"

  MODULE Hero
    include "./Hero/init_heroes.asm"  ; init_heroes
    ; ^^^ в функции нет RET, сразу переходим на функцию first_char
; --------------------------------------------------------------------------------------
; Переход на первого персонажа
;   На выходе:
;     LOGIC_ACTIVE_HERO_PTR - установлен на первого героя
;     LOGIC_ACTIVE_HERO_NUM - установлен в 0
; --------------------------------------------------------------------------------------
first_char:
  LD HL, HEROES_SET
  ld (LOGIC_ACTIVE_HERO_PTR), HL
  XOR A
  LD (LOGIC_ACTIVE_HERO_NUM), A
  RET

LOGIC_LAST_ACTION     db 00
LOGIC_ACTIVE_HERO_NUM db 00
LOGIC_ACTIVE_HERO_PTR dw 0000
LOGIC_ACTIVE_MAP_POS  dw 0000
LOGIC_ACTIVE_MAP_PTR  dw 0000
LOGIC_VIEW_POS        dw 0000

do:
  RET

show_hero_at_screen:
  LD IX, (LOGIC_ACTIVE_HERO_PTR) ; устанавливаем указатель на описание героя

  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  PUSH DE
  CALL EventsMap.lookAround ; герой осматривается на новой позиции
  POP DE

  CALL VIEW_CALC_LOOK_AT_CENTER ; в DE позиция окна view на карте
  LD (LOGIC_VIEW_POS), DE

  CALL MAP_CALC_PTR_BY_POS ; в HL указатель на ячейку карты
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
  RET

move:
  RET

hero_look_at_cell:
  RET

  ENDMODULE

  endif
