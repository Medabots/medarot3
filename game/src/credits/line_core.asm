INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Credit Line State Machines 1", ROMX[$45E3], BANK[$16]
; CreditLineActionStateMachine and CreditLineAnimationStateMachine are linked. The latter sets the former's state indices and the former sets the latter's state indices.
; For all intents and purposes CreditLineActionStateMachine and CreditLineAnimationStateMachine together represent two parts of a single state machine. It's weird.

CreditLineActionStateMachine::
  ld a, b
  creditconf M_CreditConfigActIndex
  ld a, [hl]
  ld hl, .stateIndexReorderingTable
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld hl, .table
  rst $30
  jp hl

.table
  dw CreditLineActionPlaceholderState
  dw CreditLineActionPageBeginState
  dw CreditLineActionTriggerLineInState
  dw CreditLineActionTriggerLineOutState
  dw CreditLineActionTriggerTextInState
  dw CreditLineActionTriggerTextOutState
  dw CreditLineActionTriggerWaitState

; This is incredibly silly.
.stateIndexReorderingTable
  db 1,2,4,6,5,3

CreditLineActionPlaceholderState::
  ret

CreditLineActionPageBeginState::
  ld c, 0
  ld a, [W_CreditsCurrentLineNumber]
  call $4C15
  creditconf M_CreditConfigPageNum
  ld a, [hl]
  cp $1F
  jr z, .endAnimation
  creditconfset M_CreditConfigAniIndex, 1
  ret

.endAnimation
  creditconfset M_CreditConfigAniIndex, 0
  ret

CreditLineActionTriggerLineInState::
  creditconfreset M_CreditConfigTimer
  creditconfset M_CreditConfigAniIndex, 2
  creditconftextcheck
  ret z
  creditconf 6
  ld a, [hl]
  cp 0
  ret z
  ld a, [W_CreditsCurrentLineNumber]
  push af
  call PositionCreditLineSprite
  pop af
  call $4B1E
  credittext M_CreditTextConfigYPos
  ld c, [hl]
  push bc
  credittext M_CreditTextConfigPalette
  ld a, [hl]
  sub 2
  ld e, $88
  add e
  ld e, a
  pop bc
  ld b, 3
  ld a, 2
  call WrapDecompressAttribmap0
  ret

CreditLineActionTriggerLineOutState::
  creditconfreset M_CreditConfigTimer
  creditconfset M_CreditConfigAniIndex, 3
  ret

CreditLineActionTriggerTextInState::
  creditconfreset M_CreditConfigTimer
  creditconfset M_CreditConfigAniIndex, 4
  creditconfset M_CreditConfigDirection, 0
  creditconftextcheck
  ret z
  creditconf 6
  ld a, [hl]
  cp 0
  ret z
  call $4E4E
  call $4E84
  credittext M_CreditTextConfigXPos
  ld a, [hl]
  add 3
  ld b, a
  push bc
  credittext M_CreditTextConfigYPos
  pop bc
  ld c, [hl]
  call $4DFF
  ret

CreditLineActionTriggerTextOutState::
  creditconfreset M_CreditConfigTimer
  creditconfset M_CreditConfigAniIndex, 5
  creditconfset M_CreditConfigDirection, 1
  creditconftextcheck
  ret z
  call $4E84
  ld c, 1
  ld a, [W_CreditsCurrentLineNumber]
  add a
  add 1
  ld hl, CreditSpriteConfigAddressTable
  rst $30
  ld a, c
  ld [hl], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

CreditLineActionTriggerWaitState::
  call $50CF
  creditconfsetfroma M_CreditConfigTimer
  creditconfset M_CreditConfigAniIndex, 6
  ret

CreditLineAnimationStateMachine::
  ld a, b
  ld [W_CreditsCurrentLineNumber], a
  creditconf M_CreditConfigAniIndex
  ld a, [hl]
  ld hl, .table
  rst $30
  jp hl

.table
  dw CreditLineAnimationPlaceholderState
  dw CreditLineAnimationSetupConfigState
  dw CreditLineAnimationLineInState
  dw CreditLineAnimationLineOutState
  dw CreditLineAnimationTextInState
  dw CreditLineAnimationTextOutState
  dw CreditLineAnimationWaitState

CreditLineAnimationPlaceholderState::
  ret

