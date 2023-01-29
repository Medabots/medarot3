; Miscellaneous functions that belong elsewhere but are in different spots in different versions
INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

W_OpeningSkipButtonPressed EQU $C737

IF !STRCMP("{GAMEVERSION}", "kabuto")
SECTION "Opening Input Handler", ROMX[$6236], BANK[$03]
ENDC
IF !STRCMP("{GAMEVERSION}", "kuwagata")
SECTION "Opening Input Handler", ROMX[$623C], BANK[$03]
ENDC
OpeningInputHandler::
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputB | M_JPInputStart | M_JPInputSelect
  jp nz, .buttonPressed
  xor a
  ret

.buttonPressed
  ld a, 2
  ld [$CF96], a
  ld hl, W_ScrollInstructions
  ld bc, $10
  call memclr
  ld a, 1
  ld [W_OpeningSkipButtonPressed], a
  ld a, 1
  ret

IF !STRCMP("{GAMEVERSION}", "kabuto")
SECTION "Load numbers into buffer for text", ROMX[$5698], BANK[$09]
ENDC
IF !STRCMP("{GAMEVERSION}", "kuwagata")
SECTION "Load numbers into buffer for text", ROMX[$5697], BANK[$09]
ENDC
TextLoadListTextIntoBuffer::
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld de, cBUF06
  ld bc, $0010
  call memcpy
  ret
TextLoadNumberIntoBuffer::
  ld bc, $3e8
  call DigitCalculationLoop
  ld a, [$c4ee]
  ld [$c4f2], a
  ld a, [$c4e1]
  ld l, a
  ld a, [$c4e0]
  ld h, a
  ld bc, $64
  call DigitCalculationLoop
  ld a, [$c4ee]
  ld [$c4f3], a
  ld a, [$c4e1]
  ld l, a
  ld a, [$c4e0]
  ld h, a
  ld bc, $a
  call DigitCalculationLoop
  ld a, [$c4ee]
  ld [$c4f4], a
  ld a, [$c4e1]
  ld [$c4f5], a
  ld c, $03
  ld de, $c4f2
  ld hl, cBUF06
.loop_digit_1
  ld a, [de]
  or a
  jr nz, .loop_digit_2
  inc de
  dec c
  jr nz, .loop_digit_1
  jr .return
.loop_digit_2
  ld a, [de]
  inc de
  add $e0
  ld [hli], a
  dec c
  jr nz, .loop_digit_2
.return
  ld a, [de]
  inc de
  add $e0
  ld [hli], a
  ld a, $cb
  ld [hl], a
  ret

IF !STRCMP("{GAMEVERSION}", "kabuto")
SECTION "Load items into buffer for text", ROMX[$597d], BANK[$09]
ENDC
IF !STRCMP("{GAMEVERSION}", "kuwagata")
SECTION "Load items into buffer for text", ROMX[$597c], BANK[$09]
ENDC
TextLoadItemIntoBuffer::
  ld b, $0d
  ld c, $09
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld de, cBUF06
  ld bc, $9
  call memcpy
  ret
IF !STRCMP("{GAMEVERSION}", "kabuto")
  padend $5998
ENDC
IF !STRCMP("{GAMEVERSION}", "kuwagata")
  padend $5997
ENDC