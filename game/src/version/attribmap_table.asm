INCLUDE "game/src/common/macros.asm"

SECTION "Attribmap Table 00", ROMX[$4000], BANK[$37]
AttribmapTable00::
  dw Attribmap00_00 ; 00
  dw Attribmap00_01 ; 01
  dw Attribmap00_02 ; 02
  dw Attribmap00_02 ; 03 (00_03)
  dw Attribmap00_04 ; 04
  dw Attribmap00_04 ; 05 (00_05)
  dw Attribmap00_04 ; 06 (00_06)
  dw Attribmap00_04 ; 07 (00_07)
  dw Attribmap00_04 ; 08 (00_08)
  dw Attribmap00_04 ; 09 (00_09)
  dw Attribmap00_04 ; 0A (00_0A)
  dw Attribmap00_04 ; 0B (00_0B)
  dw Attribmap00_0C ; 0C
  dw Attribmap00_0C ; 0D (00_0D)
  dw Attribmap00_0C ; 0E (00_0E)
  dw Attribmap00_0C ; 0F (00_0F)
  dw Attribmap00_0C ; 10 (00_10)
  dw Attribmap00_11 ; 11
  dw Attribmap00_12 ; 12
  dw Attribmap00_13 ; 13
  dw Attribmap00_14 ; 14
  dw Attribmap00_15 ; 15
  dw Attribmap00_16 ; 16
  dw Attribmap00_17 ; 17
  dw Attribmap00_18 ; 18
  dw Attribmap00_19 ; 19
  dw Attribmap00_1A ; 1A
  dw Attribmap00_1A ; 1B (00_1B)
  dw Attribmap00_1A ; 1C (00_1C)
  dw Attribmap00_1A ; 1D (00_1D)
  dw Attribmap00_1A ; 1E (00_1E)
  dw Attribmap00_1F ; 1F
  dw Attribmap00_20 ; 20
  dw Attribmap00_21 ; 21
  dw Attribmap00_22 ; 22
  dw Attribmap00_23 ; 23
  dw Attribmap00_23 ; 24 (00_24)
  dw Attribmap00_23 ; 25 (00_25)
  dw Attribmap00_23 ; 26 (00_26)
  dw Attribmap00_23 ; 27 (00_27)
  dw Attribmap00_23 ; 28 (00_28)
  dw Attribmap00_23 ; 29 (00_29)
  dw Attribmap00_23 ; 2A (00_2A)
  dw Attribmap00_23 ; 2B (00_2B)
  dw Attribmap00_23 ; 2C (00_2C)
  dw Attribmap00_2D ; 2D
  dw Attribmap00_2D ; 2E (00_2E)
  dw Attribmap00_2F ; 2F
  dw Attribmap00_30 ; 30
  dw Attribmap00_31 ; 31
  dw Attribmap00_31 ; 32 (00_32)
  dw Attribmap00_31 ; 33 (00_33)
  dw Attribmap00_31 ; 34 (00_34)
  dw Attribmap00_31 ; 35 (00_35)
  dw Attribmap00_36 ; 36
  dw Attribmap00_37 ; 37
  dw Attribmap00_37 ; 38 (00_38)
  dw Attribmap00_39 ; 39
  dw Attribmap00_3A ; 3A
  dw Attribmap00_3A ; 3B (00_3B)
  dw Attribmap00_3C ; 3C
  dw Attribmap00_3C ; 3D (00_3D)
  dw Attribmap00_3E ; 3E
  dw Attribmap00_3E ; 3F (00_3F)
  dw Attribmap00_3E ; 40 (00_40)
  dw Attribmap00_3E ; 41 (00_41)
  dw Attribmap00_42 ; 42
  dw Attribmap00_43 ; 43
  dw Attribmap00_44 ; 44
  dw Attribmap00_45 ; 45
  dw Attribmap00_46 ; 46
  dw Attribmap00_46 ; 47 (00_47)
  dw Attribmap00_46 ; 48 (00_48)
  dw Attribmap00_49 ; 49
  dw Attribmap00_49 ; 4A (00_4A)
  dw Attribmap00_49 ; 4B (00_4B)
  dw Attribmap00_4C ; 4C
  dw Attribmap00_4D ; 4D
  dw Attribmap00_4D ; 4E (00_4E)
  dw Attribmap00_4F ; 4F (Copy of 4D, but modified for patch)
  dw Attribmap00_50 ; 50
  dw Attribmap00_51 ; 51
  dw Attribmap00_52 ; 52
  dw Attribmap00_53 ; 53
  dw Attribmap00_53 ; 54 (00_54)
  dw Attribmap00_55 ; 55
  dw Attribmap00_56 ; 56
  dw Attribmap00_57 ; 57
  dw Attribmap00_58 ; 58
  dw Attribmap00_59 ; 59
  dw Attribmap00_5A ; 5A
  dw Attribmap00_5B ; 5B
  dw Attribmap00_5C ; 5C
  dw Attribmap00_5D ; 5D
  dw Attribmap00_5E ; 5E
  dw Attribmap00_5F ; 5F
  dw Attribmap00_60 ; 60
  dw Attribmap00_61 ; 61
  dw Attribmap00_61 ; 62 (00_62)
  dw Attribmap00_61 ; 63 (00_63)
  dw Attribmap00_61 ; 64 (00_64)
  dw Attribmap00_61 ; 65 (00_65)
  dw Attribmap00_61 ; 66 (00_66)
  dw Attribmap00_61 ; 67 (00_67)
  dw Attribmap00_61 ; 68 (00_68)
  dw Attribmap00_69 ; 69
  dw Attribmap00_69 ; 6A (00_6A)
  dw Attribmap00_69 ; 6B (00_6B)
  dw Attribmap00_69 ; 6C (00_6C)
  dw Attribmap00_69 ; 6D (00_6D)
  dw Attribmap00_69 ; 6E (00_6E)
  dw Attribmap00_6F ; 6F
  dw Attribmap00_6F ; 70 (00_70)
  dw Attribmap00_71 ; 71
  dw Attribmap00_71 ; 72 (00_72)
  dw Attribmap00_71 ; 73 (00_73)
  dw Attribmap00_71 ; 74 (00_74)
  dw Attribmap00_71 ; 75 (00_75)
  dw Attribmap00_71 ; 76 (00_76)
  dw Attribmap00_71 ; 77 (00_77)
  dw Attribmap00_71 ; 78 (00_78)
  dw Attribmap00_71 ; 79 (00_79)
  dw Attribmap00_71 ; 7A (00_7A)
  dw Attribmap00_71 ; 7B (00_7B)
  dw Attribmap00_71 ; 7C (00_7C)
  dw Attribmap00_71 ; 7D (00_7D)
  dw Attribmap00_7E ; 7E
  dw Attribmap00_7F ; 7F
  dw Attribmap00_7F ; 80 (00_80)
  dw Attribmap00_7F ; 81 (00_81)
  dw Attribmap00_7F ; 82 (00_82)
  dw Attribmap00_7F ; 83 (00_83)
  dw Attribmap00_7F ; 84 (00_84)
  dw Attribmap00_7F ; 85 (00_85)
  dw Attribmap00_7F ; 86 (00_86)
  dw Attribmap00_7F ; 87 (00_87)
  dw Attribmap00_7F ; 88 (00_88)
  dw Attribmap00_7F ; 89 (00_89)
  dw Attribmap00_7F ; 8A (00_8A)
  dw Attribmap00_7F ; 8B (00_8B)
  dw Attribmap00_7F ; 8C (00_8C)
  dw Attribmap00_7F ; 8D (00_8D)
  dw Attribmap00_7F ; 8E (00_8E)
  dw Attribmap00_7F ; 8F (00_8F)
  dw Attribmap00_7F ; 90 (00_90)
  dw Attribmap00_91 ; 91
  dw Attribmap00_92 ; 92
  dw Attribmap00_93 ; 93
  dw Attribmap00_94 ; 94
  dw Attribmap00_95 ; 95
  dw Attribmap00_96 ; 96
  dw Attribmap00_97 ; 97
  dw Attribmap00_98 ; 98
  dw Attribmap00_99 ; 99
  dw Attribmap00_9A ; 9A
  dw Attribmap00_9B ; 9B
  dw Attribmap00_9C ; 9C
  dw Attribmap00_9D ; 9D
  dw Attribmap00_9D ; 9E (00_9E)
  dw Attribmap00_9D ; 9F (00_9F)
  dw Attribmap00_9D ; A0 (00_A0)
  dw Attribmap00_A1 ; A1
  dw Attribmap00_A2 ; A2
  dw Attribmap00_A3 ; A3
  dw Attribmap00_A4 ; A4
  dw Attribmap00_A5 ; A5
  dw Attribmap00_A6 ; A6
  dw Attribmap00_A7 ; A7
  dw Attribmap00_A8 ; A8
  dw Attribmap00_A9 ; A9
  dw Attribmap00_AA ; AA
  dw Attribmap00_AB ; AB
  dw Attribmap00_AC ; AC
  dw Attribmap00_AC ; AD (00_AD)
  dw Attribmap00_AC ; AE (00_AE)
  dw Attribmap00_AC ; AF (00_AF)
  dw Attribmap00_AC ; B0 (00_B0)
  dw Attribmap00_B1 ; B1
  dw Attribmap00_B2 ; B2
  dw Attribmap00_B3 ; B3
  dw Attribmap00_B4 ; B4
  dw Attribmap00_B5 ; B5
  dw Attribmap00_B6 ; B6
  dw Attribmap00_B7 ; B7
  dw Attribmap00_B8 ; B8
  dw Attribmap00_B9 ; B9
  dw Attribmap00_BA ; BA
  dw Attribmap00_BB ; BB
  dw Attribmap00_BC ; BC
  dw Attribmap00_BC ; BD (00_BD)
  dw Attribmap00_BC ; BE (00_BE)
  dw Attribmap00_BC ; BF (00_BF)
  dw Attribmap00_BC ; C0 (00_C0)
  dw Attribmap00_C1 ; C1
  dw Attribmap00_C2 ; C2
  dw Attribmap00_C2 ; C3 (00_C3)
  dw Attribmap00_C2 ; C4 (00_C4)
  dw AttribmapTable00Terminator ; C5
  dw AttribmapTable00Terminator ; C6
  dw AttribmapTable00Terminator ; C7
  dw AttribmapTable00Terminator ; C8
  dw AttribmapTable00Terminator ; C9
  dw AttribmapTable00Terminator ; CA
  dw AttribmapTable00Terminator ; CB
  dw AttribmapTable00Terminator ; CC
  dw AttribmapTable00Terminator ; CD
  dw AttribmapTable00Terminator ; CE
  dw AttribmapTable00Terminator ; CF
  dw AttribmapTable00Terminator ; D0
  dw AttribmapTable00Terminator ; D1
  dw AttribmapTable00Terminator ; D2
  dw AttribmapTable00Terminator ; D3
  dw AttribmapTable00Terminator ; D4
  dw AttribmapTable00Terminator ; D5
  dw AttribmapTable00Terminator ; D6
  dw AttribmapTable00Terminator ; D7
  dw AttribmapTable00Terminator ; D8
  dw AttribmapTable00Terminator ; D9
  dw AttribmapTable00Terminator ; DA
  dw AttribmapTable00Terminator ; DB
  dw AttribmapTable00Terminator ; DC
  dw AttribmapTable00Terminator ; DD
  dw AttribmapTable00Terminator ; DE
  dw AttribmapTable00Terminator ; DF
  dw AttribmapTable00Terminator ; E0
  dw AttribmapTable00Terminator ; E1
  dw AttribmapTable00Terminator ; E2
  dw AttribmapTable00Terminator ; E3
  dw AttribmapTable00Terminator ; E4
  dw AttribmapTable00Terminator ; E5
  dw AttribmapTable00Terminator ; E6
  dw AttribmapTable00Terminator ; E7
  dw AttribmapTable00Terminator ; E8
  dw AttribmapTable00Terminator ; E9
  dw AttribmapTable00Terminator ; EA
  dw AttribmapTable00Terminator ; EB
  dw AttribmapTable00Terminator ; EC
  dw AttribmapTable00Terminator ; ED
  dw AttribmapTable00Terminator ; EE
  dw AttribmapTable00Terminator ; EF
  dw AttribmapTable00Terminator ; F0
  dw AttribmapTable00Terminator ; F1
  dw AttribmapTable00Terminator ; F2
  dw AttribmapTable00Terminator ; F3
  dw AttribmapTable00Terminator ; F4
  dw AttribmapTable00Terminator ; F5
  dw AttribmapTable00Terminator ; F6
  dw AttribmapTable00Terminator ; F7
  dw AttribmapTable00Terminator ; F8
  dw AttribmapTable00Terminator ; F9
  dw AttribmapTable00Terminator ; FA
  dw AttribmapTable00Terminator ; FB
  dw AttribmapTable00Terminator ; FC
  dw AttribmapTable00Terminator ; FD
  dw AttribmapTable00Terminator ; FE
  dw AttribmapTable00Terminator ; FF