CreditLineAnimationSetupConfigState::
  creditconf M_CreditConfigTimer
  ld a, [hl]
  or a
  jr z, .continue
  dec a
  ld [hl], a
  jp nz, CreditLineAnimationNoActionExit

.continue
  ld a, [W_CreditsCurrentLineNumber]
  ld hl, PtrCreditsLineInstructions
  rst $30
  push hl
  creditconf M_CreditConfigPageNum
  ld a, [hl]
  pop hl
  ld d, 0
  ld e, a
  sla e
  rl d
  sla e
  rl d
  add hl, de
  ld a, [hl]
  push hl
  creditconfsetfroma M_CreditConfigTextIndex
  pop hl
  inc hl
  ld a, [hl]
  push hl
  creditconfsetfroma 6
  pop hl
  inc hl
  ld a, [hl]
  creditconfsetfroma 7
  jp CreditLineAnimationIncStateIndex

CreditLineAnimationLineInState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  creditconftextcheck
  jr z, .skipLine
  creditconf 6
  ld a, [hl]
  cp 0
  jr z, .skipLine
  ld a, [W_CreditsCurrentLineNumber]
  call $4C2D
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4C7F

.skipLine
  creditconfinc M_CreditConfigTimer
  cp $22
  jp nz, .continue
  jp CreditLineAnimationIncStateIndex

.continue
  jp CreditLineAnimationNoActionExit

CreditLineAnimationLineOutState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  creditconftextcheck
  jr z, .skipLine
  creditconf 7
  ld a, [hl]
  cp 0
  jr z, .skipLine
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4CF2
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4D62
  ld a, 1
  ld [W_OAM_SpritesReady], a

.skipLine
  creditconfinc M_CreditConfigTimer
  cp $22
  jp nz, .continue
  ld c, 0
  ld a, [W_CreditsCurrentLineNumber]
  call $4C15
  creditconfinc M_CreditConfigPageNum
  creditconfreset M_CreditConfigActIndex
  creditconfreset M_CreditConfigTimer
  creditconf M_CreditConfigPageNum
  ld a, [hl]
  cp $1F
  jr nz, .notLastPage
  ld a, [W_CreditsCurrentLineNumber]
  cp 6
  jr nz, .notLastPage
  jp CreditLineAnimationLastPageExit

.notLastPage
  jp CreditLineAnimationActionExit

.continue
  jp CreditLineAnimationNoActionExit

CreditLineAnimationTextInState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  creditconftextcheck
  jr z, .nextFrame
  creditconf 6
  ld a, [hl]
  cp 0
  jr z, .nextFrame
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call CreditsRenderLineText
  ld a, 1
  ld [W_OAM_SpritesReady], a
  creditconftextcheck
  jr z, .nextFrame
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4C2D
  ld a, $01
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4C7F
  ld a, 1
  ld [W_OAM_SpritesReady], a

.nextFrame
  creditconfinc M_CreditConfigTimer
  creditconf M_CreditConfigTimer
  ld a, [hl]
  cp $28
  jp nz, CreditLineAnimationNoActionExit
  jp CreditLineAnimationIncStateIndex

CreditLineAnimationTextOutState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  creditconftextcheck
  jr z, .nextFrame
  creditconf 7
  ld a, [hl]
  cp 0
  jr z, .nextFrame
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call CreditsRenderLineText
  ld a, 1
  ld [W_OAM_SpritesReady], a
  creditconftextcheck
  jr z, .nextFrame
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4CF2
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_CreditsCurrentLineNumber]
  call $4D62
  ld a, 1
  ld [W_OAM_SpritesReady], a

.nextFrame
  creditconfinc M_CreditConfigTimer
  creditconf M_CreditConfigTimer
  ld a, [hl]
  cp $28
  jp nz, CreditLineAnimationNoActionExit
  creditconfreset M_CreditConfigTimer
  jp CreditLineAnimationIncStateIndex

CreditLineAnimationWaitState::
  creditconfdec M_CreditConfigTimer
  jp nz, CreditLineAnimationNoActionExit
  jp CreditLineAnimationIncStateIndex

CreditLineAnimationActionExit::
  ld a, 1
  ret

CreditLineAnimationIncStateIndex::
  creditconfinc M_CreditConfigActIndex
  ld a, 1
  ret

CreditLineAnimationNoActionExit::
  ld a, 0
  ret

CreditLineAnimationLastPageExit::
  ld a, 2
  ret
