INCLUDE "game/src/common/constants.asm"

DEF W_TutorialScrollOffset EQU $C562
DEF W_TutorialCursorPosition EQU $C563

SECTION "Tutorial Helper Functions", ROMX[$5F60], BANK[$07]
PrepareMainScriptForTutorial::
  ld a, b
  ld [W_ItemActionMessageIndex], a
  ld a, c
  ld [W_ItemActionMessageIndex + 1], a
  jp WrapInitiateMainScript

MapTutorialNamesToScreen::
  ld a, [W_TutorialScrollOffset]
  ld [$C4EE], a
  xor a
  ld [$C4F0], a
  ld b, 5

.loop
  push bc
  ld a, [$C4EE]
  ld hl, PtrListGlossaryTerms
  rst $30
  inc hl
  ld b, h
  ld c, l
  ld hl, $984C
  ld d, 0
  ld a, [$C4F0]
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
  add hl, de
  ld a, 7
  call PutStringFixedLength
  ld hl, $C4EE
  inc [hl]
  ld hl, $C4F0
  inc [hl]
  pop bc
  dec b
  jr nz, .loop
  ret

AnimateTutorialListCursor::
  call PlaceTutorialListCursor
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

PlaceTutorialListCursor::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  ld a, 7
  ld [$C0C5], a
  ld a, $57
  ld [$C0C3], a
  ld a, [W_TutorialCursorPosition]
  sla a
  sla a
  sla a
  sla a
  add $10
  ld [$C0C4], a
  ret

DisplayIconForCurrentlySelectedTutorial::
  ld a, [W_TutorialScrollOffset]
  ld b, a
  ld a, [W_TutorialCursorPosition]
  add b
  ld hl, PtrListGlossaryTerms
  rst $30
  ld a, [hl]
  or a
  jr nz, .loadIcon
  ld a, 0
  ld [$C120], a
  ret

.loadIcon
  dec a
  add $5A
  ld [$C122], a
  ld a, 1
  ld [$C120], a
  ld a, $33
  ld [$C121], a
  ld a, $38
  ld [$C123], a
  ld a, $50
  ld [$C124], a
  ret

TutorialDirectionalInputHandling::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_TutorialScrollOffset]
  ld b, a
  ld a, [W_TutorialCursorPosition]
  or b
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_TutorialCursorPosition]
  or a
  jr nz, .cursorNotAtTop
  ld a, [W_TutorialScrollOffset]
  dec a
  ld [W_TutorialScrollOffset], a
  call MapTutorialNamesToScreen
  jp DisplayIconForCurrentlySelectedTutorial

.cursorNotAtTop
  dec a
  ld [W_TutorialCursorPosition], a
  call PlaceTutorialListCursor
  jp DisplayIconForCurrentlySelectedTutorial

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  ret z
  ld a, [W_TutorialScrollOffset]
  cp $30
  jr nz, .notAtMaxScrollOffset
  ld a, [W_TutorialCursorPosition]
  cp 4
  ret z

.notAtMaxScrollOffset
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_TutorialCursorPosition]
  cp 4
  jr nz, .cursorNotAtBottom
  ld a, [W_TutorialScrollOffset]
  inc a
  ld [W_TutorialScrollOffset], a
  call MapTutorialNamesToScreen
  jp DisplayIconForCurrentlySelectedTutorial

.cursorNotAtBottom
  inc a
  ld [W_TutorialCursorPosition], a
  call PlaceTutorialListCursor
  jp DisplayIconForCurrentlySelectedTutorial

AnimateTutorialScrollingArrows::
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, PlaceTutorialScrollingArrows
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

PlaceTutorialScrollingArrows::
  ld a, [W_TutorialScrollOffset]
  or a
  jr z, .skipTopArrow
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A0
  ld [$C0E2], a
  ld a, $78
  ld [$C0E3], a
  ld a, 8
  ld [$C0E4], a

.skipTopArrow
  ld a, [W_TutorialScrollOffset]
  cp $30
  ret z
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A1
  ld [$C102], a
  ld a, $78
  ld [$C103], a
  ld a, $58
  ld [$C104], a
  ret
