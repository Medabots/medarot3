INCLUDE "game/src/common/constants.asm"

SECTION "Tileset Variables 1", WRAM0[$C4A1]
W_MaliasCopyHistoryLength:: ds 1
W_MaliasBundleBitsCount:: ds 1
W_MaliasBundleBits:: ds 2
W_MaliasDecompressionHead:: ds 2

SECTION "Tileset Variables 2", WRAM0[$C4AD]
W_TilesetScript_VRAMAddress:: ds 2

SECTION "Tileset Variables 3", WRAM0[$C4B0]
W_TilesetScript_TileBank:: ds 1
W_TilesetScript_NumTiles:: ds 1

SECTION "Tileset Variables 4", WRAM0[$C4DD]
W_TilesetScript_Bank:: ds 1

W_TilesetScript_PointerIndex EQU $C4E0 ; This address is overutilised, so EQU is better.
W_MaliasSourceBank EQU $C4EE ; This address is overutilised, so EQU is better.
W_TilesetScript_TilesetPointerIndex EQU $C4EE ; This address is overutilised, so EQU is better.
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
  ld [W_TilesetScript_Bank], a
  rst $10
  ld a, b
  cp 2
  jr c, .dontUseSecondScriptBank
  ld a, BANK(TilesetScripts1)
  ld [W_TilesetScript_Bank], a
  rst $10

.dontUseSecondScriptBank
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld a, b
  ld [W_TilesetScript_PointerIndex], a
  ld a, c
  ld [W_TilesetScript_PointerIndex + 1], a
  ld hl, $4000 ; Assume it's always at the start of the bank for both.
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a

.tilesetScriptProcessingLoop
  ld a, [hl]
  cp $ff
  jp z, .endScriptParsing
  cp $fe
  jp z, .setVRAMIndex
  cp $fd
  jp z, .setTileBank
  cp $fc
  jp z, .loadPresetVariablesAndRender
  cp $fb
  jp z, .setVRAMBank
  ld a, [hli]
  ld [W_TilesetScript_NumTiles], a
  ld a, [hli]
  ld [W_TilesetScript_TilesetPointerIndex], a
  ld a, [W_TilesetScript_PointerIndex]
  or a
  jr z, .changeBank
  ld a, [W_TilesetScript_TilesetPointerIndex]
  cp $60
  jr nc, .useOneOfSecondTwoDefaultBanks

.useOneOfFirstTwoDefaultBanks
  ld a, $28
  ld b, a
  ld a, [W_TilesetScript_PointerIndex + 1]
  and 1
  add b
  ld [W_TilesetScript_TileBank], a
  jr .changeBank

.useOneOfSecondTwoDefaultBanks
  ld a, $2a
  ld b, a
  ld a, [W_TilesetScript_PointerIndex + 1]
  and 1
  add b
  ld [W_TilesetScript_TileBank], a

.changeBank
  push hl
  ld a, [W_TilesetScript_TileBank]
  rst $10
  jp .doRender

.setVRAMIndex
  inc hl
  ld a, [hli]
  push hl
  ld hl, $8000
  ld b, 0
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
  ld [W_TilesetScript_VRAMAddress], a
  ld a, l
  ld [W_TilesetScript_VRAMAddress + 1], a
  pop hl
  jp .tilesetScriptProcessingLoop

.setTileBank
  inc hl
  ld a, [hli]
  ld [W_TilesetScript_TileBank], a
  jp .tilesetScriptProcessingLoop

.loadPresetVariablesAndRender
  inc hl
  ld a, [hli]
  push hl
  push af
  ld a, $2e ; 'Preset' values are stored in a table here.
  rst $10
  pop af
  ld hl, $5a74
  ld b, 0
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
  ld [W_TilesetScript_TilesetPointerIndex], a
  pop hl
  inc hl
  inc hl
  ld a, [hli]
  ld [W_TilesetScript_NumTiles], a
  ld b, 0
  ld a, [W_TilesetScript_TilesetPointerIndex]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [W_TilesetScript_TilesetPointerIndex], a
  ld a, [hl]
  rst $10

.doRender
  ld hl, $4000 ; There is a tileset table at the start of every referenced bank
  ld b, 0
  ld a, [W_TilesetScript_TilesetPointerIndex]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  pop de
  ld a, [W_TilesetScript_NumTiles]
  ld c, a
  ld a, [W_TilesetScript_VRAMAddress]
  ld h, a
  ld a, [W_TilesetScript_VRAMAddress + 1]
  ld l, a

.drawTilesLoop
  ld b, $10

.drawTileLoop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .drawTileLoop

  dec c
  jr nz, .drawTilesLoop

  ld a, h
  ld [W_TilesetScript_VRAMAddress], a
  ld a, l
  ld [W_TilesetScript_VRAMAddress + 1], a
  ld a, [W_TilesetScript_Bank]
  rst $10
  pop hl
  jp .tilesetScriptProcessingLoop

.setVRAMBank
  inc hl
  ld a, [hli]
  or a
  jr nz, .vramBankOnePlz
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  jp .tilesetScriptProcessingLoop

.vramBankOnePlz
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  jp .tilesetScriptProcessingLoop

.endScriptParsing
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ret
