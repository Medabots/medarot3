INCLUDE "game/src/common/constants.asm"

SECTION "Medals State Machine 1", ROMX[$4000], BANK[$02]
MedalsStateMachine::
  ld a, [$C522]
  cp 2
  jr nz, .fireState
  call $632D
  ld a, [$C4EE]
  or a
  jr z, .fireState
  ld a, $1B
  ld [W_CoreStateIndex], a
  ld a, $B0
  ld [W_CoreSubStateIndex], a
  ret

.fireState
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table

  ; Medal list screen.

  dw MedalsDrawingState ; 00
  dw MedalsMappingState ; 01
  dw MedalsPrepareFadeInState ; 02
  dw MedalsFadeState ; 03
  dw MedalsListInputHandlerState ; 04
  dw MedalsSlideInOptionsBoxState ; 05
  dw MedalsListOptionsBoxInputHandlerState ; 06
  dw MedalsListOptionsBoxTriggerSubscreenState ; 07
  dw MedalsPlaceholderState ; 08
  dw MedalsPlaceholderState ; 09
  dw MedalsPlaceholderState ; 0A
  dw MedalsPlaceholderState ; 0B
  dw MedalsPlaceholderState ; 0C
  dw MedalsPlaceholderState ; 0D
  dw MedalsPlaceholderState ; 0E
  dw MedalsPlaceholderState ; 0F

  ; Ability subscreen.

  dw MedalsPrepareFadeOutState ; 10
  dw MedalsFadeState ; 11
  dw MedalsSubscreenDrawingState ; 12
  dw MedalsAbilitySubscreenMappingState ; 13
  dw MedalsAbilitySubscreenPrepareFadeInState ; 14
  dw MedalsDoNothingState ; 15
  dw MedalsFadeState ; 16
  dw MedalsAbilitySubscreenInputHandlerState ; 17
  dw MedalsSlideInOptionsBoxState ; 18
  dw MedalsListOptionsBoxInputHandlerState ; 19
  dw MedalsListOptionsBoxTriggerSubscreenState ; 1A
  dw MedalsPrepareFadeOutState ; 1B
  dw MedalsFadeState ; 1C
  dw MedalsSubscreenExitState ; 1D
  dw MedalsPlaceholderState ; 1E
  dw MedalsPlaceholderState ; 1F

  ; Medaforce subscreen.

  dw MedalsPrepareFadeOutState ; 20
  dw MedalsFadeState ; 21
  dw MedalsSubscreenDrawingState ; 22
  dw MedalsMedaforceSubscreenMappingState ; 23
  dw MedalsMedaforceSubscreenPrepareFadeInState ; 24
  dw MedalsFadeState ; 25
  dw MedalsMedaforceSubscreenInputHandlerState ; 26
  dw MedalsSlideInOptionsBoxState ; 27
  dw MedalsListOptionsBoxInputHandlerState ; 28
  dw MedalsListOptionsBoxTriggerSubscreenState ; 29
  dw MedalsPlaceholderState ; 2A
  dw MedalsPlaceholderState ; 2B
  dw MedalsPlaceholderState ; 2C
  dw MedalsPlaceholderState ; 2D
  dw MedalsPlaceholderState ; 2E
  dw MedalsPlaceholderState ; 2F

  ; Skill level subscreen.

  dw MedalsPrepareFadeOutState ; 30
  dw MedalsFadeState ; 31
  dw MedalsSubscreenDrawingState ; 32
  dw MedalsSkillLevelSubscreenMappingState ; 33
  dw MedalsSkillLevelSubscreenPrepareFadeInState ; 34
  dw MedalsFadeState ; 35
  dw MedalsSkillLevelSubscreenInputHandlerState ; 36
  dw MedalsSlideInOptionsBoxState ; 37
  dw MedalsListOptionsBoxInputHandlerState ; 38
  dw MedalsListOptionsBoxTriggerSubscreenState ; 39
  dw MedalsPlaceholderState ; 3A
  dw MedalsPlaceholderState ; 3B
  dw MedalsPlaceholderState ; 3C
  dw MedalsPlaceholderState ; 3D
  dw MedalsPlaceholderState ; 3E
  dw MedalsPlaceholderState ; 3F

  ; Medalia subscreen.

  dw MedalsPrepareFadeOutState ; 40
  dw MedalsFadeState ; 41
  dw MedalsSubscreenDrawingState ; 42
  dw MedalsMedaliaSubscreenMappingState ; 43
  dw MedalsMedaliaSubscreenPrepareFadeInState ; 44
  dw MedalsFadeState ; 45
  dw MedalsMedaliaSubscreenSlotNavigationInputHandlerState ; 46
  dw MedalsMedaliaSubscreenListNavigationInputHandlerState ; 47
  dw MedalsPlaceholderState ; 48
  dw MedalsJumpToSkillLevelSubscreenState ; 49
  dw MedalsPlaceholderState ; 4A
  dw MedalsPlaceholderState ; 4B
  dw MedalsPlaceholderState ; 4C
  dw MedalsPlaceholderState ; 4D
  dw MedalsPlaceholderState ; 4E
  dw MedalsPlaceholderState ; 4F

  ; Exit to medawatch menu.

  dw MedalsPrepareFadeOutState ; 50
  dw MedalsFadeState ; 51
  dw MedalsPointlessConditionalExitToMedarotScreenThatDoesntWorkState ; 52
  dw MedalsMedawatchDrawingState ; 53
  dw MedalsMedawatchRestoreOddsAndEndsState ; 54
  dw MedalsPrepareMedawatchMenuFadeInState ; 55
  dw MedalsExitToMedawatchMenuState ; 56
  dw MedalsPlaceholderState ; 57
  dw MedalsPlaceholderState ; 58
  dw MedalsPlaceholderState ; 59
  dw $63C5 ; 5A
  dw $644B ; 5B
  dw MedalsPlaceholderState ; 5C
  dw MedalsPlaceholderState ; 5D
  dw MedalsPlaceholderState ; 5E
  dw MedalsPlaceholderState ; 5F
  
  ; Link-related overlay menu?
  
  dw $4626 ; 60
  dw $465E ; 61
  dw $4695 ; 62
  dw $46E0 ; 63
  dw $473B ; 64
  dw MedalsPlaceholderState ; 65
  dw $4762 ; 66
  dw $4786 ; 67
  dw $4797 ; 68
  dw $47BE ; 69
  dw MedalsFadeState ; 6A
  dw $47D0 ; 6B
  dw MedalsPlaceholderState ; 6C
  dw MedalsPlaceholderState ; 6D
  dw MedalsPlaceholderState ; 6E
  dw MedalsPlaceholderState ; 6F

  ; Exit to link menu.

  dw MedalsPrepareFadeOutState ; 70
  dw MedalsFadeState ; 71
  dw MedalsExitToLinkMenuState ; 72
  dw MedalsPlaceholderState ; 73
  dw MedalsPlaceholderState ; 74
  dw MedalsPlaceholderState ; 75
  dw MedalsPlaceholderState ; 76
  dw MedalsPlaceholderState ; 77
  dw MedalsPlaceholderState ; 78
  dw MedalsPlaceholderState ; 79
  dw MedalsPlaceholderState ; 7A
  dw MedalsPlaceholderState ; 7B
  dw MedalsPlaceholderState ; 7C
  dw MedalsPlaceholderState ; 7D
  dw MedalsPlaceholderState ; 7E
  dw MedalsPlaceholderState ; 7F
  dw MedalsPlaceholderState ; 80

