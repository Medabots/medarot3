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
