TEXT_SET:
  include "../assets/lang/lang_ru.asm"
TEXT_SET_END equ $-1

TILE_SET:
  incbin "tiles.bin"
TILE_SET_END equ $-1

; (!) код плеера должен быть в быстрой памяти как Shiru сказал (!!!)
; На 48K это просто любая память выше 0x8000 (0x8000 - 0xFFFF), на оригинальных 128K 
; есть сложности: на 128K и +2 медленные страницы 1,3,5,7; 
; на +2A и +3 медленные страницы 4,5,6,7. Т.е. для корректной работы 
; на всех оригинальных моделях плеер надо обязательно поместить в страницу 0 или 2.
; На данный момент подключается аккурат во 2ю страницу ( FX_SET )

FX_SET:
  include "../assets/fx/demoFX.asm"
FX_SET_END

TRITONE:
  include "../zx-core/libs/beeper/tritone/play.asm"
TRITONE_END

BEEPER_MUSIC:
  
  MODULE music_startgame
data:  
    include "../assets/music/AER/foryou.asm"
  ENDMODULE

  MODULE music_gameover
data:
    include "../assets/music/AER/gameover.asm"
  ENDMODULE

  MODULE music_gameend
data:    
    include "../assets/music/AER/gameend.asm"
  ENDMODULE

BEEPER_MUSIC_END equ $-1

p68_font_before:
  align 256
p68_font:
	incbin "../assets/fonts/Font57_revert.fnt"
p68_font_end equ $-1
