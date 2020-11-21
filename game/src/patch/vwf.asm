INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "VWF Wrappers", ROM0[$0072]
VWFControlCodeCCCrossBank2086::
  call $2086
  ld a, $FF
  rst $10
  ret

MainScriptProcessorPutCharLoopCrossBank::
  ld a, [W_MainScriptTextBank]
  rst $10
  jp MainScriptProcessorPutCharLoop

SECTION "VWF Drawing Functions", ROMX[$6000], BANK[$FF]
VWFDrawLetterTable::
  ; This determines the width of each character (excluding the 1px between characters).
  ; The address of this table must be a multiple of $100.

  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF
  db 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 0x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 1x
  db 2, 1, 3, 5, 4, 5, 5, 2, 2, 2, 3, 5, 2, 4, 1, 4 ; 2x
  db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 2, 4, 4, 4, 5 ; 3x
  db 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 ; 4x
  db 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 4, 2, 3, 4 ; 5x
  db 2, 5, 4, 4, 4, 4, 4, 4, 4, 1, 2, 4, 1, 5, 4, 4 ; 6x
  db 4, 4, 4, 4, 4, 4, 4, 5, 4, 4, 4, 3, 1, 3, 7, 7 ; 7x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 8x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 9x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ax
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Bx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Cx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Dx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ex
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Fx
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF

VWFDrawNarrowLetterTable::
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF
  db 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 0x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 5 ; 1x
  db 2, 1, 3, 5, 4, 5, 5, 2, 2, 2, 3, 5, 2, 4, 1, 4 ; 2x
  db 4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 1, 2, 4, 4, 4, 4 ; 3x
  db 5, 4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 5, 4, 4 ; 4x
  db 4, 4, 4, 4, 5, 4, 5, 5, 5, 5, 4, 2, 4, 2, 3, 4 ; 5x
  db 2, 3, 3, 3, 3, 3, 2, 3, 3, 1, 2, 3, 1, 5, 3, 3 ; 6x
  db 3, 3, 3, 3, 3, 3, 4, 5, 4, 3, 3, 3, 1, 3, 6, 7 ; 7x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 8x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 9x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ax
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Bx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Cx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Dx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ex
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Fx
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF

VWFDrawBoldLetterTable::
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF
  db 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 0x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 1x
  db 2, 2, 3, 5, 5, 5, 6, 2, 3, 3, 3, 5, 2, 4, 1, 4 ; 2x
  db 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 2, 4, 4, 4, 6 ; 3x
  db 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 ; 4x
  db 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 3, 4, 3, 3, 4 ; 5x
  db 2, 6, 5, 5, 5, 5, 4, 5, 5, 2, 3, 5, 2, 6, 5, 5 ; 6x
  db 5, 5, 5, 5, 5, 5, 5, 6, 6, 5, 4, 4, 2, 4, 7, 7 ; 7x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 8x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 9x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ax
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Bx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Cx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Dx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ex
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Fx
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF

VWFDrawRoboticLetterTable::
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF
  db 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 0x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 1x
  db 2, 1, 3, 5, 4, 5, 5, 1, 2, 2, 3, 5, 2, 4, 1, 4 ; 2x
  db 4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 1, 2, 4, 4, 4, 5 ; 3x
  db 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 ; 4x
  db 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 4, 2, 3, 4 ; 5x
  db 2, 4, 4, 4, 4, 4, 4, 4, 4, 1, 2, 4, 1, 5, 4, 4 ; 6x
  db 4, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 3, 1, 3, 7, 7 ; 7x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 8x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 9x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ax
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Bx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Cx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Dx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ex
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Fx
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF

VWFDrawRoboticBoldLetterTable::
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF
  db 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 0x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 1x
  db 2, 2, 3, 5, 5, 5, 6, 1, 3, 3, 3, 5, 2, 4, 1, 4 ; 2x
  db 5, 3, 5, 5, 5, 5, 5, 5, 5, 5, 1, 2, 4, 4, 4, 6 ; 3x
  db 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 ; 4x
  db 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 3, 4, 3, 3, 4 ; 5x
  db 2, 5, 5, 5, 5, 5, 5, 5, 5, 2, 3, 5, 2, 6, 5, 5 ; 6x
  db 5, 5, 5, 5, 5, 5, 5, 6, 6, 5, 5, 4, 2, 4, 7, 7 ; 7x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 8x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; 9x
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ax
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Bx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Cx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Dx
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Ex
  db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ; Fx
  ;  x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF

VWFFont::
  INCBIN "build/tilesets/patch/Font.1bpp"

VWFNarrowFont::
  INCBIN "build/tilesets/patch/NarrowFont.1bpp"

