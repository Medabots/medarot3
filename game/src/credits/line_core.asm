INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Credit Line State Machines 1", ROMX[$4800], BANK[$16]
CreditLineNewAnimationStateMachine::
  ld a, [W_CreditsCurrentLineStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw CreditLineNewAnimationInitState
  dw CreditLineNewAnimationLineInShowState
  dw CreditLineNewAnimationTextInState
  dw CreditLineNewAnimationLineInHideState
  dw CreditLineNewAnimationWaitForSyncState
  dw CreditLineNewAnimationWaitState
  dw CreditLineNewAnimationLineOutShowState
  dw CreditLineNewAnimationTextOutState
  dw CreditLineNewAnimationLineOutHideState
  dw CreditLineNewAnimationWaitForSyncState

CreditLineNewAnimationInitState::
  ld a, [W_CreditsCurrentLineProgress]
  or a
  jr z, .immediate
  dec a
  ld [W_CreditsCurrentLineProgress], a
  ret nz

.immediate
  ld a, [W_CreditsCurrentLineAnimateInOut]
  and $F0
  jr nz, .doAnimateIn
  ld a, 4
  ld [W_CreditsCurrentLineStateIndex], a
  ret

.doAnimateIn
  ld a, [W_CreditsCurrentLineTextOffset]
  ld b, a
  ld a, 8
  sub b
  dec a
  and 7
  add $30
  ld [W_CreditsCurrentLineMidTileDestination], a
  ld a, b
  srl a
  srl a
  srl a
  ld b, a
  
  ld hl, CreditOffsetLineMappingLowAddressTable
  ld a, [W_CreditsOffsetMode]
  or a
  jr nz, .isOffset
  ld l, CreditLineMappingLowAddressTable & $FF

.isOffset
  ld a, [W_CreditsCurrentLineNumber]
  add l
  ld l, a
  ld a, [hl]
  add b
  ld [W_CreditsCurrentLineDestination], a
  sub b
  add $10
  ld [W_CreditsCurrentLineProgress], a
  
  ; Continues into CreditLineNewAnimationIncStateIndex.

CreditLineNewAnimationIncStateIndex::
  ld hl, W_CreditsCurrentLineStateIndex
  inc [hl]
  ; Continues into CreditLineNewAnimationWaitForSyncState.

CreditLineNewAnimationWaitForSyncState::
  ret

CreditLineNewAnimationLineInShowState::
  call CreditLineAnimationCommon
  jr z, .lastTile
  ld a, b
  cp $2F
  jr z, .midTile
  ld b, $37
  ld a, l
  dec a
  ld [W_CreditsCurrentLineProgress], a
  jp CreditLineAnimationMapTile

.midTile
  ld b, $33
  
.mapTile
  di

.wfbB
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbB

  ld [hl], b
  ei
  ret

.lastTile
  cp $34
  jr nc, .lastBit
  
  ld a, b
  cp $2F
  jr nz, .lastBit
  jr .midTile

.lastBit
  ld a, [W_CreditsCurrentLineMidTileDestination]
  ld b, a
  call CreditLineAnimationMapTile
  jp CreditLineNewAnimationIncStateIndex

CreditLineNewAnimationLineInHideState::
  call CreditLineAnimationCommon
  jr z, .lastTile
  ld a, b
  cp $37
  jr z, .midTile
  ld b, $2F
  ld a, l
  dec a
  ld [W_CreditsCurrentLineProgress], a
  jp CreditLineAnimationMapTile

.midTile
  ld b, $3B
  jp CreditLineAnimationMapTile

.lastTile
  ld b, $2F
  call CreditLineAnimationMapTile
  jp CreditLineNewAnimationIncStateIndex

CreditLineNewAnimationLineOutShowState::
  ; We are reusing W_CreditsCurrentLineTextProgress to track the last tile.
  ld a, [W_CreditsCurrentLineTextProgress]
  inc a
  ld c, a
  call CreditLineAnimationCommon
  jr z, .firstTile

  ld a, l
  cp c
  jr z, .lastTile

  ld a, b
  ld b, $37
  cp $2F
  jr nz, .nextTile

  ld b, $3B
  jp CreditLineAnimationMapTile

.nextTile
  ld a, l
  inc a
  ld [W_CreditsCurrentLineProgress], a
  jp CreditLineAnimationMapTile

.firstTile
  ld a, [W_CreditsCurrentLineMidTileDestination]
  ld b, a
  jr .nextTile

.lastTile
  ld a, [W_CreditsCurrentLineTextLength]
  add 4
  add a
  ld [W_CreditsCurrentLineTextProgress], a
  jp CreditLineNewAnimationIncStateIndex

CreditLineNewAnimationLineOutHideState::
  ; We are reusing W_CreditsCurrentLineTextProgress to track the last tile.
  ld a, [W_CreditsCurrentLineTextProgress]
  inc a
  ld c, a
  call CreditLineAnimationCommon
  jr z, .clearTile

  ld a, l
  cp c
  jr z, .lastTile

  ld a, b
  cp $37
  jr nz, .clearTile

  ld b, $33
  jp CreditLineAnimationMapTile

.clearTile
  ld b, $2F

.nextTile
  ld a, l
  inc a
  ld [W_CreditsCurrentLineProgress], a
  jp CreditLineAnimationMapTile

.lastTile
  jp CreditLineNewAnimationIncStateIndex

CreditLineNewAnimationTextInState::
  ld a, [W_CreditsCurrentLineTextProgress]
  and 1
  ld b, a
  ld a, [W_CreditsCurrentLineNumber]
  and 1
  cp b
  jr nz, .nextFrame

  call CreditLineDrawTextInBuffer
  call CreditLineCopyTextFromBuffer

.nextFrame
  ld a, [W_CreditsCurrentLineTextLength]
  add 4
  add a
  ld b, a
  ld a, [W_CreditsCurrentLineTextProgress]
  cp b
  jr z, .lastFrame
  inc a
  ld [W_CreditsCurrentLineTextProgress], a
  ret

.lastFrame
  
  jp CreditLineNewAnimationInitState.doAnimateIn

CreditLineNewAnimationTextOutState::
  ld a, [W_CreditsCurrentLineTextProgress]
  and 1
  ld b, a
  ld a, [W_CreditsCurrentLineNumber]
  and 1
  cp b
  jr nz, .nextFrame

  call CreditLineDrawTextInBuffer
  call CreditLineCopyTextFromBuffer

.nextFrame
  ld a, [W_CreditsCurrentLineTextProgress]
  or a
  jr z, .lastFrame
  dec a
  ld [W_CreditsCurrentLineTextProgress], a
  ret

.lastFrame
  jp CreditLineNewAnimationWaitState.doAnimateOut

CreditLineNewAnimationWaitState::
  ld a, [W_CreditsCurrentLineProgress]
  or a
  jr z, .immediate
  dec a
  ld [W_CreditsCurrentLineProgress], a
  ret nz

.immediate
  ld a, [W_CreditsCurrentLineAnimateInOut]
  and $F
  jr nz, .doAnimateOut
  ld a, 9
  ld [W_CreditsCurrentLineStateIndex], a
  ret

.doAnimateOut
  call CreditLineNewAnimationInitState.doAnimateIn
  ld a, [W_CreditsCurrentLineProgress]
  ld [W_CreditsCurrentLineTextProgress], a
  ld a, [W_CreditsCurrentLineDestination]
  ld [W_CreditsCurrentLineProgress], a
  ret
  padend $4A00