MedalsDoNothingState::
  jp IncSubStateIndex

MedalsFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

MedalsDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $12
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $14
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, 2
  call $33C6
  jp IncSubStateIndex

MedalsMappingState::
  xor a
  ld [W_MedalMenuCurrentScreen], a
  ld bc, 0
  ld e, $35
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $35
  ld a, 0
  call WrapDecompressAttribmap0
  ld bc, $908
  ld a, $90
  ld hl, $980B
  call $262C
  ld bc, $908
  ld a, 0
  ld hl, $980B
  call $25FF
  call CountMedals
  call CalculateMedalMenuPageNumber
  call MapMedalMenuPageNumber
  call DrawMedalIcons
  call MapMedalIcons
  call MapMedalNamesForMenu
  ld hl, $992B
  call MapSelectedMedalName
  ld hl, $9970
  call MapSelectedMedalLevel
  ld hl, $99CE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $79
  call DisplayTinpetSpriteAssociatedWithMedal
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $C00
  call MapMedalImage
  call MedalListDisplaySelectorArrow
  call MedalListDisplayArrows
  call $62A6
  jp IncSubStateIndex

MedalsPrepareFadeInState::
  ld hl, $23
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call CalculateMedalImagePaletteIndex
  push bc
  ld a, 4
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  ld hl, 8
  add hl, bc
  ld b, h
  ld c, l
  ld a, 5
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