Attribmap00_00::
  INCBIN "./build/attribmaps/0000.map"
Attribmap00_01::
  INCBIN "./build/attribmaps/0001.map"
Attribmap00_02::
  INCBIN "./build/attribmaps/0002.map"
Attribmap00_04::
  INCBIN "./build/attribmaps/0004.map"
Attribmap00_0C::
  INCBIN "./build/attribmaps/000C.map"
Attribmap00_11::
  INCBIN "./build/attribmaps/0011.map"
Attribmap00_12::
  INCBIN "./build/attribmaps/0012.map"
Attribmap00_13::
  INCBIN "./build/attribmaps/0013.map"
Attribmap00_14::
  INCBIN "./build/attribmaps/0014.map"
Attribmap00_15::
  INCBIN "./build/attribmaps/0015.map"
Attribmap00_16::
  INCBIN "./build/attribmaps/0015.map"
Attribmap00_17::
  INCBIN "./build/attribmaps/0015.map"
Attribmap00_18::
  INCBIN "./build/attribmaps/0018.map"
Attribmap00_19::
  INCBIN "./build/attribmaps/0019.map"
Attribmap00_1A::
  INCBIN "./build/attribmaps/001A.map"
Attribmap00_1F::
  INCBIN "./build/attribmaps/001F.map"
Attribmap00_20::
  INCBIN "./build/attribmaps/0020.map"
Attribmap00_21::
  INCBIN "./build/attribmaps/0021.map"
Attribmap00_22::
  INCBIN "./build/attribmaps/001A.map"
Attribmap00_23::
  INCBIN "./build/attribmaps/0023.map"
Attribmap00_2D::
  INCBIN "./build/attribmaps/002D.map"
Attribmap00_2F::
  INCBIN "./build/attribmaps/002F.map"
Attribmap00_30::
  INCBIN "./build/attribmaps/0030.map"
Attribmap00_31::
  INCBIN "./build/attribmaps/0031.map"
Attribmap00_36::
  INCBIN "./build/attribmaps/0036.map"
Attribmap00_37::
  INCBIN "./build/attribmaps/0037.map"
Attribmap00_39::
  INCBIN "./build/attribmaps/0039.map"
Attribmap00_3A::
  INCBIN "./build/attribmaps/003A.map"
Attribmap00_3C::
  INCBIN "./build/attribmaps/003C.map"
Attribmap00_3E::
  INCBIN "./build/attribmaps/003E.map"
Attribmap00_42::
  INCBIN "./build/attribmaps/0042.map"
Attribmap00_43::
  INCBIN "./build/attribmaps/0043.map"
Attribmap00_44::
  INCBIN "./build/attribmaps/0044.map"
Attribmap00_45::
  INCBIN "./build/attribmaps/0045.map"
Attribmap00_46::
  INCBIN "./build/attribmaps/0046.map"
Attribmap00_49::
  INCBIN "./build/attribmaps/0049.map"
Attribmap00_4C::
  INCBIN "./build/attribmaps/004C.map"
Attribmap00_4D::
  INCBIN "./build/attribmaps/004D.map"
Attribmap00_4F:: ; Added, item screen attribmap
  INCBIN "./build/attribmaps/ItemScreen.map"
Attribmap00_50::
  INCBIN "./build/attribmaps/0050.map"
Attribmap00_51::
  INCBIN "./build/attribmaps/0051.map"
Attribmap00_52::
  INCBIN "./build/attribmaps/0052.map"
Attribmap00_53::
  INCBIN "./build/attribmaps/0053.map"
Attribmap00_55::
  INCBIN "./build/attribmaps/0055.map"
Attribmap00_56::
  INCBIN "./build/attribmaps/0056.map"
Attribmap00_57::
  INCBIN "./build/attribmaps/0057.map"
Attribmap00_58::
  INCBIN "./build/attribmaps/0058.map"
Attribmap00_59::
  INCBIN "./build/attribmaps/0059.map"
Attribmap00_5A::
  INCBIN "./build/attribmaps/005A.map"
Attribmap00_5B::
  INCBIN "./build/attribmaps/005B.map"
Attribmap00_5C::
  INCBIN "./build/attribmaps/005C.map"
Attribmap00_5D::
  INCBIN "./build/attribmaps/005D.map"
Attribmap00_5E::
  INCBIN "./build/attribmaps/005E.map"
Attribmap00_5F::
  INCBIN "./build/attribmaps/005F.map"
Attribmap00_60::
  INCBIN "./build/attribmaps/0060.map"
Attribmap00_61::
  INCBIN "./build/attribmaps/0061.map"
Attribmap00_69::
  INCBIN "./build/attribmaps/0069.map"
Attribmap00_6F::
  INCBIN "./build/attribmaps/006F.map"
Attribmap00_71::
  INCBIN "./build/attribmaps/0071.map"
Attribmap00_7E::
  INCBIN "./build/attribmaps/007E.map"
Attribmap00_7F::
  INCBIN "./build/attribmaps/007F.map"
Attribmap00_91::
  INCBIN "./build/attribmaps/0091.map"
Attribmap00_92::
  INCBIN "./build/attribmaps/0092.map"
Attribmap00_93::
  INCBIN "./build/attribmaps/0093.map"
Attribmap00_94::
  INCBIN "./build/attribmaps/0094.map"
Attribmap00_95::
  INCBIN "./build/attribmaps/0095.map"
Attribmap00_96::
  INCBIN "./build/attribmaps/0096.map"
Attribmap00_97::
  INCBIN "./build/attribmaps/0097.map"
Attribmap00_98::
  INCBIN "./build/attribmaps/0098.map"
Attribmap00_99::
  INCBIN "./build/attribmaps/0099.map"
Attribmap00_9A::
  INCBIN "./build/attribmaps/009A.map"
Attribmap00_9B::
  INCBIN "./build/attribmaps/009B.map"
Attribmap00_9C::
  INCBIN "./build/attribmaps/009C.map"
Attribmap00_9D::
  INCBIN "./build/attribmaps/009D.map"
Attribmap00_A1::
  INCBIN "./build/attribmaps/00A1.map"
Attribmap00_A2::
  INCBIN "./build/attribmaps/00A2.map"
Attribmap00_A3::
  INCBIN "./build/attribmaps/00A3.map"
Attribmap00_A4::
  INCBIN "./build/attribmaps/00A4.map"
Attribmap00_A5::
  INCBIN "./build/attribmaps/00A5.map"
Attribmap00_A6::
  INCBIN "./build/attribmaps/00A6.map"
Attribmap00_A7::
  INCBIN "./build/attribmaps/00A7.map"
Attribmap00_A8::
  INCBIN "./build/attribmaps/00A8.map"
Attribmap00_A9::
  INCBIN "./build/attribmaps/00A9.map"
Attribmap00_AA::
  INCBIN "./build/attribmaps/00AA.map"
Attribmap00_AB::
  INCBIN "./build/attribmaps/00AB.map"
Attribmap00_AC::
  INCBIN "./build/attribmaps/00AC.map"
Attribmap00_B1::
  INCBIN "./build/attribmaps/00AC.map"
Attribmap00_B2::
  INCBIN "./build/attribmaps/00B2.map"
Attribmap00_B3::
  INCBIN "./build/attribmaps/00B3.map"
Attribmap00_B4::
  INCBIN "./build/attribmaps/00B4.map"
Attribmap00_B5::
  INCBIN "./build/attribmaps/00B5.map"
Attribmap00_B6::
  INCBIN "./build/attribmaps/00B6.map"
Attribmap00_B7::
  INCBIN "./build/attribmaps/00B7.map"
Attribmap00_B8::
  INCBIN "./build/attribmaps/00B8.map"
Attribmap00_B9::
  INCBIN "./build/attribmaps/00B9.map"
Attribmap00_BA::
  INCBIN "./build/attribmaps/00BA.map"
Attribmap00_BB::
  INCBIN "./build/attribmaps/00BB.map"
Attribmap00_BC::
  INCBIN "./build/attribmaps/00BC.map"
