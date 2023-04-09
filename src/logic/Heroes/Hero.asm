  MODULE Hero

; LOGIC_LAST_ACTION - последнее действие героя
; LOGIC_ACTIVE_HERO_PTR - указатель на описание героя
; LOGIC_ACTIVE_HERO_NUM - текущий номер героя

; LOGIC_MapCell_xy - текущие координаты события
; LOGIC_MapCell_ptr - указатель на ячейку события

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
  CALL update_sprite_by_direction

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

LOGIC_ACTIVE_HERO_NUM defb 00
LOGIC_ACTIVE_HERO_PTR defw 00

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

; --------------------------------------------------------------------------------------
; Изменение спрайта в описании героя и на карте в зависимости от направления персонажа в его описании
; Вход:
;  IX - указатель на героя
;  IX.dir - направление
; --------------------------------------------------------------------------------------
update_sprite_by_direction:
  LD B,(IX+Hero.base_spr)
  LD A,(IX+Hero.dir)
  ADD A, B
  LD (IX+Hero.sprite), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  JP MAP_SET_BY_POS

stand:
  RET

; stand:
;   LD A, do_stand

; --------------------------------------------------------------------------------------
; Действие персонажа по направлению взгляда
; Вход:
;   IX - указатель на героя
; --------------------------------------------------------------------------------------
do:
  LD (LOGIC_LAST_ACTION), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL MAP_CALC_POS_BY_DIR ; в DE позиция действия
  RET NC
  LD (LOGIC_MapCell_xy), DE
  RET

  CALL MAP_CALC_PTR_BY_POS
  LD (LOGIC_MapCell_ptr), HL

LOGIC_LAST_ACTION equ $+1
  LD A, #00

; cheat move:
  ; CP do_stand
  ; JP Z, .do_stand; персонаж перемещается туда

  CP do_stand
  JP Z, .phase2; персонаж перемещается туда

  RET
; определяем дальше что делаем
; если нет предмета в руках то действие - do_use
  ; LD A, (LOGIC_item_id)
  ; AND A
  ; JR NZ, .item_in_hand
  
  ; LD A, do_use
  ; LD (LOGIC_LAST_ACTION), A

; .item_in_hand
  ; LD A, do_drop
  ; RET

.phase2:
  LD A, (HL)
  CALL CELL_CALC_PTR_BY_INDEX ; в HL указатель на описание ячейки
  LD (LOGIC_CellInfo_ptr), HL
  CALL Cells.call_cell_script
  JP C, hero_screen_update
  CALL hero_screen_update
  JP ScreenFX.hero_look_at_cell

.do_stand
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.ground)
  CALL MAP_SET_BY_POS ; вернули на место землю

LOGIC_MapCell_xy equ $+1
  LD DE, #0000
  LD (IX+Hero.pos.x), D
  LD (IX+Hero.pos.y), E ; установили новые координаты 

LOGIC_MapCell_ptr equ $+1
  LD HL, #0000
  LD A, (HL)
  LD (IX+Hero.ground), A ; сохранили землю
  CALL update_sprite_by_direction
  ; CALL lookAround
  CALL hero_screen_update
  JP ScreenFX.hero_look_at_cell

; ; --------------------------------------------------------------------------------------
; ; Циклический переход на следующего персонажа,
; ; если дошли до последнего то переходим на первого
; ; --------------------------------------------------------------------------------------
; ; loopNextChar:
;   ; CALL nextChar
;   ; RET NZ
;   ; JP firstChar

; --------------------------------------------------------------------------------------
; Вход:
;   IX - указатель на описание героя
; Выход: 
;   DE - координаты левого верхнего угла обзорного окна в центре которого находится герой,  D - x, E - y 
; --------------------------------------------------------------------------------------
; calc_view_pos:
  ; LD D, (IX+Hero.pos.x)
  ; LD E, (IX+Hero.pos.y)
  ; CALL VIEW_CALC_LOOK_AT_CENTER
  ; RET

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

; Осматриваемся вокру
; lookAround:
;   LD D, (IX+Hero.pos.x)
;   LD E, (IX+Hero.pos.y)
;   CALL EventsMap.lookAround
; RET

hero_screen_update:
  ; LD IX, (LOGIC_ACTIVE_HERO_PTR)
  ; CALL Hero.calc_view_pos
  ; CALL MAP_CALC_PTR_BY_POS
  ; CALL COPY_TO_BUFFER
	; CALL TILE16_SHOW_SCREEN
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

; На входе
; IX - указатель на героя

; get_hero_hand_item:
;   LD A, (IX+Hero.hand_right_p_1)
;   AND A
;   JR NZ, get_hero_hand_item_yes
;   XOR A
;   LD (LOGIC_item_id), A
;   JP check_act_no
; get_hero_hand_item_yes:
; ; сделать подсчет что в руках и сохранить id в LOGIC_item_id
;   JP check_act_yes

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

  ENDMODULE
