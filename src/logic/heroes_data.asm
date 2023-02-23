HeroesNum equ 1

Hero09.spr: equ 160

tHeroName: defb 'Hero1',0

HEROES_SET: ; описываем героев:
Hero1: 
  Hero 2,2, dir_up, Hero09.spr, Hero09.spr, 0, 0, tHeroName, 00
