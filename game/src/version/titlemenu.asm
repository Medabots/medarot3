INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Title Menu State Machine 1", ROMX[TitleMenuStateMachine1], BANK[$03]
TitleMenuStateMachine::
 ld a, [W_CoreSubStateIndex]
 ld hl, .table
 rst $30
 jp hl

.table
  dw TitleMenuDrawScreenState
  dw TitleMenuMapScreenState
  dw TitleMenuPrepareCursorState
  dw TitleMenuPrepareFadeInState
  dw TitleMenuFadeInState
  dw TitleMenuStateMachine1 + $10F
  dw TitleMenuStateMachine1 + $18E
  dw TitleMenuFadeOutState
  dw TitleMenuExitState

TitleMenuDrawScreenState::
  call $342B
  call $3433
  call $3413
  call $343B
  call $3475
  ld bc, 2
  call WrapLoadMaliasGraphics
  ld bc, 3
  call WrapLoadMaliasGraphics
  ld bc, 4
  call WrapLoadMaliasGraphics
  ld bc, 5
  call WrapLoadMaliasGraphics
  ld a, [W_HasSaveData]
  push af
  ld hl, $C720
  ld bc, $80
  call memclr
  pop af
  ld [W_HasSaveData], a
  ld a, [W_HasSaveData]
  ld [W_HasSaveData], a ; WHY?!
  ld a, [$C6A0]
  ld [$C723], a
  ld [$C724], a
  ld a, [$C6A1]
  ld [$C725], a
  ld [$C726], a
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, 3
  call $33C6
  jp IncSubStateIndex

TitleMenuMapScreenState::
  ld bc, 0
  ld e, $16
  ld a, 1
  call WrapDecompressAttribmap0
  ld a, [W_HasSaveData]
  or a
  jr nz, .notNewGame

  ; Greys out the continue option.
  ld bc, $402
  ld e, $18
  ld a, 1
  call WrapDecompressAttribmap0

.notNewGame
  ld bc, 0
  ld e, $1B
  ld a, 1
  call WrapDecompressTilemap0
  xor a
  call TitleMenuStateMachine1 + $49B
  ld a, 1
  call TitleMenuStateMachine1 + $49B
  jp IncSubStateIndex

TitleMenuPrepareCursorState::
  ld a, 1
  ld [$C0A0], a
  ld a, 0
  ld [$C0A1], a
  ld a, $B4
  ld [$C0A2], a
  ld a, $17
  ld [$C0A3], a
  ld a, $20
  ld [$C0A4], a
  ld a, 6
  ld [$C0A5], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_HasSaveData]
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [W_TitleMenuSelectedOption], a
  call TitleMenuStateMachine1 + $3C2
  ld a, $36
  ld b, 0
  ld de, $C0A0
  call $33B2
  jp IncSubStateIndex

.table
  db 1, 0

TitleMenuPrepareFadeInState::
  ld hl, $28
  ld bc, $17
  ld d, $3F
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

TitleMenuFadeInState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

  padend TitleMenuStateMachine1 + $10f

SECTION "Title Menu State Machine 2", ROMX[TitleMenuStateMachine2], BANK[$03]
TitleMenuFadeOutState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

TitleMenuExitState::
  ld a, [W_TitleMenuSelectedOption]
  cp 0
  jr z, .continueGame
  cp 1
  jr z, .newGame

.continueGame
  xor a
  ld [$C63A], a
  ld [$C63B], a
  ld a, 8
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

.newGame
  ld hl, $C620
  ld bc, $100
  call memclr
  call TitleMenuStateMachine2 + $27A
  call $340B
  call $3531
  call $3539
  call $3541
  call TitleMenuStateMachine2 + $61
  call TitleMenuStateMachine2 + $14D
  ld a, $FF
  ld [$C63A], a
  ld a, $FF
  ld [$C638], a
  ld [$C63B], a
  ld a, 1
  ld [$C6A4], a
  ld a, 8
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

  padend TitleMenuStateMachine2 + $61
