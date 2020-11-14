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
