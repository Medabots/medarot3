INCLUDE "game/src/common/constants.asm"

SECTION "Tileset Variables 1", WRAM0[$C4A1]
W_MaliasCopyHistoryLength:: ds 1
W_MaliasBundleBitsCount:: ds 1
W_MaliasBundleBits:: ds 2
W_MaliasDecompressionHead:: ds 2

W_MaliasSourceBank EQU $C4EE ; This address is overutilised, so EQU is better.
W_MaliasDestinationAddress EQU $C4F0 ; This address is overutilised, so EQU is better.

SECTION "Load Malias-Compressed Tilesets", ROM0[$0983]
LoadMaliasGraphics::
  ld a, [$C4DA]
  ld [$C4DC], a
  ld a, 1
  ld [$C4DA], a
  ld a, BANK(TilesetInfoTable) ; Bank of table with banks and destination addresses for tile data.
  rst $10
  push bc
  pop de
  ld hl, TilesetInfoTable ; Address of table with banks and destination addresses for tile data.
  sla e
  rl d
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld [W_MaliasSourceBank], a
  ld a, [hli]
  ld [W_MaliasDestinationAddress], a
  ld a, [hli]
  ld [W_MaliasDestinationAddress + 1], a
  ld a, [hl]
  ld a, a ; The fuck?!
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld a, [W_MaliasSourceBank]
  rst $10
  ld hl, TilesetSourceAddressTable ; Address of table with source addresses for tile data.
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  pop de
  ld a, [W_MaliasDestinationAddress + 1]
  ld h, a
  ld a, [W_MaliasDestinationAddress]
  ld l, a
  ld a, [de]
  inc de
  jp .pointlessJump

.pointlessJump
  cp 0
  jp z, .decompressedOutput
  ld a, h
  ld [W_MaliasDecompressionHead], a
  ld a, l
  ld [W_MaliasDecompressionHead + 1], a
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  inc de

.beginBundle
  ld a, b
  or c
  jp z, .exit
  ld a, [de]
  ld [W_MaliasBundleBits + 1], a
  inc de
  ld a, [de]
  ld [W_MaliasBundleBits], a
  inc de
  ld a, $11
  ld [W_MaliasBundleBitsCount], a

.decodeBundleCommand
  ld a, b
  or c
  jp z, .exit
  ld a, [W_MaliasBundleBitsCount]
  dec a
  jp z, .beginBundle
  ld [W_MaliasBundleBitsCount], a
  push de
  ld a, [W_MaliasBundleBits]
  ld d, a
  ld a, [W_MaliasBundleBits + 1]
  ld e, a
  srl d
  ld a, d
  ld [W_MaliasBundleBits], a
  rr e
  ld a, e
  ld [W_MaliasBundleBits + 1], a
  jp c, .copyFromHistory
  pop de
  ld a, [W_MaliasDecompressionHead]
  ld h, a
  ld a, [W_MaliasDecompressionHead + 1]
  ld l, a
  di
  rst $20
  ld a, [de]
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, h
  ld [W_MaliasDecompressionHead], a
  ld a, l
  ld [W_MaliasDecompressionHead + 1], a
  dec bc
  inc de
  jp .decodeBundleCommand

.copyFromHistory
  pop de
  push de
  ld a, [de]
  ld l, a
  inc de
  ld a, [de]
  and 7
  ld h, a
  ld a, [de]
  srl a
  srl a
  srl a
  and $1F
  add 3
  ld [W_MaliasCopyHistoryLength], a
  ld a, h
  cpl
  ld d, a
  ld a, l
  cpl
  ld e, a
  ld a, [W_MaliasDecompressionHead]
  ld h, a
  ld a, [W_MaliasDecompressionHead + 1]
  ld l, a
  add hl, de
  push hl
  pop de
  ld a, [W_MaliasDecompressionHead]
  ld h, a
  ld a, [W_MaliasDecompressionHead + 1]
  ld l, a

