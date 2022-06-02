INCLUDE "game/src/common/constants.asm"

SECTION "Patch Tileset Loading", ROM0[$0080]
Load1BPPTilesFromFE::
  ld a, $FE
  rst $10
  call Load1BPPTiles
  ld a, $FF
  rst $10
  ret

Load1BPPTiles::
  ; hl is the vram address to write to.
  ; de is the address to copy from.
  ; b is the number of tiles to copy.
  ld c, 8

.loop
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  ld a, [de]
  ld [hli], a
  ld [hli], a
  ei
  inc de
  dec c
  jr nz, .loop
  dec b
  jr nz, Load1BPPTiles
  ret

; PatchTilesetEntry FontName
PatchTilesetEntry: MACRO
PatchTilesetStart\1::
  INCBIN "./build/tilesets/patch/\1.1bpp"
PatchTilesetEnd\1::
ENDM

SECTION "Patch 2bpp Tilesets 1", ROMX[$4000], BANK[$FD]
; Include certain 2bpp 'malias' uncompressed graphics here
MainDialog1::
  INCBIN "./build/tilesets/MainDialog1.malias"
Special::
  INCBIN "./build/tilesets/Special.malias"
MenuMedawatchGraphics::
  INCBIN "./build/tilesets/MenuMedawatchGraphics.malias"
MenuMedawatchTextSprites::
  INCBIN "./build/tilesets/MenuMedawatchTextSprites.malias"
PartsScreen::
  INCBIN "./build/tilesets/PartsScreen.malias"
MedalInfoText::
  INCBIN "./build/tilesets/MedalInfoText.malias"
AutoBattleSymbols::
  INCBIN "./build/tilesets/AutoBattleSymbols.malias"
ShopBuySellKanji::
  INCBIN "./build/tilesets/ShopBuySellKanji.malias"
ShopBubbleText::
  INCBIN "./build/tilesets/ShopBubbleText.malias"
ShopBuySellText::
  INCBIN "./build/tilesets/ShopBuySellText.malias"

SECTION "Patch GFX", ROMX[$4000], BANK[$FE]
PatchTilesets::
  PatchTilesetEntry EntryFont
  PatchTilesetEntry OldFontTiles0
  PatchTilesetEntry OldFontTiles1
  PatchTilesetEntry OldFontTiles2
  PatchTilesetEntry MenuStartScreen
  PatchTilesetEntry MenuMainGame
  PatchTilesetEntry OptionYesNo
  PatchTilesetEntry InfoSaveScreen
  PatchTilesetEntry InputNameScreen
  PatchTilesetEntry InputNameCharacterMap1
  PatchTilesetEntry InputNameCharacterMap2
  PatchTilesetEntry InputNamePlayerName
  PatchTilesetEntry ItemUseCancel
  PatchTilesetEntry ItemScreen
  PatchTilesetEntry VehiclesMiniHandle
  PatchTilesetEntry VehiclesWingsOfWind
  PatchTilesetEntry VehiclesPeriscope
  PatchTilesetEntry GlossaryTerms
  PatchTilesetEntry PartsScreenPartTypes
  PatchTilesetEntry PartsInfoHead
  PatchTilesetEntry PartsInfoArms
  PatchTilesetEntry PartsInfoLegs
  PatchTilesetEntry MedalScreen ; Used on other MedalInfo screens as well
  PatchTilesetEntry MedalInfoMedaforce
  PatchTilesetEntry MedalInfoSkills
  PatchTilesetEntry MedalInfoMedalia
  PatchTilesetEntry MedarotsScreen
  PatchTilesetEntry MedarotInfo
  PatchTilesetEntry MedachangeInfo
  PatchTilesetEntry RobattleSelection
  PatchTilesetEntry Robattle
  PatchTilesetEntry RobattleMedalResults
  PatchTilesetEntry RobattleAutoBattlePlan
  PatchTilesetEntry ShopScreen
  PatchTilesetEntry ShopPasswordScreen