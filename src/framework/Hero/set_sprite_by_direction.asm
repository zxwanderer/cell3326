  ; include "../../../zx-core/libs/map/calc_pos.asm"
  ; include "../../../zx-core/libs/map/set.asm"

  include "../Maps.asm"

  ifndef _SET_SPRITE_BY_DIRECTION_
  define _SET_SPRITE_BY_DIRECTION_

; --------------------------------------------------------------------------------------
; Изменение спрайта в описании героя и на карте в зависимости от направления персонажа в его описании
; Вход:
;  IX - указатель на героя
;  IX.dir - направление
; --------------------------------------------------------------------------------------
set_sprite_by_direction:
  LD B,(IX+Hero.base_spr)
  LD A,(IX+Hero.dir)
  ADD A, B
  LD (IX+Hero.sprite), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL Maps.set
  ; CALL MAP_SET_BY_POS
  RET

  endif