VWFBoldFont::
  INCBIN "build/tilesets/patch/BoldFont.1bpp"

VWFRoboticFont::
  INCBIN "build/tilesets/patch/RoboticFont.1bpp"

VWFRoboticBoldFont::
  INCBIN "build/tilesets/patch/RoboticBoldFont.1bpp"

VWFDrawCharLoop::
  call VWFCheckInit
  ld a, [hl]
  cp $80
  jp c, VWFWriteChar
  cp $CC
  jp z, VWFControlCodeCC
  cp $CD
  jp z, VWFControlCodeCD
  cp $CE
  jp z, VWFControlCodeCE
  cp $CF
  jp z, VWFControlCodeCF
  cp $D0
  jp z, VWFControlCodeD0
  cp $D1
  jp z, VWFControlCodeD1
  cp $D2
  jp z, VWFControlCodeD2
  cp $D3
  jp z, VWFControlCodeD3
  ; This character isn't in the font, so confine the index.
  and $7F
  ld [hl], a
  jp VWFWriteChar

VWFMessageBoxInputHandler::
  ; Advance on button press.

  ld a, [H_JPInputChanged]
  and M_JPInputA
  ret nz

  ; Auto-advance if button held down.

  ld a, [H_JPInputHeldDown]
  and M_JPInputA
  ret z

  ; Wait 10 frames before advancing.

  ld a, [W_MainScriptIterator]
  cp $C
  jr nz, .buttonNotPressedLongEnough
  xor a
  inc a
  ret

.buttonNotPressedLongEnough
  inc a
  ld [W_MainScriptIterator], a
  xor a
  ret

VWFControlCodeCC:: ; End code.
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
  call VWFMessageBoxInputHandler
  ret z
  ld a, 7
  ldh [$FFA1], a
  call VWFControlCodeCCCrossBank2086
  call VWFControlCodeCCTileRestoreHelper
  jp .exitCodeCommon

.exitCode1
  call VWFControlCodeCCCrossBank2086
  call VWFControlCodeCCTileRestoreHelper
  jp .exitCodeCommon

.exitCode2
  call VWFMessageBoxInputHandler
  ret z
  ld a, 7
  ldh [$FFA1], a
  jp .exitCodeCommon

.exitCode3
  call VWFMessageBoxInputHandler
  ret z
  ld a, 7
  ldh [$FFA1], a
  ld bc, 0
  ld e, 1
  ld a, [W_ReturnBank]
  push af
  ld a, BANK(VWFControlCodeCC)
  ld [W_ReturnBank], a
  xor a
  call WrapDecompressTilemap1
  pop af
  ld [W_ReturnBank], a
  jp .exitCodeCommon
 
.exitCode4
  jp .exitCodeCommon

.exitCode5
  ld a, 1
  ld [W_MainScriptExitMode], a
  ret

.exitSubState1
  ld a, [W_ReturnBank]
  push af
  ld a, BANK(VWFControlCodeCC)
  ld [W_ReturnBank], a
  call $346D
  pop af
  ld [W_ReturnBank], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
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

.exitCodeRestoreTilesCommon

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

VWFControlCodeCCTileRestoreHelper::
  call VWFEmptyMessageBoxTilemapLine
  VRAMSwitchToBank1
  Load1BPPTileset $8800, PatchTilesetStartMainScriptOldTiles, PatchTilesetEndMainScriptOldTiles
  VRAMSwitchToBank0
  ret

VWFControlCodeCD:: ; Newline code.
  call VWFResetForNewline
  pop hl
  ld b, 1
  call MainScriptProgressXChars
  jp MainScriptProcessorPutCharLoopCrossBank

VWFControlCodeCE:: ; Text speed code.
  inc hl
  ld a, [hl]
  ld [W_MainScriptPauseTimer], a
  ld [W_MainScriptSpeed], a
  ld b, 2
  call MainScriptProgressXChars
  pop hl
  ld a, [W_MainScriptPauseTimer]
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoopCrossBank

VWFControlCodeCF:: ; New page after input code.
  pop hl
  ld hl, $9C72
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
  call VWFMessageBoxInputHandler
  ret z
  xor a
  call VWFResetMessageBox
  ld b, 1
  call MainScriptProgressXChars
  ret

VWFControlCodeD0:: ; Print subtext code.
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
  call MainScriptProgressXChars
  jp VWFWriteChar.extEntryA

.mapCharacter
  ; Confine the index to characters in the font.
  and $7F
  ld [W_VWFCurrentLetter], a
  call VWFWriteCharBasic
  ld a, [W_MainScriptIterator]
  inc a
  jp VWFWriteChar.extEntryB

VWFControlCodeD1:: ; New page without input code.
  call VWFResetMessageBox
  pop hl
  ld b, 1
  call MainScriptProgressXChars
  ret

