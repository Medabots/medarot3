export LC_CTYPE=C
export PYTHONIOENCODING=utf-8

VERSIONS := kuwagata kabuto
OUTPUT_PREFIX := medarot3_
ORIGINAL_PREFIX := baserom_

PYTHON := python3

# Types
ROM_TYPE := gbc
SYM_TYPE := sym
MAP_TYPE := map

SOURCE_TYPE := asm
INT_TYPE := o

RAW_TSET_SRC_TYPE := png
TSET_SRC_TYPE := 2bpp
TSET_TYPE := malias
TMAP_TYPE := map
TEXT_TYPE := txt
CSV_TYPE = csv
CREDITS_TYPE := bin
DIALOG_TYPE := bin
PTRLIST_TYPE := bin
TABLE_TYPE := tbl

# Directories
## It's important these remain relative
BASE := .
BUILD := $(BASE)/build
GAME := $(BASE)/game
TEXT := $(BASE)/text
GFX := $(BASE)/gfx
SCRIPT := $(BASE)/scripts
SCRIPT_RES := $(SCRIPT)/res

# Build Directories
VERSION_OUT := $(BUILD)/version

TILESET_OUT := $(BUILD)/tilesets

DIALOG_INT := $(BUILD)/intermediate/dialog
DIALOG_OUT := $(BUILD)/dialog

PTRLISTS_INT := $(BUILD)/intermediate/ptrlists
PTRLISTS_OUT := $(BUILD)/ptrlists

TILEMAP_OUT := $(BUILD)/tilemaps

ATTRIBMAP_OUT := $(BUILD)/attribmaps

# Game Source Directories
SRC := $(GAME)/src
COMMON := $(SRC)/common
VERSION_SRC := $(SRC)/version

# Text Directories
DIALOG_TEXT := $(TEXT)/dialog
PTRLISTS_TEXT := $(TEXT)/ptrlists

# Graphics Directories
TILESET_GFX := $(GFX)/tilesets
TILESET_PREBUILT := $(GFX)/prebuilt/tilesets

TILEMAP_GFX := $(GFX)/tilemaps
TILEMAP_PREBUILT := $(GFX)/prebuilt/tilemaps

ATTRIBMAP_GFX := $(GFX)/attribmaps
ATTRIBMAP_PREBUILT := $(GFX)/prebuilt/attribmaps

# Source Modules (directories in SRC), version directories (kuwagata/kabuto) are implied
# We explicitly separate this with newlines to avoid silly conflicts with tr_EN
MODULES := \
core\
gfx\
text\
link\
titlemenu\
pausemenu\
townmap\
nameentry

# Toolchain
CC := rgbasm
CC_ARGS :=
LD := rgblink
LD_ARGS :=
FIX := rgbfix
FIX_ARGS :=
CCGFX := rgbgfx
CCGFX_ARGS := 

# Helper
TOUPPER = $(shell echo '$1' | tr '[:lower:]' '[:upper:]')
FILTER = $(strip $(foreach v,$(2),$(if $(findstring $(1),$(v)),$(v),)))
FILTER_OUT = $(strip $(foreach v,$(2),$(if $(findstring $(1),$(v)),,$(v))))

# Inputs
ORIGINALS := $(foreach VERSION,$(VERSIONS),$(BASE)/$(ORIGINAL_PREFIX)$(VERSION).$(ROM_TYPE))

# Outputs (used by clean)
TARGETS := $(foreach VERSION,$(VERSIONS),$(BASE)/$(OUTPUT_PREFIX)$(VERSION).$(ROM_TYPE))
SYM_OUT := $(foreach VERSION,$(VERSIONS),$(BASE)/$(OUTPUT_PREFIX)$(VERSION).$(SYM_TYPE))
MAP_OUT := $(foreach VERSION,$(VERSIONS),$(BASE)/$(OUTPUT_PREFIX)$(VERSION).$(MAP_TYPE))

