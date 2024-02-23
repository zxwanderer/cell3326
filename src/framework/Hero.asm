  ifndef _HERO_ASM_
  define _HERO_ASM_

  include "./Hero/Hero_h.asm"

  MODULE Hero
    include "./Hero/init_heroes.asm"  ; init_heroes
; --------------------------------------------------------------------------------------
; Переход на первого персонажа
;   На выходе:
;     LOGIC_ACTIVE_HERO_PTR - установлен на первого героя
;     LOGIC_ACTIVE_HERO_NUM - установлен в 0
; --------------------------------------------------------------------------------------
firstChar:
  LD HL, HEROES_SET
  ld (LOGIC_ACTIVE_HERO_PTR), HL
  XOR A
  LD (LOGIC_ACTIVE_HERO_NUM), A
  RET

LOGIC_LAST_ACTION db 00
LOGIC_ACTIVE_HERO_NUM db 00
LOGIC_ACTIVE_HERO_PTR dw 0000
LOGIC_ACTIVE_MAP_POS dw 0000
LOGIC_ACTIVE_MAP_PTR dw 0000
LOGIC_VIEW_POS dw 00

do:
  RET
show_hero_at_screen:
  RET
move:
  RET
hero_look_at_cell:
  RET

  ENDMODULE

  endif
