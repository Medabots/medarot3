INCLUDE "game/src/common/constants.asm"

W_OpeningSkipButtonPressed EQU $C737

SECTION "Opening Animation State Machine 1", ROMX[$4627], BANK[$03]
OpeningStateMachine::
  ld a, [W_OpeningSkipButtonPressed]
  or a
  jr nz, .doNotSkipOpening
  call OpeningInputHandler
  or a
  jr z,.doNotSkipOpening
  ld a, $54
  ld [W_CoreSubStateIndex], a

.doNotSkipOpening
  ld a, [W_CoreSubStateIndex]
  ld hl, $4640
  rst $30
  jp hl

.table
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningMedalAnimationDrawingState
  dw OpeningMedalAnimationMappingState
  dw OpeningMedalAnimationSpriteConfigState
  dw OpeningMedalAnimationPrepareFadeInState
  dw OpeningMedalAnimationDoFadeState
  dw $47EB
  dw $4805
  dw $4856
  dw $4874
  dw $4883
  dw $4A2F
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw OpeningDoNothingState
  dw $4A3A
  dw $4EFF
  dw $4EFF
  dw $4EFF
  dw $4A46
  dw $4A89
  dw $4A79
  dw $4AAA
  dw $4A40
  dw $4A43
  dw $4BA0
  dw $4BE8
  dw OpeningIkkiArikaDrawingState
  dw $4AF5
  dw $4B48
  dw $4B6B
  dw $4B7B
  dw $4B8E
  dw $4BA0
  dw $4BE8
  dw OpeningKojiKarinDrawingState
  dw $4C04
  dw $4C52
  dw $4C77
  dw $4C87
  dw $4C9A
  dw $4BA0
  dw $4BE8
  dw OpeningScrewsDrawingState
  dw $4CBA
  dw $4D1E
  dw $4D43
  dw $4D53
  dw $4D66
  dw $4BA0
  dw $4BE8
  dw OpeningRoborobodanDrawingState
  dw $4DA0
  dw $4DC9
  dw OpeningRoborobodanScrollInState
  dw OpeningRoborobodanSetupScrollOutState
  dw $4E11
  dw $4E31
  dw OpeningDoFadeState
  dw $4E43
  dw $4E67
  dw $4E7E
  dw $4E95
  dw OpeningDoFadeState
  dw $4EAC
  dw $4EC5
  dw $4ED0
  dw OpeningDoFadeState
  dw $4EE2
  dw $4EFF
  dw $4EFF
  dw $4EED
  dw OpeningDoFadeState
  dw $4EE2

OpeningDoNothingState::
  jp IncSubStateIndex

OpeningMedalAnimationDrawingState::
  call $342B
  call $3433
  call $3413
  call $343B
  call $3475
  ld hl, W_HasSaveData
  ld bc, $80
  call memclr
  ld bc, TilesetIDX_Tileset3C35
  call WrapLoadMaliasGraphics
  ld bc, TilesetIDX_Tileset3C37
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

OpeningMedalAnimationMappingState::
  ld bc, 0
  ld e, $33
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $42
  ld a, 1
  call WrapDecompressTilemap0
  jp IncSubStateIndex

OpeningMedalAnimationSpriteConfigState::
  ld a, 1
  ld [$C1E0], a
  ld a, $11
  ld [$C1E1], a
  ld a, $38
  ld [$C1E3], a
  ld a, $B0
  ld [$C1E4], a
  ld a, $A4
  ld b, 0
  ld de, $C1E0
  call $33B2
  ld a, 1
  ld [$C0C0], a
  ld a, $11
  ld [$C0C1], a
  ld a, $DA
  ld [$C0C2], a
  ld a, $A0
  ld [$C0C3], a
  ld a, $50
  ld [$C0C4], a
  ld a, $18
  ld [$C0D0], a
  ld a, 2
  ld [$C0D1], a
  ld a, 1
  ld [$C0E0], a
  ld a, $11
  ld [$C0E1], a
  ld a, $DB
  ld [$C0E2], a
  ld a, $4C
  ld [$C0E3], a
  ld a, $D7
  ld [$C0E4], a
  ld a, 0
  ld [$C0F0], a
  ld a, 2
  ld [$C0F1], a
  ld a, 0
  ld [$C100], a
  ld a, $11
  ld [$C101], a
  ld a, $DC
  ld [$C102], a
  ld a, $7A
  ld [$C103], a
  ld a, $50
  ld [$C104], a
  ld a, 8
  ld [$C110], a
  ld a, 2
  ld [$C111], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

OpeningMedalAnimationPrepareFadeInState::
  ld hl, $55
  ld bc, $53
  ld d, $FE
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

OpeningMedalAnimationDoFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, $46
  call ScheduleSoundEffect
  jp IncSubStateIndex

OpeningDoFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

SECTION "Opening Animation State Machine 2", ROMX[$4AC8], BANK[$03]
OpeningIkkiArikaDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, TilesetIDX_Tileset3C3D
  call WrapLoadMaliasGraphics
  ld bc, TilesetIDX_OpeningAnimationCharacterNames
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

SECTION "Opening Animation State Machine 3", ROMX[$4BF2], BANK[$03]
OpeningKojiKarinDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, TilesetIDX_Tileset3C3F
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

SECTION "Opening Animation State Machine 4", ROMX[$4CA8], BANK[$03]
OpeningScrewsDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, TilesetIDX_Tileset3C41
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

SECTION "Opening Animation State Machine 5", ROMX[$4D89], BANK[$03]
OpeningRoborobodanDrawingState::
  call $3413
  call $343B
  call $3475
  ld a, $70
  ld [W_ShadowREG_SCY], a
  ld bc, TilesetIDX_Tileset3C43
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

SECTION "Opening Animation State Machine 6", ROMX[$4DDC], BANK[$03]
OpeningRoborobodanScrollInState::
  ld a, [W_ShadowREG_SCY]
  add a, $04
  ld [W_ShadowREG_SCY], a
  ld a, [$C124]
  add a, $04
  ld [$C124], a
  ld a, $01
  ld [W_OAM_SpritesReady], a
  ld a, [W_HasSaveData]
  dec a
  ld [W_HasSaveData], a
  ret nz
  ld a, $31 ; Wait for 31 iterations
  ld [W_HasSaveData], a
  jp IncSubStateIndex
OpeningRoborobodanSetupScrollOutState::
  ld a, [W_HasSaveData]
  dec a
  ld [W_HasSaveData], a
  ret nz
  ld a, $24 ; Scroll for 24/4 iterations (SCY)
  ld [W_HasSaveData], a
  jp IncSubStateIndex
