INCLUDE "game/src/common/constants.asm"

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
  cp $10
  jr nz, .buttonNotPressedLongEnough
  xor a
  inc a
  ret

.buttonNotPressedLongEnough
  inc a
  ld [W_MainScriptIterator], a
  xor a
  ret

VWFControlCodeCD::
  call VWFResetForNewline
  pop hl
  ld b, 1
  call MainScriptProgressXChars
  ret ; Should jump back to MainScriptProcessorPutCharLoop instead.

VWFControlCodeCE::
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
  ret ; Should jump back to MainScriptProcessorPutCharLoop instead.

VWFControlCodeCF::
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

VWFControlCodeD1::
  call VWFResetMessageBox
  pop hl
  ld b, 1
  call MainScriptProgressXChars
  ret

VWFControlCodeD3::
  pop hl
  ld b, 2
  call MainScriptProgressXChars
  ret ; Should jump back to MainScriptProcessorPutCharLoop instead.

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
  ld b, $22
  ld hl, $8000
  call VWFEmptyDrawingRegion
  pop hl
  ; "a" should be 0 after calling VWFEmptyDrawingRegion so a "xor a" here would feel redundant.
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
