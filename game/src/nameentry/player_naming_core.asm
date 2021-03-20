INCLUDE "game/src/common/constants.asm"

SECTION "Player Name", WRAM0[$C656]
W_PlayerName:: ds 1

SECTION "Player Naming Screen State Machine", ROMX[$541A], BANK[$01]
PlayerNamingScreenStateMachine::
  xor a
  ld [W_NamingScreenExitIndicator], a
  ld hl, .table
  ld a, [W_NamingScreenSubSubStateIndex]
  rst $30
  jp hl

.table
  dw PlayerNamingScreenPrepareFadeOutState
  dw PlayerNamingScreenFadeOutState
  dw PlayerNamingScreenInitState
  dw PlayerNamingScreenDrawScreenState
  dw PlayerNamingScreenMapScreenAndPrepareSpritesState
  dw PlayerNamingScreenPrepareFadeInState
  dw PlayerNamingScreenFadeInState
  dw PlayerNamingScreenTextEntryState
  dw PlayerNamingScreenPrepareFadeOutState
  dw PlayerNamingScreenFadeOutState
  dw PlayerNamingScreenCopyNameState
  dw PlayerNamingScreenExitState
  dw PlayerNamingScreenPlaceholderState

PlayerNamingScreenInitState::
  ld a, 5
  rst 8
  ld hl, $C0A0
  ld de, $DA18
  ld bc, $3C0
  call memcpy
  call $342B
  call $3433
  call $3413
  call $343B
  call $3475
  ld hl, W_HasSaveData
  ld bc, $0080
  call memclr
  ld hl, W_NamingScreenEnteredTextBuffer
  ld a, $02 ; 'イ'
  ld [hli], a
  ld a, $34 ; 'ッ'
  ld [hli], a
  ld a, $07 ; 'キ'
  ld [hli], a
  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld a, 3 ; Initial Name Length
  ld [W_NamingScreenEnteredTextLength], a
  xor a
  ld [$C761], a
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenFadeOutState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenDrawScreenState::
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $50
  call WrapLoadMaliasGraphics
  ld a, 0
  ld e, a
  ld hl, $8000
  ld bc, $C
  ld a, 0
  call $352C
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld a, 0
  ld e, a
  ld hl, $8000
  ld bc, $C
  ld a, 1
  call $352C
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld bc, $50
  call $33C6
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenMapScreenAndPrepareSpritesState::
  ld bc, 4
  ld e, $20
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $21
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 4
  ld e, $1E
  ld a, 1
  call WrapDecompressTilemap0
  ld a, [$C48C]
  ld bc, $205
  ld e, $1F
  add e
  ld e, a
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $21
  ld a, 1
  call WrapDecompressTilemap0
  call $51AD
  call $519F
  ld a, $02 ; 'イ'
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $34 ; 'ッ'
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $07 ; 'キ'
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  ld [$C1E0], a
  ld a, $11
  ld [$C1E1], a
  ld a, $80
  ld [$C1E2], a
  ld a, $70 ; Text cursor position: (textlength*8)+$50
  ld [$C1E3], a
  ld a, 8
  ld [$C1E4], a
  ld a, $80
  ld b, 0
  ld de, $C1E0
  call $33B2
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C200], a
  ld a, 0
  ld [$C201], a
  ld a, 1
  ld [$C202], a
  ld a, $40
  ld [$C203], a
  ld a, $1C
  ld [$C204], a
  ld a, 0
  call $34B7
  ld [$C205], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld b, 0
  ld de, $C200
  call $33B2
  ld a, 1
  ld [$C220], a
  ld a, $11
  ld [$C221], a
  ld a, $83
  ld [$C222], a
  ld a, $10
  ld [$C223], a
  ld a, $28
  ld [$C224], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $82
  ld b, 0
  ld de, $C220
  call $33B2
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenPrepareFadeInState::
  ld hl, $50
  ld bc, $50
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenFadeInState::
  ld de, $C1E0
  call $33B7
  ld de, $C200
  call $33B7
  ld de, $C220
  call $33B7
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  xor a
  ld [W_NamingScreenSubSubSubStateIndex], a
  ld [W_MainScriptExitMode], a
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenTextEntryState::
  ld a, [W_MainScriptExitMode]
  or a
  jr z, .textEntryActive

.terminateText
  ld a, [W_NamingScreenEnteredTextLength]
  ld hl, W_NamingScreenEnteredTextBuffer
  ld b, 0
  ld c, a
  add hl, bc
  ld [hl], $CB
  jp IncNamingScreenSubSubStateIndex

.textEntryActive
  call $48F7
  ret

PlayerNamingScreenCopyNameState::
  ld hl, W_NamingScreenEnteredTextBuffer
  ld de, W_PlayerName
  ld bc, 9
  call memcpy
  ld hl, W_NamingScreenEnteredTextBuffer
  ld de, $C665
  ld bc, 9
  call memcpy
  jp IncNamingScreenSubSubStateIndex

PlayerNamingScreenExitState::
  ld a, 1
  ld [W_NamingScreenExitIndicator], a
  xor a
  ld [W_NamingScreenSubSubStateIndex], a
  ret

PlayerNamingScreenPlaceholderState::
  ret
