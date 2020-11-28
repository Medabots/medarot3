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
TMAP_TYPE := tmap
TEXT_TYPE := txt
LISTS_TYPE := bin
CSV_TYPE = csv
CREDITS_TYPE := bin
DIALOG_TYPE := bin
TABLE_TYPE := tbl

# Directories
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
TILEMAP_OUT := $(BUILD)/tilemaps
PTRLISTS_OUT := $(BUILD)/ptrlists
LISTS_OUT := $(BUILD)/lists

DIALOG_INT := $(BUILD)/intermediate/dialog
DIALOG_OUT := $(BUILD)/dialog

# Game Source Directories
SRC := $(GAME)/src
TILESET_BIN := $(GAME)/tilesets
COMMON := $(SRC)/common

# Text Directories
DIALOG_TEXT := $(TEXT)/dialog

# Graphics Directories
TILESET_GFX := $(GFX)/tilesets

# Patch Specific
VWF_TSET_SRC_TYPE := 1bpp
VWF_TSET_TYPE := vwffont
PATCH_TEXT := $(TEXT)/patch
PATCH_TEXT_OUT := $(BUILD)/patch
PATCH_TILESET_GFX := $(TILESET_GFX)/patch
PATCH_TILESET_OUT := $(TILESET_OUT)/patch

# Source Modules (directories in SRC), version directories (kuwagata/kabuto) are implied
MODULES := core gfx text link patch

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

## Patch Specific
PATCH_TEXT_TILESETS := $(notdir $(basename $(wildcard $(PATCH_TILESET_GFX)/*.$(VWF_TSET_SRC_TYPE).$(RAW_TSET_SRC_TYPE)))) # .1bpp.png -> 1bpp
PATCH_TILESETS := $(filter-out $(PATCH_TEXT_TILESETS), $(notdir $(basename $(wildcard $(PATCH_TILESET_GFX)/*.$(RAW_TSET_SRC_TYPE))))) # .png -> 2bpp

PATCH_TEXT_TILESET_FILES := $(foreach FILE,$(PATCH_TEXT_TILESETS),$(PATCH_TILESET_OUT)/$(FILE))
PATCH_TILESET_FILES := $(foreach FILE,$(PATCH_TILESETS),$(PATCH_TILESET_OUT)/$(FILE).$(TSET_TYPE))

# Intermediates for common sources (not in version folder)
## We explicitly rely on second expansion to handle version-specific files in the version specific objects
OBJECTS := $(foreach OBJECT,$(OBJNAMES), $(addprefix $(BUILD)/,$(OBJECT)))

TILESET_FILES_COMMON := $(foreach FILE,$(TILESETS_COMMON),$(TILESET_OUT)/$(FILE).$(TSET_TYPE))
TILESET_FILES_VERSIONED := $(foreach FILE,$(TILESETS_VERSIONED),$(TILESET_OUT)/$(FILE).$(TSET_TYPE))
TILESET_FILES_GAMEVERSION := $(foreach FILE,$(TILESETS_GAMEVERSION),$(TILESET_OUT)/$(FILE).$(TSET_TYPE))

# Additional dependencies, per module granularity (i.e. story, gfx, core) or per file granularity (e.g. story_text_tables_ADDITIONAL)
core_ADDITIONAL :=
gfx_ADDITIONAL :=
text_ADDITIONAL :=
version_text_tables_ADDITIONAL := $(DIALOG_OUT)/text_table_constants_PLACEHOLDER_VERSION.asm
version_tileset_table_ADDITIONAL := $(TILESET_FILES_COMMON) $(TILESET_FILES_GAMEVERSION) $(TILESET_OUT)/PLACEHOLDER_VERSION.stamp

# Patch Specific
patch_tilesets_ADDITIONAL := $(PATCH_TEXT_TILESET_FILES)

.PHONY: $(VERSIONS) all clean default
default: kabuto
all: $(VERSIONS)

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
	$(PYTHON) $(SCRIPT)/tileset2malias.py $@ $<

# build/tilesets/*_VERSION.malias
.SECONDEXPANSION:
$(TILESET_OUT)/%.stamp: $$(call FILTER,%,$(TILESET_FILES_VERSIONED))
	touch $@

# build/dialog/intermediate/*.bin from dialog csv files
.SECONDEXPANSION:
$(DIALOG_INT)/%.$(DIALOG_TYPE): $(DIALOG_TEXT)/$$(word 1, $$(subst _, ,$$*)).$(CSV_TYPE) | $(DIALOG_INT)
	$(PYTHON) $(SCRIPT)/dialog2bin.py $@ $^ "Translated" $(subst $(subst .$(CSV_TYPE),,$(<F))_,,$*)

# Use the intermediate files to generate the final dialog files
# Make has trouble with multiple files in a single rule, so we use the asm file to indicate these files were generated
# NOTE: dialogbin2asm specifically is different between master and translation branches
.SECONDEXPANSION:
$(DIALOG_OUT)/text_table_constants_%.asm: $(SRC)/version/text_tables.asm $(SRC)/version/%/text_tables.asm $$(foreach FILE,$(DIALOG),$(DIALOG_INT)/$$(FILE)_$$*.$(DIALOG_TYPE)) | $(DIALOG_OUT)
	$(PYTHON) $(SCRIPT)/dialogbin2asm.py $@ $(DIALOG_OUT) $* $^

## Patch Specific
$(PATCH_TILESET_OUT)/%.$(VWF_TSET_TYPE): $(PATCH_TILESET_GFX)/%.$(VWF_TSET_SRC_TYPE) | $(PATCH_TILESET_OUT)
	cp $< $@

#$(PATCH_TILESET_OUT)/%.$(TSET_TYPE): $(PATCH_TILESET_OUT)/%.$(TSET_SRC_TYPE) | $(PATCH_TILESET_OUT)
#	$(PYTHON) $(SCRIPT)/tileset2malias.py $< $@

$(PATCH_TILESET_OUT)/%.$(VWF_TSET_SRC_TYPE): $(PATCH_TILESET_GFX)/%.$(VWF_TSET_SRC_TYPE).$(RAW_TSET_SRC_TYPE) | $(PATCH_TILESET_OUT)
	$(CCGFX) $(CCGFX_ARGS) -d 1 -o $@ $<

$(PATCH_TILESET_OUT)/%.$(TSET_SRC_TYPE): $(PATCH_TILESET_GFX)/%.$(RAW_TSET_SRC_TYPE) | $(PATCH_TILESET_OUT)
	$(CCGFX) $(CCGFX_ARGS) -d 2 -o $@ $<

### Dump Scripts

.PHONY: dump dump_text dump_tilesets
dump: dump_text dump_tilesets

dump_text: | $(DIALOG_TEXT) $(SCRIPT_RES)
	$(PYTHON) $(SCRIPT)/dump_text.py

dump_tilesets: | $(TILESET_GFX) $(TILESET_BIN) $(SCRIPT_RES)
	$(PYTHON) $(SCRIPT)/dump_tilesets.py

#Make directories if necessary

# Patch Specific
$(PATCH_TILESET_OUT):
	mkdir -p $(PATCH_TILESET_OUT)

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

$(TILESET_BIN):
	mkdir -p $(TILESET_BIN)

$(TILESET_GFX):
	mkdir -p $(TILESET_GFX)

$(TILESET_OUT):
	mkdir -p $(TILESET_OUT)