VWFControlCodeD2:: ; Portrait display code. We preserve most of the original logic in bank 0, but will handle .clearPortrait differently here.
  push hl
  inc hl
  ld a, [hl]
  pop hl
  cp $FF
  jp nz, ControlCodeD2_changePortrait

.clearPortrait
  ld a, [W_MainScriptPortraitCharacter]
  cp $FF
  jr z, .exit
  pop hl
  ld a, [W_MainScriptCCSubState]
  cp 0
  jp z, VWFControlCodeCC.exitSubState1
  cp 1
  jp z, VWFControlCodeCC.exitSubState2
  ld a, $FF
  ld [W_MainScriptPortraitCharacter], a
  ld [W_MainScriptPortraitPriorPlacement], a
  ld [W_MainScriptPortraitExpression], a
  xor a
  ld [W_MainScriptCCSubState], a
  ld b, 4
  call MainScriptProgressXChars
  jp $2060

.exit
  pop hl
  ld b, 4
  call MainScriptProgressXChars
  ret

VWFControlCodeD3:: ; Kanji drawing code, except we don't want to draw kanji. Will later be replaced with a universal newline control code.
  pop hl
  ld b, 2
  call MainScriptProgressXChars
  jp MainScriptProcessorPutCharLoopCrossBank

VWFCheckInit::
  ld a, [W_VWFIsInit]
  or a
  ret z
  xor a
  ld [W_VWFIsInit], a
  ld [W_VWFCurrentFont], a
  ld a, $80
  ld [W_VWFTileBaseIdx], a
  call VWFResetMessageBox
  call VWFResetMessageBoxTilemaps
  ret

VWFResetMessageBoxTilemaps::
  push hl
  ld hl, $9C21
  ld c, $80
  call VWFResetMessageBoxTilemapLine
  ld a, l
  add $2F
  ld l, a
  call VWFResetMessageBoxTilemapLine
  pop hl
  ret

VWFResetMessageBox::
  push hl
  VRAMSwitchToBank1
  ld b, $22
  ld hl, $8800
  call VWFEmptyDrawingRegion
  VRAMSwitchToBank0
  pop hl
  ; "a" should be 0 after using VRAMSwitchToBank0 so a "xor a" here would feel redundant.
  ld [W_VWFTilesDrawn], a
  ld [W_VWFIsSecondLine], a
  jr VWFResetForNewline.common

VWFResetForNewline::
  ld a, $11
  ld [W_VWFTilesDrawn], a
  ld a, 1
  ld [W_VWFIsSecondLine], a
  xor a

.common
  ld [W_VWFOldTileMode], a
  ld [W_VWFDiscardSecondTile], a
  ld [W_MainScriptIterator], a
  ld [W_MainScriptPauseAutoAdvanceTimer], a
  push hl
  ld hl, W_VWFCompositeArea
  ld b, $10

.clearCompositeAreaLoop
  ld [hli], a
  dec b
  jr nz, .clearCompositeAreaLoop
  pop hl
  ret

VWFEmptyDrawingRegion::
  ld c, 4

.loop
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ei
  dec c
  jr nz, .loop
  dec b
  jr nz, VWFEmptyDrawingRegion
  ret

VWFEmptyMessageBoxTilemapLine::
  ld hl, $9C21
  ld b, 1
  call VWFEmptyDrawingRegion
  ld l, $61
  ld b, 1
  call VWFEmptyDrawingRegion
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb

  xor a
  ld [hli], a
  ld [$9C31], a
  ei
  ret

VWFResetMessageBoxTilemapLine::
  ld b, 5

.loop
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  ld a, c
  ld [hli], a
  inc a
  ld [hli], a
  inc a
  ld [hli], a
  ei
  inc a
  ld c, a
  dec b
  jr nz, .loop
  di

.wfbB
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbB
  ld a, c
  ld [hli], a
  inc a
  ld [hli], a
  ei
  inc a
  ld c, a
  ret

VWFWriteChar::
  ld b, 1
  call MainScriptProgressXChars
  call VWFWriteCharBasic

.extEntryA
  xor a
  ld [W_MainScriptPauseAutoAdvanceTimer], a

.extEntryB
  ld [W_MainScriptIterator], a
  ld a, [W_MainScriptSpeed]
  ld [W_MainScriptPauseTimer], a
  pop hl
  cp $FF
  ret nz
  xor a
  ld [W_MainScriptPauseTimer], a
  jp MainScriptProcessorPutCharLoopCrossBank

