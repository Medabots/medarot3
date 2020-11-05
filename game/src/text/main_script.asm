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
  ld a, 0
  ld [W_MainScriptSpeed], a
  ld a, $FF
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
  ld a, 0
  ld [W_MainScriptSpeed], a
  ld a, $FF
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
  ldh a, [hJPInputChanged]
  and hJPInputA
  jr nz, .aButtonPressed
  ldh a, [hJPInputHeldDown]
  and hJPInputA
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
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a

MainScriptProcessorPutCharLoop::
  push hl
  ld a, [W_MainScriptPointerLocationOffset]
  ld b, a
  ld a, [W_MainScriptPointerLocationOffset + 1]
  ld c, a
  add hl, bc
  ld a, [hl]
  cp $CC
  jp z, ControlCodeCC ; End code.
  cp $CD
  jp z, ControlCodeCD ; Newline code.
  cp $CE
  jp z, ControlCodeCE ; Text speed code.
  cp $CF
  jp z, ControlCodeCF ; New page after input code.
  cp $D0
  jp z, ControlCodeD0 ; Print subtext code.
  cp $D1
  jp z, ControlCodeD1 ; New page without input code.
  cp $D2
  jp z, $1EB5 ; Portrait display code.
  cp $D3
  jp z, $2016 ; Kanji drawing code.
  jp MainScriptMapCharacter ; Map character to the screen.

ControlCodeCC:: ; End code.
  ld a, [W_MainScriptCCSubState]
  or a
  jp nz, .subsequentStateLoader

.exitSubState0
  inc hl
  ld a, [hl]
  pop hl
  ld hl, .table
  rst $30
  jp hl

.subsequentStateLoader
  pop hl
  add 5
  ld hl, .table
  rst $30
  jp hl

.table
  dw .exitCode0
  dw .exitCode1
  dw .exitCode2
  dw .exitCode3
  dw .exitCode4
  dw .exitCode5
  dw .exitSubState1
  dw .exitSubState2
  dw .exitSubState3

.exitCode0
  call .inputCheck
  or a
  ret z
  ld a, 7
  call $27DA
  call $2086
  jp .exitCodeCommon

.exitCode1
  call $2086
  jp .exitCodeCommon

.exitCode2
  call .inputCheck
  or a
  ret z
  ld a, 7
  call $27DA
  jp .exitCodeCommon

.exitCode3
  call .inputCheck
  or a
  ret z
  ld a, 7
  call $27DA
  call MapMainScriptWindow
  jp .exitCodeCommon
 
.exitCode4
  jp .exitCodeCommon

.exitCode5
  ld a, 1
  ld [W_MainScriptExitMode], a
  ret

.exitSubState1
  call $346D
  ld a, 1
  ld [$C4D0], a
  jp .nextSubState

.exitSubState2
  jp .nextSubState

.exitSubState3
  ld a, 1
  ld [W_MainScriptExitMode], a
  jp $2060

.nextSubState
  ld a, [W_MainScriptCCSubState]
  inc a
  ld [W_MainScriptCCSubState], a
  ret

.exitCodeCommon
  ld a, [W_MainScriptPortraitPlacement]
  cp $FF
  jr nz, .continueIntoState1

.exitNow
  ld a, 1
  ld [W_MainScriptExitMode], a
  ret

.continueIntoState1
  ld a, 1
  ld [W_MainScriptCCSubState], a
  ret

.inputCheck
  ldh a, [hJPInputChanged]
  and hJPInputA
  jr nz, .aButtonPressed
  ldh a, [hJPInputHeldDown]
  and hJPInputA
  ret z
  ld a, [W_MainScriptIterator]
  cp $C
  jp z, .aButtonPressed
  inc a
  ld [W_MainScriptIterator], a
  xor a
  ret

.aButtonPressed
  ld a, 1
  ret

ControlCodeCD:: ; Newline code.
  ld hl, $9C00
  ld bc, $0061
  add hl, bc
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld b, 1
  call $2112
  xor a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  pop hl
  jp MainScriptProcessorPutCharLoop

