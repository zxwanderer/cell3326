  ifndef __DEFINES_H_ASM_
  define __DEFINES_H_ASM_

PROGRAM_ORG equ #6000

SCREEN_ADDR equ #4000
SCREEN_ATTR_ADDR equ SCREEN_ADDR + #1800

TILE_SCR_WIDTH equ 16
TILE_SCR_HEIGTH equ 11

TILE_MAP_SIZE_WIDTH equ 32
TILE_MAP_SIZE_HEIGHT equ 32

INT_VECTOR equ #BEBE
INT_TABLE equ $BD00

STACK_TOP equ #FFFF

  endif
