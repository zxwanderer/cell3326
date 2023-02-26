  include "im2/im2_h.asm"
  include "stack/push_pop_h.asm"
  include "logic/defines_h.asm"
  include "logic/point_h.asm"
	include "keyboard/define_key_h.asm"
  include "keyboard/scancode_h.asm"
  include "cells/defines_h.asm"

start:
  DI

  XOR A
  OUT (#FE),A
  LD A, %00000100
  CALL SCREEN_SET_COLORS

  ; CALL SCREEN_CLEAR

  SetIM2 INT_TABLE, INT_VECTOR
  LD SP, STACK_TOP

	LD DE, #4000
	LD HL, HELLO_TXT
	CALL Text68.print_at

  LD HL, music_startgame.data
  ; CALL Tritone.play

  CALL Hero.initHeroes
  CALL Hero.lookAround

  EI

loop:
  XOR A
  OUT (#FE),A

  LD HL, keyMappingTable
  CALL KEYBOARD_SCAN_KEYS
  JP Z, no_press_keys
  PUSH DE
  POP HL
GOTO_HL:
  JP (HL)

no_press_keys:
  CALL Hero.firstChar
  CALL Hero.lookAtChar

  CALL CELLS_CALC_POS

  CALL COPY_TO_BUFFER
	CALL TILE16_SHOW_SCREEN
  JP loop

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
  CALL Hero.move
  CALL Hero.lookAround
  JP no_press_keys

PRESS_BUTTON_DOWN:
  LD B, dir_down
  CALL Hero.move
  CALL Hero.lookAround
  JP no_press_keys

PRESS_BUTTON_LEFT:
  LD B, dir_left
  CALL Hero.move
  CALL Hero.lookAround 
  JP no_press_keys

PRESS_BUTTON_RIGHT:
  LD B, dir_right
  CALL Hero.move
  CALL Hero.lookAround
  JP no_press_keys

PRESS_BUTTON_FIRE:
  CALL Hero.do
  JP no_press_keys
  
PRESS_RESTART:
  LD A, 6
  OUT (#FE),A
  JP no_press_keys