MedalsListInputHandlerState::
  ld de, $C0C0
  call $33B7
  call MedalListAnimateArrows
  call MedalListDisplaySortingArrow
  call MedalPreOptionBoxInputCheck
  ld a, [$C4EE]
  or a
  jr z, .nothingSelected
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 2
  jp nz, IncSubStateIndex
  ld a, $60
  ld [W_CoreSubStateIndex], a
  ret

.nothingSelected
  call MedalListItemNavigationInputHandler
  call MedalListPageNavigationInputHandler
  ld a, [$C4EE]
  or a
  ret nz
  call MedalListSortItemInputHandler
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  ld a, [W_ItemActionSubSubSubStateIndex]
  cp $80
  jr c, .exitMedalList

  xor a
  ld [W_ItemActionSubSubSubStateIndex], a
  ld a, 2
  call $27DA
  ret

.exitMedalList
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 2
  jr z, .exitToLinkMenu

.exitToMedawatchMenu
  ld a, $50
  ld [W_CoreSubStateIndex], a
  ret 

.exitToLinkMenu
  ld a, $70
  ld [W_CoreSubStateIndex], a
  ret

MedalsSlideInOptionsBoxState::
  call MapMedalOptionsBox
  ld a, [$C4EE]
  or a
  ret z
  jp IncSubStateIndex

MedalsListOptionsBoxInputHandlerState::
  call MedalOptionsBoxInputHandler
  ld a, [W_MedalMenuOptionBoxSelectedItemForProcessing]
  or a
  ret z
  jp IncSubStateIndex

MedalsListOptionsBoxTriggerSubscreenState::
  ld a, [W_MedalMenuCurrentScreen]
  ld hl, .table
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [W_MedalMenuOptionBoxSelectedItemForProcessing]
  dec a
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_CoreSubStateIndex], a
  cp $17
  ret nz
  ld b, $88
  ld c, $41
  call DisplayTinpetSpriteAssociatedWithMedal
  ret

.table
  db $10,$20,$30,$04
  db $20,$30,$1B,$17
  db $30,$10,$1B,$26
  db $10,$20,$1B,$36
  db $00,$00,$00,$00

MedalsSubscreenDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $12
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $14
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, 2
  call $33C6
  jp IncSubStateIndex

MedalsAbilitySubscreenMappingState::
  ld a, 1
  ld [W_MedalMenuCurrentScreen], a
  ld bc, 0
  ld e, $3B
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $3B
  ld a, 0
  call WrapDecompressAttribmap0
  call WrapInitiateMainScript
  call DisplayMedalDescriptionForMedalSubscreen
  call MedalSubscreenDisplayArrows
  call MedalDisplayAbilitySubscreenIconSprites
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  call MapMedalAttributeForMedalSubscreen
  call MapMedalPersonalityForMedalSubscreen
  call MapMedalCompatibilityForMedalSubscreen
  call MapUndefinedMedalStat
  call MapUndefinedMedalString
  ld hl, $984B
  call MapSelectedMedalName
  ld hl, $9890
  call MapSelectedMedalLevel
  ld hl, $98EE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $41
  call DisplayTinpetSpriteAssociatedWithMedal
  jp IncSubStateIndex

