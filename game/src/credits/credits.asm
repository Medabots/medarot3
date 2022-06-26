INCLUDE "game/src/common/constants.asm"


SECTION "Credits Variables 1", WRAM0[$C794]
W_CreditsCurrentLineNumber:: ds 1

SECTION "Credits Variables 2", WRAM0[$C4E8]
W_CreditsConfigAddressBuffer:: ds 2

W_CreditsLetterOrderingAddressBuffer EQU $C4E2

SECTION "Credits Helper Functions 1", ROMX[$43E8], BANK[$16]
CreditsAnimateSidebarPalette::
  ld a, [W_PaletteAnimRunning]
  or a
  jr z, .initiateAnimation
  call $34E6
  ret

.initiateAnimation
  ld a, [$C48D]
  inc a
  and 3
  ld [$C48D], a
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld h, 0
  ld l, a
  ld bc, $3D
  add hl, bc
  ld bc, 0
  ld d, 2
  ld e, 0
  ld a, $14
  call WrapSetupPalswapAnimation
  ret

.table
  db 0,1,0,2

CreditsRenderLineText::
  ld a, [W_CreditsCurrentLineNumber]
  ld hl, CreditsLetterOrderingConfigAddressTable
  rst $30
  ld a, h
  ld [W_CreditsLetterOrderingAddressBuffer], a
  ld a, l
  ld [W_CreditsLetterOrderingAddressBuffer + 1], a
  ld a, [W_CreditsCurrentLineNumber]
  ld hl, CreditsTextDrawingAddressTable
  rst $30
  xor a
  ld b, $10

.loop
  push af
  push bc
  push hl
  ld [$C4EE], a
  push hl
  ld a, [W_CreditsLetterOrderingAddressBuffer]
  ld h, a
  ld a, [W_CreditsLetterOrderingAddressBuffer + 1]
  ld l, a
  ld a, [$C4EE]
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  swap a
  ld d, 0
  ld e, a
  pop hl
  add hl, de
  call $44B5
  ld a, 1
  ld [W_OAM_SpritesReady], a
  pop hl
  pop bc
  pop af
  inc a
  dec b
  jr nz, .loop
  ret 

CreditsTextDrawingAddressTable::
  dw $8800
  dw $8900
  dw $8A00
  dw $8B00
  dw $8C00
  dw $8D00
  dw $8E00
  dw $8F00

CreditsLetterOrderingConfigAddressTable::
  dw $C270
  dw $C290
  dw $C2B0
  dw $C2D0
  dw $C2F0
  dw $C310
  dw $C330

CreditsClearTextDrawingRegion::
  xor a
  ld b, 7

.loop
  push bc
  push af
  call CreditsClearTextDrawingLine
  pop af
  inc a
  pop bc
  dec b
  jr nz, .loop
  ret

CreditsClearTextDrawingLine::
  ld hl, CreditsTextDrawingAddressTable
  rst $30
  ld bc, $100

.loop
  push bc
  xor a
  di
  push af
  rst $20
  pop af
  ldi [hl], a
  ei
  pop bc
  dec bc
  ld a, b
  or c
  jr nz, .loop
  ret

CreditsGetLetterOrdering::
  push af
  ld a, [W_CreditsLetterOrderingAddressBuffer]
  ld h, a
  ld a, [W_CreditsLetterOrderingAddressBuffer + 1]
  ld l, a
  pop af
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ret

SECTION "Credits Helper Functions 2", ROMX[$4AC1], BANK[$16]
CreditsGetConfigAddress::
  ld a, b
  ld hl, CreditsConfigAddressTable
  rst $30
  ld a, h
  ld [W_CreditsConfigAddressBuffer], a
  ld a, l
  ld [W_CreditsConfigAddressBuffer + 1], a
  ret

CreditsConfigAddressTable::
  dw $C720
  dw $C72C
  dw $C738
  dw $C744
  dw $C750
  dw $C75C
  dw $C768
  dw $C774
