INCLUDE "game/src/common/macros.asm"

MACRO TilesetTableEntry
  TableAddressEntry Tileset,\1
  ENDM

SECTION "Tileset Source Address Table", ROM0[$3995]
TilesetSourceAddressTable::
  TableStart
  TilesetTableEntry Tileset3995 ; 00 (3995)
  TilesetTableEntry Tileset3997 ; 01 (3997)
  TilesetTableEntry MainDialog1 ; 02 (3999)
  TilesetTableEntry MainDialog2 ; 03 (399B)
  TilesetTableEntry Special ; 04 (399D)
  TilesetTableEntry Tileset399F ; 05 (399F)
  TilesetTableEntry MenuMedawatchGraphics ; 06 (39A1)
  TilesetTableEntry Tileset39A3 ; 07 (39A3)
  TilesetTableEntry Tileset39A5 ; 08 (39A5)
  TilesetTableEntry Tileset39A7 ; 09 (39A7)
  TilesetTableEntry Tileset39A9 ; 0A (39A9)
  TilesetTableEntry Tileset39AB ; 0B (39AB)
  TilesetTableEntry MenuMedawatchTextSprites ; 0C (39AD)
  TilesetTableEntry Tileset39AF ; 0D (39AF)
  TilesetTableEntry PartsScreen ; 0E (39B1)
  TilesetTableEntry Tileset39B3 ; 0F (39B3)
  TilesetTableEntry Tileset39B5 ; 10 (39B5)
  TilesetTableEntry Tileset39B7 ; 11 (39B7)
  TilesetTableEntry Tileset39B9 ; 12 (39B9)
  TilesetTableEntry Tileset39BB ; 13 (39BB)
  TilesetTableEntry MedalInfoText ; 14 (39BD)
  TilesetTableEntry Tileset39BF ; 15 (39BF)
  TilesetTableEntry Tileset39C1 ; 16 (39C1)
  TilesetTableEntry Tileset39C3 ; 17 (39C3)
  TilesetTableEntry Tileset39C5 ; 18 (39C5)
  TilesetTableEntry Tileset39C7 ; 19 (39C7)
  TilesetTableEntry Tileset39C9 ; 1A (39C9)
  TilesetTableEntry Tileset39CB ; 1B (39CB)
  TilesetTableEntry GBCOnlyErrorScreenTextGraphics ; 1C (39CD)
  TilesetTableEntry Tileset39CF ; 1D (39CF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E (39D1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F (39D3)
  TilesetTableEntry Tileset39D5 ; 20 (39D5)
  TilesetTableEntry Digits ; 21 (39D7)
  TilesetTableEntry Tileset39D9 ; 22 (39D9)
  TilesetTableEntry Tileset39DB ; 23 (39DB)
  TilesetTableEntry Tileset39DD ; 24 (39DD)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 25 (39DF)
  TilesetTableEntry Tileset39E1 ; 26 (39E1)
  TilesetTableEntry Tileset39E3 ; 27 (39E3)
  TilesetTableEntry Tileset39D5 ; 28 (39E5)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 29 (39E7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 2A (39E9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 2B (39EB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 2C (39ED)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 2D (39EF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 2E (39F1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 2F (39F3)
  TilesetTableEntry ShopBuySellText ; 30 (39F5)
  TilesetTableEntry ShopBubbleText ; 31 (39F7)
  TilesetTableEntry Tileset39F9 ; 32 (39F9)
  TilesetTableEntry Tileset39FB ; 33 (39FB)
  TilesetTableEntry Tileset39FD ; 34 (39FD)
  TilesetTableEntry Tileset39FF ; 35 (39FF)
  TilesetTableEntry ShopBuySellKanji ; 36 (3A01)
  TilesetTableEntry Tileset3A03 ; 37 (3A03)
  TilesetTableEntry Tileset3A05 ; 38 (3A05)
  TilesetTableEntry Tileset3A07 ; 39 (3A07)
  TilesetTableEntry Tileset3A09 ; 3A (3A09)
  TilesetTableEntry PaintShopShopkeeperAvatar ; 3B (3A0B)
  TilesetTableEntry PaintShopBubbleText ; 3C (3A0D)
  TilesetTableEntry Tileset3A0F ; 3D (3A0F)
  TilesetTableEntry Tileset3A11 ; 3E (3A11)
  TilesetTableEntry Tileset3A13 ; 3F (3A13)
  TilesetTableEntry Tileset3A15 ; 40 (3A15)
  TilesetTableEntry Tileset3A17 ; 41 (3A17)
  TilesetTableEntry Tileset3A19 ; 42 (3A19)
  TilesetTableEntry Tileset3A1B ; 43 (3A1B)
  TilesetTableEntry Tileset3A1D ; 44 (3A1D)
  TilesetTableEntry Tileset3A1F ; 45 (3A1F)
  TilesetTableEntry Tileset3A21 ; 46 (3A21)
  TilesetTableEntry Tileset3A23 ; 47 (3A23)
  TilesetTableEntry Tileset3995 ; 48 (3A25)
  TilesetTableEntry Tileset3A27 ; 49 (3A27)
  TilesetTableEntry Tileset3A29 ; 4A (3A29)
  TilesetTableEntry Tileset3A2B ; 4B (3A2B)
  TilesetTableEntry Tileset3A2D ; 4C (3A2D)
  TilesetTableEntry Tileset3A2F ; 4D (3A2F)
  TilesetTableEntry Tileset3A31 ; 4E (3A31)
  TilesetTableEntry Tileset3A33 ; 4F (3A33)
  TilesetTableEntry Tileset3A35 ; 50 (3A35)
  TilesetTableEntry ChapterScreenHeaderFooter ; 51 (3A37)
  TilesetTableEntry ChapterScreenChapterNumber1 ; 52 (3A39)
  TilesetTableEntry ChapterScreenChapterNumber2 ; 53 (3A3B)
  TilesetTableEntry ChapterScreenChapterNumber3 ; 54 (3A3D)
  TilesetTableEntry ChapterScreenChapterNumber4 ; 55 (3A3F)
  TilesetTableEntry ChapterScreenChapterNumber5 ; 56 (3A41)
  TilesetTableEntry ChapterScreenChapterNumber6 ; 57 (3A43)
  TilesetTableEntry ChapterScreenChapterTitle1 ; 58 (3A45)
  TilesetTableEntry ChapterScreenChapterTitle2 ; 59 (3A47)
  TilesetTableEntry ChapterScreenChapterTitle3 ; 5A (3A49)
  TilesetTableEntry ChapterScreenChapterTitle4Kabuto ; 5B (3A4B)
  TilesetTableEntry ChapterScreenChapterTitle4Kuwagata ; 5C (3A4D)
  TilesetTableEntry ChapterScreenChapterTitle5 ; 5D (3A4F)
  TilesetTableEntry ChapterScreenChapterTitle6 ; 5E (3A51)
  TilesetTableEntry Tileset3A53 ; 5F (3A53)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 60 (3A55)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 61 (3A57)
  TilesetTableEntry Tileset3A59 ; 62 (3A59)
  TilesetTableEntry Tileset3A5B ; 63 (3A5B)
  TilesetTableEntry Tileset3A5D ; 64 (3A5D)
  TilesetTableEntry Tileset3A5F ; 65 (3A5F)
  TilesetTableEntry Tileset3A61_GAMEVERSION ; 66 (3A61)
  TilesetTableEntry Tileset3A63_GAMEVERSION ; 67 (3A63)
  TilesetTableEntry Tileset3A65 ; 68 (3A65)
  TilesetTableEntry Tileset3A67 ; 69 (3A67)
  TilesetTableEntry Tileset3A69 ; 6A (3A69)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 6B (3A6B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 6C (3A6D)
  TilesetTableEntry Tileset3A6F ; 6D (3A6F)
  TilesetTableEntry Tileset3A71 ; 6E (3A71)
  TilesetTableEntry GameOverScreenCharacters ; 6F (3A73)
  TilesetTableEntry Tileset3A75 ; 70 (3A75)
  TilesetTableEntry Tileset3A77 ; 71 (3A77)
  TilesetTableEntry Tileset3A79 ; 72 (3A79)
  TilesetTableEntry Tileset3A7B ; 73 (3A7B)
  TilesetTableEntry Tileset3A7D ; 74 (3A7D)
  TilesetTableEntry AutoBattleSymbols ; 75 (3A7F)
  TilesetTableEntry Tileset3A81 ; 76 (3A81)
  TilesetTableEntry Tileset3A83 ; 77 (3A83)
  TilesetTableEntry Tileset3A85 ; 78 (3A85)
  TilesetTableEntry Tileset3A87 ; 79 (3A87)
  TilesetTableEntry Tileset3A89 ; 7A (3A89)
  TilesetTableEntry Tileset3A8B ; 7B (3A8B)
  TilesetTableEntry Tileset3A8D ; 7C (3A8D)
  TilesetTableEntry Tileset3A8F ; 7D (3A8F)
  TilesetTableEntry Tileset3A91 ; 7E (3A91)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 7F (3A93)
  TilesetTableEntry Tileset3A95 ; 80 (3A95)
  TilesetTableEntry Tileset3A97 ; 81 (3A97)
  TilesetTableEntry Tileset3A99 ; 82 (3A99)
  TilesetTableEntry Tileset3A9B ; 83 (3A9B)
  TilesetTableEntry Tileset3A9D ; 84 (3A9D)
  TilesetTableEntry Tileset3A9F ; 85 (3A9F)
  TilesetTableEntry Tileset3AA1 ; 86 (3AA1)
  TilesetTableEntry Tileset3AA3 ; 87 (3AA3)
  TilesetTableEntry Tileset3AA5 ; 88 (3AA5)
  TilesetTableEntry Tileset3AA7 ; 89 (3AA7)
  TilesetTableEntry Tileset3AA9 ; 8A (3AA9)
  TilesetTableEntry Tileset3AAB ; 8B (3AAB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 8C (3AAD)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 8D (3AAF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 8E (3AB1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 8F (3AB3)
  TilesetTableEntry Tileset3AB5 ; 90 (3AB5)
  TilesetTableEntry Tileset3AB7 ; 91 (3AB7)
  TilesetTableEntry Tileset3AB9 ; 92 (3AB9)
  TilesetTableEntry Tileset3ABB ; 93 (3ABB)
  TilesetTableEntry Tileset3ABD ; 94 (3ABD)
  TilesetTableEntry Tileset3ABF ; 95 (3ABF)
  TilesetTableEntry Tileset3AC1 ; 96 (3AC1)
  TilesetTableEntry Tileset3AC3 ; 97 (3AC3)
  TilesetTableEntry Tileset3AC5 ; 98 (3AC5)
  TilesetTableEntry Tileset3AC7 ; 99 (3AC7)
  TilesetTableEntry Tileset3AC9 ; 9A (3AC9)
  TilesetTableEntry Tileset3ACB ; 9B (3ACB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 9C (3ACD)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 9D (3ACF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 9E (3AD1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 9F (3AD3)
  TilesetTableEntry Tileset3AD5 ; A0 (3AD5)
  TilesetTableEntry Tileset3AD7 ; A1 (3AD7)
  TilesetTableEntry Tileset3AD9 ; A2 (3AD9)
  TilesetTableEntry Tileset3ADB ; A3 (3ADB)
  TilesetTableEntry Tileset3ADD ; A4 (3ADD)
  TilesetTableEntry Tileset3ADF ; A5 (3ADF)
  TilesetTableEntry Tileset3AE1 ; A6 (3AE1)
  TilesetTableEntry Tileset3AE3 ; A7 (3AE3)
  TilesetTableEntry Tileset3AE5 ; A8 (3AE5)
  TilesetTableEntry Tileset3AE7 ; A9 (3AE7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; AA (3AE9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; AB (3AEB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; AC (3AED)
  TilesetTableEntry TilesetSourceAddressTableEnd ; AD (3AEF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; AE (3AF1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; AF (3AF3)
  TilesetTableEntry Tileset3AF5 ; B0 (3AF5)
  TilesetTableEntry Tileset3AF7 ; B1 (3AF7)
  TilesetTableEntry Tileset3AF9 ; B2 (3AF9)
  TilesetTableEntry Tileset3AFB ; B3 (3AFB)
  TilesetTableEntry Tileset3AF5 ; B4 (3AFD)
  TilesetTableEntry Tileset3AFF ; B5 (3AFF)
  TilesetTableEntry Tileset3B01 ; B6 (3B01)
  TilesetTableEntry Tileset3B03 ; B7 (3B03)
  TilesetTableEntry Tileset3B05 ; B8 (3B05)
  TilesetTableEntry Tileset3AF5 ; B9 (3B07)
  TilesetTableEntry Tileset3B09 ; BA (3B09)
  TilesetTableEntry Tileset3B0B ; BB (3B0B)
  TilesetTableEntry Tileset3AF5 ; BC (3B0D)
  TilesetTableEntry Tileset3B0F ; BD (3B0F)
  TilesetTableEntry Tileset3AF5 ; BE (3B11)
  TilesetTableEntry Tileset3B13 ; BF (3B13)
  TilesetTableEntry Tileset3B15 ; C0 (3B15)
  TilesetTableEntry Tileset3AF5 ; C1 (3B17)
  TilesetTableEntry Tileset3AF5 ; C2 (3B19)
  TilesetTableEntry Tileset3B1B ; C3 (3B1B)
  TilesetTableEntry Tileset3B1D ; C4 (3B1D)
  TilesetTableEntry Tileset3B1F ; C5 (3B1F)
  TilesetTableEntry Tileset3B21 ; C6 (3B21)
  TilesetTableEntry Tileset3B23 ; C7 (3B23)
  TilesetTableEntry Tileset3B25 ; C8 (3B25)
  TilesetTableEntry Tileset3B27 ; C9 (3B27)
  TilesetTableEntry Tileset3B29 ; CA (3B29)
  TilesetTableEntry Tileset3B2B ; CB (3B2B)
  TilesetTableEntry Tileset3B2D ; CC (3B2D)
  TilesetTableEntry Tileset3B2F ; CD (3B2F)
  TilesetTableEntry Tileset3B31 ; CE (3B31)
  TilesetTableEntry Tileset3B33 ; CF (3B33)
  TilesetTableEntry Tileset3AF5 ; D0 (3B35)
  TilesetTableEntry Tileset3B37 ; D1 (3B37)
  TilesetTableEntry Tileset3B39 ; D2 (3B39)
  TilesetTableEntry Tileset3B3B ; D3 (3B3B)
  TilesetTableEntry Tileset3B3D ; D4 (3B3D)
  TilesetTableEntry Tileset3B3F ; D5 (3B3F)
  TilesetTableEntry Tileset3B41 ; D6 (3B41)
  TilesetTableEntry Tileset3B43 ; D7 (3B43)
  TilesetTableEntry Tileset3B45 ; D8 (3B45)
  TilesetTableEntry Tileset3AF5 ; D9 (3B47)
  TilesetTableEntry Tileset3AF5 ; DA (3B49)
  TilesetTableEntry Tileset3AF5 ; DB (3B4B)
  TilesetTableEntry Tileset3AF5 ; DC (3B4D)
  TilesetTableEntry Tileset3B4F ; DD (3B4F)
  TilesetTableEntry Tileset3B51 ; DE (3B51)
  TilesetTableEntry Tileset3B53 ; DF (3B53)
  TilesetTableEntry Tileset3B55 ; E0 (3B55)
  TilesetTableEntry Tileset3B57 ; E1 (3B57)
  TilesetTableEntry Tileset3B59 ; E2 (3B59)
  TilesetTableEntry Tileset3B5B ; E3 (3B5B)
  TilesetTableEntry Tileset3B5D ; E4 (3B5D)
  TilesetTableEntry Tileset3AF5 ; E5 (3B5F)
  TilesetTableEntry Tileset3AF5 ; E6 (3B61)
  TilesetTableEntry Tileset3AF5 ; E7 (3B63)
  TilesetTableEntry Tileset3AF5 ; E8 (3B65)
  TilesetTableEntry Tileset3AF5 ; E9 (3B67)
  TilesetTableEntry Tileset3AF5 ; EA (3B69)
  TilesetTableEntry Tileset3B6B ; EB (3B6B)
  TilesetTableEntry Tileset3B6D ; EC (3B6D)
  TilesetTableEntry Tileset3B6F ; ED (3B6F)
  TilesetTableEntry Tileset3B71 ; EE (3B71)
  TilesetTableEntry Tileset3B73 ; EF (3B73)
  TilesetTableEntry Tileset3B75 ; F0 (3B75)
  TilesetTableEntry Tileset3B77 ; F1 (3B77)
  TilesetTableEntry Tileset3AF5 ; F2 (3B79)
  TilesetTableEntry Tileset3B7B ; F3 (3B7B)
  TilesetTableEntry Tileset3B7D ; F4 (3B7D)
  TilesetTableEntry Tileset3B7F ; F5 (3B7F)
  TilesetTableEntry Tileset3B81 ; F6 (3B81)
  TilesetTableEntry Tileset3B83 ; F7 (3B83)
  TilesetTableEntry Tileset3B85 ; F8 (3B85)
  TilesetTableEntry Tileset3B87 ; F9 (3B87)
  TilesetTableEntry Tileset3B89 ; FA (3B89)
  TilesetTableEntry Tileset3B8B ; FB (3B8B)
  TilesetTableEntry Tileset3B8D ; FC (3B8D)
  TilesetTableEntry Tileset3B8F ; FD (3B8F)
  TilesetTableEntry Tileset3B91 ; FE (3B91)
  TilesetTableEntry Tileset3B93 ; FF (3B93)
  TilesetTableEntry Tileset3B95 ; 100 (3B95)
  TilesetTableEntry Tileset3B97 ; 101 (3B97)
  TilesetTableEntry Tileset3B99 ; 102 (3B99)
  TilesetTableEntry Tileset3B9B ; 103 (3B9B)
  TilesetTableEntry Tileset3B9D ; 104 (3B9D)
  TilesetTableEntry Tileset3B9F ; 105 (3B9F)
  TilesetTableEntry Tileset3BA1 ; 106 (3BA1)
  TilesetTableEntry Tileset3BA3 ; 107 (3BA3)
  TilesetTableEntry Tileset3BA5 ; 108 (3BA5)
  TilesetTableEntry Tileset3BA7 ; 109 (3BA7)
  TilesetTableEntry Tileset3BA9 ; 10A (3BA9)
  TilesetTableEntry Tileset3BAB ; 10B (3BAB)
  TilesetTableEntry Tileset3BAD ; 10C (3BAD)
  TilesetTableEntry Tileset3BAF ; 10D (3BAF)
  TilesetTableEntry Tileset3BB1 ; 10E (3BB1)
  TilesetTableEntry Tileset3BB3 ; 10F (3BB3)
  TilesetTableEntry Tileset3BB5 ; 110 (3BB5)
  TilesetTableEntry Tileset3BB7 ; 111 (3BB7)
  TilesetTableEntry Tileset3BB9 ; 112 (3BB9)
  TilesetTableEntry Tileset3BBB ; 113 (3BBB)
  TilesetTableEntry Tileset3BBD ; 114 (3BBD)
  TilesetTableEntry Tileset3BBF ; 115 (3BBF)
  TilesetTableEntry Tileset3BC1 ; 116 (3BC1)
  TilesetTableEntry Tileset3BC3 ; 117 (3BC3)
  TilesetTableEntry Tileset3BC5 ; 118 (3BC5)
  TilesetTableEntry Tileset3BC7 ; 119 (3BC7)
  TilesetTableEntry Tileset3BC9 ; 11A (3BC9)
  TilesetTableEntry Tileset3BCB ; 11B (3BCB)
  TilesetTableEntry Tileset3BCD ; 11C (3BCD)
  TilesetTableEntry Tileset3BCF ; 11D (3BCF)
  TilesetTableEntry Tileset3BD1 ; 11E (3BD1)
  TilesetTableEntry Tileset3BD3 ; 11F (3BD3)
  TilesetTableEntry Tileset3BD5 ; 120 (3BD5)
  TilesetTableEntry Tileset3BD7 ; 121 (3BD7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 122 (3BD9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 123 (3BDB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 124 (3BDD)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 125 (3BDF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 126 (3BE1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 127 (3BE3)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 128 (3BE5)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 129 (3BE7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 12A (3BE9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 12B (3BEB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 12C (3BED)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 12D (3BEF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 12E (3BF1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 12F (3BF3)
  TilesetTableEntry Tileset3BF5 ; 130 (3BF5)
  TilesetTableEntry Tileset3BF7 ; 131 (3BF7)
  TilesetTableEntry Tileset3BF9 ; 132 (3BF9)
  TilesetTableEntry Tileset3BFB ; 133 (3BFB)
  TilesetTableEntry Tileset3BFD ; 134 (3BFD)
  TilesetTableEntry Tileset3BFF ; 135 (3BFF)
  TilesetTableEntry Tileset3C01 ; 136 (3C01)
  TilesetTableEntry Tileset3C03 ; 137 (3C03)
  TilesetTableEntry Tileset3C05 ; 138 (3C05)
  TilesetTableEntry Tileset3C07 ; 139 (3C07)
  TilesetTableEntry Tileset3C09 ; 13A (3C09)
  TilesetTableEntry Tileset3C0B ; 13B (3C0B)
  TilesetTableEntry Tileset3C0D ; 13C (3C0D)
  TilesetTableEntry Tileset3C0F ; 13D (3C0F)
  TilesetTableEntry Tileset3C11 ; 13E (3C11)
  TilesetTableEntry Tileset3C13 ; 13F (3C13)
  TilesetTableEntry Tileset3C15 ; 140 (3C15)
  TilesetTableEntry Tileset3C17 ; 141 (3C17)
  TilesetTableEntry Tileset3C19 ; 142 (3C19)
  TilesetTableEntry Tileset3C1B ; 143 (3C1B)
  TilesetTableEntry Tileset3C1D ; 144 (3C1D)
  TilesetTableEntry Tileset3C1F ; 145 (3C1F)
  TilesetTableEntry Tileset3C21 ; 146 (3C21)
  TilesetTableEntry Tileset3C23 ; 147 (3C23)
  TilesetTableEntry Tileset3C25 ; 148 (3C25)
  TilesetTableEntry Tileset3C27 ; 149 (3C27)
  TilesetTableEntry Tileset3C29 ; 14A (3C29)
  TilesetTableEntry Tileset3C2B ; 14B (3C2B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 14C (3C2D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 14D (3C2F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 14E (3C31)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 14F (3C33)
  TilesetTableEntry Tileset3C35 ; 150 (3C35)
  TilesetTableEntry Tileset3C37 ; 151 (3C37)
  TilesetTableEntry Tileset3C39 ; 152 (3C39)
  TilesetTableEntry Tileset3C3B ; 153 (3C3B)
  TilesetTableEntry Tileset3C3D ; 154 (3C3D)
  TilesetTableEntry Tileset3C3F ; 155 (3C3F)
  TilesetTableEntry Tileset3C41 ; 156 (3C41)
  TilesetTableEntry Tileset3C43 ; 157 (3C43)
  TilesetTableEntry Tileset3C45 ; 158 (3C45)
  TilesetTableEntry Tileset3C47 ; 159 (3C47)
  TilesetTableEntry Tileset3C49 ; 15A (3C49)
  TilesetTableEntry Tileset3C4B ; 15B (3C4B)
  TilesetTableEntry OpeningAnimationCharacterNames ; 15C (3C4D)
  TilesetTableEntry OpeningAnimationMedapartsStatus ; 15D (3C4F)
  TilesetTableEntry Tileset3C51 ; 15E (3C51)
  TilesetTableEntry Tileset3C53 ; 15F (3C53)
  TilesetTableEntry OpeningAnimationTransformStatus ; 160 (3C55)
  TilesetTableEntry OpeningAnimationTransformImages1 ; 161 (3C57)
  TilesetTableEntry OpeningAnimationTransformImages2 ; 162 (3C59)
  TilesetTableEntry Tileset3C5B ; 163 (3C5B)
  TilesetTableEntry StartScreenText ; 164 (3C5D)
  TilesetTableEntry StartScreenMainLogoRotation ; 165 (3C5F)
  TilesetTableEntry StartScreenMainLogo ; 166 (3C61)
  TilesetTableEntry Tileset3C63 ; 167 (3C63)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 168 (3C65)
  TilesetTableEntry Tileset3C67 ; 169 (3C67)
  TilesetTableEntry StartScreenFireEffect2 ; 16A (3C69)
  TilesetTableEntry Tileset3C6B ; 16B (3C6B)
  TilesetTableEntry Tileset3C6D ; 16C (3C6D)
  TilesetTableEntry SplashScreenConceptCredit ; 16D (3C6F)
  TilesetTableEntry BorderTextMedarot3 ; 16E (3C71)
  TilesetTableEntry Tileset3C73 ; 16F (3C73)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 170 (3C75)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 171 (3C77)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 172 (3C79)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 173 (3C7B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 174 (3C7D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 175 (3C7F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 176 (3C81)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 177 (3C83)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 178 (3C85)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 179 (3C87)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 17A (3C89)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 17B (3C8B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 17C (3C8D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 17D (3C8F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 17E (3C91)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 17F (3C93)
  TilesetTableEntry Tileset3C95 ; 180 (3C95)
  TilesetTableEntry Tileset3C97 ; 181 (3C97)
  TilesetTableEntry Tileset3C99 ; 182 (3C99)
  TilesetTableEntry Tileset3C99 ; 183 (3C9B)
  TilesetTableEntry Tileset3C9D ; 184 (3C9D)
  TilesetTableEntry Tileset3C9F ; 185 (3C9F)
  TilesetTableEntry Tileset3CA1 ; 186 (3CA1)
  TilesetTableEntry Tileset3CA3 ; 187 (3CA3)
  TilesetTableEntry Tileset3CA5 ; 188 (3CA5)
  TilesetTableEntry Tileset3CA7 ; 189 (3CA7)
  TilesetTableEntry Tileset3CA9 ; 18A (3CA9)
  TilesetTableEntry Tileset3CA9 ; 18B (3CAB)
  TilesetTableEntry Tileset3CAD ; 18C (3CAD)
  TilesetTableEntry Tileset3CAF ; 18D (3CAF)
  TilesetTableEntry Tileset3CB1 ; 18E (3CB1)
  TilesetTableEntry Tileset3CB3 ; 18F (3CB3)
  TilesetTableEntry Tileset3CB5 ; 190 (3CB5)
  TilesetTableEntry Tileset3CB7 ; 191 (3CB7)
  TilesetTableEntry Tileset3CB9 ; 192 (3CB9)
  TilesetTableEntry Tileset3CBB ; 193 (3CBB)
  TilesetTableEntry Tileset3CBD ; 194 (3CBD)
  TilesetTableEntry Tileset3CBF ; 195 (3CBF)
  TilesetTableEntry Tileset3CC1 ; 196 (3CC1)
  TilesetTableEntry Tileset3CC3 ; 197 (3CC3)
  TilesetTableEntry Tileset3CC5 ; 198 (3CC5)
  TilesetTableEntry Tileset3CC7 ; 199 (3CC7)
  TilesetTableEntry Tileset3CC9 ; 19A (3CC9)
  TilesetTableEntry Tileset3CCB ; 19B (3CCB)
  TilesetTableEntry Tileset3CCD ; 19C (3CCD)
  TilesetTableEntry Tileset3CCF ; 19D (3CCF)
  TilesetTableEntry Tileset3CD1 ; 19E (3CD1)
  TilesetTableEntry Tileset3CD3 ; 19F (3CD3)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A0 (3CD5)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A1 (3CD7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A2 (3CD9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A3 (3CDB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A4 (3CDD)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A5 (3CDF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A6 (3CE1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A7 (3CE3)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A8 (3CE5)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1A9 (3CE7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1AA (3CE9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1AB (3CEB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1AC (3CED)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1AD (3CEF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1AE (3CF1)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1AF (3CF3)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B0 (3CF5)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B1 (3CF7)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B2 (3CF9)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B3 (3CFB)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B4 (3CFD)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B5 (3CFF)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B6 (3D01)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B7 (3D03)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B8 (3D05)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1B9 (3D07)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1BA (3D09)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1BB (3D0B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1BC (3D0D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1BD (3D0F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1BE (3D11)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1BF (3D13)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C0 (3D15)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C1 (3D17)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C2 (3D19)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C3 (3D1B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C4 (3D1D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C5 (3D1F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C6 (3D21)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C7 (3D23)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C8 (3D25)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1C9 (3D27)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1CA (3D29)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1CB (3D2B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1CC (3D2D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1CD (3D2F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1CE (3D31)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1CF (3D33)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D0 (3D35)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D1 (3D37)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D2 (3D39)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D3 (3D3B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D4 (3D3D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D5 (3D3F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D6 (3D41)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D7 (3D43)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D8 (3D45)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1D9 (3D47)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1DA (3D49)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1DB (3D4B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1DC (3D4D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1DD (3D4F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1DE (3D51)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1DF (3D53)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E0 (3D55)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E1 (3D57)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E2 (3D59)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E3 (3D5B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E4 (3D5D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E5 (3D5F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E6 (3D61)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E7 (3D63)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E8 (3D65)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1E9 (3D67)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1EA (3D69)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1EB (3D6B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1EC (3D6D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1ED (3D6F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1EE (3D71)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1EF (3D73)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F0 (3D75)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F1 (3D77)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F2 (3D79)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F3 (3D7B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F4 (3D7D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F5 (3D7F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F6 (3D81)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F7 (3D83)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F8 (3D85)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1F9 (3D87)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1FA (3D89)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1FB (3D8B)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1FC (3D8D)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1FD (3D8F)
  TilesetTableEntry TilesetSourceAddressTableEnd ; 1FE (3D91)
  TilesetTableEntry OpeningAnimationRoboRoboGang ; 1FF (3D93), Patch Tileset
TilesetSourceAddressTableEnd::

SECTION "Tileset Info Table", ROMX[$706A], BANK[$39]
TilesetInfoTable::
  dbwb BANK(Tileset3995), $9000, $0 ; 000
  dbwb BANK(Tileset3997), $8FC0, $1 ; 001
  dbwb BANK(MainDialog1), $9000, $1 ; 002
  dbwb BANK(MainDialog2), $8800, $1 ; 003
  dbwb BANK(Special), $8E00, $1 ; 004
  dbwb BANK(Tileset399F), $8D40, $1 ; 005
  dbwb BANK(MenuMedawatchGraphics), $9000, $0 ; 006
  dbwb BANK(Tileset39A3), $9500, $0 ; 007
  dbwb BANK(Tileset39A5), $9500, $0 ; 008
  dbwb BANK(Tileset39A7), $9500, $0 ; 009
  dbwb BANK(Tileset39A9), $9500, $0 ; 00A
  dbwb BANK(Tileset39AB), $9500, $0 ; 00B
  dbwb BANK(MenuMedawatchTextSprites), $8000, $0 ; 00C
  dbwb BANK(Tileset39AF), $86C0, $0 ; 00D
  dbwb BANK(PartsScreen), $9000, $0 ; 00E
  dbwb BANK(Tileset39B3), $8CC0, $0 ; 00F
  dbwb BANK(Tileset39B5), $8F30, $0 ; 010
  dbwb BANK(Tileset39B7), $8000, $0 ; 011
  dbwb BANK(Tileset39B9), $8900, $0 ; 012
  dbwb BANK(Tileset39BB), $8ED0, $0 ; 013
  dbwb BANK(MedalInfoText), $9000, $0 ; 014
  dbwb BANK(Tileset39BF), $9000, $0 ; 015
  dbwb BANK(Tileset39C1), $8000, $0 ; 016
  dbwb BANK(Tileset39C3), $8D00, $0 ; 017
  dbwb BANK(Tileset39C5), $9000, $0 ; 018
  dbwb BANK(Tileset39C7), $9000, $1 ; 019
  dbwb BANK(Tileset39C9), $8800, $1 ; 01A
  dbwb BANK(Tileset39CB), $9000, $0 ; 01B
  dbwb BANK(GBCOnlyErrorScreenTextGraphics), $9000, $0 ; 01C
  dbwb BANK(Tileset39CF), $9000, $0 ; 01D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 01E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 01F
  dbwb BANK(Tileset39D5), $8800, $0 ; 020
  dbwb BANK(Digits), $8F00, $0 ; 021
  dbwb BANK(Tileset39D9), $9000, $0 ; 022
  dbwb BANK(Tileset39DB), $9400, $0 ; 023
  dbwb BANK(Tileset39DD), $8000, $0 ; 024
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 025
  dbwb BANK(Tileset39E1), $9000, $0 ; 026
  dbwb BANK(Tileset39E3), $8000, $0 ; 027
  dbwb BANK(Tileset39D5), $8800, $0 ; 028
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 029
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02A
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02F
  dbwb BANK(ShopBuySellText), $9000, $0 ; 030
  dbwb BANK(ShopBubbleText), $8400, $0 ; 031
  dbwb BANK(Tileset39F9), $8C00, $0 ; 032
  dbwb BANK(Tileset39FB), $8C00, $0 ; 033
  dbwb BANK(Tileset39FD), $8C00, $0 ; 034
  dbwb BANK(Tileset39FF), $8C00, $0 ; 035
  dbwb BANK(ShopBuySellKanji), $8600, $0 ; 036
  dbwb BANK(Tileset3A03), $82C0, $0 ; 037
  dbwb BANK(Tileset3A05), $8300, $0 ; 038
  dbwb BANK(Tileset3A07), $8000, $1 ; 039
  dbwb BANK(Tileset3A09), $9000, $0 ; 03A
  dbwb BANK(PaintShopShopkeeperAvatar), $9560, $0 ; 03B
  dbwb BANK(PaintShopBubbleText), $8400, $0 ; 03C
  dbwb BANK(Tileset3A0F), $8300, $0 ; 03D
  dbwb BANK(Tileset3A11), $8000, $0 ; 03E
  dbwb BANK(Tileset3A13), $8B60, $0 ; 03F
  dbwb BANK(Tileset3A15), $8C20, $0 ; 040
  dbwb BANK(Tileset3A17), $9000, $0 ; 041
  dbwb BANK(Tileset3A19), $8AA0, $0 ; 042
  dbwb BANK(Tileset3A1B), $8000, $0 ; 043
  dbwb BANK(Tileset3A1D), $9000, $0 ; 044
  dbwb BANK(Tileset3A1F), $9000, $0 ; 045
  dbwb BANK(Tileset3A21), $9000, $0 ; 046
  dbwb BANK(Tileset3A23), $8800, $0 ; 047
  dbwb BANK(Tileset3995), $8000, $0 ; 048
  dbwb BANK(Tileset3A27), $8800, $0 ; 049
  dbwb BANK(Tileset3A29), $8800, $0 ; 04A
  dbwb BANK(Tileset3A2B), $8800, $0 ; 04B
  dbwb BANK(Tileset3A2D), $8500, $0 ; 04C
  dbwb BANK(Tileset3A2F), $8800, $0 ; 04D
  dbwb BANK(Tileset3A31), $8000, $0 ; 04E
  dbwb BANK(Tileset3A33), $8000, $0 ; 04F
  dbwb BANK(Tileset3A35), $9000, $0 ; 050
  dbwb BANK(ChapterScreenHeaderFooter), $9000, $0 ; 051
  dbwb BANK(ChapterScreenChapterNumber1), $9160, $0 ; 052
  dbwb BANK(ChapterScreenChapterNumber2), $9160, $0 ; 053
  dbwb BANK(ChapterScreenChapterNumber3), $9160, $0 ; 054
  dbwb BANK(ChapterScreenChapterNumber4), $9160, $0 ; 055
  dbwb BANK(ChapterScreenChapterNumber5), $9160, $0 ; 056
  dbwb BANK(ChapterScreenChapterNumber6), $9160, $0 ; 057
  dbwb BANK(ChapterScreenChapterTitle1), $9010, $1 ; 058
  dbwb BANK(ChapterScreenChapterTitle2), $9010, $1 ; 059
  dbwb BANK(ChapterScreenChapterTitle3), $9010, $1 ; 05A
  dbwb BANK(ChapterScreenChapterTitle4Kabuto), $9010, $1 ; 05B
  dbwb BANK(ChapterScreenChapterTitle4Kuwagata), $9010, $1 ; 05C
  dbwb BANK(ChapterScreenChapterTitle5), $9010, $1 ; 05D
  dbwb BANK(ChapterScreenChapterTitle6), $9010, $1 ; 05E
  dbwb BANK(Tileset3A53), $8800, $0 ; 05F
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 060
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 061
  dbwb BANK(Tileset3A59), $8800, $0 ; 062
  dbwb BANK(Tileset3A5B), $8800, $0 ; 063
  dbwb BANK(Tileset3A5D), $8800, $0 ; 064
  dbwb BANK(Tileset3A5F), $8800, $0 ; 065
  dbwb BANK(Tileset3A61_GAMEVERSION), $8800, $0 ; 066
  dbwb BANK(Tileset3A63_GAMEVERSION), $8800, $0 ; 067
  dbwb BANK(Tileset3A65), $8800, $0 ; 068
  dbwb BANK(Tileset3A67), $8800, $0 ; 069
  dbwb BANK(Tileset3A69), $8800, $0 ; 06A
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 06B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 06C
  dbwb BANK(Tileset3A6F), $9000, $0 ; 06D
  dbwb BANK(Tileset3A71), $8800, $0 ; 06E
  dbwb BANK(GameOverScreenCharacters), $9000, $0 ; 06F
  dbwb BANK(Tileset3A75), $8100, $0 ; 070
  dbwb BANK(Tileset3A77), $8800, $0 ; 071
  dbwb BANK(Tileset3A79), $8910, $0 ; 072
  dbwb BANK(Tileset3A7B), $8C10, $0 ; 073
  dbwb BANK(Tileset3A7D), $8F60, $0 ; 074
  dbwb BANK(AutoBattleSymbols), $9000, $0 ; 075
  dbwb BANK(Tileset3A81), $8DC0, $0 ; 076
  dbwb BANK(Tileset3A83), $8D00, $0 ; 077
  dbwb BANK(Tileset3A85), $8E00, $0 ; 078
  dbwb BANK(Tileset3A87), $8F00, $0 ; 079
  dbwb BANK(Tileset3A89), $9000, $0 ; 07A
  dbwb BANK(Tileset3A8B), $9290, $0 ; 07B
  dbwb BANK(Tileset3A8D), $8D40, $1 ; 07C
  dbwb BANK(Tileset3A8F), $9000, $0 ; 07D
  dbwb BANK(Tileset3A91), $8800, $0 ; 07E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 07F
  dbwb BANK(Tileset3A95), $9000, $0 ; 080
  dbwb BANK(Tileset3A97), $9000, $0 ; 081
  dbwb BANK(Tileset3A99), $9000, $0 ; 082
  dbwb BANK(Tileset3A9B), $9000, $0 ; 083
  dbwb BANK(Tileset3A9D), $9000, $0 ; 084
  dbwb BANK(Tileset3A9F), $9000, $0 ; 085
  dbwb BANK(Tileset3AA1), $9000, $0 ; 086
  dbwb BANK(Tileset3AA3), $9000, $0 ; 087
  dbwb BANK(Tileset3AA5), $9000, $0 ; 088
  dbwb BANK(Tileset3AA7), $9000, $0 ; 089
  dbwb BANK(Tileset3AA9), $9000, $0 ; 08A
  dbwb BANK(Tileset3AAB), $9000, $0 ; 08B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08F
  dbwb BANK(Tileset3AB5), $9000, $0 ; 090
  dbwb BANK(Tileset3AB7), $9000, $0 ; 091
  dbwb BANK(Tileset3AB9), $9000, $0 ; 092
  dbwb BANK(Tileset3ABB), $9000, $0 ; 093
  dbwb BANK(Tileset3ABD), $9000, $0 ; 094
  dbwb BANK(Tileset3ABF), $9000, $0 ; 095
  dbwb BANK(Tileset3AC1), $9000, $0 ; 096
  dbwb BANK(Tileset3AC3), $9000, $0 ; 097
  dbwb BANK(Tileset3AC5), $9000, $0 ; 098
  dbwb BANK(Tileset3AC7), $9000, $0 ; 099
  dbwb BANK(Tileset3AC9), $9000, $0 ; 09A
  dbwb BANK(Tileset3ACB), $9000, $0 ; 09B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09F
  dbwb BANK(Tileset3AD5), $9000, $0 ; 0A0
  dbwb BANK(Tileset3AD7), $8000, $0 ; 0A1
  dbwb BANK(Tileset3AD9), $8000, $0 ; 0A2
  dbwb BANK(Tileset3ADB), $8800, $0 ; 0A3
  dbwb BANK(Tileset3ADD), $9000, $0 ; 0A4
  dbwb BANK(Tileset3ADF), $8000, $0 ; 0A5
  dbwb BANK(Tileset3AE1), $9000, $0 ; 0A6
  dbwb BANK(Tileset3AE3), $8000, $0 ; 0A7
  dbwb BANK(Tileset3AE5), $9000, $0 ; 0A8
  dbwb BANK(Tileset3AE7), $8B00, $0 ; 0A9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AF
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0B0
  dbwb BANK(Tileset3AF7), $8AA0, $0 ; 0B1
  dbwb BANK(Tileset3AF9), $8AA0, $0 ; 0B2
  dbwb BANK(Tileset3AFB), $8AA0, $0 ; 0B3
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0B4
  dbwb BANK(Tileset3AFF), $8AA0, $0 ; 0B5
  dbwb BANK(Tileset3B01), $8AA0, $0 ; 0B6
  dbwb BANK(Tileset3B03), $8AA0, $0 ; 0B7
  dbwb BANK(Tileset3B05), $8AA0, $0 ; 0B8
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0B9
  dbwb BANK(Tileset3B09), $8AA0, $0 ; 0BA
  dbwb BANK(Tileset3B0B), $8AA0, $0 ; 0BB
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0BC
  dbwb BANK(Tileset3B0F), $8AA0, $0 ; 0BD
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0BE
  dbwb BANK(Tileset3B13), $8AA0, $0 ; 0BF
  dbwb BANK(Tileset3B15), $8AA0, $0 ; 0C0
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0C1
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0C2
  dbwb BANK(Tileset3B1B), $8AA0, $0 ; 0C3
  dbwb BANK(Tileset3B1D), $8AA0, $0 ; 0C4
  dbwb BANK(Tileset3B1F), $8AA0, $0 ; 0C5
  dbwb BANK(Tileset3B21), $8AA0, $0 ; 0C6
  dbwb BANK(Tileset3B23), $8AA0, $0 ; 0C7
  dbwb BANK(Tileset3B25), $8AA0, $0 ; 0C8
  dbwb BANK(Tileset3B27), $8AA0, $0 ; 0C9
  dbwb BANK(Tileset3B29), $8AA0, $0 ; 0CA
  dbwb BANK(Tileset3B2B), $8AA0, $0 ; 0CB
  dbwb BANK(Tileset3B2D), $8AA0, $0 ; 0CC
  dbwb BANK(Tileset3B2F), $8AA0, $0 ; 0CD
  dbwb BANK(Tileset3B31), $8AA0, $0 ; 0CE
  dbwb BANK(Tileset3B33), $8AA0, $0 ; 0CF
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0D0
  dbwb BANK(Tileset3B37), $8AA0, $0 ; 0D1
  dbwb BANK(Tileset3B39), $8AA0, $0 ; 0D2
  dbwb BANK(Tileset3B3B), $8AA0, $0 ; 0D3
  dbwb BANK(Tileset3B3D), $8AA0, $0 ; 0D4
  dbwb BANK(Tileset3B3F), $8AA0, $0 ; 0D5
  dbwb BANK(Tileset3B41), $8AA0, $0 ; 0D6
  dbwb BANK(Tileset3B43), $8AA0, $0 ; 0D7
  dbwb BANK(Tileset3B45), $8AA0, $0 ; 0D8
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0D9
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0DA
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0DB
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0DC
  dbwb BANK(Tileset3B4F), $8AA0, $0 ; 0DD
  dbwb BANK(Tileset3B51), $8AA0, $0 ; 0DE
  dbwb BANK(Tileset3B53), $8AA0, $0 ; 0DF
  dbwb BANK(Tileset3B55), $8AA0, $0 ; 0E0
  dbwb BANK(Tileset3B57), $8AA0, $0 ; 0E1
  dbwb BANK(Tileset3B59), $8AA0, $0 ; 0E2
  dbwb BANK(Tileset3B5B), $8AA0, $0 ; 0E3
  dbwb BANK(Tileset3B5D), $8AA0, $0 ; 0E4
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0E5
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0E6
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0E7
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0E8
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0E9
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0EA
  dbwb BANK(Tileset3B6B), $8AA0, $0 ; 0EB
  dbwb BANK(Tileset3B6D), $8AA0, $0 ; 0EC
  dbwb BANK(Tileset3B6F), $8AA0, $0 ; 0ED
  dbwb BANK(Tileset3B71), $8AA0, $0 ; 0EE
  dbwb BANK(Tileset3B73), $8AA0, $0 ; 0EF
  dbwb BANK(Tileset3B75), $8AA0, $0 ; 0F0
  dbwb BANK(Tileset3B77), $8AA0, $0 ; 0F1
  dbwb BANK(Tileset3AF5), $8AA0, $0 ; 0F2
  dbwb BANK(Tileset3B7B), $8AA0, $0 ; 0F3
  dbwb BANK(Tileset3B7D), $8AA0, $0 ; 0F4
  dbwb BANK(Tileset3B7F), $8AA0, $0 ; 0F5
  dbwb BANK(Tileset3B81), $8AA0, $0 ; 0F6
  dbwb BANK(Tileset3B83), $8AA0, $0 ; 0F7
  dbwb BANK(Tileset3B85), $8AA0, $0 ; 0F8
  dbwb BANK(Tileset3B87), $8AA0, $0 ; 0F9
  dbwb BANK(Tileset3B89), $8AA0, $0 ; 0FA
  dbwb BANK(Tileset3B8B), $8AA0, $0 ; 0FB
  dbwb BANK(Tileset3B8D), $8AA0, $0 ; 0FC
  dbwb BANK(Tileset3B8F), $8AA0, $0 ; 0FD
  dbwb BANK(Tileset3B91), $8AA0, $0 ; 0FE
  dbwb BANK(Tileset3B93), $8AA0, $0 ; 0FF
  dbwb BANK(Tileset3B95), $8800, $0 ; 100
  dbwb BANK(Tileset3B97), $8800, $0 ; 101
  dbwb BANK(Tileset3B99), $8800, $0 ; 102
  dbwb BANK(Tileset3B9B), $8800, $0 ; 103
  dbwb BANK(Tileset3B9D), $8800, $0 ; 104
  dbwb BANK(Tileset3B9F), $8800, $0 ; 105
  dbwb BANK(Tileset3BA1), $8800, $0 ; 106
  dbwb BANK(Tileset3BA3), $8800, $0 ; 107
  dbwb BANK(Tileset3BA5), $8800, $0 ; 108
  dbwb BANK(Tileset3BA7), $8800, $0 ; 109
  dbwb BANK(Tileset3BA9), $8800, $0 ; 10A
  dbwb BANK(Tileset3BAB), $8800, $0 ; 10B
  dbwb BANK(Tileset3BAD), $8800, $0 ; 10C
  dbwb BANK(Tileset3BAF), $8800, $0 ; 10D
  dbwb BANK(Tileset3BB1), $8800, $0 ; 10E
  dbwb BANK(Tileset3BB3), $8800, $0 ; 10F
  dbwb BANK(Tileset3BB5), $8800, $0 ; 110
  dbwb BANK(Tileset3BB7), $8800, $0 ; 111
  dbwb BANK(Tileset3BB9), $8800, $0 ; 112
  dbwb BANK(Tileset3BBB), $8800, $0 ; 113
  dbwb BANK(Tileset3BBD), $8800, $0 ; 114
  dbwb BANK(Tileset3BBF), $8800, $0 ; 115
  dbwb BANK(Tileset3BC1), $8800, $0 ; 116
  dbwb BANK(Tileset3BC3), $8800, $0 ; 117
  dbwb BANK(Tileset3BC5), $8800, $0 ; 118
  dbwb BANK(Tileset3BC7), $8800, $0 ; 119
  dbwb BANK(Tileset3BC9), $8800, $0 ; 11A
  dbwb BANK(Tileset3BCB), $8800, $0 ; 11B
  dbwb BANK(Tileset3BCD), $8800, $0 ; 11C
  dbwb BANK(Tileset3BCF), $8800, $0 ; 11D
  dbwb BANK(Tileset3BD1), $8800, $0 ; 11E
  dbwb BANK(Tileset3BD3), $8800, $0 ; 11F
  dbwb BANK(Tileset3BD5), $8800, $0 ; 120
  dbwb BANK(Tileset3BD7), $8800, $0 ; 121
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 122
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 123
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 124
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 125
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 126
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 127
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 128
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 129
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 12A
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 12B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 12C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 12D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 12E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 12F
  dbwb BANK(Tileset3BF5), $8000, $1 ; 130
  dbwb BANK(Tileset3BF7), $8000, $1 ; 131
  dbwb BANK(Tileset3BF9), $8000, $1 ; 132
  dbwb BANK(Tileset3BFB), $8000, $1 ; 133
  dbwb BANK(Tileset3BFD), $8000, $1 ; 134
  dbwb BANK(Tileset3BFF), $8000, $1 ; 135
  dbwb BANK(Tileset3C01), $8000, $1 ; 136
  dbwb BANK(Tileset3C03), $8000, $1 ; 137
  dbwb BANK(Tileset3C05), $8000, $1 ; 138
  dbwb BANK(Tileset3C07), $8000, $1 ; 139
  dbwb BANK(Tileset3C09), $8200, $1 ; 13A
  dbwb BANK(Tileset3C0B), $8200, $1 ; 13B
  dbwb BANK(Tileset3C0D), $8000, $1 ; 13C
  dbwb BANK(Tileset3C0F), $8000, $1 ; 13D
  dbwb BANK(Tileset3C11), $8000, $1 ; 13E
  dbwb BANK(Tileset3C13), $8000, $1 ; 13F
  dbwb BANK(Tileset3C15), $8000, $1 ; 140
  dbwb BANK(Tileset3C17), $8000, $1 ; 141
  dbwb BANK(Tileset3C19), $8000, $1 ; 142
  dbwb BANK(Tileset3C1B), $8000, $1 ; 143
  dbwb BANK(Tileset3C1D), $8000, $1 ; 144
  dbwb BANK(Tileset3C1F), $8000, $1 ; 145
  dbwb BANK(Tileset3C21), $8000, $1 ; 146
  dbwb BANK(Tileset3C23), $8000, $1 ; 147
  dbwb BANK(Tileset3C25), $8000, $1 ; 148
  dbwb BANK(Tileset3C27), $8000, $1 ; 149
  dbwb BANK(Tileset3C29), $8000, $1 ; 14A
  dbwb BANK(Tileset3C2B), $8000, $1 ; 14B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14F
  dbwb BANK(Tileset3C35), $8000, $0 ; 150
  dbwb BANK(Tileset3C37), $9000, $0 ; 151
  dbwb BANK(Tileset3C39), $9000, $0 ; 152
  dbwb BANK(Tileset3C3B), $8800, $0 ; 153
  dbwb BANK(Tileset3C3D), $9000, $0 ; 154
  dbwb BANK(Tileset3C3F), $9000, $0 ; 155
  dbwb BANK(Tileset3C41), $9000, $0 ; 156
  dbwb BANK(Tileset3C43), $9000, $0 ; 157
  dbwb BANK(Tileset3C45), $9000, $0 ; 158
  dbwb BANK(Tileset3C47), $8800, $0 ; 159
  dbwb BANK(Tileset3C49), $9000, $1 ; 15A
  dbwb BANK(Tileset3C4B), $8800, $1 ; 15B
  dbwb BANK(OpeningAnimationCharacterNames), $8000, $0 ; 15C
  dbwb BANK(OpeningAnimationMedapartsStatus), $9000, $0 ; 15D
  dbwb BANK(Tileset3C51), $8800, $0 ; 15E
  dbwb BANK(Tileset3C53), $9000, $1 ; 15F
  dbwb BANK(OpeningAnimationTransformStatus), $9000, $0 ; 160
  dbwb BANK(OpeningAnimationTransformImages1), $8800, $0 ; 161
  dbwb BANK(OpeningAnimationTransformImages2), $9000, $1 ; 162
  dbwb BANK(Tileset3C5B), $9000, $0 ; 163
  dbwb BANK(StartScreenText), $8800, $0 ; 164
  dbwb BANK(StartScreenMainLogoRotation), $9000, $1 ; 165
  dbwb BANK(StartScreenMainLogo), $8800, $1 ; 166
  dbwb BANK(Tileset3C63), $8800, $1 ; 167
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 168
  dbwb BANK(Tileset3C67), $8000, $0 ; 169
  dbwb BANK(StartScreenFireEffect2), $8000, $1 ; 16A
  dbwb BANK(Tileset3C6B), $9000, $0 ; 16B
  dbwb BANK(Tileset3C6D), $8800, $0 ; 16C
  dbwb BANK(SplashScreenConceptCredit), $9000, $0 ; 16D
  dbwb BANK(BorderTextMedarot3), $9000, $0 ; 16E
  dbwb BANK(Tileset3C73), $9170, $0 ; 16F
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 170
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 171
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 172
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 173
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 174
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 175
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 176
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 177
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 178
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 179
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 17A
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 17B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 17C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 17D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 17E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 17F
  dbwb BANK(Tileset3C95), $8000, $0 ; 180
  dbwb BANK(Tileset3C97), $8800, $0 ; 181
  dbwb BANK(Tileset3C99), $8000, $1 ; 182
  dbwb BANK(Tileset3C99), $8000, $1 ; 183
  dbwb BANK(Tileset3C9D), $9000, $0 ; 184
  dbwb BANK(Tileset3C9F), $9000, $1 ; 185
  dbwb BANK(Tileset3CA1), $9000, $0 ; 186
  dbwb BANK(Tileset3CA3), $9000, $1 ; 187
  dbwb BANK(Tileset3CA5), $8000, $0 ; 188
  dbwb BANK(Tileset3CA7), $8800, $0 ; 189
  dbwb BANK(Tileset3CA9), $8000, $1 ; 18A
  dbwb BANK(Tileset3CA9), $8000, $1 ; 18B
  dbwb BANK(Tileset3CAD), $9000, $0 ; 18C
  dbwb BANK(Tileset3CAF), $9000, $1 ; 18D
  dbwb BANK(Tileset3CB1), $9000, $0 ; 18E
  dbwb BANK(Tileset3CB3), $9000, $1 ; 18F
  dbwb BANK(Tileset3CB5), $8000, $0 ; 190
  dbwb BANK(Tileset3CB7), $8800, $0 ; 191
  dbwb BANK(Tileset3CB9), $8000, $1 ; 192
  dbwb BANK(Tileset3CBB), $8800, $1 ; 193
  dbwb BANK(Tileset3CBD), $9000, $0 ; 194
  dbwb BANK(Tileset3CBF), $9000, $1 ; 195
  dbwb BANK(Tileset3CC1), $9000, $0 ; 196
  dbwb BANK(Tileset3CC3), $9000, $1 ; 197
  dbwb BANK(Tileset3CC5), $8000, $0 ; 198
  dbwb BANK(Tileset3CC7), $8800, $0 ; 199
  dbwb BANK(Tileset3CC9), $8000, $1 ; 19A
  dbwb BANK(Tileset3CCB), $8800, $1 ; 19B
  dbwb BANK(Tileset3CCD), $9000, $0 ; 19C
  dbwb BANK(Tileset3CCF), $9000, $1 ; 19D
  dbwb BANK(Tileset3CD1), $9000, $0 ; 19E
  dbwb BANK(Tileset3CD3), $9000, $1 ; 19F
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A0
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A1
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A2
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A3
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A4
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A5
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A6
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A7
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A8
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1A9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1AA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1AB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1AC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1AD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1AE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1AF
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B0
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B1
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B2
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B3
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B4
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B5
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B6
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B7
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B8
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1B9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1BA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1BB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1BC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1BD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1BE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1BF
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C0
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C1
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C2
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C3
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C4
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C5
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C6
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C7
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C8
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1C9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1CA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1CB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1CC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1CD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1CE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1CF
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D0
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D1
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D2
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D3
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D4
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D5
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D6
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D7
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D8
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1D9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1DA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1DB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1DC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1DD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1DE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1DF
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E0
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E1
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E2
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E3
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E4
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E5
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E6
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E7
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E8
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1E9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1EA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1EB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1EC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1ED
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1EE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1EF
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F0
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F1
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F2
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F3
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F4
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F5
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F6
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F7
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F8
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1F9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1FA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1FB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1FC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1FD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1FE
  dbwb BANK(OpeningAnimationRoboRoboGang), $8800, $0 ; 1FF, Patch Tileset
TilesetInfoTableEnd::

; TilesetDataCommon
SECTION "Tileset Data Tileset3995", ROMX[$4000], BANK[$3E]
Tileset3995::
  INCBIN "./build/tilesets/Tileset3995.malias"

SECTION "Tileset Data Tileset3997", ROMX[$4943], BANK[$3A]
Tileset3997::
  INCBIN "./build/tilesets/Tileset3997.malias"

SECTION "Tileset Data MainDialog2", ROMX[$44E7], BANK[$3A]
MainDialog2::
  INCBIN "./build/tilesets/MainDialog2.malias"

SECTION "Tileset Data Tileset399F", ROMX[$48BF], BANK[$3A]
Tileset399F::
  INCBIN "./build/tilesets/Tileset399F.malias"

SECTION "Tileset Data Tileset39A3", ROMX[$43A0], BANK[$3C]
Tileset39A3::
  INCBIN "./build/tilesets/Tileset39A3.malias"

SECTION "Tileset Data Tileset39A5", ROMX[$44D0], BANK[$3C]
Tileset39A5::
  INCBIN "./build/tilesets/Tileset39A5.malias"

SECTION "Tileset Data Tileset39A7", ROMX[$4625], BANK[$3C]
Tileset39A7::
  INCBIN "./build/tilesets/Tileset39A7.malias"

SECTION "Tileset Data Tileset39A9", ROMX[$4782], BANK[$3C]
Tileset39A9::
  INCBIN "./build/tilesets/Tileset39A9.malias"

SECTION "Tileset Data Tileset39AB", ROMX[$48E0], BANK[$3C]
Tileset39AB::
  INCBIN "./build/tilesets/Tileset39AB.malias"

SECTION "Tileset Data Tileset39AF", ROMX[$4F4D], BANK[$3C]
Tileset39AF::
  INCBIN "./build/tilesets/Tileset39AF.malias"

SECTION "Tileset Data Tileset39B3", ROMX[$524E], BANK[$3C]
Tileset39B3::
  INCBIN "./build/tilesets/Tileset39B3.malias"

SECTION "Tileset Data Tileset39B5", ROMX[$538F], BANK[$3C]
Tileset39B5::
  INCBIN "./build/tilesets/Tileset39B5.malias"

SECTION "Tileset Data Tileset39B7", ROMX[$541E], BANK[$3C]
Tileset39B7::
  INCBIN "./build/tilesets/Tileset39B7.malias"

SECTION "Tileset Data Tileset39B9", ROMX[$549D], BANK[$3C]
Tileset39B9::
  INCBIN "./build/tilesets/Tileset39B9.malias"

SECTION "Tileset Data Tileset39BB", ROMX[$55A3], BANK[$3C]
Tileset39BB::
  INCBIN "./build/tilesets/Tileset39BB.malias"

SECTION "Tileset Data Tileset39BF", ROMX[$59BC], BANK[$3C]
Tileset39BF::
  INCBIN "./build/tilesets/Tileset39BF.malias"

SECTION "Tileset Data Tileset39C1", ROMX[$5CE8], BANK[$3C]
Tileset39C1::
  INCBIN "./build/tilesets/Tileset39C1.malias"

SECTION "Tileset Data Tileset39C3", ROMX[$5D2D], BANK[$3C]
Tileset39C3::
  INCBIN "./build/tilesets/Tileset39C3.malias"

SECTION "Tileset Data Tileset39C5", ROMX[$5D95], BANK[$3C]
Tileset39C5::
  INCBIN "./build/tilesets/Tileset39C5.malias"

SECTION "Tileset Data Tileset39C7", ROMX[$5FD2], BANK[$3C]
Tileset39C7::
  INCBIN "./build/tilesets/Tileset39C7.malias"

SECTION "Tileset Data Tileset39C9", ROMX[$64C5], BANK[$3C]
Tileset39C9::
  INCBIN "./build/tilesets/Tileset39C9.malias"

SECTION "Tileset Data Tileset39CB", ROMX[$69F2], BANK[$3C]
Tileset39CB::
  INCBIN "./build/tilesets/Tileset39CB.malias"

SECTION "Tileset Data Tileset39CF", ROMX[$4B37], BANK[$3A]
Tileset39CF::
  INCBIN "./build/tilesets/Tileset39CF.malias"

SECTION "Tileset Data Tileset39D5", ROMX[$4B5E], BANK[$3A]
Tileset39D5::
  INCBIN "./build/tilesets/Tileset39D5.malias"

SECTION "Tileset Data Digits", ROMX[$5052], BANK[$3A]
Digits::
  INCBIN "./build/tilesets/Digits.malias"

SECTION "Tileset Data Tileset39D9", ROMX[$50C9], BANK[$3A]
Tileset39D9::
  INCBIN "./build/tilesets/Tileset39D9.malias"

SECTION "Tileset Data Tileset39DB", ROMX[$5239], BANK[$3A]
Tileset39DB::
  INCBIN "./build/tilesets/Tileset39DB.malias"

SECTION "Tileset Data Tileset39DD", ROMX[$5369], BANK[$3A]
Tileset39DD::
  INCBIN "./build/tilesets/Tileset39DD.malias"

SECTION "Tileset Data Tileset39E1", ROMX[$58A2], BANK[$3A]
Tileset39E1::
  INCBIN "./build/tilesets/Tileset39E1.malias"

SECTION "Tileset Data Tileset39E3", ROMX[$5BD9], BANK[$3A]
Tileset39E3::
  INCBIN "./build/tilesets/Tileset39E3.malias"

SECTION "Tileset Data Tileset39F9", ROMX[$4404], BANK[$3B]
Tileset39F9::
  INCBIN "./build/tilesets/Tileset39F9.malias"

SECTION "Tileset Data Tileset39FB", ROMX[$465E], BANK[$3B]
Tileset39FB::
  INCBIN "./build/tilesets/Tileset39FB.malias"

SECTION "Tileset Data Tileset39FD", ROMX[$4881], BANK[$3B]
Tileset39FD::
  INCBIN "./build/tilesets/Tileset39FD.malias"

SECTION "Tileset Data Tileset39FF", ROMX[$4A64], BANK[$3B]
Tileset39FF::
  INCBIN "./build/tilesets/Tileset39FF.malias"

SECTION "Tileset Data Tileset3A03", ROMX[$4D08], BANK[$3B]
Tileset3A03::
  INCBIN "./build/tilesets/Tileset3A03.malias"

SECTION "Tileset Data Tileset3A05", ROMX[$4D3D], BANK[$3B]
Tileset3A05::
  INCBIN "./build/tilesets/Tileset3A05.malias"

SECTION "Tileset Data Tileset3A07", ROMX[$4D71], BANK[$3B]
Tileset3A07::
  INCBIN "./build/tilesets/Tileset3A07.malias"

SECTION "Tileset Data Tileset3A09", ROMX[$4E96], BANK[$3B]
Tileset3A09::
  INCBIN "./build/tilesets/Tileset3A09.malias"

SECTION "Tileset Data PaintShopShopkeeperAvatar", ROMX[$4F4D], BANK[$3B]
PaintShopShopkeeperAvatar::
  INCBIN "./build/tilesets/PaintShopShopkeeperAvatar.malias"

SECTION "Tileset Data Tileset3A0F", ROMX[$52B5], BANK[$3B]
Tileset3A0F::
  INCBIN "./build/tilesets/Tileset3A0F.malias"

SECTION "Tileset Data Tileset3A11", ROMX[$5492], BANK[$3B]
Tileset3A11::
  INCBIN "./build/tilesets/Tileset3A11.malias"

SECTION "Tileset Data Tileset3A13", ROMX[$56A1], BANK[$3B]
Tileset3A13::
  INCBIN "./build/tilesets/Tileset3A13.malias"

SECTION "Tileset Data Tileset3A15", ROMX[$579A], BANK[$3B]
Tileset3A15::
  INCBIN "./build/tilesets/Tileset3A15.malias"

SECTION "Tileset Data Tileset3A17", ROMX[$582B], BANK[$3B]
Tileset3A17::
  INCBIN "./build/tilesets/Tileset3A17.malias"

SECTION "Tileset Data Tileset3A19", ROMX[$571D], BANK[$3B]
Tileset3A19::
  INCBIN "./build/tilesets/Tileset3A19.malias"

SECTION "Tileset Data Tileset3A1B", ROMX[$5C0B], BANK[$3B]
Tileset3A1B::
  INCBIN "./build/tilesets/Tileset3A1B.malias"

SECTION "Tileset Data Tileset3A1D", ROMX[$5CEA], BANK[$3B]
Tileset3A1D::
  INCBIN "./build/tilesets/Tileset3A1D.malias"

SECTION "Tileset Data Tileset3A27", ROMX[$4361], BANK[$3E]
Tileset3A27::
  INCBIN "./build/tilesets/Tileset3A27.malias"

SECTION "Tileset Data Tileset3A29", ROMX[$462F], BANK[$3E]
Tileset3A29::
  INCBIN "./build/tilesets/Tileset3A29.malias"

SECTION "Tileset Data Tileset3A2B", ROMX[$4998], BANK[$3E]
Tileset3A2B::
  INCBIN "./build/tilesets/Tileset3A2B.malias"

SECTION "Tileset Data Tileset3A2D", ROMX[$4C96], BANK[$3E]
Tileset3A2D::
  INCBIN "./build/tilesets/Tileset3A2D.malias"

SECTION "Tileset Data Tileset3A35", ROMX[$4952], BANK[$3A]
Tileset3A35::
  INCBIN "./build/tilesets/Tileset3A35.malias"

SECTION "Tileset Data Tileset3A59", ROMX[$4CA1], BANK[$3E]
Tileset3A59::
  INCBIN "./build/tilesets/Tileset3A59.malias"

SECTION "Tileset Data Tileset3A5B", ROMX[$5172], BANK[$3E]
Tileset3A5B::
  INCBIN "./build/tilesets/Tileset3A5B.malias"

SECTION "Tileset Data Tileset3A5D", ROMX[$595D], BANK[$3E]
Tileset3A5D::
  INCBIN "./build/tilesets/Tileset3A5D.malias"

SECTION "Tileset Data Tileset3A65", ROMX[$5E18], BANK[$46]
Tileset3A65::
  INCBIN "./build/tilesets/Tileset3A65.malias"

SECTION "Tileset Data Tileset3A67", ROMX[$669C], BANK[$46]
Tileset3A67::
  INCBIN "./build/tilesets/Tileset3A67.malias"

SECTION "Tileset Data Tileset3A69", ROMX[$58C1], BANK[$A5]
Tileset3A69::
  INCBIN "./build/tilesets/Tileset3A69.malias"

SECTION "Tileset Data Tileset3A6F", ROMX[$6E5D], BANK[$46]
Tileset3A6F::
  INCBIN "./build/tilesets/Tileset3A6F.malias"

SECTION "Tileset Data Tileset3A71", ROMX[$747B], BANK[$46]
Tileset3A71::
  INCBIN "./build/tilesets/Tileset3A71.malias"

SECTION "Tileset Data Tileset3A75", ROMX[$6A90], BANK[$3C]
Tileset3A75::
  INCBIN "./build/tilesets/Tileset3A75.malias"

SECTION "Tileset Data Tileset3A77", ROMX[$6DCB], BANK[$3C]
Tileset3A77::
  INCBIN "./build/tilesets/Tileset3A77.malias"

SECTION "Tileset Data Tileset3A79", ROMX[$6E6A], BANK[$3C]
Tileset3A79::
  INCBIN "./build/tilesets/Tileset3A79.malias"

SECTION "Tileset Data Tileset3A7B", ROMX[$706E], BANK[$3C]
Tileset3A7B::
  INCBIN "./build/tilesets/Tileset3A7B.malias"

SECTION "Tileset Data Tileset3A7D", ROMX[$71AD], BANK[$3C]
Tileset3A7D::
  INCBIN "./build/tilesets/Tileset3A7D.malias"

SECTION "Tileset Data Tileset3A81", ROMX[$737F], BANK[$3C]
Tileset3A81::
  INCBIN "./build/tilesets/Tileset3A81.malias"

SECTION "Tileset Data Tileset3A83", ROMX[$7402], BANK[$3C]
Tileset3A83::
  INCBIN "./build/tilesets/Tileset3A83.malias"

SECTION "Tileset Data Tileset3A85", ROMX[$7486], BANK[$3C]
Tileset3A85::
  INCBIN "./build/tilesets/Tileset3A85.malias"

SECTION "Tileset Data Tileset3A87", ROMX[$74EE], BANK[$3C]
Tileset3A87::
  INCBIN "./build/tilesets/Tileset3A87.malias"

SECTION "Tileset Data Tileset3A89", ROMX[$7526], BANK[$3C]
Tileset3A89::
  INCBIN "./build/tilesets/Tileset3A89.malias"

SECTION "Tileset Data Tileset3A8B", ROMX[$7683], BANK[$3C]
Tileset3A8B::
  INCBIN "./build/tilesets/Tileset3A8B.malias"

SECTION "Tileset Data Tileset3A8D", ROMX[$78BA], BANK[$3C]
Tileset3A8D::
  INCBIN "./build/tilesets/Tileset3A8D.malias"

SECTION "Tileset Data Tileset3A8F", ROMX[$4000], BANK[$A5]
Tileset3A8F::
  INCBIN "./build/tilesets/Tileset3A8F.malias"

SECTION "Tileset Data Tileset3A91", ROMX[$43CB], BANK[$A5]
Tileset3A91::
  INCBIN "./build/tilesets/Tileset3A91.malias"

SECTION "Tileset Data Tileset3A95", ROMX[$4000], BANK[$1B]
Tileset3A95::
  INCBIN "./build/tilesets/Tileset3A95.malias"

SECTION "Tileset Data Tileset3A97", ROMX[$44B6], BANK[$1B]
Tileset3A97::
  INCBIN "./build/tilesets/Tileset3A97.malias"

SECTION "Tileset Data Tileset3A99", ROMX[$486C], BANK[$1B]
Tileset3A99::
  INCBIN "./build/tilesets/Tileset3A99.malias"

SECTION "Tileset Data Tileset3A9B", ROMX[$4D11], BANK[$1B]
Tileset3A9B::
  INCBIN "./build/tilesets/Tileset3A9B.malias"

SECTION "Tileset Data Tileset3A9D", ROMX[$51BD], BANK[$1B]
Tileset3A9D::
  INCBIN "./build/tilesets/Tileset3A9D.malias"

SECTION "Tileset Data Tileset3A9F", ROMX[$561C], BANK[$1B]
Tileset3A9F::
  INCBIN "./build/tilesets/Tileset3A9F.malias"

SECTION "Tileset Data Tileset3AA1", ROMX[$5AAB], BANK[$1B]
Tileset3AA1::
  INCBIN "./build/tilesets/Tileset3AA1.malias"

SECTION "Tileset Data Tileset3AA3", ROMX[$5ECA], BANK[$1B]
Tileset3AA3::
  INCBIN "./build/tilesets/Tileset3AA3.malias"

SECTION "Tileset Data Tileset3AA5", ROMX[$619B], BANK[$1B]
Tileset3AA5::
  INCBIN "./build/tilesets/Tileset3AA5.malias"

SECTION "Tileset Data Tileset3AA7", ROMX[$6556], BANK[$1B]
Tileset3AA7::
  INCBIN "./build/tilesets/Tileset3AA7.malias"

SECTION "Tileset Data Tileset3AA9", ROMX[$69B0], BANK[$1B]
Tileset3AA9::
  INCBIN "./build/tilesets/Tileset3AA9.malias"

SECTION "Tileset Data Tileset3AAB", ROMX[$6DF5], BANK[$1B]
Tileset3AAB::
  INCBIN "./build/tilesets/Tileset3AAB.malias"

SECTION "Tileset Data Tileset3AB5", ROMX[$4A6A], BANK[$1F]
Tileset3AB5::
  INCBIN "./build/tilesets/Tileset3AB5.malias"

SECTION "Tileset Data Tileset3AB7", ROMX[$4D1B], BANK[$1F]
Tileset3AB7::
  INCBIN "./build/tilesets/Tileset3AB7.malias"

SECTION "Tileset Data Tileset3AB9", ROMX[$5049], BANK[$1F]
Tileset3AB9::
  INCBIN "./build/tilesets/Tileset3AB9.malias"

SECTION "Tileset Data Tileset3ABB", ROMX[$5405], BANK[$1F]
Tileset3ABB::
  INCBIN "./build/tilesets/Tileset3ABB.malias"

SECTION "Tileset Data Tileset3ABD", ROMX[$57D9], BANK[$1F]
Tileset3ABD::
  INCBIN "./build/tilesets/Tileset3ABD.malias"

SECTION "Tileset Data Tileset3ABF", ROMX[$5B67], BANK[$1F]
Tileset3ABF::
  INCBIN "./build/tilesets/Tileset3ABF.malias"

SECTION "Tileset Data Tileset3AC1", ROMX[$5F3A], BANK[$1F]
Tileset3AC1::
  INCBIN "./build/tilesets/Tileset3AC1.malias"

SECTION "Tileset Data Tileset3AC3", ROMX[$623F], BANK[$1F]
Tileset3AC3::
  INCBIN "./build/tilesets/Tileset3AC3.malias"

SECTION "Tileset Data Tileset3AC5", ROMX[$6497], BANK[$1F]
Tileset3AC5::
  INCBIN "./build/tilesets/Tileset3AC5.malias"

SECTION "Tileset Data Tileset3AC7", ROMX[$67C6], BANK[$1F]
Tileset3AC7::
  INCBIN "./build/tilesets/Tileset3AC7.malias"

SECTION "Tileset Data Tileset3AC9", ROMX[$6A6A], BANK[$1F]
Tileset3AC9::
  INCBIN "./build/tilesets/Tileset3AC9.malias"

SECTION "Tileset Data Tileset3ACB", ROMX[$6E25], BANK[$1F]
Tileset3ACB::
  INCBIN "./build/tilesets/Tileset3ACB.malias"

SECTION "Tileset Data Tileset3AD5", ROMX[$44C1], BANK[$A5]
Tileset3AD5::
  INCBIN "./build/tilesets/Tileset3AD5.malias"

SECTION "Tileset Data Tileset3AD7", ROMX[$46B9], BANK[$A5]
Tileset3AD7::
  INCBIN "./build/tilesets/Tileset3AD7.malias"

SECTION "Tileset Data Tileset3AD9", ROMX[$472F], BANK[$A5]
Tileset3AD9::
  INCBIN "./build/tilesets/Tileset3AD9.malias"

SECTION "Tileset Data Tileset3ADB", ROMX[$48A6], BANK[$A5]
Tileset3ADB::
  INCBIN "./build/tilesets/Tileset3ADB.malias"

SECTION "Tileset Data Tileset3ADD", ROMX[$4997], BANK[$A5]
Tileset3ADD::
  INCBIN "./build/tilesets/Tileset3ADD.malias"

SECTION "Tileset Data Tileset3ADF", ROMX[$4D6B], BANK[$A5]
Tileset3ADF::
  INCBIN "./build/tilesets/Tileset3ADF.malias"

SECTION "Tileset Data Tileset3AE1", ROMX[$505A], BANK[$A5]
Tileset3AE1::
  INCBIN "./build/tilesets/Tileset3AE1.malias"

SECTION "Tileset Data Tileset3AE3", ROMX[$50AF], BANK[$A5]
Tileset3AE3::
  INCBIN "./build/tilesets/Tileset3AE3.malias"

SECTION "Tileset Data Tileset3AE5", ROMX[$51E0], BANK[$A5]
Tileset3AE5::
  INCBIN "./build/tilesets/Tileset3AE5.malias"

SECTION "Tileset Data Tileset3AE7", ROMX[$580E], BANK[$A5]
Tileset3AE7::
  INCBIN "./build/tilesets/Tileset3AE7.malias"

SECTION "Tileset Data Tileset3AF5", ROMX[$4848], BANK[$49]
Tileset3AF5::
  INCBIN "./build/tilesets/Tileset3AF5.malias"

SECTION "Tileset Data Tileset3AF7", ROMX[$4000], BANK[$48]
Tileset3AF7::
  INCBIN "./build/tilesets/Tileset3AF7.malias"

SECTION "Tileset Data Tileset3AF9", ROMX[$41B8], BANK[$48]
Tileset3AF9::
  INCBIN "./build/tilesets/Tileset3AF9.malias"

SECTION "Tileset Data Tileset3AFB", ROMX[$4336], BANK[$48]
Tileset3AFB::
  INCBIN "./build/tilesets/Tileset3AFB.malias"

SECTION "Tileset Data Tileset3AFF", ROMX[$4506], BANK[$48]
Tileset3AFF::
  INCBIN "./build/tilesets/Tileset3AFF.malias"

SECTION "Tileset Data Tileset3B01", ROMX[$46E2], BANK[$48]
Tileset3B01::
  INCBIN "./build/tilesets/Tileset3B01.malias"

SECTION "Tileset Data Tileset3B03", ROMX[$48AE], BANK[$48]
Tileset3B03::
  INCBIN "./build/tilesets/Tileset3B03.malias"

SECTION "Tileset Data Tileset3B05", ROMX[$4A9E], BANK[$48]
Tileset3B05::
  INCBIN "./build/tilesets/Tileset3B05.malias"

SECTION "Tileset Data Tileset3B09", ROMX[$4C13], BANK[$48]
Tileset3B09::
  INCBIN "./build/tilesets/Tileset3B09.malias"

SECTION "Tileset Data Tileset3B0B", ROMX[$4DD6], BANK[$48]
Tileset3B0B::
  INCBIN "./build/tilesets/Tileset3B0B.malias"

SECTION "Tileset Data Tileset3B0F", ROMX[$4F87], BANK[$48]
Tileset3B0F::
  INCBIN "./build/tilesets/Tileset3B0F.malias"

SECTION "Tileset Data Tileset3B13", ROMX[$518A], BANK[$48]
Tileset3B13::
  INCBIN "./build/tilesets/Tileset3B13.malias"

SECTION "Tileset Data Tileset3B15", ROMX[$5360], BANK[$48]
Tileset3B15::
  INCBIN "./build/tilesets/Tileset3B15.malias"

SECTION "Tileset Data Tileset3B1B", ROMX[$54F0], BANK[$48]
Tileset3B1B::
  INCBIN "./build/tilesets/Tileset3B1B.malias"

SECTION "Tileset Data Tileset3B1D", ROMX[$566E], BANK[$48]
Tileset3B1D::
  INCBIN "./build/tilesets/Tileset3B1D.malias"

SECTION "Tileset Data Tileset3B1F", ROMX[$582F], BANK[$48]
Tileset3B1F::
  INCBIN "./build/tilesets/Tileset3B1F.malias"

SECTION "Tileset Data Tileset3B21", ROMX[$59FF], BANK[$48]
Tileset3B21::
  INCBIN "./build/tilesets/Tileset3B21.malias"

SECTION "Tileset Data Tileset3B23", ROMX[$5BAE], BANK[$48]
Tileset3B23::
  INCBIN "./build/tilesets/Tileset3B23.malias"

SECTION "Tileset Data Tileset3B25", ROMX[$5D84], BANK[$48]
Tileset3B25::
  INCBIN "./build/tilesets/Tileset3B25.malias"

SECTION "Tileset Data Tileset3B27", ROMX[$5F78], BANK[$48]
Tileset3B27::
  INCBIN "./build/tilesets/Tileset3B27.malias"

SECTION "Tileset Data Tileset3B29", ROMX[$6100], BANK[$48]
Tileset3B29::
  INCBIN "./build/tilesets/Tileset3B29.malias"

SECTION "Tileset Data Tileset3B2B", ROMX[$6321], BANK[$48]
Tileset3B2B::
  INCBIN "./build/tilesets/Tileset3B2B.malias"

SECTION "Tileset Data Tileset3B2D", ROMX[$64A1], BANK[$48]
Tileset3B2D::
  INCBIN "./build/tilesets/Tileset3B2D.malias"

SECTION "Tileset Data Tileset3B2F", ROMX[$6647], BANK[$48]
Tileset3B2F::
  INCBIN "./build/tilesets/Tileset3B2F.malias"

SECTION "Tileset Data Tileset3B31", ROMX[$67CE], BANK[$48]
Tileset3B31::
  INCBIN "./build/tilesets/Tileset3B31.malias"

SECTION "Tileset Data Tileset3B33", ROMX[$6953], BANK[$48]
Tileset3B33::
  INCBIN "./build/tilesets/Tileset3B33.malias"

SECTION "Tileset Data Tileset3B37", ROMX[$6B40], BANK[$48]
Tileset3B37::
  INCBIN "./build/tilesets/Tileset3B37.malias"

SECTION "Tileset Data Tileset3B39", ROMX[$6D11], BANK[$48]
Tileset3B39::
  INCBIN "./build/tilesets/Tileset3B39.malias"

SECTION "Tileset Data Tileset3B3B", ROMX[$6EF2], BANK[$48]
Tileset3B3B::
  INCBIN "./build/tilesets/Tileset3B3B.malias"

SECTION "Tileset Data Tileset3B3D", ROMX[$707F], BANK[$48]
Tileset3B3D::
  INCBIN "./build/tilesets/Tileset3B3D.malias"

SECTION "Tileset Data Tileset3B3F", ROMX[$4000], BANK[$49]
Tileset3B3F::
  INCBIN "./build/tilesets/Tileset3B3F.malias"

SECTION "Tileset Data Tileset3B41", ROMX[$41B5], BANK[$49]
Tileset3B41::
  INCBIN "./build/tilesets/Tileset3B41.malias"

SECTION "Tileset Data Tileset3B43", ROMX[$43D5], BANK[$49]
Tileset3B43::
  INCBIN "./build/tilesets/Tileset3B43.malias"

SECTION "Tileset Data Tileset3B45", ROMX[$466B], BANK[$49]
Tileset3B45::
  INCBIN "./build/tilesets/Tileset3B45.malias"

SECTION "Tileset Data Tileset3B4F", ROMX[$4999], BANK[$49]
Tileset3B4F::
  INCBIN "./build/tilesets/Tileset3B4F.malias"

SECTION "Tileset Data Tileset3B51", ROMX[$4B35], BANK[$49]
Tileset3B51::
  INCBIN "./build/tilesets/Tileset3B51.malias"

SECTION "Tileset Data Tileset3B53", ROMX[$4C85], BANK[$49]
Tileset3B53::
  INCBIN "./build/tilesets/Tileset3B53.malias"

SECTION "Tileset Data Tileset3B55", ROMX[$4E2C], BANK[$49]
Tileset3B55::
  INCBIN "./build/tilesets/Tileset3B55.malias"

SECTION "Tileset Data Tileset3B57", ROMX[$4FB8], BANK[$49]
Tileset3B57::
  INCBIN "./build/tilesets/Tileset3B57.malias"

SECTION "Tileset Data Tileset3B59", ROMX[$514C], BANK[$49]
Tileset3B59::
  INCBIN "./build/tilesets/Tileset3B59.malias"

SECTION "Tileset Data Tileset3B5B", ROMX[$528D], BANK[$49]
Tileset3B5B::
  INCBIN "./build/tilesets/Tileset3B5B.malias"

SECTION "Tileset Data Tileset3B5D", ROMX[$540C], BANK[$49]
Tileset3B5D::
  INCBIN "./build/tilesets/Tileset3B5D.malias"

SECTION "Tileset Data Tileset3B6B", ROMX[$5556], BANK[$49]
Tileset3B6B::
  INCBIN "./build/tilesets/Tileset3B6B.malias"

SECTION "Tileset Data Tileset3B6D", ROMX[$5823], BANK[$49]
Tileset3B6D::
  INCBIN "./build/tilesets/Tileset3B6D.malias"

SECTION "Tileset Data Tileset3B6F", ROMX[$5A05], BANK[$49]
Tileset3B6F::
  INCBIN "./build/tilesets/Tileset3B6F.malias"

SECTION "Tileset Data Tileset3B71", ROMX[$5C40], BANK[$49]
Tileset3B71::
  INCBIN "./build/tilesets/Tileset3B71.malias"

SECTION "Tileset Data Tileset3B73", ROMX[$5E55], BANK[$49]
Tileset3B73::
  INCBIN "./build/tilesets/Tileset3B73.malias"

SECTION "Tileset Data Tileset3B75", ROMX[$600D], BANK[$49]
Tileset3B75::
  INCBIN "./build/tilesets/Tileset3B75.malias"

SECTION "Tileset Data Tileset3B77", ROMX[$6156], BANK[$49]
Tileset3B77::
  INCBIN "./build/tilesets/Tileset3B77.malias"

SECTION "Tileset Data Tileset3B7B", ROMX[$639B], BANK[$49]
Tileset3B7B::
  INCBIN "./build/tilesets/Tileset3B7B.malias"

SECTION "Tileset Data Tileset3B7D", ROMX[$6518], BANK[$49]
Tileset3B7D::
  INCBIN "./build/tilesets/Tileset3B7D.malias"

SECTION "Tileset Data Tileset3B7F", ROMX[$6702], BANK[$49]
Tileset3B7F::
  INCBIN "./build/tilesets/Tileset3B7F.malias"

SECTION "Tileset Data Tileset3B81", ROMX[$6879], BANK[$49]
Tileset3B81::
  INCBIN "./build/tilesets/Tileset3B81.malias"

SECTION "Tileset Data Tileset3B83", ROMX[$6A17], BANK[$49]
Tileset3B83::
  INCBIN "./build/tilesets/Tileset3B83.malias"

SECTION "Tileset Data Tileset3B85", ROMX[$6BA4], BANK[$49]
Tileset3B85::
  INCBIN "./build/tilesets/Tileset3B85.malias"

SECTION "Tileset Data Tileset3B87", ROMX[$6D1C], BANK[$49]
Tileset3B87::
  INCBIN "./build/tilesets/Tileset3B87.malias"

SECTION "Tileset Data Tileset3B89", ROMX[$6EC8], BANK[$49]
Tileset3B89::
  INCBIN "./build/tilesets/Tileset3B89.malias"

SECTION "Tileset Data Tileset3B8B", ROMX[$706A], BANK[$49]
Tileset3B8B::
  INCBIN "./build/tilesets/Tileset3B8B.malias"

SECTION "Tileset Data Tileset3B8D", ROMX[$7226], BANK[$49]
Tileset3B8D::
  INCBIN "./build/tilesets/Tileset3B8D.malias"

SECTION "Tileset Data Tileset3B8F", ROMX[$73C4], BANK[$49]
Tileset3B8F::
  INCBIN "./build/tilesets/Tileset3B8F.malias"

SECTION "Tileset Data Tileset3B91", ROMX[$7554], BANK[$49]
Tileset3B91::
  INCBIN "./build/tilesets/Tileset3B91.malias"

SECTION "Tileset Data Tileset3B93", ROMX[$7703], BANK[$49]
Tileset3B93::
  INCBIN "./build/tilesets/Tileset3B93.malias"

SECTION "Tileset Data Tileset3B95", ROMX[$4000], BANK[$67]
Tileset3B95::
  INCBIN "./build/tilesets/Tileset3B95.malias"

SECTION "Tileset Data Tileset3B97", ROMX[$4957], BANK[$67]
Tileset3B97::
  INCBIN "./build/tilesets/Tileset3B97.malias"

SECTION "Tileset Data Tileset3B99", ROMX[$5428], BANK[$67]
Tileset3B99::
  INCBIN "./build/tilesets/Tileset3B99.malias"

SECTION "Tileset Data Tileset3B9B", ROMX[$5DBA], BANK[$67]
Tileset3B9B::
  INCBIN "./build/tilesets/Tileset3B9B.malias"

SECTION "Tileset Data Tileset3B9D", ROMX[$6936], BANK[$67]
Tileset3B9D::
  INCBIN "./build/tilesets/Tileset3B9D.malias"

SECTION "Tileset Data Tileset3B9F", ROMX[$713A], BANK[$67]
Tileset3B9F::
  INCBIN "./build/tilesets/Tileset3B9F.malias"

SECTION "Tileset Data Tileset3BA1", ROMX[$4000], BANK[$68]
Tileset3BA1::
  INCBIN "./build/tilesets/Tileset3BA1.malias"

SECTION "Tileset Data Tileset3BA3", ROMX[$48B0], BANK[$68]
Tileset3BA3::
  INCBIN "./build/tilesets/Tileset3BA3.malias"

SECTION "Tileset Data Tileset3BA5", ROMX[$5182], BANK[$68]
Tileset3BA5::
  INCBIN "./build/tilesets/Tileset3BA5.malias"

SECTION "Tileset Data Tileset3BA7", ROMX[$58E2], BANK[$68]
Tileset3BA7::
  INCBIN "./build/tilesets/Tileset3BA7.malias"

SECTION "Tileset Data Tileset3BA9", ROMX[$6295], BANK[$68]
Tileset3BA9::
  INCBIN "./build/tilesets/Tileset3BA9.malias"

SECTION "Tileset Data Tileset3BAB", ROMX[$6C26], BANK[$68]
Tileset3BAB::
  INCBIN "./build/tilesets/Tileset3BAB.malias"

SECTION "Tileset Data Tileset3BAD", ROMX[$75D9], BANK[$68]
Tileset3BAD::
  INCBIN "./build/tilesets/Tileset3BAD.malias"

SECTION "Tileset Data Tileset3BAF", ROMX[$4000], BANK[$69]
Tileset3BAF::
  INCBIN "./build/tilesets/Tileset3BAF.malias"

SECTION "Tileset Data Tileset3BB1", ROMX[$482C], BANK[$69]
Tileset3BB1::
  INCBIN "./build/tilesets/Tileset3BB1.malias"

SECTION "Tileset Data Tileset3BB3", ROMX[$52E4], BANK[$69]
Tileset3BB3::
  INCBIN "./build/tilesets/Tileset3BB3.malias"

SECTION "Tileset Data Tileset3BB5", ROMX[$5BF9], BANK[$69]
Tileset3BB5::
  INCBIN "./build/tilesets/Tileset3BB5.malias"

SECTION "Tileset Data Tileset3BB7", ROMX[$65B8], BANK[$69]
Tileset3BB7::
  INCBIN "./build/tilesets/Tileset3BB7.malias"

SECTION "Tileset Data Tileset3BB9", ROMX[$6FB5], BANK[$69]
Tileset3BB9::
  INCBIN "./build/tilesets/Tileset3BB9.malias"

SECTION "Tileset Data Tileset3BBB", ROMX[$4000], BANK[$6A]
Tileset3BBB::
  INCBIN "./build/tilesets/Tileset3BBB.malias"

SECTION "Tileset Data Tileset3BBD", ROMX[$4968], BANK[$6A]
Tileset3BBD::
  INCBIN "./build/tilesets/Tileset3BBD.malias"

SECTION "Tileset Data Tileset3BBF", ROMX[$52D9], BANK[$6A]
Tileset3BBF::
  INCBIN "./build/tilesets/Tileset3BBF.malias"

SECTION "Tileset Data Tileset3BC1", ROMX[$5C5B], BANK[$6A]
Tileset3BC1::
  INCBIN "./build/tilesets/Tileset3BC1.malias"

SECTION "Tileset Data Tileset3BC3", ROMX[$6176], BANK[$6A]
Tileset3BC3::
  INCBIN "./build/tilesets/Tileset3BC3.malias"

SECTION "Tileset Data Tileset3BC5", ROMX[$6A22], BANK[$6A]
Tileset3BC5::
  INCBIN "./build/tilesets/Tileset3BC5.malias"

SECTION "Tileset Data Tileset3BC7", ROMX[$71E1], BANK[$6A]
Tileset3BC7::
  INCBIN "./build/tilesets/Tileset3BC7.malias"

SECTION "Tileset Data Tileset3BC9", ROMX[$4000], BANK[$6B]
Tileset3BC9::
  INCBIN "./build/tilesets/Tileset3BC9.malias"

SECTION "Tileset Data Tileset3BCB", ROMX[$497D], BANK[$6B]
Tileset3BCB::
  INCBIN "./build/tilesets/Tileset3BCB.malias"

SECTION "Tileset Data Tileset3BCD", ROMX[$5153], BANK[$6B]
Tileset3BCD::
  INCBIN "./build/tilesets/Tileset3BCD.malias"

SECTION "Tileset Data Tileset3BCF", ROMX[$58E7], BANK[$6B]
Tileset3BCF::
  INCBIN "./build/tilesets/Tileset3BCF.malias"

SECTION "Tileset Data Tileset3BD1", ROMX[$606E], BANK[$6B]
Tileset3BD1::
  INCBIN "./build/tilesets/Tileset3BD1.malias"

SECTION "Tileset Data Tileset3BD3", ROMX[$68EF], BANK[$6B]
Tileset3BD3::
  INCBIN "./build/tilesets/Tileset3BD3.malias"

SECTION "Tileset Data Tileset3BD5", ROMX[$725E], BANK[$6B]
Tileset3BD5::
  INCBIN "./build/tilesets/Tileset3BD5.malias"

SECTION "Tileset Data Tileset3BD7", ROMX[$4000], BANK[$6C]
Tileset3BD7::
  INCBIN "./build/tilesets/Tileset3BD7.malias"

SECTION "Tileset Data Tileset3BF5", ROMX[$4000], BANK[$62]
Tileset3BF5::
  INCBIN "./build/tilesets/Tileset3BF5.malias"

SECTION "Tileset Data Tileset3BF7", ROMX[$434F], BANK[$62]
Tileset3BF7::
  INCBIN "./build/tilesets/Tileset3BF7.malias"

SECTION "Tileset Data Tileset3BF9", ROMX[$442D], BANK[$62]
Tileset3BF9::
  INCBIN "./build/tilesets/Tileset3BF9.malias"

SECTION "Tileset Data Tileset3BFB", ROMX[$4612], BANK[$62]
Tileset3BFB::
  INCBIN "./build/tilesets/Tileset3BFB.malias"

SECTION "Tileset Data Tileset3BFD", ROMX[$473E], BANK[$62]
Tileset3BFD::
  INCBIN "./build/tilesets/Tileset3BFD.malias"

SECTION "Tileset Data Tileset3BFF", ROMX[$487C], BANK[$62]
Tileset3BFF::
  INCBIN "./build/tilesets/Tileset3BFF.malias"

SECTION "Tileset Data Tileset3C01", ROMX[$4A1E], BANK[$62]
Tileset3C01::
  INCBIN "./build/tilesets/Tileset3C01.malias"

SECTION "Tileset Data Tileset3C03", ROMX[$4C29], BANK[$62]
Tileset3C03::
  INCBIN "./build/tilesets/Tileset3C03.malias"

SECTION "Tileset Data Tileset3C05", ROMX[$4DFC], BANK[$62]
Tileset3C05::
  INCBIN "./build/tilesets/Tileset3C05.malias"

SECTION "Tileset Data Tileset3C07", ROMX[$4FDF], BANK[$62]
Tileset3C07::
  INCBIN "./build/tilesets/Tileset3C07.malias"

SECTION "Tileset Data Tileset3C09", ROMX[$512E], BANK[$62]
Tileset3C09::
  INCBIN "./build/tilesets/Tileset3C09.malias"

SECTION "Tileset Data Tileset3C0B", ROMX[$5265], BANK[$62]
Tileset3C0B::
  INCBIN "./build/tilesets/Tileset3C0B.malias"

SECTION "Tileset Data Tileset3C0D", ROMX[$53C8], BANK[$62]
Tileset3C0D::
  INCBIN "./build/tilesets/Tileset3C0D.malias"

SECTION "Tileset Data Tileset3C0F", ROMX[$54E8], BANK[$62]
Tileset3C0F::
  INCBIN "./build/tilesets/Tileset3C0F.malias"

SECTION "Tileset Data Tileset3C11", ROMX[$574F], BANK[$62]
Tileset3C11::
  INCBIN "./build/tilesets/Tileset3C11.malias"

SECTION "Tileset Data Tileset3C13", ROMX[$58B8], BANK[$62]
Tileset3C13::
  INCBIN "./build/tilesets/Tileset3C13.malias"

SECTION "Tileset Data Tileset3C15", ROMX[$59DD], BANK[$62]
Tileset3C15::
  INCBIN "./build/tilesets/Tileset3C15.malias"

SECTION "Tileset Data Tileset3C17", ROMX[$5B6A], BANK[$62]
Tileset3C17::
  INCBIN "./build/tilesets/Tileset3C17.malias"

SECTION "Tileset Data Tileset3C19", ROMX[$5C6E], BANK[$62]
Tileset3C19::
  INCBIN "./build/tilesets/Tileset3C19.malias"

SECTION "Tileset Data Tileset3C1B", ROMX[$5D12], BANK[$62]
Tileset3C1B::
  INCBIN "./build/tilesets/Tileset3C1B.malias"

SECTION "Tileset Data Tileset3C1D", ROMX[$5EBA], BANK[$62]
Tileset3C1D::
  INCBIN "./build/tilesets/Tileset3C1D.malias"

SECTION "Tileset Data Tileset3C1F", ROMX[$60BF], BANK[$62]
Tileset3C1F::
  INCBIN "./build/tilesets/Tileset3C1F.malias"

SECTION "Tileset Data Tileset3C21", ROMX[$643B], BANK[$62]
Tileset3C21::
  INCBIN "./build/tilesets/Tileset3C21.malias"

SECTION "Tileset Data Tileset3C23", ROMX[$656C], BANK[$62]
Tileset3C23::
  INCBIN "./build/tilesets/Tileset3C23.malias"

SECTION "Tileset Data Tileset3C25", ROMX[$66F4], BANK[$62]
Tileset3C25::
  INCBIN "./build/tilesets/Tileset3C25.malias"

SECTION "Tileset Data Tileset3C27", ROMX[$6844], BANK[$62]
Tileset3C27::
  INCBIN "./build/tilesets/Tileset3C27.malias"

SECTION "Tileset Data Tileset3C29", ROMX[$69D9], BANK[$62]
Tileset3C29::
  INCBIN "./build/tilesets/Tileset3C29.malias"

SECTION "Tileset Data Tileset3C2B", ROMX[$6B96], BANK[$62]
Tileset3C2B::
  INCBIN "./build/tilesets/Tileset3C2B.malias"

SECTION "Tileset Data Tileset3C35", ROMX[$4000], BANK[$72]
Tileset3C35::
  INCBIN "./build/tilesets/Tileset3C35.malias"

SECTION "Tileset Data Tileset3C37", ROMX[$4808], BANK[$72]
Tileset3C37::
  INCBIN "./build/tilesets/Tileset3C37.malias"

SECTION "Tileset Data Tileset3C41", ROMX[$4000], BANK[$73]
Tileset3C41::
  INCBIN "./build/tilesets/Tileset3C41.malias"

SECTION "Tileset Data Tileset3C43", ROMX[$44E4], BANK[$73]
Tileset3C43::
  INCBIN "./build/tilesets/Tileset3C43.malias"

SECTION "Tileset Data Tileset3C45", ROMX[$4947], BANK[$73]
Tileset3C45::
  INCBIN "./build/tilesets/Tileset3C45.malias"

SECTION "Tileset Data Tileset3C47", ROMX[$4EDE], BANK[$73]
Tileset3C47::
  INCBIN "./build/tilesets/Tileset3C47.malias"

SECTION "Tileset Data Tileset3C49", ROMX[$5064], BANK[$73]
Tileset3C49::
  INCBIN "./build/tilesets/Tileset3C49.malias"

SECTION "Tileset Data Tileset3C4B", ROMX[$55D8], BANK[$73]
Tileset3C4B::
  INCBIN "./build/tilesets/Tileset3C4B.malias"

SECTION "Tileset Data Tileset3C5B", ROMX[$4000], BANK[$74]
Tileset3C5B::
  INCBIN "./build/tilesets/Tileset3C5B.malias"

SECTION "Tileset Data Tileset3C67", ROMX[$53F1], BANK[$74]
Tileset3C67::
  INCBIN "./build/tilesets/Tileset3C67.malias"

SECTION "Tileset Data StartScreenFireEffect2", ROMX[$5929], BANK[$74]
StartScreenFireEffect2::
  INCBIN "./build/tilesets/StartScreenFireEffect2.malias"

SECTION "Tileset Data Tileset3C95", ROMX[$4000], BANK[$A7]
Tileset3C95::
  INCBIN "./build/tilesets/Tileset3C95.malias"

SECTION "Tileset Data Tileset3C97", ROMX[$44F8], BANK[$A7]
Tileset3C97::
  INCBIN "./build/tilesets/Tileset3C97.malias"

SECTION "Tileset Data Tileset3C99", ROMX[$4A1F], BANK[$A7]
Tileset3C99::
  INCBIN "./build/tilesets/Tileset3C99.malias"

SECTION "Tileset Data Tileset3C9D", ROMX[$4FB1], BANK[$A7]
Tileset3C9D::
  INCBIN "./build/tilesets/Tileset3C9D.malias"

SECTION "Tileset Data Tileset3C9F", ROMX[$55AA], BANK[$A7]
Tileset3C9F::
  INCBIN "./build/tilesets/Tileset3C9F.malias"

SECTION "Tileset Data Tileset3CA1", ROMX[$58CE], BANK[$A7]
Tileset3CA1::
  INCBIN "./build/tilesets/Tileset3CA1.malias"

SECTION "Tileset Data Tileset3CA3", ROMX[$5E85], BANK[$A7]
Tileset3CA3::
  INCBIN "./build/tilesets/Tileset3CA3.malias"

SECTION "Tileset Data Tileset3CA5", ROMX[$4000], BANK[$A8]
Tileset3CA5::
  INCBIN "./build/tilesets/Tileset3CA5.malias"

SECTION "Tileset Data Tileset3CA7", ROMX[$44BB], BANK[$A8]
Tileset3CA7::
  INCBIN "./build/tilesets/Tileset3CA7.malias"

SECTION "Tileset Data Tileset3CA9", ROMX[$49CE], BANK[$A8]
Tileset3CA9::
  INCBIN "./build/tilesets/Tileset3CA9.malias"

SECTION "Tileset Data Tileset3CAD", ROMX[$4F04], BANK[$A8]
Tileset3CAD::
  INCBIN "./build/tilesets/Tileset3CAD.malias"

SECTION "Tileset Data Tileset3CAF", ROMX[$54FA], BANK[$A8]
Tileset3CAF::
  INCBIN "./build/tilesets/Tileset3CAF.malias"

SECTION "Tileset Data Tileset3CB1", ROMX[$5831], BANK[$A8]
Tileset3CB1::
  INCBIN "./build/tilesets/Tileset3CB1.malias"

SECTION "Tileset Data Tileset3CB3", ROMX[$5DEB], BANK[$A8]
Tileset3CB3::
  INCBIN "./build/tilesets/Tileset3CB3.malias"

SECTION "Tileset Data Tileset3CB5", ROMX[$4000], BANK[$A9]
Tileset3CB5::
  INCBIN "./build/tilesets/Tileset3CB5.malias"

SECTION "Tileset Data Tileset3CB7", ROMX[$44D8], BANK[$A9]
Tileset3CB7::
  INCBIN "./build/tilesets/Tileset3CB7.malias"

SECTION "Tileset Data Tileset3CB9", ROMX[$4A00], BANK[$A9]
Tileset3CB9::
  INCBIN "./build/tilesets/Tileset3CB9.malias"

SECTION "Tileset Data Tileset3CBB", ROMX[$501D], BANK[$A9]
Tileset3CBB::
  INCBIN "./build/tilesets/Tileset3CBB.malias"

SECTION "Tileset Data Tileset3CBD", ROMX[$50AD], BANK[$A9]
Tileset3CBD::
  INCBIN "./build/tilesets/Tileset3CBD.malias"

SECTION "Tileset Data Tileset3CBF", ROMX[$56D6], BANK[$A9]
Tileset3CBF::
  INCBIN "./build/tilesets/Tileset3CBF.malias"

SECTION "Tileset Data Tileset3CC1", ROMX[$5A4E], BANK[$A9]
Tileset3CC1::
  INCBIN "./build/tilesets/Tileset3CC1.malias"

SECTION "Tileset Data Tileset3CC3", ROMX[$5F58], BANK[$A9]
Tileset3CC3::
  INCBIN "./build/tilesets/Tileset3CC3.malias"

SECTION "Tileset Data Tileset3CC5", ROMX[$4000], BANK[$AA]
Tileset3CC5::
  INCBIN "./build/tilesets/Tileset3CC5.malias"

SECTION "Tileset Data Tileset3CC7", ROMX[$44B1], BANK[$AA]
Tileset3CC7::
  INCBIN "./build/tilesets/Tileset3CC7.malias"

SECTION "Tileset Data Tileset3CC9", ROMX[$498C], BANK[$AA]
Tileset3CC9::
  INCBIN "./build/tilesets/Tileset3CC9.malias"

SECTION "Tileset Data Tileset3CCB", ROMX[$4F97], BANK[$AA]
Tileset3CCB::
  INCBIN "./build/tilesets/Tileset3CCB.malias"

SECTION "Tileset Data Tileset3CCD", ROMX[$506D], BANK[$AA]
Tileset3CCD::
  INCBIN "./build/tilesets/Tileset3CCD.malias"

SECTION "Tileset Data Tileset3CCF", ROMX[$569D], BANK[$AA]
Tileset3CCF::
  INCBIN "./build/tilesets/Tileset3CCF.malias"

SECTION "Tileset Data Tileset3CD1", ROMX[$59BC], BANK[$AA]
Tileset3CD1::
  INCBIN "./build/tilesets/Tileset3CD1.malias"

SECTION "Tileset Data Tileset3CD3", ROMX[$5ECA], BANK[$AA]
Tileset3CD3::
  INCBIN "./build/tilesets/Tileset3CD3.malias"


SECTION "Tileset Data Tileset3A1F", ROMX[$5FC6], BANK[$3B]
Tileset3A1F::
  INCBIN "./build/tilesets/Tileset3A1F_{GAMEVERSION}.malias"

SECTION "Tileset Data Tileset3C39", ROMX[$4C87], BANK[$72]
Tileset3C39::
  INCBIN "./build/tilesets/Tileset3C39_{GAMEVERSION}.malias"

SECTION "Tileset Data OpeningAnimationTransformStatus", ROMX[$5D33], BANK[$74]
OpeningAnimationTransformStatus::
  INCBIN "./build/tilesets/OpeningAnimationTransformStatus_{GAMEVERSION}.malias"