MedalsAbilitySubscreenPrepareFadeInState::
  ld hl, $24
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedalsAbilitySubscreenInputHandlerState::
  call MedalSubscreenAnimateArrows
  call MedalPreOptionBoxInputCheck
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call MedalsAbilitySubscreenPageNavigationInputHandler
  ld a, [$C4EE]
  or a
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  ld a, $1B
  ld [W_CoreSubStateIndex], a
  ret

MedalsSubscreenExitState::
  call $3413
  call $343B
  call $3475
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 1
  jr z, .exitToMedarotScreen
  ld a, 1
  ld [W_CoreSubStateIndex], a
  ret

.exitToMedarotScreen
  call $6311
  or a
  jr nz, .deselectMedal
  ld a, [W_SelectedItemInventorySlotIndex]
  jr .specifyMedal

.deselectMedal
  ld a, $1E

.specifyMedal
  ld [$C529], a
  ld a, $F
  ld [W_CoreStateIndex], a
  ld a, $1A
  ld [W_CoreSubStateIndex], a
  ret

MedalsMedaforceSubscreenMappingState::
  ld a, 2
  ld [W_MedalMenuCurrentScreen], a
  xor a
  ld [W_ItemActionSubSubStateIndex], a
  ld bc, 0
  ld e, $41
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $41
  ld a, 0
  call WrapDecompressAttribmap0
  call WrapInitiateMainScript
  call PrintMedalSelectedMedaforceDescriptionForMedalSubscreen
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $984B
  call MapSelectedMedalName
  call MedalSubscreenDisplayArrows
  call MapMedalMedaforceForMedalSubscreen
  call MapMedalSelectedMedaforceInfoForMedalSubscreen
  call MapMedalSelectedMedaforceSkillForMedalSubscreen
  call DisplaySelectionArrowForMedalMedaforceSubscreen
  jp IncSubStateIndex

MedalsMedaforceSubscreenPrepareFadeInState::
  ld hl, $25
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedalsMedaforceSubscreenInputHandlerState::
  ld de, $C0C0
  call $33B7
  call MedalSubscreenAnimateArrows
  call MedalPreOptionBoxInputCheck
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call MedalsMedaforceSubscreenPageNavigationInputHandler
  ld a, [$C4EE]
  or a
  ret nz
  call MedalsMedaforceSubscreenItemSelectionInputHandler
  ld a, [$C4EE]
  or a
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  ld a, $1B
  ld [W_CoreSubStateIndex], a
  ret

MedalsSkillLevelSubscreenMappingState::
  ld a, 3
  ld [W_MedalMenuCurrentScreen], a
  ld bc, 0
  ld e, $42
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $42
  ld a, 0
  call WrapDecompressAttribmap0
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $984B
  call MapSelectedMedalName
  call MedalSubscreenDisplayArrows
  call MapSkillsForMedalSubscreenLeftColumn
  call MapSkillsForMedalSubscreenRightColumn
  call MapSkillBarAttributesForMedalSubscreen
  call $5AED
  call $5C74
  jp IncSubStateIndex

MedalsSkillLevelSubscreenPrepareFadeInState::
  ld hl, $26
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedalsSkillLevelSubscreenInputHandlerState::
  call AnimateMedalSkillBarSegments
  call MedalSubscreenAnimateArrows
  call MedalPreOptionBoxInputCheck
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call MedalsSkillLevelSubscreenPageNavigationInputHandler
  ld a, [$C4EE]
  or a
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputStart
  jr z, .startNotPressed
  ld a, 3
  call $27DA
  ld a, $40
  ld [W_CoreSubStateIndex], a
  ret

.startNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  ld a, $1B
  ld [W_CoreSubStateIndex], a
  ret

