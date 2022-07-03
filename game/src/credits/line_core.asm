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
  dw $464C
  dw $46D0
  dw $46EE
  dw $4775
  dw $47C8

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
  creditconf M_CreditConfigAniIndex
  ld a, 1
  ld [hl], a
  ret

.endAnimation
  creditconf M_CreditConfigAniIndex
  ld a, 0
  ld [hl], a
  ret
