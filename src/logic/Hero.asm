  MODULE Hero

; LOGIC_LAST_ACTION - последнее действие героя
; LOGIC_activeHero_ptr - указатель на описание героя
; LOGIC_curHeroNum - текущий номер героя
; LOGIC_MapCell_xy - текущие координаты события
; LOGIC_MapCell_ptr - указатель на ячейку события


; --------------------------------------------------------------------------------------
; Инициализация персонажей на карте, переход на первого персонажа
; --------------------------------------------------------------------------------------
initHeroes:
.init_loop:
  LD B, HeroesNum
  LD HL, HEROES_SET
  LD DE, Hero
  PUSH BC
  PUSH DE
  PUSH HL

  PUSH HL
  POP IX

  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL CELLS_CALC_POS
  LD A,(HL)
  LD (IX+Hero.ground),A; ячейку карты ставим на пол персонажа
  CALL update_sprite_by_direction

  POP HL
  POP DE
  POP BC
  ADD HL, DE
  DJNZ .init_loop

; --------------------------------------------------------------------------------------
; Переход на первого персонажа
; --------------------------------------------------------------------------------------
firstChar:
  LD HL, HEROES_SET
  ld (LOGIC_activeHero_ptr), HL
  XOR A
  LD (LOGIC_curHeroNum), A
  RET

; --------------------------------------------------------------------------------------
; Движение или поворот текущего персонажа
; Вход:
;   B - направление
; --------------------------------------------------------------------------------------
move:
  LD IX, (LOGIC_activeHero_ptr)
  LD A, (IX+Hero.dir)
  CP B
  JR Z, stand

.char_rot
  LD (IX+Hero.dir), B
; --------------------------------------------------------------------------------------
; меняем спрайт героя в зависимости от направления персонажа
; Вход:
;  IX - указатель на героя
; --------------------------------------------------------------------------------------
update_sprite_by_direction:
  LD B,(IX+Hero.base_spr)
  LD A,(IX+Hero.dir)
  ADD A, B
  LD (IX+Hero.sprite), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  JP CELLS_SET

stand:
  LD A, do_stand
; --------------------------------------------------------------------------------------
; Действие персонажа по направлению взгляда
; Вход:
;   IX - указатель на героя
;   A - действие
; --------------------------------------------------------------------------------------
do:
  LD (LOGIC_LAST_ACTION), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL MOVE_CALC_XY ; в DE позиция действия
  RET NC
  LD (LOGIC_MapCell_xy), DE
  CALL CELLS_CALC_POS
  LD (LOGIC_MapCell_ptr), HL
LOGIC_LAST_ACTION equ $+1
  LD A, #00

.do_stand
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.ground)
  CALL CELLS_SET ; вернули на место землю

LOGIC_MapCell_xy equ $+1
  LD DE, #0000
  LD (IX+Hero.pos.x), D
  LD (IX+Hero.pos.y), E ; установили новые координаты 

LOGIC_MapCell_ptr equ $+1
  LD HL, #0000
  LD A, (HL)
  LD (IX+Hero.ground), A ; сохранили землю
  JP update_sprite_by_direction

; ; --------------------------------------------------------------------------------------
; ; Циклический переход на следующего персонажа,
; ; если дошли до последнего то переходим на первого
; ; --------------------------------------------------------------------------------------
; ; loopNextChar:
;   ; CALL nextChar
;   ; RET NZ
;   ; JP firstChar

; --------------------------------------------------------------------------------------
; Выход: DE - координаты левого верхнего угла обзорного окна в центре которого находится герой,  D - x, E - y 
; --------------------------------------------------------------------------------------
lookAtChar:
  LD IX, (LOGIC_activeHero_ptr)
  LD D,  (IX+Hero.pos.x)
  LD E,  (IX+Hero.pos.y)
  CALL VIEW_CENTER
  RET

; ; --------------------------------------------------------------------------------------
; ; Переход на следующего персонажа
; ; Выход:
; ;    если установлен флаг Z, значит мы на последнем персонаже и дальше перейти нельзя
; ; --------------------------------------------------------------------------------------
; nextChar:
;   LD A, (LOGIC_curHeroNum)
;   INC A
;   CP HeroesNum
;   RET Z; если у нас обнулился счетчик - возвращаемся
;   LD (LOGIC_curHeroNum), A
;   LD DE, (LOGIC_activeHero_ptr)
;   LD HL, Hero
;   ADD HL, DE
;   LD (LOGIC_activeHero_ptr), HL
;   OR 2
;   RET

lookAround: 
LOGIC_activeHero_ptr equ $+1
  LD IX, #0000
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL EventsMap.lookAround
  RET

; ; --------------------------------------------------------------------------------------
; ; меняем спрайт героя в зависимости от направления персонажа
; ; Вход:
; ;  IX - указатель на героя
; ; --------------------------------------------------------------------------------------
; update_sprite:
;   LD B,(IX+Hero.base_spr)
;   LD A,(IX+Hero.dir)
;   ADD A, B
;   DEC A; delta spr = dir - 1
;   LD (IX+Hero.sprite), A
; .set_ground:
;   LD D, (IX+Hero.pos.x)
;   LD E, (IX+Hero.pos.y)
;   LD A, (IX+Hero.sprite)
;   CALL Cells.set
;   RET

  ENDMODULE