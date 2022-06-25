INCLUDE "game/src/common/constants.asm"

SECTION "Credits State Machine 1", ROMX[$4205], BANK[$16]
CreditsStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw CreditsDrawingState ;00
  dw CreditsProcessPlayerNameState ;01
  dw CreditsMappingState ;02
  dw CreditsDoNothingState ;03
  dw CreditsPrepareFadeInState ;04
  dw CreditsFadeInState ;05
  dw CreditsWaitAndChangeMusicState ;06
  dw CreditsWaitState ;07
  dw CreditsPlayState ;08
  dw CreditsWaitAndPrepareFadeOutState ;09
  dw CreditsFadeOutState ;0A
  dw CreditsDoNothingAgainState ;0B
  dw CreditsMapFinState ;0C
  dw CreditsPrepareFadeIntoFinState ;0D
  dw CreditsFadeIntoFinState ;0E
  dw CreditsWaitAndPrepareFadeOutFromFinState ;0F
  dw CreditsFadeOutFromFinState ;10
  dw CreditsExitState ;11

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
  call memcpytovram
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

CreditsWaitAndChangeMusicState::
  call CreditsAnimateSidebarPalette
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld a, 5
  call $27BA
  ld a, $60
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

CreditsWaitState::
  call CreditsAnimateSidebarPalette
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  jp IncSubStateIndex

CreditsPlayState::
  xor a
  ld b, 7

.loop
  push bc
  push af
  ld b, a
  push bc
  push bc
  call $4AC1
  pop bc
  call $47EA
  pop bc
  cp 2
  jr z, .nextState
  cp 1
  call z, $45E3
  ld a, 1
  ld [W_OAM_SpritesReady], a
  pop af
  inc a
  pop bc
  dec b
  jr nz, .loop
  call CreditsAnimateSidebarPalette
  ret

.nextState
  call CreditsAnimateSidebarPalette
  pop af
  pop bc
  ld a, $C0
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

CreditsWaitAndPrepareFadeOutState::
  call CreditsAnimateSidebarPalette
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, $14
  call WrapSetupPalswapAnimation
  ld a, $20
  ld [$CF96], a
  jp IncSubStateIndex

CreditsFadeOutState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

CreditsDoNothingAgainState::
  jp IncSubStateIndex

CreditsMapFinState::
  ld bc, 0
  ld e, $8E
  ld a, 2
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $B8
  ld a, 1
  call WrapDecompressTilemap0
  jp IncSubStateIndex

CreditsPrepareFadeIntoFinState::
  ld hl, $3C
  ld bc, $56
  ld d, $FF
  ld e, $FF
  ld a, $10
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

CreditsFadeIntoFinState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, $FF
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

CreditsWaitAndPrepareFadeOutFromFinState::
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, $10
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

CreditsFadeOutFromFinState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, $10
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

CreditsExitState::
  jp $36A3