VWFWriteCharBasic::
  ; Get tile address.

  VRAMSwitchToBank1

  ld a, [W_VWFTilesDrawn]
  ld b, a
  ld a, [W_VWFTileBaseIdx]
  add b
  call VWFTileIdx2Ptr

  ; Draw character.

  call VWFDrawLetter

  ; Progress to next tile (if applicable).
  
  VRAMSwitchToBank0

  ld a, [W_VWFOldTileMode]
  cp 1
  ld a, [W_VWFTilesDrawn]
  ret c
  inc a
  ld [W_VWFTilesDrawn], a
  ret

VWFTileIdx2Ptr::
  cp $80
  jr c, .firstPage
  swap a
  ld h, a
  and $F0
  ld l, a
  ld a, h
  and $F
  or $80
  ld h, a
  ret

.firstPage
  swap a
  ld h, a
  and $F0
  ld l, a
  ld a, h
  and $F
  or $90
  ld h, a
  ret

VWFDrawLetter::
  ld a, [W_VWFCurrentLetter]

  ; Calculate the address of the relevant character.

  push hl
  ld b, 0
  add a
  jr nc, .noCarry
  inc b

.noCarry
  sla a
  rl b
  sla a
  rl b
  ld c, a
  ld hl, VWFFont
  ld a, [W_VWFCurrentFont]
  add a
  add a
  add a
  add h
  ld h, a
  add hl, bc
  ld d, h
  ld e, l
  pop hl

  ; Store the address of the composite area (an area to draw tile data before tranferring it to vram).

  ld b, 8
  ld a, W_VWFCompositeArea >> 8
  ld [W_HackTempHL], a
  ld a, W_VWFCompositeArea & $FF
  ld [W_HackTempHL + 1], a

  ; Get the width of the character.

  push hl
  push bc
  ld a, [W_VWFCurrentLetter]
  ld h, VWFDrawLetterTable >> 8
  ld l, a
  ld a, [W_VWFCurrentFont]
  add h
  ld h, a
  ld b, [hl]
  ld a, [W_VWFTextLength]
  add b
  inc a
  ld [W_VWFTextLength], a

  ; Check if the character overflows into the next tile.

  ld a, [W_VWFLetterShift]
  add a, b
  bit 3, a
  jr nz, .onSecondTile
  xor a
  jr .doneCalculatingTile

.onSecondTile
  ld a, 1

.doneCalculatingTile
  pop bc
  pop hl

.tileShiftLoop
  push bc
  push de
  push hl
  push af
  ld a, [W_HackTempHL]
  ld h, a
  ld a, [W_HackTempHL + 1]
  ld l, a
  ld b, [hl]
  inc hl
  ld c, [hl]
  dec hl
  ld a, [de]
  ld d, a
  ld e, 0
  ld a, [W_VWFOldTileMode]
  cp 2
  jr z, .newlineMode
  cp 1
  jr z, .secondTileMode
  jr .firstTileMode

.newlineMode
  ld c, 0

.secondTileMode
  ld b, c

.firstTileMode
  ld a, [W_VWFLetterShift]
  or a
  jr z, .stopShifting

.shiftLoop
  srl d
  rr e
  dec a
  jr nz, .shiftLoop

.stopShifting
  ld a, d
  or b
  ld b, a
  ld c, e
  ld [hl], b
  inc hl
  ld [hl], c
  inc hl
  ld a, h
  ld [W_HackTempHL], a
  ld a, l
  ld [W_HackTempHL + 1], a
  pop af
  pop hl
  ld d, h
  ld e, l
  push af
  ld a, b
  call VWFExpandGlyph
  pop af
  push hl
  push af
  or a
  jr z, .skipSecondTile
  ld a, [W_VWFDiscardSecondTile]
  or a
  jr nz, .skipSecondTile
  ld hl, $10
  add hl, de
  ld a, c
  call VWFExpandGlyph
  
.skipSecondTile
  pop af
  pop hl
  pop de
  pop bc
  inc de
  dec b
  jr nz, .tileShiftLoop
  xor a
  ld [W_VWFOldTileMode], a
  ld b, VWFDrawLetterTable >> 8
  ld a, [W_VWFCurrentFont]
  add b
  ld b, a
  ld a, [W_VWFCurrentLetter]
  ld c, a
  ld a, [bc]
  inc a
  
.addWidth
  ld b, a
  ld a, [W_VWFLetterShift]
  add a, b
  bit 3, a
  jr z, .noSecondTileShiftBack
  sub 8
  push af
  ld a, 1
  ld [W_VWFOldTileMode], a
  pop af
  
.noSecondTileShiftBack
  ld [W_VWFLetterShift], a
  ret

VWFExpandGlyph::
  push bc
  ld b, a
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb

  ld a, b
  ld [hli], a
  ld [hli], a
  ei
  pop bc
  ret
