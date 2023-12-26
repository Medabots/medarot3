INCLUDE "game/src/common/constants.asm"

W_LogoSplashCurrentLogo EQU $C720

SECTION "Logo Splash State Machine 1", ROMX[$40FD], BANK[$03]
LogoSplashStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw LogoSplashPalettesState ; 00
  dw LogoSplashImagineerBombomDrawingState ; 01
  dw LogoSplashImagineerMappingState ; 02
  dw LogoSplashDoFadeState ; 03
  dw LogoSplashWaitTimerState ; 04
  dw LogoSplashDoFadeState ; 05
  dw LogoSplashBombomMappingState ; 06
  dw LogoSplashPrepareFadeInState ; 07
  dw LogoSplashDoFadeState ; 08
  dw LogoSplashWaitTimerState ; 09
  dw LogoSplashDoFadeState ; 0A
  dw LogoSplashCharacterDesignState ; 0B
  dw LogoSplashPrepareFadeInState ; 0C
  dw LogoSplashDoFadeState ; 0D
  dw LogoSplashWaitTimerState ; 0E
  dw LogoSplashDoFadeState ; 0F
  dw LogoSplashNatsumeState ; 10
  dw LogoSplashPrepareFadeInState ; 11
  dw LogoSplashDoFadeState ; 12
  dw LogoSplashWaitTimerState ; 13
  dw LogoSplashDoFadeState ; 14
  dw LogoSplashCashMedalChameleonState ; 15
  dw LogoSplashDoFadeState ; 16
  dw LogoSplashWaitTimerState ; 17
  dw LogoSplashDoFadeState ; 18
  dw LogoSplashPrepareFadeToBlackState ; 19
  dw LogoSplashFadeToOpeningState ; 1A

LogoSplashDoFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

LogoSplashPrepareFadeInState::
  ld hl, $3B

.ext
  ld bc, 0
  ld d, $7F
  ld e, 0
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LogoSplashPalettesState::
  ld bc, 0
  call WrapCGBLoadBGPPaletteIndexes
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ld bc, 0
  call WrapCGBLoadOBPPaletteIndexes
  ld a, 1
  ld [W_CGBPaletteStagedOBP], a
  jp IncSubStateIndex

LogoSplashImagineerBombomDrawingState::
  call $342B
  call $3433
  call $3413
  call $343B
  call $3475
  ld hl, $C720
  ld bc, $80
  call memclr
  ld bc, $16B
  call WrapLoadMaliasGraphics
  ld bc, $16C
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

LogoSplashImagineerMappingState::
  ld bc, 0
  ld e, $52
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $71
  ld a, 1
  call WrapDecompressTilemap0
  ld a, $3C
  ld [W_MedalMenuWaitTimer], a
  ld hl, $3B
  ld bc, 0
  ld d, $7F
  ld e, 0
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LogoSplashWaitTimerState::
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .noLogoSkip
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ld a, $18
  ld [W_CoreSubStateIndex], a
  ret

.noLogoSkip
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LogoSplashBombomMappingState::
  ld bc, 0
  ld e, $53
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $72
  ld a, 1
  call WrapDecompressTilemap0
  ld a, $3C
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LogoSplashCharacterDesignState::
  ; Also draws the Natsume logo for later.
  ld bc, $16D
  call WrapLoadMaliasGraphics
  ld bc, 0
  ld e, $54
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $73
  ld a, 1
  call WrapDecompressTilemap0
  ld a, $3C
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LogoSplashNatsumeState::
  ld bc, 0
  ld e, $55
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $74
  ld a, 1
  call WrapDecompressTilemap0
  ld a, $3C
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LogoSplashPrepareFadeToBlackState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LogoSplashFadeToOpeningState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, $2D
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

LogoSplashCashMedalChameleonState::
  ld bc, TilesetIDX_CashMedalChameleon
  call WrapLoadMaliasGraphics
  ld bc, 0
  ld e, $54
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $FE
  ld a, 3
  call WrapDecompressTilemap0
  ld a, $3C
  ld [W_MedalMenuWaitTimer], a
  ld hl, $1FE
  jp LogoSplashPrepareFadeInState.ext
  nop
