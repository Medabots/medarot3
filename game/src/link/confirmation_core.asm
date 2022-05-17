INCLUDE "game/src/common/constants.asm"

SECTION "Link Confirmation State Machine 1", ROMX[$5459], BANK[$11]
LinkConfirmationStateMachine::
  xor a
  ld [W_TotalItemPages], a
  ld a, [W_CurrentItemPage]
  ld hl, .table
  rst $30
  jp hl

.table
  dw LinkConfirmationClearSpritesForYNBoxState
  dw LinkConfirmationRefreshSpritesState
  dw LinkConfirmationPreserveOverworldTilesState
  dw LinkConfirmationMapYNBoxState
  dw LinkConfirmationYNBoxMapCursorState
  dw LinkConfirmationInputHandlerState
  dw LinkConfirmationWaitAndRemoveYNBoxState
  dw LinkConfirmationPreExitState
  dw LinkConfirmationExitState

LinkConfirmationClearSpritesForYNBoxState::
  ld a, 2
  ld [$C498], a
  ld b, $48
  ld c, $68
  ld d, $70
  ld e, $98
  call $3465
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationRefreshSpritesState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationPreserveOverworldTilesState::
  ld a, $E
  ld [$C4EE], a
  ld a, 6
  ld [$C4EF], a
  ld a, 8
  ld [$C4F0], a
  ld a, 5
  ld [$C4F1], a
  ld a, 1
  call $1153
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationMapYNBoxState::
  ld bc, $E08
  ld e, $B
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, $E08
  ld e, $B
  ld a, 0
  call WrapDecompressAttribmap0ScrollAdjusted
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationYNBoxMapCursorState::
  ld a, 0
  ld [W_CurrentPageItemSelectionIndex], a
  call LinkConfirmationMapYNBoxCursor
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationInputHandlerState::
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputStart
  jr z, .neitherANorStartPressed
  ld a, 3
  call ScheduleSoundEffect
  call LinkConfirmationMapYNBoxCursorAsSelected
  ld a, $1E
  ld [W_MedalMenuWaitTimer], a
  jp LinkConfirmationIncSubSubStateIndex

.neitherANorStartPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jr z, .bNotPressed
  ld a, 4
  call ScheduleSoundEffect
  ld a, 1
  ld [W_CurrentPageItemSelectionIndex], a
  call LinkConfirmationMapYNBoxCursorAsBlank
  call LinkConfirmationMapYNBoxCursorAsSelected
  ld a, $F
  ld [W_MedalMenuWaitTimer], a
  jp LinkConfirmationIncSubSubStateIndex

.bNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputUp | M_JPInputDown
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_CurrentPageItemSelectionIndex]
  xor 1
  ld [W_CurrentPageItemSelectionIndex], a
  call LinkConfirmationMapYNBoxCursorAsBlank
  jp LinkConfirmationMapYNBoxCursor

LinkConfirmationWaitAndRemoveYNBoxState::
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld a, $E
  ld [$C4EE], a
  ld a, 6
  ld [$C4EF], a
  ld a, 8
  ld [$C4F0], a
  ld a, 5
  ld [$C4F1], a
  ld a, 1
  call $123B
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationPreExitState::
  call $346D
  ld a, 1
  ld [$C498], a
  jp LinkConfirmationIncSubSubStateIndex

LinkConfirmationExitState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [W_TotalItemPages], a
  xor a
  ld [W_CurrentItemPage], a
  ret
