INCLUDE "game/src/common/constants.asm"

SECTION "Minigame A State Machine 1", ROMX[$4000], BANK[$14]
MinigameAStateMachine::
  ld a, [$C824]
  inc a
  ld [$C824], a
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw MinigameADrawingState
  dw MinigameAMappingState
  dw MinigameAPrepareFadeInState
  dw MinigameADoFadeInState
  dw $410C
  dw $4134
  dw $4160
  dw $41BA
  dw $41CC
  dw $41F0

MinigameADrawingState::
  call $343B
  ld hl, $C820
  xor a
  ld b, 0

.clearLoop
  ld [hli], a
  dec b
  jr nz, .clearLoop

  ld a, $40
  ld [$C830], a
  ld a, 0
  ld [W_ShadowREG_WX], a
  ld a, $78
  ld [W_ShadowREG_WY], a
  ld a, $E3
  ld [W_ShadowREG_LCDC], a
  ld a, 1
  ld [$C840], a
  ld a, $10
  ld [$C826], a
  ld a, 0
  ld [$C827], a
  ld bc, 4
  call WrapLoadMaliasGraphics
  ld bc, $20
  call WrapLoadMaliasGraphics
  ld bc, $21
  call WrapLoadMaliasGraphics
  ld bc, $22
  call WrapLoadMaliasGraphics
  ld bc, $23
  call WrapLoadMaliasGraphics
  ld bc, $24
  call WrapLoadMaliasGraphics
  call .setMetaspritePointerTableIndices
  jp IncSubStateIndex

.setMetaspritePointerTableIndices
  call $3413
  ld b, $1E
  ld hl, $C0A1
  ld de, $20
  ld a, $11

.writeLoop
  ld [hl], a
  add hl, de
  dec b
  jr nz, .writeLoop
  ret

MinigameAMappingState::
  ld bc, 0
  ld e, 0
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, 0
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, 1
  ld a, 1
  call WrapDecompressTilemap1
  ld bc, 0
  ld e, 1
  ld a, 1
  call WrapDecompressAttribmap1
  ld b, 0
  ld c, 0
  ld hl, $9824
  call MinigameADrawScore
  call $43A1
  ld a, 1
  ld [$C0C0], a
  ld [$C0E0], a
  call $44BC
  call $587C
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

MinigameAPrepareFadeInState::
  ld hl, $20
  ld bc, $14
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

MinigameADoFadeInState::
  call MinigameASetupScoreBoard
  call $41AB
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  xor a
  ld [$C835], a
  jp IncSubStateIndex

SECTION "Minigame A State Machine 2", ROMX[$4404], BANK[$14]
MinigameASetupScoreBoard::
; TODO: Annotate
  ld a, [$C840]
  or a
  jr nz, .draw_score
  ld a, [$C824]
  and $3f
  jr nz, .asm_5041c
  ld a, [$C830]
  dec a
  cp $18
  jr c, .asm_5041c
  ld [$C830], a
.asm_5041c
  ld a, [$C830]
  cp $28
  jr nz, .draw_score
  ld a, $01
  ld [$C380], a
.draw_score
  ld a, [$C827]
  ld b, a
  ld a, [$C826]
  ld c, a
  ld hl, $9824
  call MinigameADrawScore
  ld a, [$C824]
  and $03
  jr nz, .asm_50481
  ld a, [$C840]
  cp $06
  jr c, .asm_5044e
  ld a, [$C82A]
  cp $0a
  jr c, .asm_50481
  dec a
  jr .asm_5047e
.asm_5044e
  ld a, [$C841]
  or a
  jr z, .asm_50462
  dec a
  ld [$C841], a
  ld a, [$C82A]
  or a
  jr z, .asm_5045f
  dec a
.asm_5045f
  ld [$C82A], a
.asm_50462
  ld a, [$C83B]
  or a
  jr z, .asm_50481
  dec a
  ld [$C83B], a
  ld a, [$C82A]
  inc a
  cp $40
  jr c, .asm_5047e
  ld a, $02
  ld [$C840], a
  call $47c6
  ld a, $40
.asm_5047e
  ld [$C82A], a
.asm_50481
  ld a, [$C82A]
  xor $ff
  inc a
  add $78
  ld b, a
  ld hl, $5F36
  ld a, [$C824]
  srl a
  srl a
  and $3f
  bit 5, a
  jr z, .asm_504a8
  and $1f
  add l
  ld l, a
  ld a, $00
  adc h
  ld h, a
  ld a, [hl]
  xor $ff
  inc a
  jr .asm_504af
.asm_504a8
  add l
  ld l, a
  ld a, $00
  adc h
  ld h, a
  ld a, [hl]
.asm_504af
  sra a
  sra a
  sra a
  sra a
  add b
  ld [W_ShadowREG_WY], a
  ret

SECTION "Minigame A State Machine 3", ROMX[$4374], BANK[$14]
MinigameADrawScore::
  ld d, $00
  ld a, b
  and $0f
  jr nz, .not_zero
  xor a
  jr .draw
.not_zero
  add $f0
  ld d, $f0
.draw
  di
  ld b, a
  rst $20
  ld a, b
  ld [hli], a
  ei
  ld a, c
  swap a
  and $0f
  jr nz, .not_zero_2
  or d
  jr .done_drawing
.not_zero_2
  add $f0
.done_drawing
  di
  ld b, a
  rst $20
  ld a, b
  ld [hli], a
  ld a, c
  and $0f
  add $f0
  ld [hl], a
  ei
  ret

SECTION "Minigame B State Machine 1", ROMX[$5F7C], BANK[$14]
MinigameBStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw MinigameBDrawingState
  dw MinigameBMappingState
  dw $5FF5
  dw $6090
  dw $6061
  dw $6085
  dw $60C7
  dw $60FC
  dw $6073
  dw $6085
  dw $6234
  dw $61B9
  dw $61E2
  dw $620B
  dw $6234
  dw $6234

MinigameBDrawingState::
  call $343B
  ld c, $FF
  ld hl, $C820
  call $69FB ; Clear loop function.
  ld a, [$C91F]
  or a
  jp nz, .notLessThanOne
  inc a

.notLessThanOne
  cp 6
  jp c, .notGreaterThanFive
  ld a, 5

.notGreaterThanFive
  ld [$C820], a
  call $3413
  ld bc, $26
  call WrapLoadMaliasGraphics
  ld bc, $27
  call WrapLoadMaliasGraphics
  ld bc, $28
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

MinigameBMappingState::
  ld bc, 0
  ld e, 3
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, 3
  ld a, 1
  call WrapDecompressAttribmap0
  ld a, 1
  ld [$C4D9], a
  jp IncSubStateIndex
