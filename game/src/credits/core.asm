INCLUDE "game/src/common/constants.asm"

SECTION "Credits State Machine 1", ROMX[$4205], BANK[$16]
CreditsStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw CreditsDrawingState
  dw CreditsProcessPlayerNameState
  dw CreditsMappingState
  dw CreditsDoNothingState
  dw CreditsPrepareFadeInState
  dw CreditsFadeInState
  dw $42ED
  dw $4305
  dw $4313
  dw $4348
  dw $436A
  dw $4375
  dw $4378
  dw $438F
  dw $43A1
  dw $43B1
  dw $43CB
  dw $43E5

CreditsDrawingState::
  call $342B
  call $3433
  call $3413
  call $343B
  call $3475
  ld hl, W_HasSaveData
  ld bc, $80
  call memclr
  ld bc, $16E
  call WrapLoadMaliasGraphics
  ld bc, $16F
  call WrapLoadMaliasGraphics
  ld bc, $36
  call $33C6
  ld hl, $45D3
  ld de, $92F0
  ld bc, $10
  call $04F9
  call $4480
  xor a
  ld b, 7

.loop
  push bc
  push af
  push af
  ld b, a
  call $4AC1
  ld de, 0
  ld a, [$C4E8]
  ld h, a
  ld a, [$C4E9]
  ld l, a
  add hl, de
  ld a, 1
  ld [hl], a
  pop af
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  push af
  ld de, 2
  ld a, [$C4E8]
  ld h, a
  ld a, [$C4E9]
  ld l, a
  add hl, de
  pop af
  ld [hl], a
  pop af
  inc a
  pop bc
  dec b
  jr nz, .loop
  jp IncSubStateIndex

.table
  db $10,$20,$30,$40,$50,$60,$70

CreditsProcessPlayerNameState::
  call $4ECA
  jp IncSubStateIndex

CreditsMappingState::
  ld bc, 0
  ld e, $87
  ld a, 2
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $AE
  ld a, 1
  call WrapDecompressTilemap0
  jp IncSubStateIndex

CreditsDoNothingState::
  jp IncSubStateIndex

CreditsPrepareFadeInState::
  ld hl, $3C
  ld bc, $56
  ld d, $FF
  ld e, $FF
  ld a, $12
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

CreditsFadeInState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, $80
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex
