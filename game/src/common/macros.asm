; macro for putting a byte then a word
MACRO dbw
  db \1
  dw \2
  ENDM

; macro for putting a word then a byte
MACRO dwb
  dw \1
  db \2
  ENDM

MACRO dbww
  db \1
  dw \2
  dw \3
  ENDM

MACRO dbwb
  db \1
  dw \2
  db \3
  ENDM

MACRO TableStart
  RSRESET
  ENDM

; TableAddressEntry TableName,ID
; Note that duplicate entries will be overridden by the latest entry
MACRO TableAddressEntry
  PUSHO
  OPT Wno-purge
  IF DEF(\1IDX_\2)
    PURGE \1IDX_\2
  ENDC
  DEF \1IDX_\2 RB
  dw \2
  EXPORT \1IDX_\2
  POPO
  ENDM

MACRO TableAddressBankEntry
  PUSHO
  OPT Wno-purge
  IF DEF(\1IDX_\2)
    PURGE \1IDX_\2
  ENDC
  DEF \1IDX_\2 RB
  dwb \2, BANK(\2)
  EXPORT \1IDX_\2
  POPO
  ENDM

MACRO dcolor
  dw ((\3) << 10) + ((\2) << 5) + (\1)
  ENDM
    
;CGB palette color indexes are stored as big-endian words for some reason
MACRO dpalette
  dw (\1 >> 8) | ((\1 & $FF) << 8)
  dw (\2 >> 8) | ((\2 & $FF) << 8)
  dw (\3 >> 8) | ((\3 & $FF) << 8)
  dw (\4 >> 8) | ((\4 & $FF) << 8)
  dw (\5 >> 8) | ((\5 & $FF) << 8)
  dw (\6 >> 8) | ((\6 & $FF) << 8)
  dw (\7 >> 8) | ((\7 & $FF) << 8)
  dw (\8 >> 8) | ((\8 & $FF) << 8)
  ENDM

MACRO padend
  .end\@
    REPT \1 - .end\@
      nop
    ENDR
  ENDM

MACRO creditconf
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ENDM

MACRO creditconfset
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, \2
  ld [hl], a
  ENDM

MACRO creditconfreset
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  xor a
  ld [hl], a
  ENDM

MACRO creditconfinc
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  inc a
  ld [hl], a
  ENDM

MACRO creditconfdec
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  dec a
  ld [hl], a
  ENDM

MACRO creditconfsetfroma
  push af
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  pop af
  ld [hl], a
  ENDM

MACRO creditconftextcheck
  ld de, M_CreditConfigTextIndex
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  cp $FF
  ENDM

MACRO credittext
  ld de, M_CreditConfigTextIndex
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  ld hl, PtrListCredits
  rst $30
  ld de, \1
  add hl, de
  ENDM

MACRO dsample
  db BANK(\1) ;Fragment bank
  dw \2 ;Sample count?
ENDM
