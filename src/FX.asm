  MODULE FX
look_at_hero_cell:
  LD IX, (Hero.LOGIC_activeHero_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL EventsMap.cell_by_dir
  RET NC;  возвратили false - неправильное направление

	LD DE, #0016
  CALL SCREEN_POS_TO_SCR
	LD HL, Empty_cell_name
	CALL Text68.print_at

  RET

  ENDMODULE
