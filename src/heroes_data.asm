  include "./framework/Hero/Hero_h.asm"
  include "../zx-core/libs/map/Directions_h.asm"

HeroesNum equ 1

Hero09.spr: equ 160

tHeroName: defb 'Hero1',0

HEROES_SET: ; описываем героев:
Hero1: 
  Hero 3,4, dir_up, Hero09.spr, Hero09.spr, 0, 0, tHeroName, 0
