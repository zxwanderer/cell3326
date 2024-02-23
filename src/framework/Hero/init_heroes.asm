
  ifndef _INIT_HEROES_ASM
  define _INIT_HEROES_ASM

  include "../Maps.asm"

  ; include "../../../zx-core/libs/map/calc_pos.asm"
  ; include "./set_sprite_by_direction.asm"

; --------------------------------------------------------------------------------------
; Инициализация персонажей на карте, переход на первого персонажа
; --------------------------------------------------------------------------------------
init_heroes:
  LD B,  HeroesNum
  LD HL, HEROES_SET
  LD DE, Hero
.init_loop:
  PUSH BC
  PUSH DE
  PUSH HL

  PUSH HL
  POP IX

  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL Maps.calc_pos_ptr
  ; CALL MAP_CALC_PTR_BY_POS
  LD A,(HL)
  LD (IX+Hero.ground),A; ячейку карты ставим на пол персонажа
  CALL Maps.set
  ; CALL set_sprite_by_direction

  POP HL
  POP DE
  POP BC
  ADD HL, DE
  DJNZ .init_loop

    endif
