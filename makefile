BIN_FOLDER := ./zx-core/bin/osx
SCRIPT_FOLDER := ./zx-core/scripts

EXT_LIBRARY_FOLDER = ./zx-core/

SRC_FOLDER := ./src
BUILD_FOLDER := ./output

PROJECT_NAME := game

ASSETS_FOLDER := ./assets
 
clean:
	rm -rf $(BUILD_FOLDER)
	mkdir -p $(BUILD_FOLDER)

build: clean make_tileset make_map
	$(BIN_FOLDER)/sjasmplus --dos866 --nofakes --dirbol --outprefix=$(BUILD_FOLDER)/ \
		-i$(BUILD_FOLDER) \
		-DSNA_FILENAME=\"$(PROJECT_NAME).sna\" \
		-DBIN_FILENAME=\"$(PROJECT_NAME).bin\" \
    --lst=$(BUILD_FOLDER)/program.list \
    --fullpath $(SRC_FOLDER)/main.asm

make_sna: clean make_tileset make_map
	$(BIN_FOLDER)/sjasmplus --dos866 --nofakes --dirbol --outprefix=$(BUILD_FOLDER)/ \
		-i$(BUILD_FOLDER) \
		-i$(SRC_FOLDER) \
		-DSNA_FILENAME=\"$(PROJECT_NAME).sna\" \
		-DBIN_FILENAME=\"$(PROJECT_NAME).bin\" \
    --lst=$(BUILD_FOLDER)/program.list \
		--sld=$(BUILD_FOLDER)/$(PROJECT_NAME).sld \
    --fullpath ./make_sna.asm

build_parts: build pack_upkr
	$(BIN_FOLDER)/sjasmplus --dos866 --nofakes --dirbol --outprefix=$(BUILD_FOLDER)/ \
		-i$(BUILD_FOLDER) \
		-DSNA_FILENAME=\"$(PROJECT_NAME).sna\" \
		-DBIN_FILENAME=\"$(PROJECT_NAME).bin\" \
    --lst=$(BUILD_FOLDER)/program.list \
    --fullpath $(SRC_FOLDER)/parts.asm

run2: build
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/$(PROJECT_NAME).sna

run3: build
	open -a 'xpeccy' $(BUILD_FOLDER)/$(PROJECT_NAME).sna

make_scr:
	python3 $(SCRIPT_FOLDER)/png2scr.py -i $(ASSETS_FOLDER)/tiles/tiles.png -o $(BUILD_FOLDER)/tiles.scr

make_map:
	python3 $(SCRIPT_FOLDER)/tiled2bin.py -i $(ASSETS_FOLDER)/tiles/map.tmx -o $(BUILD_FOLDER)/map.bin

make_tileset: make_scr
	python3 $(SCRIPT_FOLDER)/scr2spr.py --width 2 --height 2 --color True --count 191 -i $(BUILD_FOLDER)/tiles.scr -o $(BUILD_FOLDER)/tiles.bin

compile_parts: build pack_upkr build_parts

compile_bootable: compile_parts pack_upkr_game
	$(BIN_FOLDER)/sjasmplus --dos866 --nofakes --dirbol --outprefix=$(BUILD_FOLDER)/ \
		-i$(BUILD_FOLDER) \
		-i$(EXT_LIBRARY_FOLDER) \
		-DBOOTSTRAP_ORG=#D000 \
    --fullpath $(SRC_FOLDER)/parts2.asm

pack_sal:
	rm -f $(BUILD_FOLDER)/*.sal
	$(BIN_FOLDER)/salvador -classic $(BUILD_FOLDER)/static.bin $(BUILD_FOLDER)/static.bin.sal
	$(BIN_FOLDER)/salvador -classic $(BUILD_FOLDER)/dynamic.bin $(BUILD_FOLDER)/dynamic.bin.sal

pack_upkr:
	rm -f $(BUILD_FOLDER)/*.upkr
	$(BIN_FOLDER)/upkr --z80 $(BUILD_FOLDER)/static.bin $(BUILD_FOLDER)/static.bin.upkr
	$(BIN_FOLDER)/upkr --z80 $(BUILD_FOLDER)/dynamic.bin $(BUILD_FOLDER)/dynamic.bin.upkr

pack_upkr_game:
	$(BIN_FOLDER)/upkr --z80 $(BUILD_FOLDER)/game.bin $(BUILD_FOLDER)/game.bin.upkr

make_tape: compile_bootable
	$(BIN_FOLDER)/bin2tap -b -hp $(BUILD_FOLDER)/bootable.bin -c 24575 -a 53248 -r 53248 

run_sna: make_sna
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/game.sna

debug: make_sna
	open -a 'xpeccy' $(BUILD_FOLDER)/game.sna --args --labels ./$(BUILD_FOLDER)/cell3326.list
