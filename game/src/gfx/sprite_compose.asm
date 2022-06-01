INCLUDE "game/src/common/constants.asm"

SECTION "Sprite Prep Vars", WRAM0[$C4D0]
W_OAM_SpritesReady:: ds 1
W_OAM_SpritesBrk:: ds 1

SECTION "DMA Ready Var", WRAM0[$C4D8]
W_OAM_DMAReady:: ds 1

SECTION "Metasprite Loader Vars",  WRAM0[$C4B5]
W_ConfigBufferForMetaSpriteLoader_Bank:: ds 1
W_ConfigBufferForMetaSpriteLoader_HiAttribs:: ds 1
W_ConfigBufferForMetaSpriteLoader_Index:: ds 1
W_ConfigBufferForMetaSpriteLoader_OAMYOffset:: ds 1
W_ConfigBufferForMetaSpriteLoader_OAMXOffset:: ds 1
W_ConfigBufferForMetaSpriteLoader_LowAttributes:: ds 1

SECTION "Metasprite Loader",  ROM0[$0590]
LoadMetasprite::

; Loads a precomposed set of sprites (called a metasprite) and generates a set
; of OAM entries based on a few bytes of configuration data which affects all
; of the sprites in the set.

  ld a, [hli]
  ld [W_ConfigBufferForMetaSpriteLoader_HiAttribs], a
  ld a, [hli]
  ld [W_ConfigBufferForMetaSpriteLoader_Bank], a
  ld a, [hli]
  ld [W_ConfigBufferForMetaSpriteLoader_Index], a
  ld a, [hli]
  add 8
  ld [W_ConfigBufferForMetaSpriteLoader_OAMXOffset], a
  ld a, [hli]
  add $10
  ld [W_ConfigBufferForMetaSpriteLoader_OAMYOffset], a
  ld a, [hli]
  ld [W_ConfigBufferForMetaSpriteLoader_LowAttributes], a
  push bc
  ld a, [W_ConfigBufferForMetaSpriteLoader_Bank]
  and $F0
  swap a
  ld hl, .banktable
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  rst $10
  pop bc
  ld a, [W_ConfigBufferForMetaSpriteLoader_Bank]
  and $F0
  swap a
  ld hl, .addresstable
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [W_ConfigBufferForMetaSpriteLoader_Index]
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [hli]
  ld d, h
  ld e, l

; At the start of this loop, the following registers hold:
; A = Number of sprites left to build.
; DE = Current byte of the metasprite list we're working with.
; BC = Current byte of target we're writing OAM memory to (usually shadow-OAM)

.spriteComposeLoop
  push af
  ld a, [W_OAM_SpritesBrk]
  inc a
  ld [W_OAM_SpritesBrk], a

; Write the next sprite's Y position.

  ld a, [W_ConfigBufferForMetaSpriteLoader_OAMYOffset]
  ld h, a
  ld a, [de]
  add h
  ld [bc], a
  inc bc
  inc de

; Write the next sprite's X position.

  ld a, [W_ConfigBufferForMetaSpriteLoader_OAMXOffset]
  ld h, a
  ld a, [de]
  add h
  ld [bc], a
  inc bc
  inc de

; Copy the tile pattern number we're interested in.

  ld a, [de]
  ld [bc], a
  inc bc
  inc de

; Calculate sprite attributes.
; First byte is a flag determining how the sprite and configuration
; attributes get mixed together. Second byte is OAM attribute data.
; 0 = Use metasprite config attributes
; 1 = Use individual sprite attributes
; 2 = Use individual sprite's high attributes && config's low attributes

  ld a, [de]
  or a
  jr nz, .spriteOverridesConfigAttributes
  ld a, [W_ConfigBufferForMetaSpriteLoader_HiAttribs]
  and $F8
  push bc
  ld b, a
  ld a, [W_ConfigBufferForMetaSpriteLoader_LowAttributes]
  and 7
  or b
  pop bc
  ld [bc], a
  inc de
  jr .spriteComposeLoopEpilogue

.spriteOverridesConfigAttributes
  cp 1
  jr nz, .useSpriteHiAttributes
  inc de
  ld a, [de]
  ld [bc], a
  jr .spriteComposeLoopEpilogue

.useSpriteHiAttributes
  inc de
  ld a, [de]
  and $F8
  push bc
  ld b, a
  ld a, [W_ConfigBufferForMetaSpriteLoader_LowAttributes]
  and 7
  or b
  pop bc
  ld [bc], a

.spriteComposeLoopEpilogue
  inc bc
  inc de
  pop af
  dec a
  jp nz, .spriteComposeLoop
  ret

.banktable
  db $2F, $2F, $2F, $A4, $30, $30, $30, $32

.addresstable
  dw $4000, $4E66, $68E8, $4000, $4000, $5162, $6606, $640C