Attribmap00_C1::
  INCBIN "./build/attribmaps/00C1.map"
Attribmap00_C2::
  INCBIN "./build/attribmaps/00C2.map"
AttribmapTable00Terminator::

SECTION "Attribmap Table 01", ROMX[$4000], BANK[$38]
AttribmapTable01::
  dw Attribmap01_00 ; 00
  dw Attribmap01_01 ; 01
  dw Attribmap01_02 ; 02
  dw Attribmap01_02 ; 03 (01_03)
  dw Attribmap01_04 ; 04
  dw Attribmap01_05 ; 05
  dw Attribmap01_06 ; 06
  dw Attribmap01_07 ; 07
  dw Attribmap01_08 ; 08
  dw Attribmap01_08 ; 09 (01_09)
  dw Attribmap01_08 ; 0A (01_0A)
  dw Attribmap01_08 ; 0B (01_0B)
  dw Attribmap01_08 ; 0C (01_0C)
  dw Attribmap01_08 ; 0D (01_0D)
  dw Attribmap01_08 ; 0E (01_0E)
  dw Attribmap01_08 ; 0F (01_0F)
  dw Attribmap01_08 ; 10 (01_10)
  dw Attribmap01_11 ; 11
  dw Attribmap01_12 ; 12
  dw Attribmap01_13 ; 13
  dw Attribmap01_14 ; 14
  dw Attribmap01_15 ; 15
  dw Attribmap01_16 ; 16
  dw Attribmap01_17 ; 17
  dw Attribmap01_18 ; 18
  dw Attribmap01_19 ; 19
  dw Attribmap01_1A ; 1A
  dw Attribmap01_1B ; 1B
  dw Attribmap01_1C ; 1C
  dw Attribmap01_1D ; 1D
  dw Attribmap01_1E ; 1E
  dw Attribmap01_1F ; 1F
  dw Attribmap01_20 ; 20
  dw Attribmap01_21 ; 21
  dw Attribmap01_22 ; 22
  dw Attribmap01_23 ; 23
  dw Attribmap01_24 ; 24
  dw Attribmap01_25 ; 25
  dw Attribmap01_26 ; 26
  dw Attribmap01_27 ; 27
  dw Attribmap01_27 ; 28 (01_28)
  dw Attribmap01_27 ; 29 (01_29)
  dw Attribmap01_27 ; 2A (01_2A)
  dw Attribmap01_27 ; 2B (01_2B)
  dw Attribmap01_27 ; 2C (01_2C)
  dw Attribmap01_27 ; 2D (01_2D)
  dw Attribmap01_27 ; 2E (01_2E)
  dw Attribmap01_27 ; 2F (01_2F)
  dw Attribmap01_27 ; 30 (01_30)
  dw Attribmap01_31 ; 31
  dw Attribmap01_32 ; 32
  dw Attribmap01_33 ; 33
  dw Attribmap01_34 ; 34
  dw Attribmap01_35 ; 35
  dw Attribmap01_36 ; 36
  dw Attribmap01_37 ; 37
  dw Attribmap01_38 ; 38
  dw Attribmap01_39 ; 39
  dw Attribmap01_3A ; 3A
  dw Attribmap01_3B ; 3B
  dw Attribmap01_3C ; 3C
  dw Attribmap01_3D ; 3D
  dw Attribmap01_3E ; 3E
  dw Attribmap01_3F_GAMEVERSION ; 3F
  dw Attribmap01_40 ; 40
  dw Attribmap01_41 ; 41
  dw Attribmap01_42 ; 42
  dw Attribmap01_43 ; 43
  dw Attribmap01_44 ; 44
  dw Attribmap01_45_GAMEVERSION ; 45
  dw Attribmap01_46_GAMEVERSION ; 46
  dw Attribmap01_47_GAMEVERSION ; 47
  dw Attribmap01_48_GAMEVERSION ; 48
  dw Attribmap01_49_GAMEVERSION ; 49
  dw Attribmap01_4A_GAMEVERSION ; 4A
  dw Attribmap01_4B_GAMEVERSION ; 4B
  dw Attribmap01_4C_GAMEVERSION ; 4C
  dw Attribmap01_4D_GAMEVERSION ; 4D
  dw Attribmap01_4E_GAMEVERSION ; 4E
  dw Attribmap01_4F ; 4F
  dw Attribmap01_50 ; 50
  dw Attribmap01_51 ; 51
  dw Attribmap01_52 ; 52
  dw Attribmap01_53 ; 53
  dw Attribmap01_54 ; 54
  dw Attribmap01_55 ; 55
  dw Attribmap01_56 ; 56
  dw Attribmap01_56 ; 57 (01_57)
  dw Attribmap01_56 ; 58 (01_58)
  dw Attribmap01_56 ; 59 (01_59)
  dw Attribmap01_56 ; 5A (01_5A)
  dw Attribmap01_56 ; 5B (01_5B)
  dw Attribmap01_56 ; 5C (01_5C)
  dw Attribmap01_56 ; 5D (01_5D)
  dw Attribmap01_56 ; 5E (01_5E)
  dw Attribmap01_56 ; 5F (01_5F)
  dw Attribmap01_56 ; 60 (01_60)
  dw Attribmap01_56 ; 61 (01_61)
  dw Attribmap01_56 ; 62 (01_62)
  dw Attribmap01_56 ; 63 (01_63)
  dw Attribmap01_56 ; 64 (01_64)
  dw Attribmap01_56 ; 65 (01_65)
  dw Attribmap01_56 ; 66 (01_66)
  dw Attribmap01_56 ; 67 (01_67)
  dw Attribmap01_56 ; 68 (01_68)
  dw Attribmap01_56 ; 69 (01_69)
  dw Attribmap01_56 ; 6A (01_6A)
  dw Attribmap01_56 ; 6B (01_6B)
  dw Attribmap01_56 ; 6C (01_6C)
  dw Attribmap01_56 ; 6D (01_6D)
  dw Attribmap01_56 ; 6E (01_6E)
  dw Attribmap01_56 ; 6F (01_6F)
  dw Attribmap01_56 ; 70 (01_70)
  dw Attribmap01_56 ; 71 (01_71)
  dw Attribmap01_56 ; 72 (01_72)
  dw Attribmap01_56 ; 73 (01_73)
  dw Attribmap01_56 ; 74 (01_74)
  dw Attribmap01_56 ; 75 (01_75)
  dw Attribmap01_56 ; 76 (01_76)
  dw Attribmap01_56 ; 77 (01_77)
  dw Attribmap01_56 ; 78 (01_78)
  dw Attribmap01_56 ; 79 (01_79)
  dw Attribmap01_56 ; 7A (01_7A)
  dw Attribmap01_56 ; 7B (01_7B)
  dw Attribmap01_56 ; 7C (01_7C)
  dw Attribmap01_56 ; 7D (01_7D)
  dw Attribmap01_56 ; 7E (01_7E)
  dw Attribmap01_56 ; 7F (01_7F)
  dw Attribmap01_56 ; 80 (01_80)
  dw Attribmap01_81 ; 81
  dw Attribmap01_82 ; 82
  dw Attribmap01_83 ; 83
  dw Attribmap01_84 ; 84
  dw Attribmap01_85 ; 85
  dw Attribmap01_86 ; 86
  dw Attribmap01_87 ; 87
  dw Attribmap01_88 ; 88
  dw Attribmap01_89 ; 89
  dw Attribmap01_8A ; 8A
  dw Attribmap01_8B ; 8B
  dw Attribmap01_8C ; 8C
  dw Attribmap01_8D ; 8D
  dw Attribmap01_8E ; 8E
  dw Attribmap01_8F ; 8F
  dw Attribmap01_90 ; 90
  dw Attribmap01_91 ; 91
  dw Attribmap01_92 ; 92
  dw Attribmap01_93 ; 93
  dw Attribmap01_94 ; 94
  dw Attribmap01_95 ; 95
  dw Attribmap01_96 ; 96
  dw Attribmap01_97 ; 97
  dw Attribmap01_98 ; 98
  dw Attribmap01_99 ; 99
  dw Attribmap01_9A ; 9A
  dw Attribmap01_9B ; 9B
  dw Attribmap01_9C ; 9C
  dw Attribmap01_9D ; 9D
  dw Attribmap01_9D ; 9E (01_9E)
  dw Attribmap01_9D ; 9F (01_9F)
  dw Attribmap01_9D ; A0 (01_A0)
  dw Attribmap01_9D ; A1 (01_A1)
  dw Attribmap01_9D ; A2 (01_A2)
  dw Attribmap01_9D ; A3 (01_A3)
  dw Attribmap01_9D ; A4 (01_A4)
  dw Attribmap01_9D ; A5 (01_A5)
  dw Attribmap01_9D ; A6 (01_A6)
  dw Attribmap01_9D ; A7 (01_A7)
  dw Attribmap01_9D ; A8 (01_A8)
  dw Attribmap01_9D ; A9 (01_A9)
  dw Attribmap01_9D ; AA (01_AA)
  dw Attribmap01_9D ; AB (01_AB)
  dw Attribmap01_9D ; AC (01_AC)
  dw Attribmap01_9D ; AD (01_AD)
  dw Attribmap01_9D ; AE (01_AE)
  dw Attribmap01_9D ; AF (01_AF)
  dw Attribmap01_9D ; B0 (01_B0)
  dw Attribmap01_9D ; B1 (01_B1)
  dw Attribmap01_B2 ; B2
  dw Attribmap01_B3 ; B3
  dw Attribmap01_B4 ; B4
  dw Attribmap01_B4 ; B5 (01_B5)
  dw Attribmap01_B6 ; B6
  dw Attribmap01_B7 ; B7
  dw Attribmap01_B8 ; B8
  dw Attribmap01_B9 ; B9
  dw Attribmap01_B9 ; BA (01_BA)
  dw Attribmap01_BB ; BB
  dw Attribmap01_BC ; BC
  dw Attribmap01_BC ; BD (01_BD)
  dw Attribmap01_BE ; BE
  dw Attribmap01_BE ; BF (01_BF)
  dw Attribmap01_C0 ; C0
  dw Attribmap01_C1 ; C1
  dw Attribmap01_C1 ; C2 (01_C2)
  dw Attribmap01_C1 ; C3 (01_C3)
  dw Attribmap01_C4 ; C4
  dw Attribmap01_C5 ; C5
  dw Attribmap01_C6 ; C6
  dw Attribmap01_C7 ; C7
  dw Attribmap01_C8 ; C8
  dw Attribmap01_C9 ; C9
  dw Attribmap01_CA ; CA
  dw Attribmap01_CB ; CB
  dw Attribmap01_CC ; CC
  dw Attribmap01_CD ; CD
  dw Attribmap01_CE ; CE
  dw Attribmap01_CF ; CF
  dw Attribmap01_D0 ; D0
  dw Attribmap01_D0 ; D1 (01_D1)
  dw Attribmap01_D2 ; D2
  dw Attribmap01_D3 ; D3
  dw Attribmap01_D4 ; D4
  dw Attribmap01_D5 ; D5
  dw Attribmap01_D6 ; D6
  dw Attribmap01_D7 ; D7
  dw Attribmap01_D8 ; D8
  dw Attribmap01_D9 ; D9
  dw Attribmap01_D9 ; DA (01_DA)
  dw Attribmap01_D9 ; DB (01_DB)
  dw Attribmap01_DC ; DC
  dw Attribmap01_DC ; DD (01_DD)
  dw Attribmap01_DE ; DE
  dw Attribmap01_DF ; DF
  dw Attribmap01_E0 ; E0
  dw Attribmap01_E1 ; E1
  dw Attribmap01_E2 ; E2
  dw Attribmap01_E3 ; E3
  dw Attribmap01_E4 ; E4
  dw Attribmap01_E5 ; E5
  dw Attribmap01_E5 ; E6 (01_E6)
  dw Attribmap01_E5 ; E7 (01_E7)
  dw Attribmap01_E5 ; E8 (01_E8)
  dw Attribmap01_E5 ; E9 (01_E9)
  dw Attribmap01_E5 ; EA (01_EA)
  dw Attribmap01_E5 ; EB (01_EB)
  dw Attribmap01_EC ; EC
  dw Attribmap01_ED ; ED
  dw Attribmap01_EE ; EE
  dw Attribmap01_EF ; EF
  dw Attribmap01_F0 ; F0
  dw Attribmap01_F1 ; F1
  dw Attribmap01_F2 ; F2
  dw Attribmap01_F2 ; F3 (01_F3)
  dw Attribmap01_F4 ; F4
  dw Attribmap01_F5 ; F5
  dw Attribmap01_F6 ; F6
  dw Attribmap01_F7 ; F7
  dw Attribmap01_F8 ; F8
  dw Attribmap01_F9 ; F9
  dw Attribmap01_FA ; FA
  dw Attribmap01_FB ; FB
  dw Attribmap01_FC ; FC
  dw Attribmap01_FD ; FD
  dw Attribmap01_FE ; FE
  dw Attribmap01_FF ; FF