ControlCodeCE:: ; Text speed code.
  inc hl
  ld a, [hl]
  ld [W_MainScriptPauseTimer], a
  ld [W_MainScriptSpeed], a
  ld b, 2
  call $2112
  pop hl
  ld a, [W_MainScriptPauseTimer]
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoop

ControlCodeCF:: ; New page after input code.
  pop hl
  ld hl, $9C00
  ld bc, $72
  add hl, bc
  ld b, $F7
  ld a, [$C460]
  and 4
  jr nz, .showNextPageIndicator
  ld b, 0

.showNextPageIndicator
  ld a, b
  di
  push af
  rst $20
  pop af
  ld [hl], a
  ei
  ldh a, [hJPInputChanged]
  and hJPInputA
  jr nz, .aButtonPressed
  ldh a, [hJPInputHeldDown]
  and hJPInputA
  ret z
  ld a, [W_MainScriptIterator]
  cp $C
  jp z, .aButtonPressed
  inc a
  ld [W_MainScriptIterator], a
  ret

.aButtonPressed
  ld a, 7
  call $27DA
  xor a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ld bc, 0
  ld e, 1
  ld a, 0
  call DecompressTilemap1
  ld hl, $9C21
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld b, 1
  call $2112
  xor a
  ld [W_MainScriptKanjiDrawingRegionTileIndex], a
  ret

ControlCodeD0:: ; Print subtext code.
  inc hl
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [W_MainScriptIterator]
  ld c, a
  ld b, 0
  add hl, bc
  ld a, [hl]
  cp $CB
  jr nz, .mapCharacter

.terminatorFound
  ld b, 3
  call $2112
  xor a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ld a, [W_MainScriptSpeed]
  ld [W_MainScriptPauseTimer], a
  pop hl
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoop

.mapCharacter
  ld [W_MaliasSourceBank], a
  cp $D3
  jr z, .kanjiHandling
  ld a, [W_MainScriptLineMappingBaseLocation]
  ld h, a
  ld a, [W_MainScriptLineMappingBaseLocation + 1]
  ld l, a
  ld a, [W_MaliasSourceBank]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld a, [W_MainScriptIterator]
  inc a
  ld [W_MainScriptIterator], a
  ld a, [W_MainScriptSpeed]
  ld [W_MainScriptPauseTimer], a
  pop hl
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoop

.kanjiHandling
  inc hl
  ld a, [hl]
  ld [W_MaliasSourceBank], a
  call $2122
  ld a, [W_MaliasSourceBank]
  call $2172
  ld a, [W_MainScriptLineMappingBaseLocation]
  ld h, a
  ld a, [W_MainScriptLineMappingBaseLocation + 1]
  ld l, a
  ld a, [W_MainScriptKanjiDrawingRegionTileIndex]
  add $BB
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld a, [W_MainScriptTextBank]
  rst $10
  ld a, [W_MainScriptKanjiDrawingRegionTileIndex]
  inc a
  ld [W_MainScriptKanjiDrawingRegionTileIndex], a
  pop hl
  ld a, [W_MainScriptIterator]
  add 2
  ld [W_MainScriptIterator], a
  ld a, [W_MainScriptSpeed]
  ld [W_MainScriptPauseTimer], a
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoop

ControlCodeD1:: ; New page without input code.
  call MapMainScriptWindow
  ld hl, $9C21
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld b, 1
  call $2112
  xor a
  ld [W_MainScriptKanjiDrawingRegionTileIndex], a
  pop hl
  ret

MainScriptMapCharacter::
  ld b, 1
  call $2112
  xor a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  ld a, [hl]
  ld [W_MaliasSourceBank], a
  ld a, [W_MainScriptLineMappingBaseLocation]
  ld h, a
  ld a, [W_MainScriptLineMappingBaseLocation + 1]
  ld l, a
  ld a, [W_MaliasSourceBank]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, h
  ld [W_MainScriptLineMappingBaseLocation], a
  ld a, l
  ld [W_MainScriptLineMappingBaseLocation + 1], a
  ld a, [W_MainScriptSpeed]
  ld [W_MainScriptPauseTimer], a
  pop hl
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoop
