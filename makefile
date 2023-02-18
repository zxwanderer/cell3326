BIN_FOLDER := ./zx-core/bin/osx
SCRIPT_FOLDER := ./zx-core/scripts
LIBS_FOLDER := ../zx-core/libs

SRC_FOLDER := ./src
BUILD_FOLDER := ./output

PROJECT_NAME := game

ASSETS_FOLDER := ./assets
 
clean:
	rm -rf $(BUILD_FOLDER)
	mkdir -p $(BUILD_FOLDER)

build: clean make_tileset make_map
	$(BIN_FOLDER)/sjasmplus --dos866 --nofakes --dirbol --outprefix=$(BUILD_FOLDER)/ \
		-i$(LIBS_FOLDER) \
		-i$(ASSETS_FOLDER) \
		-i$(BUILD_FOLDER) \
		-DSNA_FILENAME=\"$(PROJECT_NAME).sna\" \
		-DBIN_FILENAME=\"$(PROJECT_NAME).bin\" \
    --lst=$(BUILD_FOLDER)/program.list \
    --fullpath $(SRC_FOLDER)/main.asm

run: build
	$(BIN_FOLDER)/xpeccy.app/Contents/MacOS/xpeccy \
		--debug $(BUILD_FOLDER)/$(PROJECT_NAME).sna \
		--labels $(BUILD_FOLDER)/labels.txt

run2: build
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/$(PROJECT_NAME).sna

make_scr:
	python3 $(SCRIPT_FOLDER)/png2scr.py -i $(ASSETS_FOLDER)/tiles/tiles.png -o $(BUILD_FOLDER)/tiles.scr

make_map:
	python3 $(SCRIPT_FOLDER)/tiled2bin.py -i $(ASSETS_FOLDER)/tiles/map.tmx -o $(BUILD_FOLDER)/map.bin

make_tileset: make_scr
	python3 $(SCRIPT_FOLDER)/scr2spr.py --width 2 --height 2 --color True --count 191 -i $(BUILD_FOLDER)/tiles.scr -o $(BUILD_FOLDER)/tiles.bin

compile_parts: make_map
	./engine/bin/osx/sjasmplus --dos866 --nofakes --dirbol --outprefix=./$(BUILD_FOLDER)/ \
        --lst=./$(BUILD_FOLDER)/program.list \
        --fullpath ./parts.asm

pack_sal:
	rm -f $(BUILD_FOLDER)/*.sal
	$(BIN_FOLDER)/salvador -classic $(BUILD_FOLDER)/static.bin ./$(BUILD_FOLDER)/static.bin.sal
	$(BIN_FOLDER)/salvador -classic $(BUILD_FOLDER)/dynamic.bin ./$(BUILD_FOLDER)/dynamic.bin.sal

make_sna: clean make_tileset compile_parts pack_sal
	$(BIN_FOLDER)/sjasmplus --dos866 --nofakes --dirbol --outprefix=./$(BUILD_FOLDER)/ \
        --lst=$(BUILD_FOLDER)/program.list \
        --fullpath make_sna.asm

run_sna: make_sna
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/cell3326.sna