Attribmap01_00::
  INCBIN "./build/attribmaps/0100.map"
Attribmap01_01::
  INCBIN "./build/attribmaps/0101.map"
Attribmap01_02::
  INCBIN "./build/attribmaps/0102.map"
Attribmap01_04::
  INCBIN "./build/attribmaps/0104.map"
Attribmap01_05::
  INCBIN "./build/attribmaps/0105.map"
Attribmap01_06::
  INCBIN "./build/attribmaps/0105.map"
Attribmap01_07::
  INCBIN "./build/attribmaps/0105.map"
Attribmap01_08::
  INCBIN "./build/attribmaps/0108.map"
Attribmap01_11::
  INCBIN "./build/attribmaps/0111.map"
Attribmap01_12::
  INCBIN "./build/attribmaps/0112.map"
Attribmap01_13::
  INCBIN "./build/attribmaps/0113.map"
Attribmap01_14::
  INCBIN "./build/attribmaps/0114.map"
Attribmap01_15::
  INCBIN "./build/attribmaps/0115.map"
Attribmap01_16::
  INCBIN "./build/attribmaps/0116.map"
Attribmap01_17::
  INCBIN "./build/attribmaps/0117.map"
Attribmap01_18::
  INCBIN "./build/attribmaps/0118.map"
Attribmap01_19::
  INCBIN "./build/attribmaps/0119.map"
Attribmap01_1A::
  INCBIN "./build/attribmaps/011A.map"
Attribmap01_1B::
  INCBIN "./build/attribmaps/011B.map"
Attribmap01_1C::
  INCBIN "./build/attribmaps/011C.map"
Attribmap01_1D::
  INCBIN "./build/attribmaps/011D.map"
Attribmap01_1E::
  INCBIN "./build/attribmaps/011E.map"
Attribmap01_1F::
  INCBIN "./build/attribmaps/011F.map"
Attribmap01_20::
  INCBIN "./build/attribmaps/0120.map"
Attribmap01_21::
  INCBIN "./build/attribmaps/0121.map"
Attribmap01_22::
  INCBIN "./build/attribmaps/0122.map"
Attribmap01_23::
  INCBIN "./build/attribmaps/0123.map"
Attribmap01_24::
  INCBIN "./build/attribmaps/0124.map"
Attribmap01_25::
  INCBIN "./build/attribmaps/0125.map"
Attribmap01_26::
  INCBIN "./build/attribmaps/0126.map"
Attribmap01_27::
  INCBIN "./build/attribmaps/0127.map"
Attribmap01_31::
  INCBIN "./build/attribmaps/0131.map"
Attribmap01_32::
  INCBIN "./build/attribmaps/0132.map"
Attribmap01_33::
  INCBIN "./build/attribmaps/0133.map"
Attribmap01_34::
  INCBIN "./build/attribmaps/0134.map"
Attribmap01_35::
  INCBIN "./build/attribmaps/0135.map"
Attribmap01_36::
  INCBIN "./build/attribmaps/0136.map"
Attribmap01_37::
  INCBIN "./build/attribmaps/0137.map"
Attribmap01_38::
  INCBIN "./build/attribmaps/0138.map"
Attribmap01_39::
  INCBIN "./build/attribmaps/0139.map"
Attribmap01_3A::
  INCBIN "./build/attribmaps/013A.map"
Attribmap01_3B::
  INCBIN "./build/attribmaps/013B.map"
Attribmap01_3C::
  INCBIN "./build/attribmaps/013C.map"
Attribmap01_3D::
  INCBIN "./build/attribmaps/013D.map"
Attribmap01_3E::
  INCBIN "./build/attribmaps/013E.map"
Attribmap01_3F_GAMEVERSION::
  INCBIN cAttribmap01_3F_GAMEVERSION
Attribmap01_40::
  INCBIN "./build/attribmaps/0140.map"
Attribmap01_41::
  INCBIN "./build/attribmaps/0141.map"
Attribmap01_42::
  INCBIN "./build/attribmaps/0142.map"
Attribmap01_43::
  INCBIN "./build/attribmaps/0143.map"
Attribmap01_44::
  INCBIN "./build/attribmaps/0144.map"
Attribmap01_45_GAMEVERSION::
  INCBIN cAttribmap01_45_GAMEVERSION
Attribmap01_46_GAMEVERSION::
  INCBIN cAttribmap01_46_GAMEVERSION
Attribmap01_47_GAMEVERSION::
  INCBIN cAttribmap01_47_GAMEVERSION
Attribmap01_48_GAMEVERSION::
  INCBIN cAttribmap01_48_GAMEVERSION
Attribmap01_49_GAMEVERSION::
  INCBIN cAttribmap01_49_GAMEVERSION
Attribmap01_4A_GAMEVERSION::
  INCBIN cAttribmap01_4A_GAMEVERSION
Attribmap01_4B_GAMEVERSION::
  INCBIN cAttribmap01_4B_GAMEVERSION
Attribmap01_4C_GAMEVERSION::
  INCBIN cAttribmap01_4C_GAMEVERSION
Attribmap01_4D_GAMEVERSION::
  INCBIN cAttribmap01_4D_GAMEVERSION
Attribmap01_4E_GAMEVERSION::
  INCBIN cAttribmap01_4E_GAMEVERSION
Attribmap01_4F::
  INCBIN "./build/attribmaps/014F.map"
Attribmap01_50::
  INCBIN "./build/attribmaps/0150.map"
Attribmap01_51::
  INCBIN "./build/attribmaps/0151.map"
Attribmap01_52::
  INCBIN "./build/attribmaps/0152.map"
Attribmap01_53::
  INCBIN "./build/attribmaps/0153.map"
Attribmap01_54::
  INCBIN "./build/attribmaps/0154.map"
Attribmap01_55::
  INCBIN "./build/attribmaps/0155.map"
Attribmap01_56::
  INCBIN "./build/attribmaps/0156.map"
Attribmap01_81::
  INCBIN "./build/attribmaps/0181.map"
Attribmap01_82::
  INCBIN "./build/attribmaps/0182.map"
Attribmap01_83::
  INCBIN "./build/attribmaps/0182.map"
Attribmap01_84::
  INCBIN "./build/attribmaps/0184.map"
Attribmap01_85::
  INCBIN "./build/attribmaps/0185.map"
Attribmap01_86::
  INCBIN "./build/attribmaps/0186.map"
Attribmap01_87::
  INCBIN "./build/attribmaps/0187.map"
Attribmap01_88::
  INCBIN "./build/attribmaps/0188.map"
Attribmap01_89::
  INCBIN "./build/attribmaps/0189.map"
Attribmap01_8A::
  INCBIN "./build/attribmaps/018A.map"
Attribmap01_8B::
  INCBIN "./build/attribmaps/018B.map"
Attribmap01_8C::
  INCBIN "./build/attribmaps/018C.map"
Attribmap01_8D::
  INCBIN "./build/attribmaps/018D.map"
Attribmap01_8E::
  INCBIN "./build/attribmaps/018E.map"
Attribmap01_8F::
  INCBIN "./build/attribmaps/018F.map"
Attribmap01_90::
  INCBIN "./build/attribmaps/0190.map"
Attribmap01_91::
  INCBIN "./build/attribmaps/0191.map"
Attribmap01_92::
  INCBIN "./build/attribmaps/0192.map"
Attribmap01_93::
  INCBIN "./build/attribmaps/0193.map"
Attribmap01_94::
  INCBIN "./build/attribmaps/0194.map"
Attribmap01_95::
  INCBIN "./build/attribmaps/0195.map"
Attribmap01_96::
  INCBIN "./build/attribmaps/0196.map"
Attribmap01_97::
  INCBIN "./build/attribmaps/0197.map"
Attribmap01_98::
  INCBIN "./build/attribmaps/0198.map"
Attribmap01_99::
  INCBIN "./build/attribmaps/0199.map"
Attribmap01_9A::
  INCBIN "./build/attribmaps/019A.map"
Attribmap01_9B::
  INCBIN "./build/attribmaps/019B.map"
Attribmap01_9C::
  INCBIN "./build/attribmaps/019C.map"
