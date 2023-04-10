  include "im2/im2_h.asm"
  include "macros/macros_h.asm"
  include "stack/push_pop_h.asm"
  include "logic/Directions_h.asm"
  include "logic/Actions_h.asm"
  include "logic/point_h.asm"
	include "keyboard/define_key_h.asm"
  include "keyboard/scancode_h.asm"
  include "map/defines_h.asm"
  include "logic/Cells/CellType_h.asm"
  include "logic/Cells/CellType_macro_h.asm"
  include "fx/demoFX_h.asm"

start:
  DI

  XOR A
  OUT (#FE),A
  LD A, %00000100
  CALL SCREEN_SET_COLORS

  SetIM2 INT_TABLE, INT_VECTOR
  LD SP, STACK_TOP

	LD DE, #4000
	LD HL, HELLO_TXT
	CALL Text68.print_at

  ; LD HL, music_startgame.data
  ; CALL Tritone.play

  CALL Hero.initHeroes
  CALL Hero.show_hero_at_screen
  CALL Hero.hero_look_at_cell

  EI

loop:
  XOR A
  OUT (#FE),A

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
  LD A, do_use
  CALL Hero.do
  CALL Hero.show_hero_at_screen
  JP loop
  
PRESS_RESTART:
  LD A, 6
  OUT (#FE),A
  JP loop

hero_move_processing:
  CALL Hero.move
  CALL Hero.show_hero_at_screen
  CALL Hero.hero_look_at_cell
  JP loop
