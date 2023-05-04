  MODULE Hero

; LOGIC_LAST_ACTION - последнее действие героя
; LOGIC_ACTIVE_HERO_PTR - указатель на описание героя
; LOGIC_ACTIVE_HERO_NUM - текущий номер героя
; LOGIC_ACTIVE_MAP_POS - координаты текущего события на карте

; --------------------------------------------------------------------------------------
; Инициализация персонажей на карте, переход на первого персонажа
; --------------------------------------------------------------------------------------
initHeroes:
  LD B, HeroesNum
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
  CALL MAP_CALC_PTR_BY_POS
  LD A,(HL)
  LD (IX+Hero.ground),A; ячейку карты ставим на пол персонажа
  CALL set_sprite_by_direction

  POP HL
  POP DE
  POP BC
  ADD HL, DE
  DJNZ .init_loop

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

; --------------------------------------------------------------------------------------
; Движение или поворот текущего персонажа
; Вход:
;   B - направление
;   LOGIC_ACTIVE_HERO_PTR - указатель на героя
; --------------------------------------------------------------------------------------
move:
  LD IX, (LOGIC_ACTIVE_HERO_PTR)
  LD A, (IX+Hero.dir)
  CP B
  JR Z, stand
  LD (IX+Hero.dir), B
  CALL set_sprite_by_direction
  JP show_hero_at_screen

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
  CALL MAP_SET_BY_POS
  RET

stand:
  LD A, do_stand

; --------------------------------------------------------------------------------------
; Действие персонажа по направлению взгляда
; Вход:
;   A - действие
;   LOGIC_ACTIVE_HERO_PTR - указатель на героя
; --------------------------------------------------------------------------------------
do:
  LD IX, (LOGIC_ACTIVE_HERO_PTR)
  LD (LOGIC_LAST_ACTION), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL MAP_CALC_POS_BY_DIR ; в DE позиция действия
  RET NC

  LD (LOGIC_ACTIVE_MAP_POS), DE
  CALL MAP_CALC_PTR_BY_POS
  LD (LOGIC_ACTIVE_MAP_PTR), HL

  LD A, (LOGIC_LAST_ACTION)

; cheat move:
  ; CP do_stand
  ; JP Z, .do_stand; персонаж перемещается туда

.phase2:
  LD HL, (LOGIC_ACTIVE_MAP_PTR)
  LD A, (HL)
  CALL CELL_CALC_PTR_BY_INDEX ; в HL указатель на описание ячейки
  LD A, (LOGIC_LAST_ACTION)
  CALL Cells.call_cell_script
  JP NC, show_hero_at_screen ; дальше обрабатывать не надо

  LD A, (LOGIC_LAST_ACTION)
  CP do_stand
  JP Z, .do_stand
  JP hero_look_at_cell

.do_stand
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.ground)
  CALL MAP_SET_BY_POS ; вернули на место землю

  LD DE, (LOGIC_ACTIVE_MAP_POS)
  LD (IX+Hero.pos.x), D
  LD (IX+Hero.pos.y), E ; установили новые координаты 

  LD HL, (LOGIC_ACTIVE_MAP_PTR)
  LD A, (HL)
  LD (IX+Hero.ground), A ; сохранили землю
  CALL set_sprite_by_direction
  JP show_hero_at_screen

; --------------------------------------------------------------------------------------
; Циклический переход на следующего персонажа,
; если дошли до последнего то переходим на первого
; --------------------------------------------------------------------------------------
; loopNextChar:
;   CALL nextChar
;   RET NZ
;   JP firstChar

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
;   LD DE, (LOGIC_ACTIVE_HERO_PTR)
;   LD HL, Hero
;   ADD HL, DE
;   LD (LOGIC_ACTIVE_HERO_PTR), HL
;   OR 2
;   RET

show_hero_at_screen:
  LD IX, (LOGIC_ACTIVE_HERO_PTR) ; устанавливаем указатель на описание героя

  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  PUSH DE
  CALL EventsMap.lookAround ; герой осматривается на новой позиции
  POP DE

  CALL VIEW_CALC_LOOK_AT_CENTER ; в DE позиция окна view на карте 
  CALL MAP_CALC_PTR_BY_POS ; в HL указатель на ячейку карты
  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
  RET

; Вывести описание ячейки на которую смотрит герой
; На входе:
;   IX - указатель на описание героя
hero_look_at_cell:
  LD IX, (LOGIC_ACTIVE_HERO_PTR)

  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL EventsMap.cell_by_dir_ptr
  RET NC;  возвратили false - неправильное направление
  LD A, (HL)
  JP ScreenFX.show_cell_info

  ENDMODULE