Attribmap01_9D::
  INCBIN "./build/attribmaps/019D.map"
Attribmap01_B2::
  INCBIN "./build/attribmaps/01B2.map"
Attribmap01_B3::
  INCBIN "./build/attribmaps/01B3.map"
Attribmap01_B4::
  INCBIN "./build/attribmaps/01B4.map"
Attribmap01_B6::
  INCBIN "./build/attribmaps/01B6.map"
Attribmap01_B7::
  INCBIN "./build/attribmaps/01B7.map"
Attribmap01_B8::
  INCBIN "./build/attribmaps/01B8.map"
Attribmap01_B9::
  INCBIN "./build/attribmaps/01B9.map"
Attribmap01_BB::
  INCBIN "./build/attribmaps/01BB.map"
Attribmap01_BC::
  INCBIN "./build/attribmaps/01BC.map"
Attribmap01_BE::
  INCBIN "./build/attribmaps/01BE.map"
Attribmap01_C0::
  INCBIN "./build/attribmaps/01C0.map"
Attribmap01_C1::
  INCBIN "./build/attribmaps/01C1.map"
Attribmap01_C4::
  INCBIN "./build/attribmaps/01C4.map"
Attribmap01_C5::
  INCBIN "./build/attribmaps/01C5.map"
Attribmap01_C6::
  INCBIN "./build/attribmaps/01C6.map"
Attribmap01_C7::
  INCBIN "./build/attribmaps/01C7.map"
Attribmap01_C8::
  INCBIN "./build/attribmaps/01C8.map"
Attribmap01_C9::
  INCBIN "./build/attribmaps/01C9.map"
Attribmap01_CA::
  INCBIN "./build/attribmaps/01CA.map"
Attribmap01_CB::
  INCBIN "./build/attribmaps/01CB.map"
Attribmap01_CC::
  INCBIN "./build/attribmaps/01CC.map"
Attribmap01_CD::
  INCBIN "./build/attribmaps/01CD.map"
Attribmap01_CE::
  INCBIN "./build/attribmaps/01CE.map"
Attribmap01_CF::
  INCBIN "./build/attribmaps/01CF.map"
Attribmap01_D0::
  INCBIN "./build/attribmaps/01D0.map"
Attribmap01_D2::
  INCBIN "./build/attribmaps/01D2.map"
Attribmap01_D3::
  INCBIN "./build/attribmaps/01D3.map"
Attribmap01_D4::
  INCBIN "./build/attribmaps/01D4.map"
Attribmap01_D5::
  INCBIN "./build/attribmaps/01D5.map"
Attribmap01_D6::
  INCBIN "./build/attribmaps/01D6.map"
Attribmap01_D7::
  INCBIN "./build/attribmaps/01D7.map"
Attribmap01_D8::
  INCBIN "./build/attribmaps/01D8.map"
Attribmap01_D9::
  INCBIN "./build/attribmaps/01D9.map"
Attribmap01_DC::
  INCBIN "./build/attribmaps/01DC.map"
Attribmap01_DE::
  INCBIN "./build/attribmaps/01DE.map"
Attribmap01_DF::
  INCBIN "./build/attribmaps/01DF.map"
Attribmap01_E0::
  INCBIN "./build/attribmaps/01E0.map"
Attribmap01_E1::
  INCBIN "./build/attribmaps/01E0.map"
Attribmap01_E2::
  INCBIN "./build/attribmaps/01E2.map"
Attribmap01_E3::
  INCBIN "./build/attribmaps/01E3.map"
Attribmap01_E4::
  INCBIN "./build/attribmaps/01E4.map"
Attribmap01_E5::
  INCBIN "./build/attribmaps/01E5.map"
Attribmap01_EC::
  INCBIN "./build/attribmaps/01EC.map"
Attribmap01_ED::
  INCBIN "./build/attribmaps/01ED.map"
Attribmap01_EE::
  INCBIN "./build/attribmaps/01EE.map"
Attribmap01_EF::
  INCBIN "./build/attribmaps/01EF.map"
Attribmap01_F0::
  INCBIN "./build/attribmaps/01F0.map"
Attribmap01_F1::
  INCBIN "./build/attribmaps/01F1.map"
Attribmap01_F2::
  INCBIN "./build/attribmaps/01F2.map"
Attribmap01_F4::
  INCBIN "./build/attribmaps/01F4.map"
Attribmap01_F5::
  INCBIN "./build/attribmaps/01F5.map"
Attribmap01_F6::
  INCBIN "./build/attribmaps/01F6.map"
Attribmap01_F7::
  INCBIN "./build/attribmaps/01F7.map"
Attribmap01_F8::
  INCBIN "./build/attribmaps/01F8.map"
Attribmap01_F9::
  INCBIN "./build/attribmaps/01F9.map"
Attribmap01_FA::
  INCBIN "./build/attribmaps/01FA.map"
Attribmap01_FB::
  INCBIN "./build/attribmaps/01FB.map"
Attribmap01_FC::
  INCBIN "./build/attribmaps/01FC.map"
Attribmap01_FD::
  INCBIN "./build/attribmaps/01FD.map"
Attribmap01_FE::
  INCBIN "./build/attribmaps/01FE.map"
Attribmap01_FF::
  INCBIN "./build/attribmaps/01FF.map"
AttribmapTable01Terminator::

