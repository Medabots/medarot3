INCLUDE "game/src/common/constants.asm"

SECTION "Main Script Variables 1", WRAM0[$C4C3]
W_MainScriptPointerLocationOffset:: ds 2
W_MainScriptPauseTimer:: ds 1
W_MainScriptLineMappingBaseLocation:: ds 2
W_MainScriptSpeed:: ds 1
W_MainScriptIterator:: ds 1
W_MainScriptKanjiDrawingRegionTileIndex:: ds 1
W_MainScriptPortraitCharacter:: ds 1
W_MainScriptTextBank:: ds 1
W_MainScriptExitMode:: ds 1

SECTION "Main Script Variables 2", WRAM0[$C4D6]
W_MainScriptCCSubState:: ds 1
W_MainScriptPauseAutoAdvanceTimer:: ds 1

SECTION "Main Script Variables 3", WRAM0[$C539]
W_MainScriptPortraitPriorPlacement:: ds 1
W_MainScriptPortraitPlacement:: ds 1
W_MainScriptPortraitExpression:: ds 1

; W_MainScriptPortraitPlacement has 5 viable values, those being $00, $01, $10, $11, and $FF.
; $00 and $10 have left-facing portraits, and $01 and $11 have right-facing portraits.
; $00 and $01 are of the left side of the screen. $10 and $11 are to the right.
; $FF clears the current portrait.

SECTION "Main Script", ROM0[$1B6B]
InitiateMainScript::
  xor a
  ld [W_MainScriptKanjiDrawingRegionTileIndex], a
  ld [W_MainScriptPointerLocationOffset], a
  ld [W_MainScriptPointerLocationOffset + 1], a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptExitMode], a
  ld [W_MainScriptPauseTimer], a
  ld [W_MainScriptCCSubState], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ld [W_MainScriptSpeed], a
  dec a
  ld [W_VWFIsInit], a
  ld [W_MainScriptPortraitCharacter], a
  ld [W_MainScriptPortraitPriorPlacement], a
  ld [W_MainScriptPortraitPlacement], a
  ld [W_MainScriptPortraitExpression], a
  ld hl, $9C21
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld a, 1
  jp $1569

InitiateMainScriptAlternate::
  xor a
  ld [W_MainScriptKanjiDrawingRegionTileIndex], a
  ld [W_MainScriptPointerLocationOffset], a
  ld [W_MainScriptPointerLocationOffset + 1], a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptExitMode], a
  ld [W_MainScriptPauseTimer], a
  ld [W_MainScriptCCSubState], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ld [W_MainScriptSpeed], a
  dec a
  ld [W_VWFIsInit], a
  ld [W_MainScriptPortraitCharacter], a
  ld [W_MainScriptPortraitPriorPlacement], a
  ld [W_MainScriptPortraitPlacement], a
  ld [W_MainScriptPortraitExpression], a
  ld hl, $9C21
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld bc, 0
  ld e, 1
  ld a, 0
  jp DecompressTilemap1

MapMainScriptWindow::
  ld bc, 0
  ld e, 1
  ld a, 0
  jp DecompressTilemap1

MainScriptProcessor::
  call $208B
  ld a, [W_MainScriptExitMode]
  or a
  ret nz
  ld a, [W_MainScriptPauseTimer]
  or a
  jr z, .doNotPause
  dec a
  ld [W_MainScriptPauseTimer], a
  ld a, [$C522]
  cp 2
  ret z
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr nz, .aButtonPressed
  ldh a, [H_JPInputHeldDown]
  and M_JPInputA
  ret z
  ld a, [W_MainScriptPauseAutoAdvanceTimer]
  cp $C
  jr z, .aButtonPressed
  inc a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ret

.aButtonPressed
  xor a
  ld [W_MainScriptPauseTimer], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ret

.doNotPause
  add hl, bc
  add hl, bc
  add hl, bc
  ld a, [hli]
  ld [W_VWFTextBank], a
  push af
  ld a, [hli]
  ld h, [hl]
  ld l, a
  pop af
  rst $10

MainScriptProcessorPutCharLoop::
  push hl
  ld a, [W_MainScriptPointerLocationOffset]
  ld b, a
  ld a, [W_MainScriptPointerLocationOffset + 1]
  ld c, a
  add hl, bc
  ld a, [hl]
  ld bc, W_VWFCurrentLetter
  ld a, [hli]
  ld [bc], a
  inc bc
  ld a, [hli]
  ld [bc], a
  inc bc
  ld a, [hli]
  ld [bc], a
  inc bc
  ld a, [hl]
  ld [bc], a
  ld hl, W_VWFCurrentLetter
  ld a, BANK(VWFDrawCharLoop)
  rst $10
  jp VWFDrawCharLoop

SECTION "Main Script 2", ROM0[$1EEA]
ControlCodeD2_changePortrait::
  ld a, [W_MainScriptCCSubState]
  cp 0
  jr z, .state0
  cp 1
  jp z, .state1
  jp .state2

