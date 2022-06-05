INCLUDE "game/src/common/constants.asm"

; Wrapper functions (useful for maintaining bank information when swapping)
SECTION "Gfx Function Wrappers", ROM0[$3394]
WrapDecompressTilemap0::
  call DecompressTilemap0
  rst $18
  ret

WrapDecompressTilemap1::
  call DecompressTilemap1
  rst $18
  ret

WrapDecompressAttribmap0::
  call DecompressAttribmap0
  rst $18
  ret

WrapDecompressAttribmap1::
  call DecompressAttribmap1
  rst $18
  ret

WrapLoadMaliasGraphics::
  call LoadMaliasGraphics
  rst $18
  ret

SECTION "RAM Initiation Wrappers", ROM0[$33F3]
WrapClearVRAM::
  ld a, BANK(ClearVRAM)
  rst $10
  call ClearVRAM
  rst $18
  ret

WrapClearWRAM::
  ld a, BANK(ClearWRAM)
  rst $10
  ld a, [W_ReturnBank]
  push af
  call ClearWRAM
  pop af
  ld [W_ReturnBank], a
  rst $18
  ret

SECTION "Load Palette Indexes Wrappers", ROM0[$33BC]
WrapCGBLoadBGPPaletteIndexes::
  call CGBLoadBGPPaletteIndexes
  rst $18
  ret

WrapCGBLoadOBPPaletteIndexes::
  call CGBLoadOBPPaletteIndexes
  rst $18
  ret

SECTION "Fade-related Wrappers 1", ROM0[$33CB]
WrapSetupPalswapAnimation::
  call SetupPalswapAnimation
  rst $18
  ret

SECTION "Gfx Function Wrappers 2", ROM0[$33D5]
WrapDecompressTilemap0ScrollAdjusted::
  call DecompressTilemap0ScrollAdjusted
  rst $18
  ret

WrapDecompressAttribmap0ScrollAdjusted::
  call DecompressAttribmap0ScrollAdjusted
  rst $18
  ret

SECTION "Main Script Init Functions", ROM0[$347D]
WrapInitiateMainScript::
  call InitiateMainScript
  rst $18
  ret

WrapInitiateMainScriptAlternate::
  call InitiateMainScriptAlternate
  rst $18
  ret

WrapMainScriptProcessor::
  call MainScriptProcessor
  rst $18
  ret

SECTION "List Buffering Wrapper", ROM0[$34DC]
WrapBufferTextFromList::
  call BufferTextFromList
  rst $18
  ret

SECTION "Fade-related Wrappers 2", ROM0[$3513]
WrapRestageDestinationBGPalettesForFade::
  call RestageDestinationBGPalettesForFade
  rst $18
  ret

WrapRestageDestinationOBPalettesForFade::
  call RestageDestinationOBPalettesForFade
  rst $18
  ret

SECTION "Item Helper Function Wrappers", ROM0[$356A]
WrapIsItemInInventory::
  push af
  ld a, BANK(IsItemInInventory)
  rst $10
  pop af
  call IsItemInInventory
  push af
  rst $18
  pop af
  ret

SECTION "Load Part Type Reward Wrapper", ROM0[$3731]
WrapEncounterLoadRewardPartTypeText::
  push af
  ld a, $15
  rst $10
  pop af
  call EncounterLoadRewardPartTypeText
  rst $18
  ret

SECTION "Non-Kanji Character Drawing Wrapper", ROM0[$3765]
WrapMainScriptDrawNonKanjiCharacter::
  call MainScriptDrawNonKanjiCharacter
  rst $18
  ret
