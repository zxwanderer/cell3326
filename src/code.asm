  include "_defines_h.asm"
  include "Actions_h.asm"
  
  include "../zx-core/libs/defines_h.asm"
  include "../zx-core/libs/map/Directions_h.asm"
  include "../zx-core/libs/keyboard/define_key_h.asm"
  include "../zx-core/libs/im2/im2_lite_h.asm"

  ; не включать сюда код, так как старт идет в начале блока а не на метку start
  ; define SHOW_START_MENU
  ; DEFINE CHEAT_MOVE
  ; DEFINE SHOW_ALL_MAP ; сразу открыта вся карта

start:
  DI

  IM2_INIT INT_TABLE_HIGH

init:
  XOR A
  OUT (#FE),A
  LD A, %00000100
  CALL SCREEN_SET_COLORS

  IFDEF SHOW_START_MENU
    LD SP, STACK_TOP
	  LD DE, #4000
	  LD HL, HELLO_TXT
	  CALL Text68.print_at

    LD HL, music_startgame.data
    CALL Tritone.play
  ENDIF

  CALL Heroes.init
  CALL Heroes.show_hero_at_screen
  CALL Heroes.hero_look_at_cell
  EI

loop:
  LD HL, keyMappingTable
  CALL KEYBOARD_SCAN_KEYS
  JP Z, loop

  PUSH DE
  POP HL
GOTO_HL:
  JP (HL)

keyMappingTable:
  DefineKey KEY_G,     PRESS_RESTART
  DefineKey KEY_Q,     PRESS_BUTTON_UP
  DefineKey KEY_A,     PRESS_BUTTON_DOWN
  DefineKey KEY_O,     PRESS_BUTTON_LEFT
  DefineKey KEY_P,     PRESS_BUTTON_RIGHT
  DefineKey KEY_M,     PRESS_BUTTON_FIRE
  DefineKey KEY_SPACE, PRESS_BUTTON_FIRE
  DefineKey KEY_ENTER, PRESS_BUTTON_FIRE
  defb _endByte

PRESS_BUTTON_UP:
  LD B, dir_up
  JP hero_move_processing

PRESS_BUTTON_DOWN:
  LD B, dir_down
  JP hero_move_processing

PRESS_BUTTON_LEFT:
  LD B, dir_left
  JP hero_move_processing

PRESS_BUTTON_RIGHT:
  LD B, dir_right
  JP hero_move_processing

PRESS_BUTTON_FIRE:
  ; CALL KEYBOARD_WAIT_UNPRESS_LONG
  ; LD A, D
  ; CP #50
  ; JP C, loop
  LD A, do_use
  CALL Heroes.do
  JP loop

PRESS_RESTART:
  ; LD A, 6
  ; OUT (#FE),A
  JP loop

hero_move_processing:
  CALL Heroes.move
  CALL Heroes.hero_look_at_cell
  JP loop

  include "../zx-core/libs/keyboard/scan_keys.asm"
  include "../zx-core/libs/screen/set_colors.asm"
  include "../zx-core/libs/screen/calc_down_pos.asm"
  include "../zx-core/libs/text/text68.asm"

  include "./framework/Heroes.asm"