.exit
  pop hl
  ld b, 4
  call MainScriptProgressXChars
  ret

.state0
  inc hl
  ld a, [hli]
  ld [W_MainScriptPortraitPlacement], a
  ld a, [hli]
  ld [W_MainScriptPortraitCharacter], a
  ld a, [hl]
  ld [W_MainScriptPortraitExpression], a
  ld a, [W_MainScriptPortraitPlacement]
  cp $FF
  jp z, .exit
  ld a, [W_MainScriptCCSubState]
  inc a
  ld [W_MainScriptCCSubState], a
  ld a, 1
  ld [$C498], a
  ld a, [W_MainScriptPortraitPriorPlacement]
  cp $FF
  jr z, .firstPortrait
  and $F0
  ld b, a
  ld a, [W_MainScriptPortraitPlacement]
  and $F0
  cp b
  jr z, .checkMappingLocation

.changedSides
  call $2060
  call $346D
  jr .checkMappingLocation

.firstPortrait
  ld a, 0
  ld [W_MaliasSourceBank], a
  ld a, $14
  ld [$C4EF], a
  ld a, 9
  ld [W_MaliasDestinationAddress], a
  ld a, 4
  ld [$C4F1], a
  ld a, 0
  call $1153

.checkMappingLocation
  ld a, [W_MainScriptPortraitPlacement]
  and $F0
  or a
  jr nz, .rightSideOfScreen

.leftSideOfScreen
  ld b, $50
  ld c, $68
  ld d, 0
  ld e, $18
  call $3465
  pop hl
  ret

.rightSideOfScreen
  ld b, $50
  ld c, $68
  ld d, $80
  ld e, $98
  call $3465
  pop hl
  ret

.state1
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_MainScriptCCSubState]
  inc a
  ld [W_MainScriptCCSubState], a
  pop hl
  ret

.state2
  ld c, 0
  ld a, [W_MainScriptPortraitCharacter]
  cp $C
  jr c, .switchToPortraitBank
  ld c, 1
  cp $26
  jr c, .switchToPortraitBank
  ld c, 2
  cp $44
  jr c, .switchToPortraitBank
  ld c, 3

.switchToPortraitBank
  ld a, $43
  add c
  rst $10
  ld hl, .table
  ld b, 0
  add hl, bc
  ld a, [hl]
  ld b, a
  ld a, [W_MainScriptPortraitCharacter]
  sub b
  ld hl, $4000
  rst $30
  ld a, [W_MainScriptPortraitExpression]
  ld b, 0
  ld c, a
  ld a, 8
  call $1446
  ld de, $9600
  ld bc, $100
  call $04F9
  ld a, [W_MainScriptPortraitPlacement]
  and $F0
  swap a
  sla a
  sla a
  sla a
  sla a
  ld b, a
  ld c, 9
  push bc
  ld a, [W_MainScriptPortraitPlacement]
  and $F
  add $10
  ld e, a
  push de
  ld a, 0
  call $151F
  pop de
  pop bc
  ld a, 0
  call $1527
  ld hl, $480
  ld b, 0
  ld a, [W_MainScriptPortraitCharacter]
  ld c, a
  add hl, bc
  ld b, h
  ld c, l
  ld a, 6
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ld a, [W_MainScriptTextBank]
  rst $10
  xor a
  ld [W_MainScriptCCSubState], a
  ld a, [W_MainScriptPortraitPlacement]
  ld [W_MainScriptPortraitPriorPlacement], a
  jp .exit

.table
  db 0,$C,$26,$44

; Free space.
.free
REPT $2060 - .free
  nop
ENDR

SECTION "Main Script Helper Functions 1", ROM0[$2112]
MainScriptProgressXChars::
  ld a, [W_MainScriptPointerLocationOffset + 1]
  add b
  ld [W_MainScriptPointerLocationOffset + 1], a
  ret nc
  ld a, [W_MainScriptPointerLocationOffset]
  inc a
  ld [W_MainScriptPointerLocationOffset], a
  ret

MainScriptGetKanjiDrawingAddress::
  ld hl, $8BB0
  ld b, 0
  ld a, [W_MainScriptKanjiDrawingRegionTileIndex]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ret

MainScriptDrawNonKanjiCharacter::
  push de
  push bc
  push hl
  push af
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld a, $39
  rst $10
  ld hl, $502A
  pop af
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld d, [hl]
  ld e, a
  ld b, $10
  pop hl

.drawLoop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .drawLoop

  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop bc
  pop de
  ret

MainScriptDrawKanjiCharacter::
  push de
  push bc
  push hl
  push af
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld a, $39
  rst $10
  ld hl, $5F8A
  pop af
  rst $30
  ld b, $10
  ld d, h
  ld e, l
  pop hl

.drawLoop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .drawLoop

  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop bc
  pop de
  ret