.copyByteToHead
  di
  rst $20
  ld a, [de]
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec bc
  inc de
  ld a, [W_MaliasCopyHistoryLength]
  dec a
  ld [W_MaliasCopyHistoryLength], a
  jp nz, .copyByteToHead
  ld a, h
  ld [W_MaliasDecompressionHead], a
  ld a, l
  ld [W_MaliasDecompressionHead + 1], a
  pop de
  inc de
  inc de
  jp .decodeBundleCommand

.decompressedOutput
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  inc de

.decompressedByteCopy
  ld a, b
  or c
  jp z, .exit
  di
  rst $20
  ld a, [de]
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec bc
  jp .decompressedByteCopy

.exit
  ld a, [$C4DC]
  ld [$C4DA], a
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ret

SECTION "Parse tileset loading scripts", ROM0[$0d9d]
ParseTilesetScript::
  ld a, BANK(TilesetScripts0)
  ld [$c4dd], a
  rst $10
  ld a, b
  cp $02
  jr c, .asm_dae
  ld a, BANK(TilesetScripts1)
  ld [$c4dd], a
  rst $10
.asm_dae
  ld a, $00
  ld [W_CurrentVRAMBank], a
  ld [$ff4f], a
  ld a, b
  ld [$c4e0], a
  ld a, c
  ld [$c4e1], a
  ld hl, $4000 ; Assume it's always at the start of the bank for both
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
.asm_dc8
  ld a, [hl]
  cp $ff
  jp z, .asm_ed5
  cp $fe
  jp z, .asm_e19
  cp $fd
  jp z, .asm_e3f
  cp $fc
  jp z, .asm_e47
  cp $fb
  jp z, .asm_ebc
  ld a, [hli]
  ld [$c4b1], a
  ld a, [hli]
  ld [$c4ee], a
  ld a, [$c4e0]
  or a
  jr z, .asm_e11
  ld a, [$c4ee]
  cp $60
  jr nc, .asm_e05
  ld a, $28
  ld b, a
  ld a, [$c4e1]
  and $01
  add b
  ld [$c4b0], a
  jr .asm_e11
.asm_e05
  ld a, $2a
  ld b, a
  ld a, [$c4e1]
  and $01
  add b
  ld [$c4b0], a
.asm_e11
  push hl
  ld a, [$c4b0]
  rst $10
  jp .asm_e7d
.asm_e19: ; e19 (0:e19)
  inc hl
  ld a, [hli]
  push hl
  ld hl, $8000
  ld b, $00
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, h
  ld [$c4ad], a
  ld a, l
  ld [$c4ae], a
  pop hl
  jp .asm_dc8
.asm_e3f:
  inc hl
  ld a, [hli]
  ld [$c4b0], a
  jp .asm_dc8
.asm_e47:
  inc hl
  ld a, [hli]
  push hl
  push af
  ld a, $2e ; 'Preset' instructions are stored in a table here
  rst $10
  pop af
  ld hl, $5a74
  ld b, $00
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [hl]
  ld [$c4ee], a
  pop hl
  inc hl
  inc hl
  ld a, [hli]
  ld [$c4b1], a
  ld b, $00
  ld a, [$c4ee]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$c4ee], a
  ld a, [hl]
  rst $10
.asm_e7d
  ld hl, $4000 ; There is a tileset table at the start of every referenced bank
  ld b, $00
  ld a, [$c4ee]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  pop de
  ld a, [$c4b1]
  ld c, a
  ld a, [$c4ad]
  ld h, a
  ld a, [$c4ae]
  ld l, a
.asm_e9c
  ld b, $10
.asm_e9e
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .asm_e9e
  dec c
  jr nz, .asm_e9c
  ld a, h
  ld [$c4ad], a
  ld a, l
  ld [$c4ae], a
  ld a, [$c4dd]
  rst $10
  pop hl
  jp .asm_dc8
.asm_ebc:
  inc hl
  ld a, [hli]
  or a
  jr nz, .asm_ecb
  ld a, $00
  ld [W_CurrentVRAMBank], a
  ld [$ff4f], a
  jp .asm_dc8
.asm_ecb
  ld a, $01
  ld [W_CurrentVRAMBank], a
  ld [$ff4f], a
  jp .asm_dc8
.asm_ed5:
  ld a, $00
  ld [W_CurrentVRAMBank], a
  ld [$ff4f], a
  ret