MedalsMedaliaSubscreenMappingState::
  ld a, 4
  ld [W_MedalMenuCurrentScreen], a
  xor a
  ld [W_MedalMenuSelectedMedaliaSlot], a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld [W_MedalMenuMedaliaListOffsetIndex], a
  ld bc, 0
  ld e, $43
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $43
  ld a, 0
  call WrapDecompressAttribmap0
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $986B
  call MapSelectedMedalName
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $206
  call MapMedalImage
  call DisplayMedaliaIndicatorSpritesForMedaliaSubscreen
  call DisplayMedaliaInCurrentlySelectedSlot
  call CountMedalia
  call PopulateMedaliaList
  call DisplayMedaliaSlotSelector
  jp IncSubStateIndex

MedalsMedaliaSubscreenPrepareFadeInState::
  ld hl, $27
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call CalculateMedalImagePaletteIndex
  push bc
  ld a, 4
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  ld hl, 8
  add hl, bc
  ld b, h
  ld c, l
  ld a, 5
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

MedalsMedaliaSubscreenSlotNavigationInputHandlerState::
  ld de, $C0C0
  call $33B7
  call MedaliaSlotNavigationInputHandler
  call MedaliaSlotConfirmationInputHandler
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  ld a, $49
  ld [W_CoreSubStateIndex], a
  ret

MedalsMedaliaSubscreenListNavigationInputHandlerState::
  ld de, $C120
  call $33B7
  call AnimateVerticalMedaliaListArrows
  call MedaliaListNavigationInputHandler
  call $620E
  ld a, [$C4EE]
  or a
  jr nz, .medaliaSelected
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA

.medaliaSelected
  ld a, 0
  ld [$C120], a
  ld [$C0E0], a
  ld [$C100], a
  xor a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld [W_MedalMenuMedaliaListOffsetIndex], a
  call PopulateMedaliaList
  call DisplayMedaliaIndicatorSpritesForMedaliaSubscreen
  call DisplayMedaliaInCurrentlySelectedSlot
  ld a, $46
  ld [W_CoreSubStateIndex], a
  ret

MedalsJumpToSkillLevelSubscreenState::
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

MedalsPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedalsPointlessConditionalExitToMedarotScreenThatDoesntWorkState::
  call $3413
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 1
  jp nz, IncSubStateIndex
  ld a, $F
  ld [W_CoreStateIndex], a
  ld a, $C
  ld [W_CoreSubStateIndex], a
  ret

MedalsMedawatchDrawingState::
  ld bc, 6
  call WrapLoadMaliasGraphics
  call $2CEC
  ld h, 0
  ld l, a
  ld bc, 7
  add hl, bc
  ld b, h
  ld c, l
  call WrapLoadMaliasGraphics
  ld bc, $C
  call WrapLoadMaliasGraphics
  ld bc, $D
  call WrapLoadMaliasGraphics
  call $3475
  jp IncSubStateIndex

MedalsMedawatchRestoreOddsAndEndsState::
  ld a, [W_PauseMenuPerserveSCX]
  ld [W_ShadowREG_SCX], a
  ld a, [W_PauseMenuPerserveSCY]
  ld [W_ShadowREG_SCY], a
  ld a, 0
  ld [$C4EE], a
  ld a, $14
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, $12
  ld [$C4F1], a
  ld a, 3
  call $123B
  call MedalMenuRestoreIkkiOverlay
  ld a, 1
  call MedalMenuRestorePausemenuArrowPlaceholder
  jp IncSubStateIndex

MedalsPrepareMedawatchMenuFadeInState::
  call $2CEC
  ld h, 0
  ld l, a
  ld bc, $12
  add hl, bc
  ld bc, $12
  ld d, $7F
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedalsExitToMedawatchMenuState::
  ld a, $A
  ld [W_CoreStateIndex], a
  ld a, 3
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Medals State Machine 2", ROMX[$47DA], BANK[$02]
MedalsExitToLinkMenuState::
  ld a, $1B
  ld [W_CoreStateIndex], a
  ld a, $90
  ld [W_CoreSubStateIndex], a
  ret

MedalsPlaceholderState::
  ret