SECTION "Attribmap Table 02", ROMX[$47A0], BANK[$19]
AttribmapTable02::
  dw Attribmap02_00 ; 00
  dw Attribmap02_01 ; 01
  dw Attribmap02_02 ; 02
  dw Attribmap02_03 ; 03
  dw Attribmap02_04 ; 04
  dw Attribmap02_05 ; 05
  dw Attribmap02_06 ; 06
  dw Attribmap02_07 ; 07
  dw Attribmap02_08 ; 08
  dw Attribmap02_09 ; 09
  dw Attribmap02_0A ; 0A
  dw Attribmap02_0B ; 0B
  dw Attribmap02_0C ; 0C
  dw Attribmap02_0D ; 0D
  dw Attribmap02_0E ; 0E
  dw Attribmap02_0F ; 0F
  dw Attribmap02_10 ; 10
  dw Attribmap02_11 ; 11
  dw Attribmap02_12 ; 12
  dw Attribmap02_13 ; 13
  dw Attribmap02_14 ; 14
  dw Attribmap02_15 ; 15
  dw Attribmap02_16 ; 16
  dw Attribmap02_17 ; 17
  dw Attribmap02_18 ; 18
  dw Attribmap02_19 ; 19
  dw Attribmap02_1A ; 1A
  dw Attribmap02_1B ; 1B
  dw Attribmap02_1C ; 1C
  dw Attribmap02_1D ; 1D
  dw Attribmap02_1E ; 1E
  dw Attribmap02_1F ; 1F
  dw Attribmap02_20 ; 20
  dw Attribmap02_21 ; 21
  dw Attribmap02_22 ; 22
  dw Attribmap02_23 ; 23
  dw Attribmap02_24 ; 24
  dw Attribmap02_25 ; 25
  dw Attribmap02_26 ; 26
  dw Attribmap02_27 ; 27
  dw Attribmap02_28 ; 28
  dw Attribmap02_29 ; 29
  dw Attribmap02_2A ; 2A
  dw Attribmap02_2B ; 2B
  dw Attribmap02_2C ; 2C
  dw Attribmap02_2D ; 2D
  dw Attribmap02_2E ; 2E
  dw Attribmap02_2F ; 2F
  dw Attribmap02_30 ; 30
  dw Attribmap02_31 ; 31
  dw Attribmap02_32 ; 32
  dw Attribmap02_33 ; 33
  dw Attribmap02_34 ; 34
  dw Attribmap02_35 ; 35
  dw Attribmap02_36 ; 36
  dw Attribmap02_37 ; 37
  dw Attribmap02_38 ; 38
  dw Attribmap02_39 ; 39
  dw Attribmap02_3A ; 3A
  dw Attribmap02_3B ; 3B
  dw Attribmap02_3C ; 3C
  dw Attribmap02_3D ; 3D
  dw Attribmap02_3E ; 3E
  dw Attribmap02_3F ; 3F
  dw Attribmap02_40 ; 40
  dw Attribmap02_41 ; 41
  dw Attribmap02_42 ; 42
  dw Attribmap02_43 ; 43
  dw Attribmap02_44 ; 44
  dw Attribmap02_45 ; 45
  dw Attribmap02_46 ; 46
  dw Attribmap02_47 ; 47
  dw Attribmap02_48 ; 48
  dw Attribmap02_49 ; 49
  dw Attribmap02_4A ; 4A
  dw Attribmap02_4B ; 4B
  dw Attribmap02_4C ; 4C
  dw Attribmap02_4D ; 4D
  dw Attribmap02_4E ; 4E
  dw Attribmap02_4F ; 4F
  dw Attribmap02_50 ; 50
  dw Attribmap02_51 ; 51
  dw Attribmap02_52 ; 52
  dw Attribmap02_53 ; 53
  dw Attribmap02_54 ; 54
  dw Attribmap02_55 ; 55
  dw Attribmap02_56 ; 56
  dw Attribmap02_57 ; 57
  dw Attribmap02_58 ; 58
  dw Attribmap02_59 ; 59
  dw Attribmap02_5A ; 5A
  dw Attribmap02_5B ; 5B
  dw Attribmap02_5C ; 5C
  dw Attribmap02_5D ; 5D
  dw Attribmap02_5E ; 5E
  dw Attribmap02_5F ; 5F
  dw Attribmap02_60 ; 60
  dw Attribmap02_61 ; 61
  dw Attribmap02_62 ; 62
  dw Attribmap02_63 ; 63
  dw Attribmap02_64 ; 64
  dw Attribmap02_65 ; 65
  dw Attribmap02_66 ; 66
  dw Attribmap02_66 ; 67 (02_67)
  dw Attribmap02_66 ; 68 (02_68)
  dw Attribmap02_69 ; 69
  dw Attribmap02_6A ; 6A
  dw Attribmap02_6A ; 6B (02_6B)
  dw Attribmap02_6A ; 6C (02_6C)
  dw Attribmap02_6A ; 6D (02_6D)
  dw Attribmap02_6A ; 6E (02_6E)
  dw Attribmap02_6A ; 6F (02_6F)
  dw Attribmap02_6A ; 70 (02_70)
  dw Attribmap02_6A ; 71 (02_71)
  dw Attribmap02_6A ; 72 (02_72)
  dw Attribmap02_73 ; 73
  dw Attribmap02_73 ; 74 (02_74)
  dw Attribmap02_75 ; 75
  dw Attribmap02_76 ; 76
  dw Attribmap02_77 ; 77
  dw Attribmap02_78 ; 78
  dw Attribmap02_79 ; 79
  dw Attribmap02_79 ; 7A (02_7A)
  dw Attribmap02_79 ; 7B (02_7B)
  dw Attribmap02_79 ; 7C (02_7C)
  dw Attribmap02_79 ; 7D (02_7D)
  dw Attribmap02_79 ; 7E (02_7E)
  dw Attribmap02_79 ; 7F (02_7F)
  dw Attribmap02_79 ; 80 (02_80)
  dw Attribmap02_81 ; 81
  dw Attribmap02_82 ; 82
  dw Attribmap02_83 ; 83
  dw Attribmap02_84 ; 84
  dw Attribmap02_85 ; 85
  dw Attribmap02_86 ; 86
  dw Attribmap02_87 ; 87
  dw Attribmap02_88 ; 88
  dw Attribmap02_89 ; 89
  dw Attribmap02_8A ; 8A
  dw Attribmap02_8B ; 8B
  dw Attribmap02_8C ; 8C
  dw Attribmap02_8D ; 8D
  dw Attribmap02_8E ; 8E
  dw AttribmapTable02Terminator ; 8F
  dw AttribmapTable02Terminator ; 90
  dw AttribmapTable02Terminator ; 91
  dw AttribmapTable02Terminator ; 92
  dw AttribmapTable02Terminator ; 93
  dw AttribmapTable02Terminator ; 94
  dw AttribmapTable02Terminator ; 95
  dw AttribmapTable02Terminator ; 96
  dw AttribmapTable02Terminator ; 97
  dw AttribmapTable02Terminator ; 98
  dw AttribmapTable02Terminator ; 99
  dw AttribmapTable02Terminator ; 9A
  dw AttribmapTable02Terminator ; 9B
  dw AttribmapTable02Terminator ; 9C
  dw AttribmapTable02Terminator ; 9D
  dw AttribmapTable02Terminator ; 9E
  dw AttribmapTable02Terminator ; 9F
  dw AttribmapTable02Terminator ; A0
  dw AttribmapTable02Terminator ; A1
  dw AttribmapTable02Terminator ; A2
  dw AttribmapTable02Terminator ; A3
  dw AttribmapTable02Terminator ; A4
  dw AttribmapTable02Terminator ; A5
  dw AttribmapTable02Terminator ; A6
  dw AttribmapTable02Terminator ; A7
  dw AttribmapTable02Terminator ; A8
  dw AttribmapTable02Terminator ; A9
  dw AttribmapTable02Terminator ; AA
  dw AttribmapTable02Terminator ; AB
  dw AttribmapTable02Terminator ; AC
  dw AttribmapTable02Terminator ; AD
  dw AttribmapTable02Terminator ; AE
  dw AttribmapTable02Terminator ; AF
  dw AttribmapTable02Terminator ; B0
  dw AttribmapTable02Terminator ; B1
  dw AttribmapTable02Terminator ; B2
  dw AttribmapTable02Terminator ; B3
  dw AttribmapTable02Terminator ; B4
  dw AttribmapTable02Terminator ; B5
  dw AttribmapTable02Terminator ; B6
  dw AttribmapTable02Terminator ; B7
  dw AttribmapTable02Terminator ; B8
  dw AttribmapTable02Terminator ; B9
  dw AttribmapTable02Terminator ; BA
  dw AttribmapTable02Terminator ; BB
  dw AttribmapTable02Terminator ; BC
  dw AttribmapTable02Terminator ; BD
  dw AttribmapTable02Terminator ; BE
  dw AttribmapTable02Terminator ; BF
  dw AttribmapTable02Terminator ; C0
  dw AttribmapTable02Terminator ; C1
  dw AttribmapTable02Terminator ; C2
  dw AttribmapTable02Terminator ; C3
  dw AttribmapTable02Terminator ; C4
  dw AttribmapTable02Terminator ; C5
  dw AttribmapTable02Terminator ; C6
  dw AttribmapTable02Terminator ; C7
  dw AttribmapTable02Terminator ; C8
  dw AttribmapTable02Terminator ; C9
  dw AttribmapTable02Terminator ; CA
  dw AttribmapTable02Terminator ; CB
  dw AttribmapTable02Terminator ; CC
  dw AttribmapTable02Terminator ; CD
  dw AttribmapTable02Terminator ; CE
  dw AttribmapTable02Terminator ; CF
  dw AttribmapTable02Terminator ; D0
  dw AttribmapTable02Terminator ; D1
  dw AttribmapTable02Terminator ; D2
  dw AttribmapTable02Terminator ; D3
  dw AttribmapTable02Terminator ; D4
  dw AttribmapTable02Terminator ; D5
  dw AttribmapTable02Terminator ; D6
  dw AttribmapTable02Terminator ; D7
  dw AttribmapTable02Terminator ; D8
  dw AttribmapTable02Terminator ; D9
  dw AttribmapTable02Terminator ; DA
  dw AttribmapTable02Terminator ; DB
  dw AttribmapTable02Terminator ; DC
  dw AttribmapTable02Terminator ; DD
  dw AttribmapTable02Terminator ; DE
  dw AttribmapTable02Terminator ; DF
  dw AttribmapTable02Terminator ; E0
  dw AttribmapTable02Terminator ; E1
  dw AttribmapTable02Terminator ; E2
  dw AttribmapTable02Terminator ; E3
  dw AttribmapTable02Terminator ; E4
  dw AttribmapTable02Terminator ; E5
  dw AttribmapTable02Terminator ; E6
  dw AttribmapTable02Terminator ; E7
  dw AttribmapTable02Terminator ; E8
  dw AttribmapTable02Terminator ; E9
  dw AttribmapTable02Terminator ; EA
  dw AttribmapTable02Terminator ; EB
  dw AttribmapTable02Terminator ; EC
  dw AttribmapTable02Terminator ; ED
  dw AttribmapTable02Terminator ; EE
  dw AttribmapTable02Terminator ; EF
  dw AttribmapTable02Terminator ; F0
  dw AttribmapTable02Terminator ; F1
  dw AttribmapTable02Terminator ; F2
  dw AttribmapTable02Terminator ; F3
  dw AttribmapTable02Terminator ; F4
  dw AttribmapTable02Terminator ; F5
  dw AttribmapTable02Terminator ; F6
  dw AttribmapTable02Terminator ; F7
  dw AttribmapTable02Terminator ; F8
  dw AttribmapTable02Terminator ; F9
  dw AttribmapTable02Terminator ; FA
  dw AttribmapTable02Terminator ; FB
  dw AttribmapTable02Terminator ; FC
  dw AttribmapTable02Terminator ; FD
  dw AttribmapTable02Terminator ; FE
  dw AttribmapTable02Terminator ; FF
Attribmap02_00::
  INCBIN "./build/attribmaps/0200.map"
Attribmap02_01::
  INCBIN "./build/attribmaps/0201.map"
Attribmap02_02::
  INCBIN "./build/attribmaps/0202.map"
Attribmap02_03::
  INCBIN "./build/attribmaps/0203.map"
Attribmap02_04::
  INCBIN "./build/attribmaps/0204.map"
Attribmap02_05::
  INCBIN "./build/attribmaps/0205.map"
Attribmap02_06::
  INCBIN "./build/attribmaps/0206.map"
Attribmap02_07::
  INCBIN "./build/attribmaps/0207.map"
Attribmap02_08::
  INCBIN "./build/attribmaps/0208.map"
Attribmap02_09::
  INCBIN "./build/attribmaps/0209.map"
Attribmap02_0A::
  INCBIN "./build/attribmaps/020A.map"
Attribmap02_0B::
  INCBIN "./build/attribmaps/020B.map"
Attribmap02_0C::
  INCBIN "./build/attribmaps/020C.map"
Attribmap02_0D::
  INCBIN "./build/attribmaps/020D.map"
Attribmap02_0E::
  INCBIN "./build/attribmaps/020E.map"
Attribmap02_0F::
  INCBIN "./build/attribmaps/020F.map"
Attribmap02_10::
  INCBIN "./build/attribmaps/0210.map"
Attribmap02_11::
  INCBIN "./build/attribmaps/0211.map"
Attribmap02_12::
  INCBIN "./build/attribmaps/0212.map"
Attribmap02_13::
  INCBIN "./build/attribmaps/0213.map"
Attribmap02_14::
  INCBIN "./build/attribmaps/0214.map"
Attribmap02_15::
  INCBIN "./build/attribmaps/0215.map"
Attribmap02_16::
  INCBIN "./build/attribmaps/0216.map"
Attribmap02_17::
  INCBIN "./build/attribmaps/0217.map"
Attribmap02_18::
  INCBIN "./build/attribmaps/0216.map"
Attribmap02_19::
  INCBIN "./build/attribmaps/0217.map"
Attribmap02_1A::
  INCBIN "./build/attribmaps/021A.map"
Attribmap02_1B::
  INCBIN "./build/attribmaps/021B.map"
Attribmap02_1C::
  INCBIN "./build/attribmaps/021C.map"
Attribmap02_1D::
  INCBIN "./build/attribmaps/021D.map"
Attribmap02_1E::
  INCBIN "./build/attribmaps/021E.map"
Attribmap02_1F::
  INCBIN "./build/attribmaps/021F.map"
Attribmap02_20::
  INCBIN "./build/attribmaps/0220.map"
Attribmap02_21::
  INCBIN "./build/attribmaps/0221.map"
Attribmap02_22::
  INCBIN "./build/attribmaps/0222.map"
Attribmap02_23::
  INCBIN "./build/attribmaps/0223.map"
Attribmap02_24::
  INCBIN "./build/attribmaps/0224.map"
Attribmap02_25::
  INCBIN "./build/attribmaps/0225.map"
Attribmap02_26::
  INCBIN "./build/attribmaps/0224.map"
Attribmap02_27::
  INCBIN "./build/attribmaps/0225.map"
Attribmap02_28::
  INCBIN "./build/attribmaps/0228.map"
Attribmap02_29::
  INCBIN "./build/attribmaps/0229.map"
Attribmap02_2A::
  INCBIN "./build/attribmaps/022A.map"
Attribmap02_2B::
  INCBIN "./build/attribmaps/022B.map"
Attribmap02_2C::
  INCBIN "./build/attribmaps/022C.map"
Attribmap02_2D::
  INCBIN "./build/attribmaps/022D.map"
