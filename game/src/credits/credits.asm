INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

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
  call CreditsFetchAndRenderCharacter
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

CreditsFetchAndRenderCharacter::
  ld a, h
  ld [$C4E0], a
  ld a, l
  ld [$C4E1], a
  ld a, [$C4EE]
  call CreditsGetLetterOrdering
  ld b, 0
  ld c, a
  push bc
  credittext M_CreditTextConfigText
  pop bc
  add hl, bc
  ld a, [hl]
  cp $FF
  ret z
  ld [$C4EF], a
  call CreditsCharacterRenderingTimingThing
  or a
  ret nz
  call CreditsGetCharacterAddressOffset
  or a
  jr z, .notEmptySpace
  ld hl, 0

.notEmptySpace
  push af
  ld a, [$C4E0]
  ld b, a
  ld a, [$C4E1]
  ld c, a
  pop af
  call $3774
  ret

CreditsCharacterRenderingTimingThing::
  ld a, [$C4EE]
  add a
  ld c, a
  ld hl, CreditsCharacterRenderingTimingTable
  ld d, 0
  ld e, a
  add hl, de
  ld b, [hl]
  push bc
  push hl
  creditconf M_CreditConfigTimer
  ld a, [hl]
  pop hl
  pop bc
  cp b
  jr nc, .doNotProceed
  inc hl
  ld b, [hl]
  cp b
  jr c, .doNotProceed
  sub c
  jr c, .doNotProceed
  ld c, a
  xor a
  ret

.doNotProceed
  ld a, 1
  ret

CreditsCharacterRenderingTimingTable::
  db $0A, $00
  db $0C, $02
  db $0E, $04
  db $10, $06
  db $12, $08
  db $14, $0A
  db $16, $0C
  db $18, $0E
  db $1A, $10
  db $1C, $12
  db $1E, $14
  db $20, $16
  db $22, $18
  db $24, $1A
  db $26, $1C
  db $28, $1E

CreditsGetCharacterAddressOffset::
  push bc
  creditconf M_CreditConfigDirection
  ld a, [hl]
  pop bc
  or a
  jr nz, .reverseDirection
  ld a, c
  cp 0
  jr z, .emptySpace
  cp 1
  jr z, .emptySpace
  ld a, c
  sub 2
  ld c, a
  jr .getAnimationStage

.reverseDirection
  ld a, c
  cp 8
  jr z, .emptySpace
  cp 9
  jr z, .emptySpace
  jr .getAnimationStage

.emptySpace
  ld a, 1
  jr .exit

.getAnimationStage
  push bc
  creditconf M_CreditConfigDirection
  ld a, [hl]
  pop bc
  ld hl, CreditsAnimationStageTable
  add a
  add a
  add a
  add c
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  push af
  ld a, [$C4EF]
  ld d, 0
  ld e, a
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  pop af
  swap a
  ld h, 0
  ld l, a
  add hl, de
  xor a

.exit
  ret

CreditsAnimationStageTable::
  db 3,3,2,2,1,1,0,0
  db 0,0,1,1,2,2,3,3

CreditsUnderlineGfx::
  db $00,$00
  db $00,$00
  db $00,$00
  db $00,$00
  db $00,$00
  db $00,$00
  db $00,$00
  db $FF,$FF

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

PositionCreditLineSprite::
  add a
  ld hl, CreditSpriteConfigAddressTable
  rst $30
  ld d, h
  ld e, l
  push de
  push de
  ld a, 0
  call CreditConfigureUnderlineSprite
  credittext M_CreditTextConfigXPos
  ld a, [hl]
  ld c, a
  add a
  add a
  add a
  ld b, $A0
  add b
  pop de
  ld hl, 3
  add hl, de
  ld [hl], a
  pop de
  ld a, $10
  ld hl, $13
  add hl, de
  ld [hl], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

SECTION "Credits Helper Functions 4", ROMX[$4B79], BANK[$16]
CreditSpriteConfigAddressTable::
  dw $C0A0
  dw $C0C0
  dw $C0E0
  dw $C100
  dw $C120
  dw $C140
  dw $C160
  dw $C180
  dw $C1A0
  dw $C1C0
  dw $C1E0
  dw $C200
  dw $C220
  dw $C240

CreditGetTextXPos::
  credittext M_CreditTextConfigXPos
  ld a, [hl]
  ret

CreditGetTextVariable2Value::
  credittext 2
  ld a, [hl]
  ret

CreditConfigureUnderlineSprite::
  push de
  push de
  ld [de], a
  ld a, $11
  ld hl, 1
  add hl, de
  ld [hl], a
  ld a, $F4
  ld hl, 2
  add hl, de
  ld [hl], a
  credittext M_CreditTextConfigYPos
  ld a, [hl]
  add a
  add a
  add a
  pop de
  ld hl, 4
  add hl, de
  ld [hl], a
  credittext M_CreditTextConfigPalette
  ld a, [hl]
  ld hl, 5
  pop de
  add hl, de
  ld [hl], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret
