  include "../src/_defines_h.asm"

TILE_SET:
  incbin "../output/tiles.bin"
TILE_SET_END equ $-1

FX_SET:
  include "../assets/fx/demoFX.asm"
FX_SET_END

p68_font_before:
  align 256
p68_font:
	incbin "../assets/fonts/Font57_revert.fnt"
p68_font_end equ $-1

MAP_DATA:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP

MAP_MASK:
  DUP TILE_MAP_SIZE_WIDTH * TILE_MAP_SIZE_HEIGHT
  defb #00
  EDUP

VIEW_BUFFER:
	include "../zx-core/libs/tiles16/view_buffer.asm"

  include "../zx-core/libs/map/Directions_h.asm"
  include "../src/Hero_h.asm"
  include "../src/Hero.asm"
  include "../src/heroes_data.asm"

Kick_shard_mess: db "Empty",0

 MODULE TestSuite_Hero

UT_Hero_struct:
  LD IX, HEROES_SET
  LD HL, (IX+Hero.pos)
  nop ; ASSERTION  H == 4
  nop ; ASSERTION  L == 3

  LD A, (IX+Hero.dir)
  nop ; ASSERTION  A == dir_up
  TC_END

 ENDMODULE