Attribmap02_2E::
  INCBIN "./build/attribmaps/022E.map"
Attribmap02_2F::
  INCBIN "./build/attribmaps/022F.map"
Attribmap02_30::
  INCBIN "./build/attribmaps/022E.map"
Attribmap02_31::
  INCBIN "./build/attribmaps/022F.map"
Attribmap02_32::
  INCBIN "./build/attribmaps/0232.map"
Attribmap02_33::
  INCBIN "./build/attribmaps/0233.map"
Attribmap02_34::
  INCBIN "./build/attribmaps/0234.map"
Attribmap02_35::
  INCBIN "./build/attribmaps/0235.map"
Attribmap02_36::
  INCBIN "./build/attribmaps/0236.map"
Attribmap02_37::
  INCBIN "./build/attribmaps/0237.map"
Attribmap02_38::
  INCBIN "./build/attribmaps/0238.map"
Attribmap02_39::
  INCBIN "./build/attribmaps/0239.map"
Attribmap02_3A::
  INCBIN "./build/attribmaps/023A.map"
Attribmap02_3B::
  INCBIN "./build/attribmaps/023B.map"
Attribmap02_3C::
  INCBIN "./build/attribmaps/023C.map"
Attribmap02_3D::
  INCBIN "./build/attribmaps/023D.map"
Attribmap02_3E::
  INCBIN "./build/attribmaps/023E.map"
Attribmap02_3F::
  INCBIN "./build/attribmaps/023F.map"
Attribmap02_40::
  INCBIN "./build/attribmaps/023E.map"
Attribmap02_41::
  INCBIN "./build/attribmaps/0241.map"
Attribmap02_42::
  INCBIN "./build/attribmaps/023E.map"
Attribmap02_43::
  INCBIN "./build/attribmaps/0243.map"
Attribmap02_44::
  INCBIN "./build/attribmaps/0244.map"
Attribmap02_45::
  INCBIN "./build/attribmaps/0245.map"
Attribmap02_46::
  INCBIN "./build/attribmaps/0246.map"
Attribmap02_47::
  INCBIN "./build/attribmaps/0247.map"
Attribmap02_48::
  INCBIN "./build/attribmaps/0248.map"
Attribmap02_49::
  INCBIN "./build/attribmaps/0249.map"
Attribmap02_4A::
  INCBIN "./build/attribmaps/024A.map"
Attribmap02_4B::
  INCBIN "./build/attribmaps/024B.map"
Attribmap02_4C::
  INCBIN "./build/attribmaps/024A.map"
Attribmap02_4D::
  INCBIN "./build/attribmaps/024B.map"
Attribmap02_4E::
  INCBIN "./build/attribmaps/024E.map"
Attribmap02_4F::
  INCBIN "./build/attribmaps/024F.map"
Attribmap02_50::
  INCBIN "./build/attribmaps/0250.map"
Attribmap02_51::
  INCBIN "./build/attribmaps/0251.map"
Attribmap02_52::
  INCBIN "./build/attribmaps/0252.map"
Attribmap02_53::
  INCBIN "./build/attribmaps/0253.map"
Attribmap02_54::
  INCBIN "./build/attribmaps/0254.map"
Attribmap02_55::
  INCBIN "./build/attribmaps/0255.map"
Attribmap02_56::
  INCBIN "./build/attribmaps/0256.map"
Attribmap02_57::
  INCBIN "./build/attribmaps/0257.map"
Attribmap02_58::
  INCBIN "./build/attribmaps/0256.map"
Attribmap02_59::
  INCBIN "./build/attribmaps/0257.map"
Attribmap02_5A::
  INCBIN "./build/attribmaps/0256.map"
Attribmap02_5B::
  INCBIN "./build/attribmaps/0257.map"
Attribmap02_5C::
  INCBIN "./build/attribmaps/0256.map"
Attribmap02_5D::
  INCBIN "./build/attribmaps/0257.map"
Attribmap02_5E::
  INCBIN "./build/attribmaps/025E.map"
Attribmap02_5F::
  INCBIN "./build/attribmaps/025F.map"
Attribmap02_60::
  INCBIN "./build/attribmaps/0260.map"
Attribmap02_61::
  INCBIN "./build/attribmaps/0261.map"
Attribmap02_62::
  INCBIN "./build/attribmaps/0262.map"
Attribmap02_63::
  INCBIN "./build/attribmaps/0263.map"
Attribmap02_64::
  INCBIN "./build/attribmaps/0264.map"
Attribmap02_65::
  INCBIN "./build/attribmaps/0265.map"
Attribmap02_66::
  INCBIN "./build/attribmaps/0266.map"
Attribmap02_69::
  INCBIN "./build/attribmaps/0269.map"
Attribmap02_6A::
  INCBIN "./build/attribmaps/026A.map"
Attribmap02_73::
  INCBIN "./build/attribmaps/005D.map"
Attribmap02_75::
  INCBIN "./build/attribmaps/0275.map"
Attribmap02_76::
  INCBIN "./build/attribmaps/005D.map"
Attribmap02_77::
  INCBIN "./build/attribmaps/0277.map"
Attribmap02_78::
  INCBIN "./build/attribmaps/GlossaryTerms.map"
Attribmap02_79::
  INCBIN "./build/attribmaps/0279.map"
Attribmap02_81::
  INCBIN "./build/attribmaps/0281.map"
Attribmap02_82::
  INCBIN "./build/attribmaps/0282.map"
Attribmap02_83::
  INCBIN "./build/attribmaps/0283.map"
Attribmap02_84::
  INCBIN "./build/attribmaps/0284.map"
Attribmap02_85::
  INCBIN "./build/attribmaps/0285.map"
Attribmap02_86::
  INCBIN "./build/attribmaps/0286.map"
Attribmap02_87::
  INCBIN "./build/attribmaps/0287.map"
Attribmap02_88::
  INCBIN "./build/attribmaps/0288.map"
Attribmap02_89::
  INCBIN "./build/attribmaps/0289.map"
Attribmap02_8A::
  INCBIN "./build/attribmaps/028A.map"
Attribmap02_8B::
  INCBIN "./build/attribmaps/028B.map"
Attribmap02_8C::
  INCBIN "./build/attribmaps/028C.map"
Attribmap02_8D::
  INCBIN "./build/attribmaps/028D.map"
Attribmap02_8E::
  INCBIN "./build/attribmaps/0154.map"
AttribmapTable02Terminator::

SECTION "Attribmap Table 03", ROMX[$5692], BANK[$AB]
AttribmapTable03::
  dw Attribmap03_00 ; 00
  dw Attribmap03_01 ; 01
  dw Attribmap03_02 ; 02
  dw Attribmap03_03 ; 03
  dw Attribmap03_04 ; 04
  dw Attribmap03_05 ; 05
  dw Attribmap03_06 ; 06
  dw Attribmap03_07 ; 07
  dw Attribmap03_08 ; 08
  dw Attribmap03_09 ; 09
  dw Attribmap03_0A ; 0A
  dw Attribmap03_0B ; 0B
  dw Attribmap03_0C ; 0C
  dw Attribmap03_0D ; 0D
  dw Attribmap03_0D ; 0E (03_0E)
  dw Attribmap03_0D ; 0F (03_0F)
  dw Attribmap03_0D ; 10 (03_10)
  dw Attribmap03_0D ; 11 (03_11)
  dw Attribmap03_0D ; 12 (03_12)
  dw Attribmap03_0D ; 13 (03_13)
  dw Attribmap03_0D ; 14 (03_14)
  dw Attribmap03_0D ; 15 (03_15)
  dw Attribmap03_0D ; 16 (03_16)
  dw Attribmap03_0D ; 17 (03_17)
  dw Attribmap03_0D ; 18 (03_18)
  dw Attribmap03_0D ; 19 (03_19)
  dw Attribmap03_0D ; 1A (03_1A)
  dw Attribmap03_0D ; 1B (03_1B)
  dw Attribmap03_0D ; 1C (03_1C)
  dw Attribmap03_0D ; 1D (03_1D)
  dw Attribmap03_0D ; 1E (03_1E)
  dw Attribmap03_0D ; 1F (03_1F)
  dw Attribmap03_0D ; 20 (03_20)
  dw Attribmap03_0D ; 21 (03_21)
  dw Attribmap03_0D ; 22 (03_22)
  dw Attribmap03_0D ; 23 (03_23)
  dw Attribmap03_0D ; 24 (03_24)
  dw Attribmap03_0D ; 25 (03_25)
  dw Attribmap03_0D ; 26 (03_26)
  dw Attribmap03_0D ; 27 (03_27)
  dw Attribmap03_28 ; 28
  dw Attribmap03_29 ; 29
  dw Attribmap03_2A ; 2A
  dw Attribmap03_2B ; 2B
  dw Attribmap03_2C ; 2C
  dw Attribmap03_2D ; 2D
  dw Attribmap03_2E ; 2E
  dw Attribmap03_2F ; 2F
  dw AttribmapTable03Terminator ; 30
  dw AttribmapTable03Terminator ; 31
  dw AttribmapTable03Terminator ; 32
  dw AttribmapTable03Terminator ; 33
  dw AttribmapTable03Terminator ; 34
  dw AttribmapTable03Terminator ; 35
  dw AttribmapTable03Terminator ; 36
  dw AttribmapTable03Terminator ; 37
  dw AttribmapTable03Terminator ; 38
  dw AttribmapTable03Terminator ; 39
  dw AttribmapTable03Terminator ; 3A
  dw AttribmapTable03Terminator ; 3B
  dw AttribmapTable03Terminator ; 3C
  dw AttribmapTable03Terminator ; 3D
  dw AttribmapTable03Terminator ; 3E
  dw AttribmapTable03Terminator ; 3F
  dw AttribmapTable03Terminator ; 40
  dw AttribmapTable03Terminator ; 41
  dw AttribmapTable03Terminator ; 42
  dw AttribmapTable03Terminator ; 43
  dw AttribmapTable03Terminator ; 44
  dw AttribmapTable03Terminator ; 45
  dw AttribmapTable03Terminator ; 46
  dw AttribmapTable03Terminator ; 47
  dw AttribmapTable03Terminator ; 48
  dw AttribmapTable03Terminator ; 49
  dw AttribmapTable03Terminator ; 4A
  dw AttribmapTable03Terminator ; 4B
  dw AttribmapTable03Terminator ; 4C
  dw AttribmapTable03Terminator ; 4D
  dw AttribmapTable03Terminator ; 4E
  dw AttribmapTable03Terminator ; 4F
  dw AttribmapTable03Terminator ; 50
  dw AttribmapTable03Terminator ; 51
  dw AttribmapTable03Terminator ; 52
  dw AttribmapTable03Terminator ; 53
  dw AttribmapTable03Terminator ; 54
  dw AttribmapTable03Terminator ; 55
  dw AttribmapTable03Terminator ; 56
  dw AttribmapTable03Terminator ; 57
  dw AttribmapTable03Terminator ; 58
  dw AttribmapTable03Terminator ; 59
  dw AttribmapTable03Terminator ; 5A
  dw AttribmapTable03Terminator ; 5B
  dw AttribmapTable03Terminator ; 5C
  dw AttribmapTable03Terminator ; 5D
  dw AttribmapTable03Terminator ; 5E
  dw AttribmapTable03Terminator ; 5F
  dw AttribmapTable03Terminator ; 60
  dw AttribmapTable03Terminator ; 61
  dw AttribmapTable03Terminator ; 62
  dw AttribmapTable03Terminator ; 63
  dw AttribmapTable03Terminator ; 64
  dw AttribmapTable03Terminator ; 65
  dw AttribmapTable03Terminator ; 66
  dw AttribmapTable03Terminator ; 67
  dw AttribmapTable03Terminator ; 68
  dw AttribmapTable03Terminator ; 69
  dw AttribmapTable03Terminator ; 6A
  dw AttribmapTable03Terminator ; 6B
  dw AttribmapTable03Terminator ; 6C
  dw AttribmapTable03Terminator ; 6D
  dw AttribmapTable03Terminator ; 6E
  dw AttribmapTable03Terminator ; 6F
  dw AttribmapTable03Terminator ; 70
  dw AttribmapTable03Terminator ; 71
  dw AttribmapTable03Terminator ; 72
  dw AttribmapTable03Terminator ; 73
  dw AttribmapTable03Terminator ; 74
  dw AttribmapTable03Terminator ; 75
  dw AttribmapTable03Terminator ; 76
  dw AttribmapTable03Terminator ; 77
  dw AttribmapTable03Terminator ; 78
  dw AttribmapTable03Terminator ; 79
  dw AttribmapTable03Terminator ; 7A
  dw AttribmapTable03Terminator ; 7B
  dw AttribmapTable03Terminator ; 7C
  dw AttribmapTable03Terminator ; 7D
  dw AttribmapTable03Terminator ; 7E
  dw AttribmapTable03Terminator ; 7F
  dw AttribmapTable03Terminator ; 80
  dw AttribmapTable03Terminator ; 81
  dw AttribmapTable03Terminator ; 82
  dw AttribmapTable03Terminator ; 83
  dw AttribmapTable03Terminator ; 84
  dw AttribmapTable03Terminator ; 85
  dw AttribmapTable03Terminator ; 86
  dw AttribmapTable03Terminator ; 87
  dw AttribmapTable03Terminator ; 88
  dw AttribmapTable03Terminator ; 89
  dw AttribmapTable03Terminator ; 8A
  dw AttribmapTable03Terminator ; 8B
  dw AttribmapTable03Terminator ; 8C
  dw AttribmapTable03Terminator ; 8D
  dw AttribmapTable03Terminator ; 8E
  dw AttribmapTable03Terminator ; 8F
  dw AttribmapTable03Terminator ; 90
  dw AttribmapTable03Terminator ; 91
  dw AttribmapTable03Terminator ; 92
  dw AttribmapTable03Terminator ; 93
  dw AttribmapTable03Terminator ; 94
  dw AttribmapTable03Terminator ; 95
  dw AttribmapTable03Terminator ; 96
  dw AttribmapTable03Terminator ; 97
  dw AttribmapTable03Terminator ; 98
  dw AttribmapTable03Terminator ; 99
  dw AttribmapTable03Terminator ; 9A
  dw AttribmapTable03Terminator ; 9B
  dw AttribmapTable03Terminator ; 9C
  dw AttribmapTable03Terminator ; 9D
  dw AttribmapTable03Terminator ; 9E
  dw AttribmapTable03Terminator ; 9F
  dw AttribmapTable03Terminator ; A0
  dw AttribmapTable03Terminator ; A1
  dw AttribmapTable03Terminator ; A2
  dw AttribmapTable03Terminator ; A3
  dw AttribmapTable03Terminator ; A4
  dw AttribmapTable03Terminator ; A5
  dw AttribmapTable03Terminator ; A6
  dw AttribmapTable03Terminator ; A7
  dw AttribmapTable03Terminator ; A8
  dw AttribmapTable03Terminator ; A9
  dw AttribmapTable03Terminator ; AA
  dw AttribmapTable03Terminator ; AB
  dw AttribmapTable03Terminator ; AC
  dw AttribmapTable03Terminator ; AD
  dw AttribmapTable03Terminator ; AE
  dw AttribmapTable03Terminator ; AF
  dw AttribmapTable03Terminator ; B0
  dw AttribmapTable03Terminator ; B1
  dw AttribmapTable03Terminator ; B2
  dw AttribmapTable03Terminator ; B3
  dw AttribmapTable03Terminator ; B4
  dw AttribmapTable03Terminator ; B5
  dw AttribmapTable03Terminator ; B6
  dw AttribmapTable03Terminator ; B7
  dw AttribmapTable03Terminator ; B8
  dw AttribmapTable03Terminator ; B9
  dw AttribmapTable03Terminator ; BA
  dw AttribmapTable03Terminator ; BB
  dw AttribmapTable03Terminator ; BC
  dw AttribmapTable03Terminator ; BD
  dw AttribmapTable03Terminator ; BE
  dw AttribmapTable03Terminator ; BF
  dw AttribmapTable03Terminator ; C0
  dw AttribmapTable03Terminator ; C1
  dw AttribmapTable03Terminator ; C2
  dw AttribmapTable03Terminator ; C3
  dw AttribmapTable03Terminator ; C4
  dw AttribmapTable03Terminator ; C5
  dw AttribmapTable03Terminator ; C6
  dw AttribmapTable03Terminator ; C7
  dw AttribmapTable03Terminator ; C8
  dw AttribmapTable03Terminator ; C9
  dw AttribmapTable03Terminator ; CA
  dw AttribmapTable03Terminator ; CB
  dw AttribmapTable03Terminator ; CC
  dw AttribmapTable03Terminator ; CD
  dw AttribmapTable03Terminator ; CE
  dw AttribmapTable03Terminator ; CF
  dw AttribmapTable03Terminator ; D0
  dw AttribmapTable03Terminator ; D1
  dw AttribmapTable03Terminator ; D2
  dw AttribmapTable03Terminator ; D3
  dw AttribmapTable03Terminator ; D4
  dw AttribmapTable03Terminator ; D5
  dw AttribmapTable03Terminator ; D6
  dw AttribmapTable03Terminator ; D7
  dw AttribmapTable03Terminator ; D8
  dw AttribmapTable03Terminator ; D9
  dw AttribmapTable03Terminator ; DA
  dw AttribmapTable03Terminator ; DB
  dw AttribmapTable03Terminator ; DC
  dw AttribmapTable03Terminator ; DD
  dw AttribmapTable03Terminator ; DE
  dw AttribmapTable03Terminator ; DF
  dw AttribmapTable03Terminator ; E0
  dw AttribmapTable03Terminator ; E1
  dw AttribmapTable03Terminator ; E2
  dw AttribmapTable03Terminator ; E3
  dw AttribmapTable03Terminator ; E4
  dw AttribmapTable03Terminator ; E5
  dw AttribmapTable03Terminator ; E6
  dw AttribmapTable03Terminator ; E7
  dw AttribmapTable03Terminator ; E8
  dw AttribmapTable03Terminator ; E9
  dw AttribmapTable03Terminator ; EA
  dw AttribmapTable03Terminator ; EB
  dw AttribmapTable03Terminator ; EC
  dw AttribmapTable03Terminator ; ED
  dw AttribmapTable03Terminator ; EE
  dw AttribmapTable03Terminator ; EF
  dw AttribmapTable03Terminator ; F0
  dw AttribmapTable03Terminator ; F1
  dw AttribmapTable03Terminator ; F2
  dw AttribmapTable03Terminator ; F3
  dw AttribmapTable03Terminator ; F4
  dw AttribmapTable03Terminator ; F5
  dw AttribmapTable03Terminator ; F6
  dw AttribmapTable03Terminator ; F7
  dw AttribmapTable03Terminator ; F8
  dw AttribmapTable03Terminator ; F9
  dw AttribmapTable03Terminator ; FA
  dw AttribmapTable03Terminator ; FB
  dw AttribmapTable03Terminator ; FC
  dw AttribmapTable03Terminator ; FD
  dw AttribmapTable03Terminator ; FE
  dw AttribmapTable03Terminator ; FF
Attribmap03_00::
  INCBIN "./build/attribmaps/0300.map"
Attribmap03_01::
  INCBIN "./build/attribmaps/0301.map"
Attribmap03_02::
  INCBIN "./build/attribmaps/0302.map"
Attribmap03_03::
  INCBIN "./build/attribmaps/0303.map"
Attribmap03_04::
  INCBIN "./build/attribmaps/0304.map"
Attribmap03_05::
  INCBIN "./build/attribmaps/0305.map"
Attribmap03_06::
  INCBIN "./build/attribmaps/0306.map"
Attribmap03_07::
  INCBIN "./build/attribmaps/0307.map"
Attribmap03_08::
  INCBIN "./build/attribmaps/0308.map"
Attribmap03_09::
  INCBIN "./build/attribmaps/0309.map"
Attribmap03_0A::
  INCBIN "./build/attribmaps/030A.map"
Attribmap03_0B::
  INCBIN "./build/attribmaps/030B.map"
Attribmap03_0C::
  INCBIN "./build/attribmaps/0001.map"
Attribmap03_0D::
  INCBIN "./build/attribmaps/030D.map"
Attribmap03_28::
  INCBIN "./build/attribmaps/0328.map"
Attribmap03_29::
  INCBIN "./build/attribmaps/0329.map"
Attribmap03_2A::
  INCBIN "./build/attribmaps/032A.map"
Attribmap03_2B::
  INCBIN "./build/attribmaps/032B.map"
Attribmap03_2C::
  INCBIN "./build/attribmaps/032C.map"
Attribmap03_2D::
  INCBIN "./build/attribmaps/032D.map"
Attribmap03_2E::
  INCBIN "./build/attribmaps/032E.map"
Attribmap03_2F::
  INCBIN "./build/attribmaps/032F.map"
AttribmapTable03Terminator::

