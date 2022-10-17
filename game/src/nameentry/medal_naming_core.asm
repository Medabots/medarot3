INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

W_NamingScreenSubSubSubStateIndex EQU $C760

SECTION "Medal Naming Screen State Machine 1", ROMX[$562F], BANK[$01]
MedalNamingScreenStateMachine::
  xor a
  ld [W_NamingScreenExitIndicator], a
  ld hl, .table
  ld a, [W_NamingScreenSubSubStateIndex]
  rst $30
  jp hl

.table
  dw PlayerNamingScreenPrepareFadeOutState
  dw PlayerNamingScreenFadeOutState
  dw MedalNamingScreenInitState
  dw MedalNamingScreenDrawScreenState
  dw MedalNamingScreenMapScreenAndPrepareSpritesState
  dw PlayerNamingScreenPrepareFadeInState
  dw MedalNamingScreenFadeInState
  dw PlayerNamingScreenTextEntryState
  dw PlayerNamingScreenPrepareFadeOutState
  dw PlayerNamingScreenFadeOutState
  dw MedalNamingScreenCopyNameState
  dw PlayerNamingScreenExitState
  dw PlayerNamingScreenPlaceholderState

SECTION "Medal Naming Screen State Machine 2", ROMX[$568C], BANK[$01]
MedalNamingScreenInitState:
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
  ld a, [$C762]
  push af
  ld hl, $C720
  ld bc, $80
  call memclr
  pop af
  ld [$C762], a
  ld a, 1
  ld [$C761], a
  call GetDefaultMedalNameAddress
  ld de, W_NamingScreenEnteredTextBuffer
  ld bc, 8
  call memcpy
  ld a, [hli]
  ld [W_NamingScreenEnteredTextLength], a
  ld a, [hl]
  ld [$C1E3], a
  jp IncNamingScreenSubSubStateIndex

MedalNamingScreenDrawScreenState::
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $50
  call WrapLoadMaliasGraphics
  ld a, [$C762]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $C
  ld hl, $8C80
  call $34E1
  ld bc, $50
  call $33C6
  jp IncNamingScreenSubSubStateIndex

MedalNamingScreenMapScreenAndPrepareSpritesState::
  ld bc, 4
  ld e, $20
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $22
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
  ld e, $22
  ld a, 1
  call WrapDecompressTilemap0
  call $51AD
  ld a, [$C762]
  ld [W_ListItemIndexForBuffering], a
  ld b, $B
  ld c, 6
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $9843
  ld bc, W_NewListItemBufferArea
  ld a, 5
  ld h, $AC
  call VWFDrawStringLeftFullAddress
  call $519F
  push hl
  call GetDefaultMedalNameAddress
  pop de
  ld bc, 8
  call memcpytovram
  ld a, 1
  ld [$C1E0], a
  ld a, $11
  ld [$C1E1], a
  ld a, $80
  ld [$C1E2], a
  ld a, 8
  ld [$C1E4], a
  ld a, $80
  ld b, 0
  ld de, $C1E0
  call $33B2
  ld a, 1
  ld [W_OAM_SpritesReady], a
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

MedalNamingScreenFadeInState::
  ld de, $C1E0
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

MedalNamingScreenCopyNameState::
  ld a, [$C762]
  call $3555
  ld hl, $30
  add hl, de
  push hl
  pop de
  ld hl, W_NamingScreenEnteredTextBuffer
  ld bc, 9
  call memcpy
  ld a, [$C762]
  cp 0
  jr z, .jpA
  cp 1
  jr z, .jpA
  jp IncNamingScreenSubSubStateIndex

.jpA
  ld hl, W_NamingScreenEnteredTextBuffer
  ld de, $C6E3
  ld bc, 9
  call memcpy
  jp IncNamingScreenSubSubStateIndex

GetDefaultMedalNameAddress::
  ld a, [$C762]
  cp 0
  jr z, .withinBoundaries
  cp 1
  jr z, .withinBoundaries
  ld a, 2

.withinBoundaries
  ld hl, .table
  rst $30
  ret

.table
  dw DefaultMedalNameA, DefaultMedalNameB, DefaultMedalNameC

; Format below is 8 bytes of zero-padded text, one byte for text length, and another for cursor position, or (length*8)+$50.

DefaultMedalNameA::
  db "R", "o", "k", "u", "s", "h", "o", $00
  db 7
  db $88

DefaultMedalNameB::
  db "M", "e", "t", "a", "b", "e", "e", $00
  db 7
  db $88

DefaultMedalNameC::
  db $00, $00, $00, $00, $00, $00, $00, $00
  db 0
  db $50
  padend $5838