# Sources
OBJNAMES := $(foreach MODULE,$(MODULES),$(addprefix $(MODULE)., $(addsuffix .$(INT_TYPE), $(notdir $(basename $(wildcard $(SRC)/$(MODULE)/*.$(SOURCE_TYPE)))))))
COMMON_SRC := $(wildcard $(COMMON)/*.$(SOURCE_TYPE))

DIALOG := $(notdir $(basename $(wildcard $(DIALOG_TEXT)/*.$(CSV_TYPE))))
TILESETS = $(notdir $(basename $(wildcard $(TILESET_GFX)/*.$(RAW_TSET_SRC_TYPE))))
TILESETS_COMMON := $(call FILTER_OUT,_,$(TILESETS))
TILESETS_VERSIONED := $(call FILTER,_,$(TILESETS))
# A bit of a hack for the tilesets with shifted pointers
TILESETS_GAMEVERSION := $(call FILTER,GAMEVERSION,$(TILESETS))
PTRLISTS := $(notdir $(basename $(wildcard $(PTRLISTS_TEXT)/*.$(TEXT_TYPE))))

TILEMAPS := $(notdir $(basename $(wildcard $(TILEMAP_GFX)/*.$(TEXT_TYPE))))
TILEMAPS_COMMON := $(call FILTER_OUT,_,$(TILEMAPS))
TILEMAPS_VERSIONED := $(call FILTER,_,$(TILEMAPS))

ATTRIBMAPS := $(notdir $(basename $(wildcard $(ATTRIBMAP_GFX)/*.$(TEXT_TYPE))))
ATTRIBMAPS_COMMON := $(call FILTER_OUT,_,$(ATTRIBMAPS))
ATTRIBMAPS_VERSIONED := $(call FILTER,_,$(ATTRIBMAPS))

# Intermediates for common sources (not in version folder)
## We explicitly rely on second expansion to handle version-specific files in the version specific objects
OBJECTS := $(foreach OBJECT,$(OBJNAMES), $(addprefix $(BUILD)/,$(OBJECT)))

TILESET_FILES_COMMON := $(foreach FILE,$(TILESETS_COMMON),$(TILESET_OUT)/$(FILE).$(TSET_TYPE))
TILESET_FILES_VERSIONED := $(foreach FILE,$(TILESETS_VERSIONED),$(TILESET_OUT)/$(FILE).$(TSET_TYPE))
TILESET_FILES_GAMEVERSION := $(foreach FILE,$(TILESETS_GAMEVERSION),$(TILESET_OUT)/$(FILE).$(TSET_TYPE))

TILEMAP_FILES_COMMON := $(foreach FILE,$(TILEMAPS_COMMON),$(TILEMAP_OUT)/$(FILE).$(TMAP_TYPE))
TILEMAP_FILES_VERSIONED := $(foreach FILE,$(TILEMAPS_VERSIONED),$(TILEMAP_OUT)/$(FILE).$(TMAP_TYPE))

ATTRIBMAP_FILES_COMMON := $(foreach FILE,$(ATTRIBMAPS_COMMON),$(ATTRIBMAP_OUT)/$(FILE).$(TMAP_TYPE))
ATTRIBMAP_FILES_VERSIONED := $(foreach FILE,$(ATTRIBMAPS_VERSIONED),$(ATTRIBMAP_OUT)/$(FILE).$(TMAP_TYPE))

# Additional dependencies, per module granularity (i.e. story, gfx, core) or per file granularity (e.g. story_text_tables_ADDITIONAL)
core_ADDITIONAL :=
gfx_ADDITIONAL :=
text_ADDITIONAL :=
version_text_tables_ADDITIONAL := $(DIALOG_OUT)/text_table_constants_PLACEHOLDER_VERSION.asm
version_tileset_table_ADDITIONAL := $(TILESET_FILES_COMMON) $(VERSION_SRC)/tileset_table.asm $(TILESET_FILES_GAMEVERSION) $(TILESET_OUT)/PLACEHOLDER_VERSION.stamp
version_ptrlist_data_ADDITIONAL := $(PTRLISTS_OUT)/ptrlist_data_constants_PLACEHOLDER_VERSION.asm
version_tilemap_table_ADDITIONAL :=  $(TILEMAP_FILES_COMMON) $(VERSION_SRC)/tilemap_table.asm $(TILEMAP_OUT)/PLACEHOLDER_VERSION.stamp
version_attribmap_table_ADDITIONAL :=  $(ATTRIBMAP_FILES_COMMON) $(VERSION_SRC)/attribmap_table.asm $(ATTRIBMAP_OUT)/PLACEHOLDER_VERSION.stamp

.PHONY: $(VERSIONS) all clean default test
default: kabuto
all: $(VERSIONS)
test: test_tilemaps test_attribmaps

clean:
	rm -r $(BUILD) $(TARGETS) $(SYM_OUT) $(MAP_OUT) || exit 0

# Support building specific versions
# Unfortunately make has no real good way to do this dynamically from VERSIONS so we just manually set CURVERSION here to propagate to the rgbasm call
kabuto: CURVERSION:=kabuto
kabuto: CURNAME:=MEDAROT3KBTB32J
kuwagata: CURVERSION:=kuwagata
kuwagata: CURNAME:= MEDAROT3KWGB33J

$(VERSIONS): %: $(OUTPUT_PREFIX)%.$(ROM_TYPE)

# $| is a hack, we cannot have any other order-only prerequisites
.SECONDEXPANSION:
$(BASE)/$(OUTPUT_PREFIX)%.$(ROM_TYPE): $(OBJECTS) $$(addprefix $(VERSION_OUT)/$$*., $$(addsuffix .$(INT_TYPE), $$(notdir $$(basename $$(wildcard $(SRC)/version/$$*/*.$(SOURCE_TYPE)))))) | $(BASE)/$(ORIGINAL_PREFIX)%.$(ROM_TYPE)
	$(LD) $(LD_ARGS) -n $(OUTPUT_PREFIX)$*.$(SYM_TYPE) -m $(OUTPUT_PREFIX)$*.$(MAP_TYPE) -O $| -o $@ $^
	$(FIX) $(FIX_ARGS) -v -C -k 9C -l 0x33 -m 0x1B -p 0 -r 2 $@ -t "$(CURNAME)"
	cmp -l $| $@

### Intermediate files
## Unless specified otherwise, called as 'script.py [output file] [optional resource file] [input file] [optional version suffix]'

# Build objects
.SECONDEXPANSION:
.SECONDARY: # Don't delete intermediate files
$(BUILD)/%.$(INT_TYPE): $(SRC)/$$(firstword $$(subst ., ,$$*))/$$(lastword $$(subst ., ,$$*)).$(SOURCE_TYPE) $(COMMON_SRC) $$(wildcard $(SRC)/$$(firstword $$(subst ., ,$$*))/include/*.$(SOURCE_TYPE)) $$($$(firstword $$(subst ., ,$$*))_ADDITIONAL) $$($$(firstword $$(subst ., ,$$*))_$$(lastword $$(subst ., ,$$*))_ADDITIONAL) $$(subst PLACEHOLDER_VERSION,$$(lastword $$(subst /, ,$$(firstword $$(subst ., ,$$*)))),$$($$(firstword $$(subst /, ,$$*))_$$(lastword $$(subst ., ,$$*))_ADDITIONAL)) | $(BUILD) $(VERSION_OUT)
	$(CC) $(CC_ARGS) -DGAMEVERSION=$(CURVERSION) -o $@ $<

# build/tilesets/*.2bpp from source png
$(TILESET_OUT)/%.$(TSET_SRC_TYPE): $(TILESET_GFX)/%.$(RAW_TSET_SRC_TYPE) | $(TILESET_OUT)
	$(CCGFX) $(CCGFX_ARGS) -d 2 -o $@ $<

# build/tilesets/*.malias from built 2bpp
$(TILESET_OUT)/%.$(TSET_TYPE): $(TILESET_OUT)/%.$(TSET_SRC_TYPE) | $(TILESET_OUT)
	$(PYTHON) $(SCRIPT)/tileset2malias.py $@ $< $(TILESET_PREBUILT)

# build/tilesets/*_VERSION.malias
.SECONDEXPANSION:
$(TILESET_OUT)/%.stamp: $$(call FILTER,%,$(TILESET_FILES_VERSIONED))
	touch $@

# build/intermediate/dialog/*.bin from dialog csv files
.SECONDEXPANSION:
$(DIALOG_INT)/%.$(DIALOG_TYPE): $(DIALOG_TEXT)/$$(word 1, $$(subst _, ,$$*)).$(CSV_TYPE) | $(DIALOG_INT)
	$(PYTHON) $(SCRIPT)/dialog2bin.py $@ $^ "Original" $(subst $(subst .$(CSV_TYPE),,$(<F))_,,$*)

# build/intermediate/ptrlists/*.bin from dialog csv files
.SECONDEXPANSION:
$(PTRLISTS_INT)/%.$(PTRLIST_TYPE): $(PTRLISTS_TEXT)/$$(word 1, $$(subst _, ,$$*)).$(TEXT_TYPE) | $(PTRLISTS_INT)
	$(PYTHON) $(SCRIPT)/ptrlist2bin.py $@ $< $(subst $(subst .$(TEXT_TYPE),,$(<F))_,,$*)

# Use the intermediate files to generate the final dialog and ptrlist files
# Make has trouble with multiple files in a single rule, so we use the asm file to indicate these files were generated
# NOTE: dialogbin2asm specifically is different between master and translation branches
.SECONDEXPANSION:
$(DIALOG_OUT)/text_table_constants_%.asm: $(SRC)/version/text_tables.asm $(SRC)/version/%/text_tables.asm $$(foreach FILE,$(DIALOG),$(DIALOG_INT)/$$(FILE)_$$*.$(DIALOG_TYPE)) | $(DIALOG_OUT)
	$(PYTHON) $(SCRIPT)/dialogbin2asm.py $@ $(DIALOG_OUT) $* $^

.SECONDEXPANSION:
$(PTRLISTS_OUT)/ptrlist_data_constants_%.asm: $(SRC)/version/ptrlist_data.asm $(SRC)/version/%/ptrlist_data.asm $$(foreach FILE,$(PTRLISTS),$(PTRLISTS_INT)/$$(FILE)_$$*.$(PTRLIST_TYPE)) | $(PTRLISTS_OUT)
	$(PYTHON) $(SCRIPT)/ptrlistbin2asm.py $@ $(PTRLISTS_OUT) $* $^

# build/tilemaps/*.map from tilemaps txt
$(TILEMAP_OUT)/%.$(TMAP_TYPE): $(TILEMAP_GFX)/%.$(TEXT_TYPE) | $(TILEMAP_OUT)
	$(PYTHON) $(SCRIPT)/txt2map.py $@ $^ $(TILEMAP_PREBUILT)

# build/tilemaps/*_VERSION.map
.SECONDEXPANSION:
$(TILEMAP_OUT)/%.stamp: $$(call FILTER,%,$(TILEMAP_FILES_VERSIONED))
	touch $@

# build/attribmaps/*.map from tilemaps txt
$(ATTRIBMAP_OUT)/%.$(TMAP_TYPE): $(ATTRIBMAP_GFX)/%.$(TEXT_TYPE) | $(ATTRIBMAP_OUT)
	$(PYTHON) $(SCRIPT)/txt2map.py $@ $^ $(ATTRIBMAP_PREBUILT)

# build/attribmaps/*_VERSION.map
.SECONDEXPANSION:
$(ATTRIBMAP_OUT)/%.stamp: $$(call FILTER,%,$(ATTRIBMAP_FILES_VERSIONED))
	touch $@

### Dump Scripts

.PHONY: dump dump_text dump_tilesets dump_ptrlists dump_tilemaps dump_attribmaps
dump: dump_text dump_tilesets dump_ptrlists dump_tilemaps dump_attribmaps

dump_text: | $(DIALOG_TEXT) $(SCRIPT_RES)
	rm $(DIALOG_TEXT)/*.$(CSV_TYPE)
	$(PYTHON) $(SCRIPT)/dump_text.py "$(SCRIPT_RES)" "$(VERSION_SRC)" "$(DIALOG_TEXT)" "$(DIALOG_OUT)"

dump_tilesets: | $(TILESET_GFX) $(TILESET_PREBUILT) $(SCRIPT_RES)
	rm $(TILESET_PREBUILT)/*.$(TSET_TYPE)
	rm $(TILESET_GFX)/*.$(RAW_TSET_SRC_TYPE)
	$(PYTHON) $(SCRIPT)/dump_tilesets.py "$(TILESET_GFX)" "$(TILESET_PREBUILT)" "$(TILESET_OUT)" "$(SCRIPT_RES)" "$(VERSION_SRC)"

dump_ptrlists: | $(PTRLISTS_TEXT)
	rm $(PTRLISTS_TEXT)/*.$(TEXT_TYPE)
	$(PYTHON) $(SCRIPT)/dump_ptrlists.py "$(VERSION_SRC)" "$(PTRLISTS_TEXT)" "$(PTRLISTS_OUT)"

dump_tilemaps: | $(TILEMAP_GFX) $(TILEMAP_PREBUILT) $(SCRIPT_RES)
	rm $(TILEMAP_PREBUILT)/*.$(TMAP_TYPE)
	rm $(TILEMAP_GFX)/*.$(TEXT_TYPE)
	$(PYTHON) $(SCRIPT)/dump_maps.py tilemap "$(TILEMAP_GFX)" "$(TILEMAP_PREBUILT)" "$(TILEMAP_OUT)" "$(SCRIPT_RES)" "$(VERSION_SRC)" 78a 78e 4

dump_attribmaps: | $(ATTRIBMAP_GFX) $(ATTRIBMAP_PREBUILT) $(SCRIPT_RES)
	rm $(ATTRIBMAP_PREBUILT)/*.$(TMAP_TYPE)
	rm $(ATTRIBMAP_GFX)/*.$(TEXT_TYPE)
	$(PYTHON) $(SCRIPT)/dump_maps.py attribmap "$(ATTRIBMAP_GFX)" "$(ATTRIBMAP_PREBUILT)" "$(ATTRIBMAP_OUT)" "$(SCRIPT_RES)" "$(VERSION_SRC)" 8fe 902 4

# Tests
.PHONY: test_tilemaps test_attribmaps

test_tilemaps:
	$(PYTHON) $(SCRIPT)/test_maps.py "$(TILEMAP_PREBUILT)"

test_attribmaps:
	$(PYTHON) $(SCRIPT)/test_maps.py "$(ATTRIBMAP_PREBUILT)"

#Make directories if necessary
$(BUILD):
	mkdir -p $(BUILD)

$(SCRIPT_RES):
	mkdir -p $(SCRIPT_RES)

$(VERSION_OUT):
	mkdir -p $(VERSION_OUT)

$(DIALOG_TEXT):
	mkdir -p $(DIALOG_TEXT)

$(DIALOG_INT):
	mkdir -p $(DIALOG_INT)

$(DIALOG_OUT):
	mkdir -p $(DIALOG_OUT)

$(TILESET_PREBUILT):
	mkdir -p $(TILESET_PREBUILT)

$(TILESET_GFX):
	mkdir -p $(TILESET_GFX)

$(TILESET_OUT):
	mkdir -p $(TILESET_OUT)

$(PTRLISTS_TEXT):
	mkdir -p $(PTRLISTS_TEXT)

$(PTRLISTS_INT):
	mkdir -p $(PTRLISTS_INT)

$(PTRLISTS_OUT):
	mkdir -p $(PTRLISTS_OUT)

$(TILEMAP_PREBUILT):
	mkdir -p $(TILEMAP_PREBUILT)

$(TILEMAP_GFX):
	mkdir -p $(TILEMAP_GFX)

$(TILEMAP_OUT):
	mkdir -p $(TILEMAP_OUT)

$(ATTRIBMAP_PREBUILT):
	mkdir -p $(ATTRIBMAP_PREBUILT)

$(ATTRIBMAP_GFX):
	mkdir -p $(ATTRIBMAP_GFX)

$(ATTRIBMAP_OUT):
	mkdir -p $(ATTRIBMAP_OUT)