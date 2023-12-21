INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "User Functions (Hack)", ROMX[$4000], BANK[$FF]
HackPredef::
  push af
  ld a, h
  ld [W_HackTempHL + 1], a
  ld a, l
  ld [W_HackTempHL], a
  pop af
  ld hl, HackPredefTable
  push bc
  rst $30
  pop bc
  push hl ; Change return pointer to Hack function
  ld a, [W_HackTempHL + 1]
  ld h, a
  ld a, [W_HackTempHL]
  ld l, a
  ret

HackPredefTable:
  dw TilemapLoadTileset ; 0
  dw PatchPrintVersion ; 1

MACRO TilemapTilesetTableEntry
  ; Number of Tiles, Tileset, Load Offset
  dbww (PatchTilesetEnd\1 - PatchTilesetStart\1)/$8, PatchTilesetStart\1, \2
ENDM
; c == table index
TilemapLoadTileset:
  push de
  push hl

  rr c
  dec c
  ld hl, .table
  ld b, $0
  add hl, bc
  add hl, bc
  add hl, bc
  add hl, bc
  add hl, bc
  ld a, [hli]
  ; b == Number of tiles
  ld b, a
  ; de == Tileset pointer
  ld a, [hli]
  ld e, a
  ld a, [hli]
  ld d, a
  
  ; hl == Font load index
  ld a, [hli]
  ld h, [hl]
  ld l, a
  
  VRAMSwitchToBank1
  call Load1BPPTilesFromFE
  VRAMSwitchToBank0

  pop hl
  pop de
  ret
.table
  ; TilemapTilesetTableEntry Tileset Name, Load Address
  ; Dialog uses $8000 to $8A10
  ; This leaves $8A20 to $8B90 and $9010 to $97F0 available
  ; Tilemap format requires that these entries are referenced at index-1
  TilemapTilesetTableEntry MenuStartScreen, $9010 ; 1
  TilemapTilesetTableEntry MenuMainGame, $9010 ; 2
  TilemapTilesetTableEntry OptionYesNo, $8B60 ; 3
  TilemapTilesetTableEntry InfoSaveScreen, $9120 ; 4 (Loaded with main menu)
  TilemapTilesetTableEntry EntryFont, $9000 ; 5 (Used for name entry)
  TilemapTilesetTableEntry InputNameCharacterMap1, $8A20 ; 6 (Swapped between 1 and 2, with InputNameScreen)
  TilemapTilesetTableEntry InputNameCharacterMap2, $8A20 ; 7
  TilemapTilesetTableEntry InputNamePlayerName, $8AC0 ; 8
  TilemapTilesetTableEntry ItemUseCancel, $97B0 ; 9
  TilemapTilesetTableEntry ItemScreen, $9120 ; A
  TilemapTilesetTableEntry VehiclesMiniHandle, $9120 ; B
  TilemapTilesetTableEntry VehiclesWingsOfWind, $9180 ; C
  TilemapTilesetTableEntry VehiclesPeriscope, $91f0 ; D
  TilemapTilesetTableEntry GlossaryTerms, $9010 ; E
  TilemapTilesetTableEntry PartsScreenPartTypes, $9120 ; F (loaded with the main PartsScreen, must preserve menu)
  TilemapTilesetTableEntry PartsInfoHead, $9270 ; 10, PartsInfo 'stat names' are loaded after the actual attributes, which are fixed
  TilemapTilesetTableEntry PartsInfoArms, $9270 ; 11
  TilemapTilesetTableEntry PartsInfoLegs, $9270 ; 12
  TilemapTilesetTableEntry MedalScreen, $9120 ; 13, loaded as part of the MedalInfoAbility screen too
  TilemapTilesetTableEntry MedalInfoMedaforce, $93A0 ; 14
  TilemapTilesetTableEntry MedalInfoSkills, $93A0 ; 15
  TilemapTilesetTableEntry MedalInfoMedalia, $93A0 ; 16
  TilemapTilesetTableEntry MedarotsScreen, $9120 ; 17
  TilemapTilesetTableEntry MedarotInfo, $9120 ; 18
  TilemapTilesetTableEntry MedachangeInfo, $9120 ; 19
  TilemapTilesetTableEntry RobattleSelection, $9190 ; 1A
  TilemapTilesetTableEntry Robattle, $9010 ; 1B
  TilemapTilesetTableEntry RobattleMedalResults, $9010 ; 1C
  TilemapTilesetTableEntry RobattleAutoBattlePlan, $9010 ; 1D
  TilemapTilesetTableEntry ShopScreen, $9010 ; 1E
  TilemapTilesetTableEntry ShopPasswordScreen, $8A20 ; 1F
  TilemapTilesetTableEntry MenuTestScreen, $9010 ; 20
  TilemapTilesetTableEntry CorruptedSaveScreen, $9010 ; 21
  TilemapTilesetTableEntry PaintShopMainScreen, $9010 ; 22
  TilemapTilesetTableEntry PaintShopPaintSelectScreen, $9010 ; 23
  TilemapTilesetTableEntry MinigameAOverlay, $9010 ; 24
  TilemapTilesetTableEntry MinigameBOverlay, $9010 ; 25
  TilemapTilesetTableEntry HeavensGateElevator, $9010 ; 26

PatchPrintVersion:
  ; VWF will overwrite the preserved bank, so fix it
  ld a, [W_BankPreservation]
  push af

  push bc
  push de
  push hl

  ; Draw text
  ld a, $14
  ld bc, .url
  ld de, $9800
  ld h, $30
  call VWFDrawStringRightFullAddress

  ld a, $14
  ld bc, .tag
  ld de, $9a20
  ld h, $44
  call VWFDrawStringRightFullAddress

  ld hl, $9300
  ld bc, $A0FF
  call .invert

  ld hl, $9440
  ld bc, $A0FF
  call .invert

  pop hl
  pop de
  pop bc

  pop af
  ld [W_BankPreservation], a
  ret
.invert
  ; Invert the colors
  VRAMSwitchToBank1
.loop
  di
.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  ld a, [hl]
  xor c
  ld [hli], a
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  VRAMSwitchToBank0
  ret
.tag
  INCBIN "build/patch/tag.bin"
.url
  INCBIN "build/patch/url.bin"