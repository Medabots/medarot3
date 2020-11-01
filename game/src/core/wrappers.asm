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
