INCLUDE "game/src/common/macros.asm"

SECTION "Tileset Source Address Table", ROM0[$3995]
TilesetSourceAddressTable::
  dw Tileset0F8000 ; 00 (3995)
  dw Tileset0E8943 ; 01 (3997)
  dw MainDialog1 ; 02 (3999)
  dw MainDialog2 ; 03 (399B)
  dw Special ; 04 (399D)
  dw Tileset0E88BF ; 05 (399F)
  dw Tileset0F0000 ; 06 (39A1)
  dw Tileset0F03A0 ; 07 (39A3)
  dw Tileset0F04D0 ; 08 (39A5)
  dw Tileset0F0625 ; 09 (39A7)
  dw Tileset0F0782 ; 0A (39A9)
  dw Tileset0F08E0 ; 0B (39AB)
  dw Tileset0F0A5B ; 0C (39AD)
  dw Tileset0F0F4D ; 0D (39AF)
  dw Tileset0F0FD5 ; 0E (39B1)
  dw Tileset0F124E ; 0F (39B3)
  dw Tileset0F138F ; 10 (39B5)
  dw Tileset0F141E ; 11 (39B7)
  dw Tileset0F149D ; 12 (39B9)
  dw Tileset0F15A3 ; 13 (39BB)
  dw Tileset0F160E ; 14 (39BD)
  dw Tileset0F19BC ; 15 (39BF)
  dw Tileset0F1CE8 ; 16 (39C1)
  dw Tileset0F1D2D ; 17 (39C3)
  dw Tileset0F1D95 ; 18 (39C5)
  dw Tileset0F1FD2 ; 19 (39C7)
  dw Tileset0F24C5 ; 1A (39C9)
  dw Tileset0F29F2 ; 1B (39CB)
  dw Tileset0E8969 ; 1C (39CD)
  dw Tileset0E8B37 ; 1D (39CF)
  dw TilesetSourceAddressTableEnd ; 1E (39D1)
  dw TilesetSourceAddressTableEnd ; 1F (39D3)
  dw Tileset0E8B5E ; 20 (39D5)
  dw Tileset0E9052 ; 21 (39D7)
  dw Tileset0E90C9 ; 22 (39D9)
  dw Tileset0E9239 ; 23 (39DB)
  dw Tileset0E9369 ; 24 (39DD)
  dw TilesetSourceAddressTableEnd ; 25 (39DF)
  dw Tileset0E98A2 ; 26 (39E1)
  dw Tileset0E9BD9 ; 27 (39E3)
  dw Tileset0E8B5E ; 28 (39E5)
  dw TilesetSourceAddressTableEnd ; 29 (39E7)
  dw TilesetSourceAddressTableEnd ; 2A (39E9)
  dw TilesetSourceAddressTableEnd ; 2B (39EB)
  dw TilesetSourceAddressTableEnd ; 2C (39ED)
  dw TilesetSourceAddressTableEnd ; 2D (39EF)
  dw TilesetSourceAddressTableEnd ; 2E (39F1)
  dw TilesetSourceAddressTableEnd ; 2F (39F3)
  dw Tileset0EC000 ; 30 (39F5)
  dw Tileset0EC30C ; 31 (39F7)
  dw Tileset0EC404 ; 32 (39F9)
  dw Tileset0EC65E ; 33 (39FB)
  dw Tileset0EC881 ; 34 (39FD)
  dw Tileset0ECA64 ; 35 (39FF)
  dw Tileset0ECC8E ; 36 (3A01)
  dw Tileset0ECD08 ; 37 (3A03)
  dw Tileset0ECD3D ; 38 (3A05)
  dw Tileset0ECD71 ; 39 (3A07)
  dw Tileset0ECE96 ; 3A (3A09)
  dw Tileset0ECF4D ; 3B (3A0B)
  dw Tileset0ED1BB ; 3C (3A0D)
  dw Tileset0ED2B5 ; 3D (3A0F)
  dw Tileset0ED492 ; 3E (3A11)
  dw Tileset0ED6A1 ; 3F (3A13)
  dw Tileset0ED79A ; 40 (3A15)
  dw Tileset0ED82B ; 41 (3A17)
  dw Tileset0ED71D ; 42 (3A19)
  dw Tileset0EDC0B ; 43 (3A1B)
  dw Tileset0EDCEA ; 44 (3A1D)
  dw Tileset0EDFC6 ; 45 (3A1F)
  dw Tileset0EE3F8 ; 46 (3A21)
  dw Tileset0EE831 ; 47 (3A23)
  dw Tileset0F8000 ; 48 (3A25)
  dw Tileset0F8361 ; 49 (3A27)
  dw Tileset0F862F ; 4A (3A29)
  dw Tileset0F8998 ; 4B (3A2B)
  dw Tileset0F8C96 ; 4C (3A2D)
  dw Tileset0FB460 ; 4D (3A2F)
  dw Tileset0FB2B6 ; 4E (3A31)
  dw Tileset0FB8D6 ; 4F (3A33)
  dw Tileset0E8952 ; 50 (3A35)
  dw Tileset0EE8AF ; 51 (3A37)
  dw Tileset0EE9AA ; 52 (3A39)
  dw Tileset0EEA17 ; 53 (3A3B)
  dw Tileset0EEA86 ; 54 (3A3D)
  dw Tileset0EEAF5 ; 55 (3A3F)
  dw Tileset0EEB65 ; 56 (3A41)
  dw Tileset0EEBD2 ; 57 (3A43)
  dw Tileset0EEC40 ; 58 (3A45)
  dw Tileset0EED82 ; 59 (3A47)
  dw Tileset0EEE9E ; 5A (3A49)
  dw Tileset0EEFFF ; 5B (3A4B)
  dw Tileset0EF136 ; 5C (3A4D)
  dw Tileset0EF28F ; 5D (3A4F)
  dw Tileset0EF3C0 ; 5E (3A51)
  dw Tileset0FB9B2 ; 5F (3A53)
  dw TilesetSourceAddressTableEnd ; 60 (3A55)
  dw TilesetSourceAddressTableEnd ; 61 (3A57)
  dw Tileset0F8CA1 ; 62 (3A59)
  dw Tileset0F9172 ; 63 (3A5B)
  dw Tileset0F995D ; 64 (3A5D)
  dw Tileset0FA28F ; 65 (3A5F)
  dw Tileset0FAA7F ; 66 (3A61)
  dw Tileset0FAA7F ; 67 (3A63)
  dw Tileset119E18 ; 68 (3A65)
  dw Tileset11A69C ; 69 (3A67)
  dw Tileset2958C1 ; 6A (3A69)
  dw TilesetSourceAddressTableEnd ; 6B (3A6B)
  dw TilesetSourceAddressTableEnd ; 6C (3A6D)
  dw Tileset11AE5D ; 6D (3A6F)
  dw Tileset11B47B ; 6E (3A71)
  dw Tileset0EF448 ; 6F (3A73)
  dw Tileset0F2A90 ; 70 (3A75)
  dw Tileset0F2DCB ; 71 (3A77)
  dw Tileset0F2E6A ; 72 (3A79)
  dw Tileset0F306E ; 73 (3A7B)
  dw Tileset0F31AD ; 74 (3A7D)
  dw Tileset0F3200 ; 75 (3A7F)
  dw Tileset0F337F ; 76 (3A81)
  dw Tileset0F3402 ; 77 (3A83)
  dw Tileset0F3486 ; 78 (3A85)
  dw Tileset0F34EE ; 79 (3A87)
  dw Tileset0F3526 ; 7A (3A89)
  dw Tileset0F3683 ; 7B (3A8B)
  dw Tileset0F38BA ; 7C (3A8D)
  dw Tileset294000 ; 7D (3A8F)
  dw Tileset2943CB ; 7E (3A91)
  dw TilesetSourceAddressTableEnd ; 7F (3A93)
  dw Tileset06C000 ; 80 (3A95)
  dw Tileset06C4B6 ; 81 (3A97)
  dw Tileset06C86C ; 82 (3A99)
  dw Tileset06CD11 ; 83 (3A9B)
  dw Tileset06D1BD ; 84 (3A9D)
  dw Tileset06D61C ; 85 (3A9F)
  dw Tileset06DAAB ; 86 (3AA1)
  dw Tileset06DECA ; 87 (3AA3)
  dw Tileset06E19B ; 88 (3AA5)
  dw Tileset06E556 ; 89 (3AA7)
  dw Tileset06E9B0 ; 8A (3AA9)
  dw Tileset06EDF5 ; 8B (3AAB)
  dw TilesetSourceAddressTableEnd ; 8C (3AAD)
  dw TilesetSourceAddressTableEnd ; 8D (3AAF)
  dw TilesetSourceAddressTableEnd ; 8E (3AB1)
  dw TilesetSourceAddressTableEnd ; 8F (3AB3)
  dw Tileset07CA6A ; 90 (3AB5)
  dw Tileset07CD1B ; 91 (3AB7)
  dw Tileset07D049 ; 92 (3AB9)
  dw Tileset07D405 ; 93 (3ABB)
  dw Tileset07D7D9 ; 94 (3ABD)
  dw Tileset07DB67 ; 95 (3ABF)
  dw Tileset07DF3A ; 96 (3AC1)
  dw Tileset07E23F ; 97 (3AC3)
  dw Tileset07E497 ; 98 (3AC5)
  dw Tileset07E7C6 ; 99 (3AC7)
  dw Tileset07EA6A ; 9A (3AC9)
  dw Tileset07EE25 ; 9B (3ACB)
  dw TilesetSourceAddressTableEnd ; 9C (3ACD)
  dw TilesetSourceAddressTableEnd ; 9D (3ACF)
  dw TilesetSourceAddressTableEnd ; 9E (3AD1)
  dw TilesetSourceAddressTableEnd ; 9F (3AD3)
  dw Tileset2944C1 ; A0 (3AD5)
  dw Tileset2946B9 ; A1 (3AD7)
  dw Tileset29472F ; A2 (3AD9)
  dw Tileset2948A6 ; A3 (3ADB)
  dw Tileset294997 ; A4 (3ADD)
  dw Tileset294D6B ; A5 (3ADF)
  dw Tileset29505A ; A6 (3AE1)
  dw Tileset2950AF ; A7 (3AE3)
  dw Tileset2951E0 ; A8 (3AE5)
  dw Tileset29580E ; A9 (3AE7)
  dw TilesetSourceAddressTableEnd ; AA (3AE9)
  dw TilesetSourceAddressTableEnd ; AB (3AEB)
  dw TilesetSourceAddressTableEnd ; AC (3AED)
  dw TilesetSourceAddressTableEnd ; AD (3AEF)
  dw TilesetSourceAddressTableEnd ; AE (3AF1)
  dw TilesetSourceAddressTableEnd ; AF (3AF3)
  dw Tileset124848 ; B0 (3AF5)
  dw Tileset120000 ; B1 (3AF7)
  dw Tileset1201B8 ; B2 (3AF9)
  dw Tileset120336 ; B3 (3AFB)
  dw Tileset124848 ; B4 (3AFD)
  dw Tileset120506 ; B5 (3AFF)
  dw Tileset1206E2 ; B6 (3B01)
  dw Tileset1208AE ; B7 (3B03)
  dw Tileset120A9E ; B8 (3B05)
  dw Tileset124848 ; B9 (3B07)
  dw Tileset120C13 ; BA (3B09)
  dw Tileset120DD6 ; BB (3B0B)
  dw Tileset124848 ; BC (3B0D)
  dw Tileset120F87 ; BD (3B0F)
  dw Tileset124848 ; BE (3B11)
  dw Tileset12118A ; BF (3B13)
  dw Tileset121360 ; C0 (3B15)
  dw Tileset124848 ; C1 (3B17)
  dw Tileset124848 ; C2 (3B19)
  dw Tileset1214F0 ; C3 (3B1B)
  dw Tileset12166E ; C4 (3B1D)
  dw Tileset12182F ; C5 (3B1F)
  dw Tileset1219FF ; C6 (3B21)
  dw Tileset121BAE ; C7 (3B23)
  dw Tileset121D84 ; C8 (3B25)
  dw Tileset121F78 ; C9 (3B27)
  dw Tileset122100 ; CA (3B29)
  dw Tileset122321 ; CB (3B2B)
  dw Tileset1224A1 ; CC (3B2D)
  dw Tileset122647 ; CD (3B2F)
  dw Tileset1227CE ; CE (3B31)
  dw Tileset122953 ; CF (3B33)
  dw Tileset124848 ; D0 (3B35)
  dw Tileset122B40 ; D1 (3B37)
  dw Tileset122D11 ; D2 (3B39)
  dw Tileset122EF2 ; D3 (3B3B)
  dw Tileset12307F ; D4 (3B3D)
  dw Tileset124000 ; D5 (3B3F)
  dw Tileset1241B5 ; D6 (3B41)
  dw Tileset1243D5 ; D7 (3B43)
  dw Tileset12466B ; D8 (3B45)
  dw Tileset124848 ; D9 (3B47)
  dw Tileset124848 ; DA (3B49)
  dw Tileset124848 ; DB (3B4B)
  dw Tileset124848 ; DC (3B4D)
  dw Tileset124999 ; DD (3B4F)
  dw Tileset124B35 ; DE (3B51)
  dw Tileset124C85 ; DF (3B53)
  dw Tileset124E2C ; E0 (3B55)
  dw Tileset124FB8 ; E1 (3B57)
  dw Tileset12514C ; E2 (3B59)
  dw Tileset12528D ; E3 (3B5B)
  dw Tileset12540C ; E4 (3B5D)
  dw Tileset124848 ; E5 (3B5F)
  dw Tileset124848 ; E6 (3B61)
  dw Tileset124848 ; E7 (3B63)
  dw Tileset124848 ; E8 (3B65)
  dw Tileset124848 ; E9 (3B67)
  dw Tileset124848 ; EA (3B69)
  dw Tileset125556 ; EB (3B6B)
  dw Tileset125823 ; EC (3B6D)
  dw Tileset125A05 ; ED (3B6F)
  dw Tileset125C40 ; EE (3B71)
  dw Tileset125E55 ; EF (3B73)
  dw Tileset12600D ; F0 (3B75)
  dw Tileset126156 ; F1 (3B77)
  dw Tileset124848 ; F2 (3B79)
  dw Tileset12639B ; F3 (3B7B)
  dw Tileset126518 ; F4 (3B7D)
  dw Tileset126702 ; F5 (3B7F)
  dw Tileset126879 ; F6 (3B81)
  dw Tileset126A17 ; F7 (3B83)
  dw Tileset126BA4 ; F8 (3B85)
  dw Tileset126D1C ; F9 (3B87)
  dw Tileset126EC8 ; FA (3B89)
  dw Tileset12706A ; FB (3B8B)
  dw Tileset127226 ; FC (3B8D)
  dw Tileset1273C4 ; FD (3B8F)
  dw Tileset127554 ; FE (3B91)
  dw Tileset127703 ; FF (3B93)
  dw Tileset19C000 ; 100 (3B95)
  dw Tileset19C957 ; 101 (3B97)
  dw Tileset19D428 ; 102 (3B99)
  dw Tileset19DDBA ; 103 (3B9B)
  dw Tileset19E936 ; 104 (3B9D)
  dw Tileset19F13A ; 105 (3B9F)
  dw Tileset1A0000 ; 106 (3BA1)
  dw Tileset1A08B0 ; 107 (3BA3)
  dw Tileset1A1182 ; 108 (3BA5)
  dw Tileset1A18E2 ; 109 (3BA7)
  dw Tileset1A2295 ; 10A (3BA9)
  dw Tileset1A2C26 ; 10B (3BAB)
  dw Tileset1A35D9 ; 10C (3BAD)
  dw Tileset1A4000 ; 10D (3BAF)
  dw Tileset1A482C ; 10E (3BB1)
  dw Tileset1A52E4 ; 10F (3BB3)
  dw Tileset1A5BF9 ; 110 (3BB5)
  dw Tileset1A65B8 ; 111 (3BB7)
  dw Tileset1A6FB5 ; 112 (3BB9)
  dw Tileset1A8000 ; 113 (3BBB)
  dw Tileset1A8968 ; 114 (3BBD)
  dw Tileset1A92D9 ; 115 (3BBF)
  dw Tileset1A9C5B ; 116 (3BC1)
  dw Tileset1AA176 ; 117 (3BC3)
  dw Tileset1AAA22 ; 118 (3BC5)
  dw Tileset1AB1E1 ; 119 (3BC7)
  dw Tileset1AC000 ; 11A (3BC9)
  dw Tileset1AC97D ; 11B (3BCB)
  dw Tileset1AD153 ; 11C (3BCD)
  dw Tileset1AD8E7 ; 11D (3BCF)
  dw Tileset1AE06E ; 11E (3BD1)
  dw Tileset1AE8EF ; 11F (3BD3)
  dw Tileset1AF25E ; 120 (3BD5)
  dw Tileset1B0000 ; 121 (3BD7)
  dw TilesetSourceAddressTableEnd ; 122 (3BD9)
  dw TilesetSourceAddressTableEnd ; 123 (3BDB)
  dw TilesetSourceAddressTableEnd ; 124 (3BDD)
  dw TilesetSourceAddressTableEnd ; 125 (3BDF)
  dw TilesetSourceAddressTableEnd ; 126 (3BE1)
  dw TilesetSourceAddressTableEnd ; 127 (3BE3)
  dw TilesetSourceAddressTableEnd ; 128 (3BE5)
  dw TilesetSourceAddressTableEnd ; 129 (3BE7)
  dw TilesetSourceAddressTableEnd ; 12A (3BE9)
  dw TilesetSourceAddressTableEnd ; 12B (3BEB)
  dw TilesetSourceAddressTableEnd ; 12C (3BED)
  dw TilesetSourceAddressTableEnd ; 12D (3BEF)
  dw TilesetSourceAddressTableEnd ; 12E (3BF1)
  dw TilesetSourceAddressTableEnd ; 12F (3BF3)
  dw Tileset188000 ; 130 (3BF5)
  dw Tileset18834F ; 131 (3BF7)
  dw Tileset18842D ; 132 (3BF9)
  dw Tileset188612 ; 133 (3BFB)
  dw Tileset18873E ; 134 (3BFD)
  dw Tileset18887C ; 135 (3BFF)
  dw Tileset188A1E ; 136 (3C01)
  dw Tileset188C29 ; 137 (3C03)
  dw Tileset188DFC ; 138 (3C05)
  dw Tileset188FDF ; 139 (3C07)
  dw Tileset18912E ; 13A (3C09)
  dw Tileset189265 ; 13B (3C0B)
  dw Tileset1893C8 ; 13C (3C0D)
  dw Tileset1894E8 ; 13D (3C0F)
  dw Tileset18974F ; 13E (3C11)
  dw Tileset1898B8 ; 13F (3C13)
  dw Tileset1899DD ; 140 (3C15)
  dw Tileset189B6A ; 141 (3C17)
  dw Tileset189C6E ; 142 (3C19)
  dw Tileset189D12 ; 143 (3C1B)
  dw Tileset189EBA ; 144 (3C1D)
  dw Tileset18A0BF ; 145 (3C1F)
  dw Tileset18A43B ; 146 (3C21)
  dw Tileset18A56C ; 147 (3C23)
  dw Tileset18A6F4 ; 148 (3C25)
  dw Tileset18A844 ; 149 (3C27)
  dw Tileset18A9D9 ; 14A (3C29)
  dw Tileset18AB96 ; 14B (3C2B)
  dw TilesetSourceAddressTableEnd ; 14C (3C2D)
  dw TilesetSourceAddressTableEnd ; 14D (3C2F)
  dw TilesetSourceAddressTableEnd ; 14E (3C31)
  dw TilesetSourceAddressTableEnd ; 14F (3C33)
  dw Tileset1C8000 ; 150 (3C35)
  dw Tileset1C8808 ; 151 (3C37)
  dw Tileset1C8C87 ; 152 (3C39)
  dw Tileset1C9296 ; 153 (3C3B)
  dw Tileset1C9CBD ; 154 (3C3D)
  dw Tileset1CA128 ; 155 (3C3F)
  dw Tileset1CC000 ; 156 (3C41)
  dw Tileset1CC4E4 ; 157 (3C43)
  dw Tileset1CC947 ; 158 (3C45)
  dw Tileset1CCEDE ; 159 (3C47)
  dw Tileset1CD064 ; 15A (3C49)
  dw Tileset1CD5D8 ; 15B (3C4B)
  dw Tileset1C9841 ; 15C (3C4D)
  dw Tileset1CA584 ; 15D (3C4F)
  dw Tileset1CAA6F ; 15E (3C51)
  dw Tileset1CB0B0 ; 15F (3C53)
  dw Tileset1D1D33 ; 160 (3C55)
  dw Tileset1D217E ; 161 (3C57)
  dw Tileset1D26A2 ; 162 (3C59)
  dw Tileset1D0000 ; 163 (3C5B)
  dw Tileset1D055D ; 164 (3C5D)
  dw Tileset1D0989 ; 165 (3C5F)
  dw Tileset1D0F8C ; 166 (3C61)
  dw Tileset1D2BBF ; 167 (3C63)
  dw TilesetSourceAddressTableEnd ; 168 (3C65)
  dw Tileset1D13F1 ; 169 (3C67)
  dw Tileset1D1929 ; 16A (3C69)
  dw Tileset1D2BCD ; 16B (3C6B)
  dw Tileset1D30A1 ; 16C (3C6D)
  dw Tileset1D3307 ; 16D (3C6F)
  dw Tileset1D3600 ; 16E (3C71)
  dw Tileset1D368F ; 16F (3C73)
  dw TilesetSourceAddressTableEnd ; 170 (3C75)
  dw TilesetSourceAddressTableEnd ; 171 (3C77)
  dw TilesetSourceAddressTableEnd ; 172 (3C79)
  dw TilesetSourceAddressTableEnd ; 173 (3C7B)
  dw TilesetSourceAddressTableEnd ; 174 (3C7D)
  dw TilesetSourceAddressTableEnd ; 175 (3C7F)
  dw TilesetSourceAddressTableEnd ; 176 (3C81)
  dw TilesetSourceAddressTableEnd ; 177 (3C83)
  dw TilesetSourceAddressTableEnd ; 178 (3C85)
  dw TilesetSourceAddressTableEnd ; 179 (3C87)
  dw TilesetSourceAddressTableEnd ; 17A (3C89)
  dw TilesetSourceAddressTableEnd ; 17B (3C8B)
  dw TilesetSourceAddressTableEnd ; 17C (3C8D)
  dw TilesetSourceAddressTableEnd ; 17D (3C8F)
  dw TilesetSourceAddressTableEnd ; 17E (3C91)
  dw TilesetSourceAddressTableEnd ; 17F (3C93)
  dw Tileset29C000 ; 180 (3C95)
  dw Tileset29C4F8 ; 181 (3C97)
  dw Tileset29CA1F ; 182 (3C99)
  dw Tileset29CA1F ; 183 (3C9B)
  dw Tileset29CFB1 ; 184 (3C9D)
  dw Tileset29D5AA ; 185 (3C9F)
  dw Tileset29D8CE ; 186 (3CA1)
  dw Tileset29DE85 ; 187 (3CA3)
  dw Tileset2A0000 ; 188 (3CA5)
  dw Tileset2A04BB ; 189 (3CA7)
  dw Tileset2A09CE ; 18A (3CA9)
  dw Tileset2A09CE ; 18B (3CAB)
  dw Tileset2A0F04 ; 18C (3CAD)
  dw Tileset2A14FA ; 18D (3CAF)
  dw Tileset2A1831 ; 18E (3CB1)
  dw Tileset2A1DEB ; 18F (3CB3)
  dw Tileset2A4000 ; 190 (3CB5)
  dw Tileset2A44D8 ; 191 (3CB7)
  dw Tileset2A4A00 ; 192 (3CB9)
  dw Tileset2A501D ; 193 (3CBB)
  dw Tileset2A50AD ; 194 (3CBD)
  dw Tileset2A56D6 ; 195 (3CBF)
  dw Tileset2A5A4E ; 196 (3CC1)
  dw Tileset2A5F58 ; 197 (3CC3)
  dw Tileset2A8000 ; 198 (3CC5)
  dw Tileset2A84B1 ; 199 (3CC7)
  dw Tileset2A898C ; 19A (3CC9)
  dw Tileset2A8F97 ; 19B (3CCB)
  dw Tileset2A906D ; 19C (3CCD)
  dw Tileset2A969D ; 19D (3CCF)
  dw Tileset2A99BC ; 19E (3CD1)
  dw Tileset2A9ECA ; 19F (3CD3)
  dw TilesetSourceAddressTableEnd ; 1A0 (3CD5)
  dw TilesetSourceAddressTableEnd ; 1A1 (3CD7)
  dw TilesetSourceAddressTableEnd ; 1A2 (3CD9)
  dw TilesetSourceAddressTableEnd ; 1A3 (3CDB)
  dw TilesetSourceAddressTableEnd ; 1A4 (3CDD)
  dw TilesetSourceAddressTableEnd ; 1A5 (3CDF)
  dw TilesetSourceAddressTableEnd ; 1A6 (3CE1)
  dw TilesetSourceAddressTableEnd ; 1A7 (3CE3)
  dw TilesetSourceAddressTableEnd ; 1A8 (3CE5)
  dw TilesetSourceAddressTableEnd ; 1A9 (3CE7)
  dw TilesetSourceAddressTableEnd ; 1AA (3CE9)
  dw TilesetSourceAddressTableEnd ; 1AB (3CEB)
  dw TilesetSourceAddressTableEnd ; 1AC (3CED)
  dw TilesetSourceAddressTableEnd ; 1AD (3CEF)
  dw TilesetSourceAddressTableEnd ; 1AE (3CF1)
  dw TilesetSourceAddressTableEnd ; 1AF (3CF3)
  dw TilesetSourceAddressTableEnd ; 1B0 (3CF5)
  dw TilesetSourceAddressTableEnd ; 1B1 (3CF7)
  dw TilesetSourceAddressTableEnd ; 1B2 (3CF9)
  dw TilesetSourceAddressTableEnd ; 1B3 (3CFB)
  dw TilesetSourceAddressTableEnd ; 1B4 (3CFD)
  dw TilesetSourceAddressTableEnd ; 1B5 (3CFF)
  dw TilesetSourceAddressTableEnd ; 1B6 (3D01)
  dw TilesetSourceAddressTableEnd ; 1B7 (3D03)
  dw TilesetSourceAddressTableEnd ; 1B8 (3D05)
  dw TilesetSourceAddressTableEnd ; 1B9 (3D07)
  dw TilesetSourceAddressTableEnd ; 1BA (3D09)
  dw TilesetSourceAddressTableEnd ; 1BB (3D0B)
  dw TilesetSourceAddressTableEnd ; 1BC (3D0D)
  dw TilesetSourceAddressTableEnd ; 1BD (3D0F)
  dw TilesetSourceAddressTableEnd ; 1BE (3D11)
  dw TilesetSourceAddressTableEnd ; 1BF (3D13)
  dw TilesetSourceAddressTableEnd ; 1C0 (3D15)
  dw TilesetSourceAddressTableEnd ; 1C1 (3D17)
  dw TilesetSourceAddressTableEnd ; 1C2 (3D19)
  dw TilesetSourceAddressTableEnd ; 1C3 (3D1B)
  dw TilesetSourceAddressTableEnd ; 1C4 (3D1D)
  dw TilesetSourceAddressTableEnd ; 1C5 (3D1F)
  dw TilesetSourceAddressTableEnd ; 1C6 (3D21)
  dw TilesetSourceAddressTableEnd ; 1C7 (3D23)
  dw TilesetSourceAddressTableEnd ; 1C8 (3D25)
  dw TilesetSourceAddressTableEnd ; 1C9 (3D27)
  dw TilesetSourceAddressTableEnd ; 1CA (3D29)
  dw TilesetSourceAddressTableEnd ; 1CB (3D2B)
  dw TilesetSourceAddressTableEnd ; 1CC (3D2D)
  dw TilesetSourceAddressTableEnd ; 1CD (3D2F)
  dw TilesetSourceAddressTableEnd ; 1CE (3D31)
  dw TilesetSourceAddressTableEnd ; 1CF (3D33)
  dw TilesetSourceAddressTableEnd ; 1D0 (3D35)
  dw TilesetSourceAddressTableEnd ; 1D1 (3D37)
  dw TilesetSourceAddressTableEnd ; 1D2 (3D39)
  dw TilesetSourceAddressTableEnd ; 1D3 (3D3B)
  dw TilesetSourceAddressTableEnd ; 1D4 (3D3D)
  dw TilesetSourceAddressTableEnd ; 1D5 (3D3F)
  dw TilesetSourceAddressTableEnd ; 1D6 (3D41)
  dw TilesetSourceAddressTableEnd ; 1D7 (3D43)
  dw TilesetSourceAddressTableEnd ; 1D8 (3D45)
  dw TilesetSourceAddressTableEnd ; 1D9 (3D47)
  dw TilesetSourceAddressTableEnd ; 1DA (3D49)
  dw TilesetSourceAddressTableEnd ; 1DB (3D4B)
  dw TilesetSourceAddressTableEnd ; 1DC (3D4D)
  dw TilesetSourceAddressTableEnd ; 1DD (3D4F)
  dw TilesetSourceAddressTableEnd ; 1DE (3D51)
  dw TilesetSourceAddressTableEnd ; 1DF (3D53)
  dw TilesetSourceAddressTableEnd ; 1E0 (3D55)
  dw TilesetSourceAddressTableEnd ; 1E1 (3D57)
  dw TilesetSourceAddressTableEnd ; 1E2 (3D59)
  dw TilesetSourceAddressTableEnd ; 1E3 (3D5B)
  dw TilesetSourceAddressTableEnd ; 1E4 (3D5D)
  dw TilesetSourceAddressTableEnd ; 1E5 (3D5F)
  dw TilesetSourceAddressTableEnd ; 1E6 (3D61)
  dw TilesetSourceAddressTableEnd ; 1E7 (3D63)
  dw TilesetSourceAddressTableEnd ; 1E8 (3D65)
  dw TilesetSourceAddressTableEnd ; 1E9 (3D67)
  dw TilesetSourceAddressTableEnd ; 1EA (3D69)
  dw TilesetSourceAddressTableEnd ; 1EB (3D6B)
  dw TilesetSourceAddressTableEnd ; 1EC (3D6D)
  dw TilesetSourceAddressTableEnd ; 1ED (3D6F)
  dw TilesetSourceAddressTableEnd ; 1EE (3D71)
  dw TilesetSourceAddressTableEnd ; 1EF (3D73)
  dw TilesetSourceAddressTableEnd ; 1F0 (3D75)
  dw TilesetSourceAddressTableEnd ; 1F1 (3D77)
  dw TilesetSourceAddressTableEnd ; 1F2 (3D79)
  dw TilesetSourceAddressTableEnd ; 1F3 (3D7B)
  dw TilesetSourceAddressTableEnd ; 1F4 (3D7D)
  dw TilesetSourceAddressTableEnd ; 1F5 (3D7F)
  dw TilesetSourceAddressTableEnd ; 1F6 (3D81)
  dw TilesetSourceAddressTableEnd ; 1F7 (3D83)
  dw TilesetSourceAddressTableEnd ; 1F8 (3D85)
  dw TilesetSourceAddressTableEnd ; 1F9 (3D87)
  dw TilesetSourceAddressTableEnd ; 1FA (3D89)
  dw TilesetSourceAddressTableEnd ; 1FB (3D8B)
  dw TilesetSourceAddressTableEnd ; 1FC (3D8D)
  dw TilesetSourceAddressTableEnd ; 1FD (3D8F)
  dw TilesetSourceAddressTableEnd ; 1FE (3D91)
  dw TilesetSourceAddressTableEnd ; 1FF (3D93)
TilesetSourceAddressTableEnd::

SECTION "Tileset Info Table", ROMX[$706A], BANK[$39]
TilesetInfoTable::
  dbwb BANK(Tileset0F8000), $9000, $0 ; 000
  dbwb BANK(Tileset0E8943), $8FC0, $1 ; 001
  dbwb BANK(MainDialog1), $9000, $1 ; 002
  dbwb BANK(MainDialog2), $8800, $1 ; 003
  dbwb BANK(Special), $8E00, $1 ; 004
  dbwb BANK(Tileset0E88BF), $8D40, $1 ; 005
  dbwb BANK(Tileset0F0000), $9000, $0 ; 006
  dbwb BANK(Tileset0F03A0), $9500, $0 ; 007
  dbwb BANK(Tileset0F04D0), $9500, $0 ; 008
  dbwb BANK(Tileset0F0625), $9500, $0 ; 009
  dbwb BANK(Tileset0F0782), $9500, $0 ; 00A
  dbwb BANK(Tileset0F08E0), $9500, $0 ; 00B
  dbwb BANK(Tileset0F0A5B), $8000, $0 ; 00C
  dbwb BANK(Tileset0F0F4D), $86C0, $0 ; 00D
  dbwb BANK(Tileset0F0FD5), $9000, $0 ; 00E
  dbwb BANK(Tileset0F124E), $8CC0, $0 ; 00F
  dbwb BANK(Tileset0F138F), $8F30, $0 ; 010
  dbwb BANK(Tileset0F141E), $8000, $0 ; 011
  dbwb BANK(Tileset0F149D), $8900, $0 ; 012
  dbwb BANK(Tileset0F15A3), $8ED0, $0 ; 013
  dbwb BANK(Tileset0F160E), $9000, $0 ; 014
  dbwb BANK(Tileset0F19BC), $9000, $0 ; 015
  dbwb BANK(Tileset0F1CE8), $8000, $0 ; 016
  dbwb BANK(Tileset0F1D2D), $8D00, $0 ; 017
  dbwb BANK(Tileset0F1D95), $9000, $0 ; 018
  dbwb BANK(Tileset0F1FD2), $9000, $1 ; 019
  dbwb BANK(Tileset0F24C5), $8800, $1 ; 01A
  dbwb BANK(Tileset0F29F2), $9000, $0 ; 01B
  dbwb BANK(Tileset0E8969), $9000, $0 ; 01C
  dbwb BANK(Tileset0E8B37), $9000, $0 ; 01D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 01E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 01F
  dbwb BANK(Tileset0E8B5E), $8800, $0 ; 020
  dbwb BANK(Tileset0E9052), $8F00, $0 ; 021
  dbwb BANK(Tileset0E90C9), $9000, $0 ; 022
  dbwb BANK(Tileset0E9239), $9400, $0 ; 023
  dbwb BANK(Tileset0E9369), $8000, $0 ; 024
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 025
  dbwb BANK(Tileset0E98A2), $9000, $0 ; 026
  dbwb BANK(Tileset0E9BD9), $8000, $0 ; 027
  dbwb BANK(Tileset0E8B5E), $8800, $0 ; 028
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 029
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02A
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 02F
  dbwb BANK(Tileset0EC000), $9000, $0 ; 030
  dbwb BANK(Tileset0EC30C), $8400, $0 ; 031
  dbwb BANK(Tileset0EC404), $8C00, $0 ; 032
  dbwb BANK(Tileset0EC65E), $8C00, $0 ; 033
  dbwb BANK(Tileset0EC881), $8C00, $0 ; 034
  dbwb BANK(Tileset0ECA64), $8C00, $0 ; 035
  dbwb BANK(Tileset0ECC8E), $8600, $0 ; 036
  dbwb BANK(Tileset0ECD08), $82C0, $0 ; 037
  dbwb BANK(Tileset0ECD3D), $8300, $0 ; 038
  dbwb BANK(Tileset0ECD71), $8000, $1 ; 039
  dbwb BANK(Tileset0ECE96), $9000, $0 ; 03A
  dbwb BANK(Tileset0ECF4D), $9560, $0 ; 03B
  dbwb BANK(Tileset0ED1BB), $8400, $0 ; 03C
  dbwb BANK(Tileset0ED2B5), $8300, $0 ; 03D
  dbwb BANK(Tileset0ED492), $8000, $0 ; 03E
  dbwb BANK(Tileset0ED6A1), $8B60, $0 ; 03F
  dbwb BANK(Tileset0ED79A), $8C20, $0 ; 040
  dbwb BANK(Tileset0ED82B), $9000, $0 ; 041
  dbwb BANK(Tileset0ED71D), $8AA0, $0 ; 042
  dbwb BANK(Tileset0EDC0B), $8000, $0 ; 043
  dbwb BANK(Tileset0EDCEA), $9000, $0 ; 044
  dbwb BANK(Tileset0EDFC6), $9000, $0 ; 045
  dbwb BANK(Tileset0EE3F8), $9000, $0 ; 046
  dbwb BANK(Tileset0EE831), $8800, $0 ; 047
  dbwb BANK(Tileset0F8000), $8000, $0 ; 048
  dbwb BANK(Tileset0F8361), $8800, $0 ; 049
  dbwb BANK(Tileset0F862F), $8800, $0 ; 04A
  dbwb BANK(Tileset0F8998), $8800, $0 ; 04B
  dbwb BANK(Tileset0F8C96), $8500, $0 ; 04C
  dbwb BANK(Tileset0FB460), $8800, $0 ; 04D
  dbwb BANK(Tileset0FB2B6), $8000, $0 ; 04E
  dbwb BANK(Tileset0FB8D6), $8000, $0 ; 04F
  dbwb BANK(Tileset0E8952), $9000, $0 ; 050
  dbwb BANK(Tileset0EE8AF), $9000, $0 ; 051
  dbwb BANK(Tileset0EE9AA), $9160, $0 ; 052
  dbwb BANK(Tileset0EEA17), $9160, $0 ; 053
  dbwb BANK(Tileset0EEA86), $9160, $0 ; 054
  dbwb BANK(Tileset0EEAF5), $9160, $0 ; 055
  dbwb BANK(Tileset0EEB65), $9160, $0 ; 056
  dbwb BANK(Tileset0EEBD2), $9160, $0 ; 057
  dbwb BANK(Tileset0EEC40), $91E0, $0 ; 058
  dbwb BANK(Tileset0EED82), $91E0, $0 ; 059
  dbwb BANK(Tileset0EEE9E), $91E0, $0 ; 05A
  dbwb BANK(Tileset0EEFFF), $91E0, $0 ; 05B
  dbwb BANK(Tileset0EF136), $91E0, $0 ; 05C
  dbwb BANK(Tileset0EF28F), $91E0, $0 ; 05D
  dbwb BANK(Tileset0EF3C0), $91E0, $0 ; 05E
  dbwb BANK(Tileset0FB9B2), $8800, $0 ; 05F
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 060
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 061
  dbwb BANK(Tileset0F8CA1), $8800, $0 ; 062
  dbwb BANK(Tileset0F9172), $8800, $0 ; 063
  dbwb BANK(Tileset0F995D), $8800, $0 ; 064
  dbwb BANK(Tileset0FA28F), $8800, $0 ; 065
  dbwb BANK(Tileset0FAA7F), $8800, $0 ; 066
  dbwb BANK(Tileset0FAA7F), $8800, $0 ; 067
  dbwb BANK(Tileset119E18), $8800, $0 ; 068
  dbwb BANK(Tileset11A69C), $8800, $0 ; 069
  dbwb BANK(Tileset2958C1), $8800, $0 ; 06A
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 06B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 06C
  dbwb BANK(Tileset11AE5D), $9000, $0 ; 06D
  dbwb BANK(Tileset11B47B), $8800, $0 ; 06E
  dbwb BANK(Tileset0EF448), $9000, $0 ; 06F
  dbwb BANK(Tileset0F2A90), $8100, $0 ; 070
  dbwb BANK(Tileset0F2DCB), $8800, $0 ; 071
  dbwb BANK(Tileset0F2E6A), $8910, $0 ; 072
  dbwb BANK(Tileset0F306E), $8C10, $0 ; 073
  dbwb BANK(Tileset0F31AD), $8F60, $0 ; 074
  dbwb BANK(Tileset0F3200), $9000, $0 ; 075
  dbwb BANK(Tileset0F337F), $8DC0, $0 ; 076
  dbwb BANK(Tileset0F3402), $8D00, $0 ; 077
  dbwb BANK(Tileset0F3486), $8E00, $0 ; 078
  dbwb BANK(Tileset0F34EE), $8F00, $0 ; 079
  dbwb BANK(Tileset0F3526), $9000, $0 ; 07A
  dbwb BANK(Tileset0F3683), $9290, $0 ; 07B
  dbwb BANK(Tileset0F38BA), $8D40, $1 ; 07C
  dbwb BANK(Tileset294000), $9000, $0 ; 07D
  dbwb BANK(Tileset2943CB), $8800, $0 ; 07E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 07F
  dbwb BANK(Tileset06C000), $9000, $0 ; 080
  dbwb BANK(Tileset06C4B6), $9000, $0 ; 081
  dbwb BANK(Tileset06C86C), $9000, $0 ; 082
  dbwb BANK(Tileset06CD11), $9000, $0 ; 083
  dbwb BANK(Tileset06D1BD), $9000, $0 ; 084
  dbwb BANK(Tileset06D61C), $9000, $0 ; 085
  dbwb BANK(Tileset06DAAB), $9000, $0 ; 086
  dbwb BANK(Tileset06DECA), $9000, $0 ; 087
  dbwb BANK(Tileset06E19B), $9000, $0 ; 088
  dbwb BANK(Tileset06E556), $9000, $0 ; 089
  dbwb BANK(Tileset06E9B0), $9000, $0 ; 08A
  dbwb BANK(Tileset06EDF5), $9000, $0 ; 08B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 08F
  dbwb BANK(Tileset07CA6A), $9000, $0 ; 090
  dbwb BANK(Tileset07CD1B), $9000, $0 ; 091
  dbwb BANK(Tileset07D049), $9000, $0 ; 092
  dbwb BANK(Tileset07D405), $9000, $0 ; 093
  dbwb BANK(Tileset07D7D9), $9000, $0 ; 094
  dbwb BANK(Tileset07DB67), $9000, $0 ; 095
  dbwb BANK(Tileset07DF3A), $9000, $0 ; 096
  dbwb BANK(Tileset07E23F), $9000, $0 ; 097
  dbwb BANK(Tileset07E497), $9000, $0 ; 098
  dbwb BANK(Tileset07E7C6), $9000, $0 ; 099
  dbwb BANK(Tileset07EA6A), $9000, $0 ; 09A
  dbwb BANK(Tileset07EE25), $9000, $0 ; 09B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 09F
  dbwb BANK(Tileset2944C1), $9000, $0 ; 0A0
  dbwb BANK(Tileset2946B9), $8000, $0 ; 0A1
  dbwb BANK(Tileset29472F), $8000, $0 ; 0A2
  dbwb BANK(Tileset2948A6), $8800, $0 ; 0A3
  dbwb BANK(Tileset294997), $9000, $0 ; 0A4
  dbwb BANK(Tileset294D6B), $8000, $0 ; 0A5
  dbwb BANK(Tileset29505A), $9000, $0 ; 0A6
  dbwb BANK(Tileset2950AF), $8000, $0 ; 0A7
  dbwb BANK(Tileset2951E0), $9000, $0 ; 0A8
  dbwb BANK(Tileset29580E), $8B00, $0 ; 0A9
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AA
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AB
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AC
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AD
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AE
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 0AF
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0B0
  dbwb BANK(Tileset120000), $8AA0, $0 ; 0B1
  dbwb BANK(Tileset1201B8), $8AA0, $0 ; 0B2
  dbwb BANK(Tileset120336), $8AA0, $0 ; 0B3
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0B4
  dbwb BANK(Tileset120506), $8AA0, $0 ; 0B5
  dbwb BANK(Tileset1206E2), $8AA0, $0 ; 0B6
  dbwb BANK(Tileset1208AE), $8AA0, $0 ; 0B7
  dbwb BANK(Tileset120A9E), $8AA0, $0 ; 0B8
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0B9
  dbwb BANK(Tileset120C13), $8AA0, $0 ; 0BA
  dbwb BANK(Tileset120DD6), $8AA0, $0 ; 0BB
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0BC
  dbwb BANK(Tileset120F87), $8AA0, $0 ; 0BD
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0BE
  dbwb BANK(Tileset12118A), $8AA0, $0 ; 0BF
  dbwb BANK(Tileset121360), $8AA0, $0 ; 0C0
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0C1
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0C2
  dbwb BANK(Tileset1214F0), $8AA0, $0 ; 0C3
  dbwb BANK(Tileset12166E), $8AA0, $0 ; 0C4
  dbwb BANK(Tileset12182F), $8AA0, $0 ; 0C5
  dbwb BANK(Tileset1219FF), $8AA0, $0 ; 0C6
  dbwb BANK(Tileset121BAE), $8AA0, $0 ; 0C7
  dbwb BANK(Tileset121D84), $8AA0, $0 ; 0C8
  dbwb BANK(Tileset121F78), $8AA0, $0 ; 0C9
  dbwb BANK(Tileset122100), $8AA0, $0 ; 0CA
  dbwb BANK(Tileset122321), $8AA0, $0 ; 0CB
  dbwb BANK(Tileset1224A1), $8AA0, $0 ; 0CC
  dbwb BANK(Tileset122647), $8AA0, $0 ; 0CD
  dbwb BANK(Tileset1227CE), $8AA0, $0 ; 0CE
  dbwb BANK(Tileset122953), $8AA0, $0 ; 0CF
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0D0
  dbwb BANK(Tileset122B40), $8AA0, $0 ; 0D1
  dbwb BANK(Tileset122D11), $8AA0, $0 ; 0D2
  dbwb BANK(Tileset122EF2), $8AA0, $0 ; 0D3
  dbwb BANK(Tileset12307F), $8AA0, $0 ; 0D4
  dbwb BANK(Tileset124000), $8AA0, $0 ; 0D5
  dbwb BANK(Tileset1241B5), $8AA0, $0 ; 0D6
  dbwb BANK(Tileset1243D5), $8AA0, $0 ; 0D7
  dbwb BANK(Tileset12466B), $8AA0, $0 ; 0D8
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0D9
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0DA
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0DB
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0DC
  dbwb BANK(Tileset124999), $8AA0, $0 ; 0DD
  dbwb BANK(Tileset124B35), $8AA0, $0 ; 0DE
  dbwb BANK(Tileset124C85), $8AA0, $0 ; 0DF
  dbwb BANK(Tileset124E2C), $8AA0, $0 ; 0E0
  dbwb BANK(Tileset124FB8), $8AA0, $0 ; 0E1
  dbwb BANK(Tileset12514C), $8AA0, $0 ; 0E2
  dbwb BANK(Tileset12528D), $8AA0, $0 ; 0E3
  dbwb BANK(Tileset12540C), $8AA0, $0 ; 0E4
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0E5
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0E6
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0E7
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0E8
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0E9
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0EA
  dbwb BANK(Tileset125556), $8AA0, $0 ; 0EB
  dbwb BANK(Tileset125823), $8AA0, $0 ; 0EC
  dbwb BANK(Tileset125A05), $8AA0, $0 ; 0ED
  dbwb BANK(Tileset125C40), $8AA0, $0 ; 0EE
  dbwb BANK(Tileset125E55), $8AA0, $0 ; 0EF
  dbwb BANK(Tileset12600D), $8AA0, $0 ; 0F0
  dbwb BANK(Tileset126156), $8AA0, $0 ; 0F1
  dbwb BANK(Tileset124848), $8AA0, $0 ; 0F2
  dbwb BANK(Tileset12639B), $8AA0, $0 ; 0F3
  dbwb BANK(Tileset126518), $8AA0, $0 ; 0F4
  dbwb BANK(Tileset126702), $8AA0, $0 ; 0F5
  dbwb BANK(Tileset126879), $8AA0, $0 ; 0F6
  dbwb BANK(Tileset126A17), $8AA0, $0 ; 0F7
  dbwb BANK(Tileset126BA4), $8AA0, $0 ; 0F8
  dbwb BANK(Tileset126D1C), $8AA0, $0 ; 0F9
  dbwb BANK(Tileset126EC8), $8AA0, $0 ; 0FA
  dbwb BANK(Tileset12706A), $8AA0, $0 ; 0FB
  dbwb BANK(Tileset127226), $8AA0, $0 ; 0FC
  dbwb BANK(Tileset1273C4), $8AA0, $0 ; 0FD
  dbwb BANK(Tileset127554), $8AA0, $0 ; 0FE
  dbwb BANK(Tileset127703), $8AA0, $0 ; 0FF
  dbwb BANK(Tileset19C000), $8800, $0 ; 100
  dbwb BANK(Tileset19C957), $8800, $0 ; 101
  dbwb BANK(Tileset19D428), $8800, $0 ; 102
  dbwb BANK(Tileset19DDBA), $8800, $0 ; 103
  dbwb BANK(Tileset19E936), $8800, $0 ; 104
  dbwb BANK(Tileset19F13A), $8800, $0 ; 105
  dbwb BANK(Tileset1A0000), $8800, $0 ; 106
  dbwb BANK(Tileset1A08B0), $8800, $0 ; 107
  dbwb BANK(Tileset1A1182), $8800, $0 ; 108
  dbwb BANK(Tileset1A18E2), $8800, $0 ; 109
  dbwb BANK(Tileset1A2295), $8800, $0 ; 10A
  dbwb BANK(Tileset1A2C26), $8800, $0 ; 10B
  dbwb BANK(Tileset1A35D9), $8800, $0 ; 10C
  dbwb BANK(Tileset1A4000), $8800, $0 ; 10D
  dbwb BANK(Tileset1A482C), $8800, $0 ; 10E
  dbwb BANK(Tileset1A52E4), $8800, $0 ; 10F
  dbwb BANK(Tileset1A5BF9), $8800, $0 ; 110
  dbwb BANK(Tileset1A65B8), $8800, $0 ; 111
  dbwb BANK(Tileset1A6FB5), $8800, $0 ; 112
  dbwb BANK(Tileset1A8000), $8800, $0 ; 113
  dbwb BANK(Tileset1A8968), $8800, $0 ; 114
  dbwb BANK(Tileset1A92D9), $8800, $0 ; 115
  dbwb BANK(Tileset1A9C5B), $8800, $0 ; 116
  dbwb BANK(Tileset1AA176), $8800, $0 ; 117
  dbwb BANK(Tileset1AAA22), $8800, $0 ; 118
  dbwb BANK(Tileset1AB1E1), $8800, $0 ; 119
  dbwb BANK(Tileset1AC000), $8800, $0 ; 11A
  dbwb BANK(Tileset1AC97D), $8800, $0 ; 11B
  dbwb BANK(Tileset1AD153), $8800, $0 ; 11C
  dbwb BANK(Tileset1AD8E7), $8800, $0 ; 11D
  dbwb BANK(Tileset1AE06E), $8800, $0 ; 11E
  dbwb BANK(Tileset1AE8EF), $8800, $0 ; 11F
  dbwb BANK(Tileset1AF25E), $8800, $0 ; 120
  dbwb BANK(Tileset1B0000), $8800, $0 ; 121
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
  dbwb BANK(Tileset188000), $8000, $1 ; 130
  dbwb BANK(Tileset18834F), $8000, $1 ; 131
  dbwb BANK(Tileset18842D), $8000, $1 ; 132
  dbwb BANK(Tileset188612), $8000, $1 ; 133
  dbwb BANK(Tileset18873E), $8000, $1 ; 134
  dbwb BANK(Tileset18887C), $8000, $1 ; 135
  dbwb BANK(Tileset188A1E), $8000, $1 ; 136
  dbwb BANK(Tileset188C29), $8000, $1 ; 137
  dbwb BANK(Tileset188DFC), $8000, $1 ; 138
  dbwb BANK(Tileset188FDF), $8000, $1 ; 139
  dbwb BANK(Tileset18912E), $8200, $1 ; 13A
  dbwb BANK(Tileset189265), $8200, $1 ; 13B
  dbwb BANK(Tileset1893C8), $8000, $1 ; 13C
  dbwb BANK(Tileset1894E8), $8000, $1 ; 13D
  dbwb BANK(Tileset18974F), $8000, $1 ; 13E
  dbwb BANK(Tileset1898B8), $8000, $1 ; 13F
  dbwb BANK(Tileset1899DD), $8000, $1 ; 140
  dbwb BANK(Tileset189B6A), $8000, $1 ; 141
  dbwb BANK(Tileset189C6E), $8000, $1 ; 142
  dbwb BANK(Tileset189D12), $8000, $1 ; 143
  dbwb BANK(Tileset189EBA), $8000, $1 ; 144
  dbwb BANK(Tileset18A0BF), $8000, $1 ; 145
  dbwb BANK(Tileset18A43B), $8000, $1 ; 146
  dbwb BANK(Tileset18A56C), $8000, $1 ; 147
  dbwb BANK(Tileset18A6F4), $8000, $1 ; 148
  dbwb BANK(Tileset18A844), $8000, $1 ; 149
  dbwb BANK(Tileset18A9D9), $8000, $1 ; 14A
  dbwb BANK(Tileset18AB96), $8000, $1 ; 14B
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14C
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14D
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14E
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 14F
  dbwb BANK(Tileset1C8000), $8000, $0 ; 150
  dbwb BANK(Tileset1C8808), $9000, $0 ; 151
  dbwb BANK(Tileset1C8C87), $9000, $0 ; 152
  dbwb BANK(Tileset1C9296), $8800, $0 ; 153
  dbwb BANK(Tileset1C9CBD), $9000, $0 ; 154
  dbwb BANK(Tileset1CA128), $9000, $0 ; 155
  dbwb BANK(Tileset1CC000), $9000, $0 ; 156
  dbwb BANK(Tileset1CC4E4), $9000, $0 ; 157
  dbwb BANK(Tileset1CC947), $9000, $0 ; 158
  dbwb BANK(Tileset1CCEDE), $8800, $0 ; 159
  dbwb BANK(Tileset1CD064), $9000, $1 ; 15A
  dbwb BANK(Tileset1CD5D8), $8800, $1 ; 15B
  dbwb BANK(Tileset1C9841), $8000, $0 ; 15C
  dbwb BANK(Tileset1CA584), $9000, $0 ; 15D
  dbwb BANK(Tileset1CAA6F), $8800, $0 ; 15E
  dbwb BANK(Tileset1CB0B0), $9000, $1 ; 15F
  dbwb BANK(Tileset1D1D33), $9000, $0 ; 160
  dbwb BANK(Tileset1D217E), $8800, $0 ; 161
  dbwb BANK(Tileset1D26A2), $9000, $1 ; 162
  dbwb BANK(Tileset1D0000), $9000, $0 ; 163
  dbwb BANK(Tileset1D055D), $8800, $0 ; 164
  dbwb BANK(Tileset1D0989), $9000, $1 ; 165
  dbwb BANK(Tileset1D0F8C), $8800, $1 ; 166
  dbwb BANK(Tileset1D2BBF), $8800, $1 ; 167
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 168
  dbwb BANK(Tileset1D13F1), $8000, $0 ; 169
  dbwb BANK(Tileset1D1929), $8000, $1 ; 16A
  dbwb BANK(Tileset1D2BCD), $9000, $0 ; 16B
  dbwb BANK(Tileset1D30A1), $8800, $0 ; 16C
  dbwb BANK(Tileset1D3307), $9000, $0 ; 16D
  dbwb BANK(Tileset1D3600), $9000, $0 ; 16E
  dbwb BANK(Tileset1D368F), $9170, $0 ; 16F
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
  dbwb BANK(Tileset29C000), $8000, $0 ; 180
  dbwb BANK(Tileset29C4F8), $8800, $0 ; 181
  dbwb BANK(Tileset29CA1F), $8000, $1 ; 182
  dbwb BANK(Tileset29CA1F), $8000, $1 ; 183
  dbwb BANK(Tileset29CFB1), $9000, $0 ; 184
  dbwb BANK(Tileset29D5AA), $9000, $1 ; 185
  dbwb BANK(Tileset29D8CE), $9000, $0 ; 186
  dbwb BANK(Tileset29DE85), $9000, $1 ; 187
  dbwb BANK(Tileset2A0000), $8000, $0 ; 188
  dbwb BANK(Tileset2A04BB), $8800, $0 ; 189
  dbwb BANK(Tileset2A09CE), $8000, $1 ; 18A
  dbwb BANK(Tileset2A09CE), $8000, $1 ; 18B
  dbwb BANK(Tileset2A0F04), $9000, $0 ; 18C
  dbwb BANK(Tileset2A14FA), $9000, $1 ; 18D
  dbwb BANK(Tileset2A1831), $9000, $0 ; 18E
  dbwb BANK(Tileset2A1DEB), $9000, $1 ; 18F
  dbwb BANK(Tileset2A4000), $8000, $0 ; 190
  dbwb BANK(Tileset2A44D8), $8800, $0 ; 191
  dbwb BANK(Tileset2A4A00), $8000, $1 ; 192
  dbwb BANK(Tileset2A501D), $8800, $1 ; 193
  dbwb BANK(Tileset2A50AD), $9000, $0 ; 194
  dbwb BANK(Tileset2A56D6), $9000, $1 ; 195
  dbwb BANK(Tileset2A5A4E), $9000, $0 ; 196
  dbwb BANK(Tileset2A5F58), $9000, $1 ; 197
  dbwb BANK(Tileset2A8000), $8000, $0 ; 198
  dbwb BANK(Tileset2A84B1), $8800, $0 ; 199
  dbwb BANK(Tileset2A898C), $8000, $1 ; 19A
  dbwb BANK(Tileset2A8F97), $8800, $1 ; 19B
  dbwb BANK(Tileset2A906D), $9000, $0 ; 19C
  dbwb BANK(Tileset2A969D), $9000, $1 ; 19D
  dbwb BANK(Tileset2A99BC), $9000, $0 ; 19E
  dbwb BANK(Tileset2A9ECA), $9000, $1 ; 19F
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
  dbwb BANK(TilesetSourceAddressTableEnd), $0000, $0 ; 1FF
TilesetInfoTableEnd::

TilesetData::
SECTION "Tileset Data Tileset0F8000", ROMX[$4000], BANK[$3E]
Tileset0F8000::
  INCBIN "build/tilesets/Tileset0F8000.malias"
SECTION "Tileset Data Tileset0E8943", ROMX[$4943], BANK[$3A]
Tileset0E8943::
  INCBIN "build/tilesets/Tileset0E8943.malias"
SECTION "Tileset Data MainDialog1", ROMX[$4000], BANK[$3A]
MainDialog1::
  INCBIN "build/tilesets/MainDialog1.malias"
SECTION "Tileset Data MainDialog2", ROMX[$44E7], BANK[$3A]
MainDialog2::
  INCBIN "build/tilesets/MainDialog2.malias"
SECTION "Tileset Data Special", ROMX[$4780], BANK[$3A]
Special::
  INCBIN "build/tilesets/Special.malias"
SECTION "Tileset Data Tileset0E88BF", ROMX[$48BF], BANK[$3A]
Tileset0E88BF::
  INCBIN "build/tilesets/Tileset0E88BF.malias"
SECTION "Tileset Data Tileset0F0000", ROMX[$4000], BANK[$3C]
Tileset0F0000::
  INCBIN "build/tilesets/Tileset0F0000.malias"
SECTION "Tileset Data Tileset0F03A0", ROMX[$43A0], BANK[$3C]
Tileset0F03A0::
  INCBIN "build/tilesets/Tileset0F03A0.malias"
SECTION "Tileset Data Tileset0F04D0", ROMX[$44D0], BANK[$3C]
Tileset0F04D0::
  INCBIN "build/tilesets/Tileset0F04D0.malias"
SECTION "Tileset Data Tileset0F0625", ROMX[$4625], BANK[$3C]
Tileset0F0625::
  INCBIN "build/tilesets/Tileset0F0625.malias"
SECTION "Tileset Data Tileset0F0782", ROMX[$4782], BANK[$3C]
Tileset0F0782::
  INCBIN "build/tilesets/Tileset0F0782.malias"
SECTION "Tileset Data Tileset0F08E0", ROMX[$48E0], BANK[$3C]
Tileset0F08E0::
  INCBIN "build/tilesets/Tileset0F08E0.malias"
SECTION "Tileset Data Tileset0F0A5B", ROMX[$4A5B], BANK[$3C]
Tileset0F0A5B::
  INCBIN "build/tilesets/Tileset0F0A5B.malias"
SECTION "Tileset Data Tileset0F0F4D", ROMX[$4F4D], BANK[$3C]
Tileset0F0F4D::
  INCBIN "build/tilesets/Tileset0F0F4D.malias"
SECTION "Tileset Data Tileset0F0FD5", ROMX[$4FD5], BANK[$3C]
Tileset0F0FD5::
  INCBIN "build/tilesets/Tileset0F0FD5.malias"
SECTION "Tileset Data Tileset0F124E", ROMX[$524E], BANK[$3C]
Tileset0F124E::
  INCBIN "build/tilesets/Tileset0F124E.malias"
SECTION "Tileset Data Tileset0F138F", ROMX[$538F], BANK[$3C]
Tileset0F138F::
  INCBIN "build/tilesets/Tileset0F138F.malias"
SECTION "Tileset Data Tileset0F141E", ROMX[$541E], BANK[$3C]
Tileset0F141E::
  INCBIN "build/tilesets/Tileset0F141E.malias"
SECTION "Tileset Data Tileset0F149D", ROMX[$549D], BANK[$3C]
Tileset0F149D::
  INCBIN "build/tilesets/Tileset0F149D.malias"
SECTION "Tileset Data Tileset0F15A3", ROMX[$55A3], BANK[$3C]
Tileset0F15A3::
  INCBIN "build/tilesets/Tileset0F15A3.malias"
SECTION "Tileset Data Tileset0F160E", ROMX[$560E], BANK[$3C]
Tileset0F160E::
  INCBIN "build/tilesets/Tileset0F160E.malias"
SECTION "Tileset Data Tileset0F19BC", ROMX[$59BC], BANK[$3C]
Tileset0F19BC::
  INCBIN "build/tilesets/Tileset0F19BC.malias"
SECTION "Tileset Data Tileset0F1CE8", ROMX[$5CE8], BANK[$3C]
Tileset0F1CE8::
  INCBIN "build/tilesets/Tileset0F1CE8.malias"
SECTION "Tileset Data Tileset0F1D2D", ROMX[$5D2D], BANK[$3C]
Tileset0F1D2D::
  INCBIN "build/tilesets/Tileset0F1D2D.malias"
SECTION "Tileset Data Tileset0F1D95", ROMX[$5D95], BANK[$3C]
Tileset0F1D95::
  INCBIN "build/tilesets/Tileset0F1D95.malias"
SECTION "Tileset Data Tileset0F1FD2", ROMX[$5FD2], BANK[$3C]
Tileset0F1FD2::
  INCBIN "build/tilesets/Tileset0F1FD2.malias"
SECTION "Tileset Data Tileset0F24C5", ROMX[$64C5], BANK[$3C]
Tileset0F24C5::
  INCBIN "build/tilesets/Tileset0F24C5.malias"
SECTION "Tileset Data Tileset0F29F2", ROMX[$69F2], BANK[$3C]
Tileset0F29F2::
  INCBIN "build/tilesets/Tileset0F29F2.malias"
SECTION "Tileset Data Tileset0E8969", ROMX[$4969], BANK[$3A]
Tileset0E8969::
  INCBIN "build/tilesets/Tileset0E8969.malias"
SECTION "Tileset Data Tileset0E8B37", ROMX[$4B37], BANK[$3A]
Tileset0E8B37::
  INCBIN "build/tilesets/Tileset0E8B37.malias"
SECTION "Tileset Data Tileset0E8B5E", ROMX[$4B5E], BANK[$3A]
Tileset0E8B5E::
  INCBIN "build/tilesets/Tileset0E8B5E.malias"
SECTION "Tileset Data Tileset0E9052", ROMX[$5052], BANK[$3A]
Tileset0E9052::
  INCBIN "build/tilesets/Tileset0E9052.malias"
SECTION "Tileset Data Tileset0E90C9", ROMX[$50C9], BANK[$3A]
Tileset0E90C9::
  INCBIN "build/tilesets/Tileset0E90C9.malias"
SECTION "Tileset Data Tileset0E9239", ROMX[$5239], BANK[$3A]
Tileset0E9239::
  INCBIN "build/tilesets/Tileset0E9239.malias"
SECTION "Tileset Data Tileset0E9369", ROMX[$5369], BANK[$3A]
Tileset0E9369::
  INCBIN "build/tilesets/Tileset0E9369.malias"
SECTION "Tileset Data Tileset0E98A2", ROMX[$58A2], BANK[$3A]
Tileset0E98A2::
  INCBIN "build/tilesets/Tileset0E98A2.malias"
SECTION "Tileset Data Tileset0E9BD9", ROMX[$5BD9], BANK[$3A]
Tileset0E9BD9::
  INCBIN "build/tilesets/Tileset0E9BD9.malias"
SECTION "Tileset Data Tileset0EC000", ROMX[$4000], BANK[$3B]
Tileset0EC000::
  INCBIN "build/tilesets/Tileset0EC000.malias"
SECTION "Tileset Data Tileset0EC30C", ROMX[$430C], BANK[$3B]
Tileset0EC30C::
  INCBIN "build/tilesets/Tileset0EC30C.malias"
SECTION "Tileset Data Tileset0EC404", ROMX[$4404], BANK[$3B]
Tileset0EC404::
  INCBIN "build/tilesets/Tileset0EC404.malias"
SECTION "Tileset Data Tileset0EC65E", ROMX[$465E], BANK[$3B]
Tileset0EC65E::
  INCBIN "build/tilesets/Tileset0EC65E.malias"
SECTION "Tileset Data Tileset0EC881", ROMX[$4881], BANK[$3B]
Tileset0EC881::
  INCBIN "build/tilesets/Tileset0EC881.malias"
SECTION "Tileset Data Tileset0ECA64", ROMX[$4A64], BANK[$3B]
Tileset0ECA64::
  INCBIN "build/tilesets/Tileset0ECA64.malias"
SECTION "Tileset Data Tileset0ECC8E", ROMX[$4C8E], BANK[$3B]
Tileset0ECC8E::
  INCBIN "build/tilesets/Tileset0ECC8E.malias"
SECTION "Tileset Data Tileset0ECD08", ROMX[$4D08], BANK[$3B]
Tileset0ECD08::
  INCBIN "build/tilesets/Tileset0ECD08.malias"
SECTION "Tileset Data Tileset0ECD3D", ROMX[$4D3D], BANK[$3B]
Tileset0ECD3D::
  INCBIN "build/tilesets/Tileset0ECD3D.malias"
SECTION "Tileset Data Tileset0ECD71", ROMX[$4D71], BANK[$3B]
Tileset0ECD71::
  INCBIN "build/tilesets/Tileset0ECD71.malias"
SECTION "Tileset Data Tileset0ECE96", ROMX[$4E96], BANK[$3B]
Tileset0ECE96::
  INCBIN "build/tilesets/Tileset0ECE96.malias"
SECTION "Tileset Data Tileset0ECF4D", ROMX[$4F4D], BANK[$3B]
Tileset0ECF4D::
  INCBIN "build/tilesets/Tileset0ECF4D.malias"
SECTION "Tileset Data Tileset0ED1BB", ROMX[$51BB], BANK[$3B]
Tileset0ED1BB::
  INCBIN "build/tilesets/Tileset0ED1BB.malias"
SECTION "Tileset Data Tileset0ED2B5", ROMX[$52B5], BANK[$3B]
Tileset0ED2B5::
  INCBIN "build/tilesets/Tileset0ED2B5.malias"
SECTION "Tileset Data Tileset0ED492", ROMX[$5492], BANK[$3B]
Tileset0ED492::
  INCBIN "build/tilesets/Tileset0ED492.malias"
SECTION "Tileset Data Tileset0ED6A1", ROMX[$56A1], BANK[$3B]
Tileset0ED6A1::
  INCBIN "build/tilesets/Tileset0ED6A1.malias"
SECTION "Tileset Data Tileset0ED79A", ROMX[$579A], BANK[$3B]
Tileset0ED79A::
  INCBIN "build/tilesets/Tileset0ED79A.malias"
SECTION "Tileset Data Tileset0ED82B", ROMX[$582B], BANK[$3B]
Tileset0ED82B::
  INCBIN "build/tilesets/Tileset0ED82B.malias"
SECTION "Tileset Data Tileset0ED71D", ROMX[$571D], BANK[$3B]
Tileset0ED71D::
  INCBIN "build/tilesets/Tileset0ED71D.malias"
SECTION "Tileset Data Tileset0EDC0B", ROMX[$5C0B], BANK[$3B]
Tileset0EDC0B::
  INCBIN "build/tilesets/Tileset0EDC0B.malias"
SECTION "Tileset Data Tileset0EDCEA", ROMX[$5CEA], BANK[$3B]
Tileset0EDCEA::
  INCBIN "build/tilesets/Tileset0EDCEA.malias"
SECTION "Tileset Data Tileset0EDFC6", ROMX[$5FC6], BANK[$3B]
Tileset0EDFC6::
  INCBIN "build/tilesets/Tileset0EDFC6.malias"
SECTION "Tileset Data Tileset0EE3F8", ROMX[$63F8], BANK[$3B]
Tileset0EE3F8::
  INCBIN "build/tilesets/Tileset0EE3F8.malias"
SECTION "Tileset Data Tileset0EE831", ROMX[$6831], BANK[$3B]
Tileset0EE831::
  INCBIN "build/tilesets/Tileset0EE831.malias"
SECTION "Tileset Data Tileset0F8361", ROMX[$4361], BANK[$3E]
Tileset0F8361::
  INCBIN "build/tilesets/Tileset0F8361.malias"
SECTION "Tileset Data Tileset0F862F", ROMX[$462F], BANK[$3E]
Tileset0F862F::
  INCBIN "build/tilesets/Tileset0F862F.malias"
SECTION "Tileset Data Tileset0F8998", ROMX[$4998], BANK[$3E]
Tileset0F8998::
  INCBIN "build/tilesets/Tileset0F8998.malias"
SECTION "Tileset Data Tileset0F8C96", ROMX[$4C96], BANK[$3E]
Tileset0F8C96::
  INCBIN "build/tilesets/Tileset0F8C96.malias"
SECTION "Tileset Data Tileset0FB460", ROMX[$7460], BANK[$3E]
Tileset0FB460::
  INCBIN "build/tilesets/Tileset0FB460.malias"
SECTION "Tileset Data Tileset0FB2B6", ROMX[$72B6], BANK[$3E]
Tileset0FB2B6::
  INCBIN "build/tilesets/Tileset0FB2B6.malias"
SECTION "Tileset Data Tileset0FB8D6", ROMX[$78D6], BANK[$3E]
Tileset0FB8D6::
  INCBIN "build/tilesets/Tileset0FB8D6.malias"
SECTION "Tileset Data Tileset0E8952", ROMX[$4952], BANK[$3A]
Tileset0E8952::
  INCBIN "build/tilesets/Tileset0E8952.malias"
SECTION "Tileset Data Tileset0EE8AF", ROMX[$68AF], BANK[$3B]
Tileset0EE8AF::
  INCBIN "build/tilesets/Tileset0EE8AF.malias"
SECTION "Tileset Data Tileset0EE9AA", ROMX[$69AA], BANK[$3B]
Tileset0EE9AA::
  INCBIN "build/tilesets/Tileset0EE9AA.malias"
SECTION "Tileset Data Tileset0EEA17", ROMX[$6A17], BANK[$3B]
Tileset0EEA17::
  INCBIN "build/tilesets/Tileset0EEA17.malias"
SECTION "Tileset Data Tileset0EEA86", ROMX[$6A86], BANK[$3B]
Tileset0EEA86::
  INCBIN "build/tilesets/Tileset0EEA86.malias"
SECTION "Tileset Data Tileset0EEAF5", ROMX[$6AF5], BANK[$3B]
Tileset0EEAF5::
  INCBIN "build/tilesets/Tileset0EEAF5.malias"
SECTION "Tileset Data Tileset0EEB65", ROMX[$6B65], BANK[$3B]
Tileset0EEB65::
  INCBIN "build/tilesets/Tileset0EEB65.malias"
SECTION "Tileset Data Tileset0EEBD2", ROMX[$6BD2], BANK[$3B]
Tileset0EEBD2::
  INCBIN "build/tilesets/Tileset0EEBD2.malias"
SECTION "Tileset Data Tileset0EEC40", ROMX[$6C40], BANK[$3B]
Tileset0EEC40::
  INCBIN "build/tilesets/Tileset0EEC40.malias"
SECTION "Tileset Data Tileset0EED82", ROMX[$6D82], BANK[$3B]
Tileset0EED82::
  INCBIN "build/tilesets/Tileset0EED82.malias"
SECTION "Tileset Data Tileset0EEE9E", ROMX[$6E9E], BANK[$3B]
Tileset0EEE9E::
  INCBIN "build/tilesets/Tileset0EEE9E.malias"
SECTION "Tileset Data Tileset0EEFFF", ROMX[$6FFF], BANK[$3B]
Tileset0EEFFF::
  INCBIN "build/tilesets/Tileset0EEFFF.malias"
SECTION "Tileset Data Tileset0EF136", ROMX[$7136], BANK[$3B]
Tileset0EF136::
  INCBIN "build/tilesets/Tileset0EF136.malias"
SECTION "Tileset Data Tileset0EF28F", ROMX[$728F], BANK[$3B]
Tileset0EF28F::
  INCBIN "build/tilesets/Tileset0EF28F.malias"
SECTION "Tileset Data Tileset0EF3C0", ROMX[$73C0], BANK[$3B]
Tileset0EF3C0::
  INCBIN "build/tilesets/Tileset0EF3C0.malias"
SECTION "Tileset Data Tileset0FB9B2", ROMX[$79B2], BANK[$3E]
Tileset0FB9B2::
  INCBIN "build/tilesets/Tileset0FB9B2.malias"
SECTION "Tileset Data Tileset0F8CA1", ROMX[$4CA1], BANK[$3E]
Tileset0F8CA1::
  INCBIN "build/tilesets/Tileset0F8CA1.malias"
SECTION "Tileset Data Tileset0F9172", ROMX[$5172], BANK[$3E]
Tileset0F9172::
  INCBIN "build/tilesets/Tileset0F9172.malias"
SECTION "Tileset Data Tileset0F995D", ROMX[$595D], BANK[$3E]
Tileset0F995D::
  INCBIN "build/tilesets/Tileset0F995D.malias"
SECTION "Tileset Data Tileset0FA28F", ROMX[$628F], BANK[$3E]
Tileset0FA28F::
  INCBIN "build/tilesets/Tileset0FA28F.malias"
SECTION "Tileset Data Tileset0FAA7F", ROMX[$6A7F], BANK[$3E]
Tileset0FAA7F::
  INCBIN "build/tilesets/Tileset0FAA7F.malias"
SECTION "Tileset Data Tileset119E18", ROMX[$5E18], BANK[$46]
Tileset119E18::
  INCBIN "build/tilesets/Tileset119E18.malias"
SECTION "Tileset Data Tileset11A69C", ROMX[$669C], BANK[$46]
Tileset11A69C::
  INCBIN "build/tilesets/Tileset11A69C.malias"
SECTION "Tileset Data Tileset2958C1", ROMX[$58C1], BANK[$A5]
Tileset2958C1::
  INCBIN "build/tilesets/Tileset2958C1.malias"
SECTION "Tileset Data Tileset11AE5D", ROMX[$6E5D], BANK[$46]
Tileset11AE5D::
  INCBIN "build/tilesets/Tileset11AE5D.malias"
SECTION "Tileset Data Tileset11B47B", ROMX[$747B], BANK[$46]
Tileset11B47B::
  INCBIN "build/tilesets/Tileset11B47B.malias"
SECTION "Tileset Data Tileset0EF448", ROMX[$7448], BANK[$3B]
Tileset0EF448::
  INCBIN "build/tilesets/Tileset0EF448.malias"
SECTION "Tileset Data Tileset0F2A90", ROMX[$6A90], BANK[$3C]
Tileset0F2A90::
  INCBIN "build/tilesets/Tileset0F2A90.malias"
SECTION "Tileset Data Tileset0F2DCB", ROMX[$6DCB], BANK[$3C]
Tileset0F2DCB::
  INCBIN "build/tilesets/Tileset0F2DCB.malias"
SECTION "Tileset Data Tileset0F2E6A", ROMX[$6E6A], BANK[$3C]
Tileset0F2E6A::
  INCBIN "build/tilesets/Tileset0F2E6A.malias"
SECTION "Tileset Data Tileset0F306E", ROMX[$706E], BANK[$3C]
Tileset0F306E::
  INCBIN "build/tilesets/Tileset0F306E.malias"
SECTION "Tileset Data Tileset0F31AD", ROMX[$71AD], BANK[$3C]
Tileset0F31AD::
  INCBIN "build/tilesets/Tileset0F31AD.malias"
SECTION "Tileset Data Tileset0F3200", ROMX[$7200], BANK[$3C]
Tileset0F3200::
  INCBIN "build/tilesets/Tileset0F3200.malias"
SECTION "Tileset Data Tileset0F337F", ROMX[$737F], BANK[$3C]
Tileset0F337F::
  INCBIN "build/tilesets/Tileset0F337F.malias"
SECTION "Tileset Data Tileset0F3402", ROMX[$7402], BANK[$3C]
Tileset0F3402::
  INCBIN "build/tilesets/Tileset0F3402.malias"
SECTION "Tileset Data Tileset0F3486", ROMX[$7486], BANK[$3C]
Tileset0F3486::
  INCBIN "build/tilesets/Tileset0F3486.malias"
SECTION "Tileset Data Tileset0F34EE", ROMX[$74EE], BANK[$3C]
Tileset0F34EE::
  INCBIN "build/tilesets/Tileset0F34EE.malias"
SECTION "Tileset Data Tileset0F3526", ROMX[$7526], BANK[$3C]
Tileset0F3526::
  INCBIN "build/tilesets/Tileset0F3526.malias"
SECTION "Tileset Data Tileset0F3683", ROMX[$7683], BANK[$3C]
Tileset0F3683::
  INCBIN "build/tilesets/Tileset0F3683.malias"
SECTION "Tileset Data Tileset0F38BA", ROMX[$78BA], BANK[$3C]
Tileset0F38BA::
  INCBIN "build/tilesets/Tileset0F38BA.malias"
SECTION "Tileset Data Tileset294000", ROMX[$4000], BANK[$A5]
Tileset294000::
  INCBIN "build/tilesets/Tileset294000.malias"
SECTION "Tileset Data Tileset2943CB", ROMX[$43CB], BANK[$A5]
Tileset2943CB::
  INCBIN "build/tilesets/Tileset2943CB.malias"
SECTION "Tileset Data Tileset06C000", ROMX[$4000], BANK[$1B]
Tileset06C000::
  INCBIN "build/tilesets/Tileset06C000.malias"
SECTION "Tileset Data Tileset06C4B6", ROMX[$44B6], BANK[$1B]
Tileset06C4B6::
  INCBIN "build/tilesets/Tileset06C4B6.malias"
SECTION "Tileset Data Tileset06C86C", ROMX[$486C], BANK[$1B]
Tileset06C86C::
  INCBIN "build/tilesets/Tileset06C86C.malias"
SECTION "Tileset Data Tileset06CD11", ROMX[$4D11], BANK[$1B]
Tileset06CD11::
  INCBIN "build/tilesets/Tileset06CD11.malias"
SECTION "Tileset Data Tileset06D1BD", ROMX[$51BD], BANK[$1B]
Tileset06D1BD::
  INCBIN "build/tilesets/Tileset06D1BD.malias"
SECTION "Tileset Data Tileset06D61C", ROMX[$561C], BANK[$1B]
Tileset06D61C::
  INCBIN "build/tilesets/Tileset06D61C.malias"
SECTION "Tileset Data Tileset06DAAB", ROMX[$5AAB], BANK[$1B]
Tileset06DAAB::
  INCBIN "build/tilesets/Tileset06DAAB.malias"
SECTION "Tileset Data Tileset06DECA", ROMX[$5ECA], BANK[$1B]
Tileset06DECA::
  INCBIN "build/tilesets/Tileset06DECA.malias"
SECTION "Tileset Data Tileset06E19B", ROMX[$619B], BANK[$1B]
Tileset06E19B::
  INCBIN "build/tilesets/Tileset06E19B.malias"
SECTION "Tileset Data Tileset06E556", ROMX[$6556], BANK[$1B]
Tileset06E556::
  INCBIN "build/tilesets/Tileset06E556.malias"
SECTION "Tileset Data Tileset06E9B0", ROMX[$69B0], BANK[$1B]
Tileset06E9B0::
  INCBIN "build/tilesets/Tileset06E9B0.malias"
SECTION "Tileset Data Tileset06EDF5", ROMX[$6DF5], BANK[$1B]
Tileset06EDF5::
  INCBIN "build/tilesets/Tileset06EDF5.malias"
SECTION "Tileset Data Tileset07CA6A", ROMX[$4A6A], BANK[$1F]
Tileset07CA6A::
  INCBIN "build/tilesets/Tileset07CA6A.malias"
SECTION "Tileset Data Tileset07CD1B", ROMX[$4D1B], BANK[$1F]
Tileset07CD1B::
  INCBIN "build/tilesets/Tileset07CD1B.malias"
SECTION "Tileset Data Tileset07D049", ROMX[$5049], BANK[$1F]
Tileset07D049::
  INCBIN "build/tilesets/Tileset07D049.malias"
SECTION "Tileset Data Tileset07D405", ROMX[$5405], BANK[$1F]
Tileset07D405::
  INCBIN "build/tilesets/Tileset07D405.malias"
SECTION "Tileset Data Tileset07D7D9", ROMX[$57D9], BANK[$1F]
Tileset07D7D9::
  INCBIN "build/tilesets/Tileset07D7D9.malias"
SECTION "Tileset Data Tileset07DB67", ROMX[$5B67], BANK[$1F]
Tileset07DB67::
  INCBIN "build/tilesets/Tileset07DB67.malias"
SECTION "Tileset Data Tileset07DF3A", ROMX[$5F3A], BANK[$1F]
Tileset07DF3A::
  INCBIN "build/tilesets/Tileset07DF3A.malias"
SECTION "Tileset Data Tileset07E23F", ROMX[$623F], BANK[$1F]
Tileset07E23F::
  INCBIN "build/tilesets/Tileset07E23F.malias"
SECTION "Tileset Data Tileset07E497", ROMX[$6497], BANK[$1F]
Tileset07E497::
  INCBIN "build/tilesets/Tileset07E497.malias"
SECTION "Tileset Data Tileset07E7C6", ROMX[$67C6], BANK[$1F]
Tileset07E7C6::
  INCBIN "build/tilesets/Tileset07E7C6.malias"
SECTION "Tileset Data Tileset07EA6A", ROMX[$6A6A], BANK[$1F]
Tileset07EA6A::
  INCBIN "build/tilesets/Tileset07EA6A.malias"
SECTION "Tileset Data Tileset07EE25", ROMX[$6E25], BANK[$1F]
Tileset07EE25::
  INCBIN "build/tilesets/Tileset07EE25.malias"
SECTION "Tileset Data Tileset2944C1", ROMX[$44C1], BANK[$A5]
Tileset2944C1::
  INCBIN "build/tilesets/Tileset2944C1.malias"
SECTION "Tileset Data Tileset2946B9", ROMX[$46B9], BANK[$A5]
Tileset2946B9::
  INCBIN "build/tilesets/Tileset2946B9.malias"
SECTION "Tileset Data Tileset29472F", ROMX[$472F], BANK[$A5]
Tileset29472F::
  INCBIN "build/tilesets/Tileset29472F.malias"
SECTION "Tileset Data Tileset2948A6", ROMX[$48A6], BANK[$A5]
Tileset2948A6::
  INCBIN "build/tilesets/Tileset2948A6.malias"
SECTION "Tileset Data Tileset294997", ROMX[$4997], BANK[$A5]
Tileset294997::
  INCBIN "build/tilesets/Tileset294997.malias"
SECTION "Tileset Data Tileset294D6B", ROMX[$4D6B], BANK[$A5]
Tileset294D6B::
  INCBIN "build/tilesets/Tileset294D6B.malias"
SECTION "Tileset Data Tileset29505A", ROMX[$505A], BANK[$A5]
Tileset29505A::
  INCBIN "build/tilesets/Tileset29505A.malias"
SECTION "Tileset Data Tileset2950AF", ROMX[$50AF], BANK[$A5]
Tileset2950AF::
  INCBIN "build/tilesets/Tileset2950AF.malias"
SECTION "Tileset Data Tileset2951E0", ROMX[$51E0], BANK[$A5]
Tileset2951E0::
  INCBIN "build/tilesets/Tileset2951E0.malias"
SECTION "Tileset Data Tileset29580E", ROMX[$580E], BANK[$A5]
Tileset29580E::
  INCBIN "build/tilesets/Tileset29580E.malias"
SECTION "Tileset Data Tileset124848", ROMX[$4848], BANK[$49]
Tileset124848::
  INCBIN "build/tilesets/Tileset124848.malias"
SECTION "Tileset Data Tileset120000", ROMX[$4000], BANK[$48]
Tileset120000::
  INCBIN "build/tilesets/Tileset120000.malias"
SECTION "Tileset Data Tileset1201B8", ROMX[$41B8], BANK[$48]
Tileset1201B8::
  INCBIN "build/tilesets/Tileset1201B8.malias"
SECTION "Tileset Data Tileset120336", ROMX[$4336], BANK[$48]
Tileset120336::
  INCBIN "build/tilesets/Tileset120336.malias"
SECTION "Tileset Data Tileset120506", ROMX[$4506], BANK[$48]
Tileset120506::
  INCBIN "build/tilesets/Tileset120506.malias"
SECTION "Tileset Data Tileset1206E2", ROMX[$46E2], BANK[$48]
Tileset1206E2::
  INCBIN "build/tilesets/Tileset1206E2.malias"
SECTION "Tileset Data Tileset1208AE", ROMX[$48AE], BANK[$48]
Tileset1208AE::
  INCBIN "build/tilesets/Tileset1208AE.malias"
SECTION "Tileset Data Tileset120A9E", ROMX[$4A9E], BANK[$48]
Tileset120A9E::
  INCBIN "build/tilesets/Tileset120A9E.malias"
SECTION "Tileset Data Tileset120C13", ROMX[$4C13], BANK[$48]
Tileset120C13::
  INCBIN "build/tilesets/Tileset120C13.malias"
SECTION "Tileset Data Tileset120DD6", ROMX[$4DD6], BANK[$48]
Tileset120DD6::
  INCBIN "build/tilesets/Tileset120DD6.malias"
SECTION "Tileset Data Tileset120F87", ROMX[$4F87], BANK[$48]
Tileset120F87::
  INCBIN "build/tilesets/Tileset120F87.malias"
SECTION "Tileset Data Tileset12118A", ROMX[$518A], BANK[$48]
Tileset12118A::
  INCBIN "build/tilesets/Tileset12118A.malias"
SECTION "Tileset Data Tileset121360", ROMX[$5360], BANK[$48]
Tileset121360::
  INCBIN "build/tilesets/Tileset121360.malias"
SECTION "Tileset Data Tileset1214F0", ROMX[$54F0], BANK[$48]
Tileset1214F0::
  INCBIN "build/tilesets/Tileset1214F0.malias"
SECTION "Tileset Data Tileset12166E", ROMX[$566E], BANK[$48]
Tileset12166E::
  INCBIN "build/tilesets/Tileset12166E.malias"
SECTION "Tileset Data Tileset12182F", ROMX[$582F], BANK[$48]
Tileset12182F::
  INCBIN "build/tilesets/Tileset12182F.malias"
SECTION "Tileset Data Tileset1219FF", ROMX[$59FF], BANK[$48]
Tileset1219FF::
  INCBIN "build/tilesets/Tileset1219FF.malias"
SECTION "Tileset Data Tileset121BAE", ROMX[$5BAE], BANK[$48]
Tileset121BAE::
  INCBIN "build/tilesets/Tileset121BAE.malias"
SECTION "Tileset Data Tileset121D84", ROMX[$5D84], BANK[$48]
Tileset121D84::
  INCBIN "build/tilesets/Tileset121D84.malias"
SECTION "Tileset Data Tileset121F78", ROMX[$5F78], BANK[$48]
Tileset121F78::
  INCBIN "build/tilesets/Tileset121F78.malias"
SECTION "Tileset Data Tileset122100", ROMX[$6100], BANK[$48]
Tileset122100::
  INCBIN "build/tilesets/Tileset122100.malias"
SECTION "Tileset Data Tileset122321", ROMX[$6321], BANK[$48]
Tileset122321::
  INCBIN "build/tilesets/Tileset122321.malias"
SECTION "Tileset Data Tileset1224A1", ROMX[$64A1], BANK[$48]
Tileset1224A1::
  INCBIN "build/tilesets/Tileset1224A1.malias"
SECTION "Tileset Data Tileset122647", ROMX[$6647], BANK[$48]
Tileset122647::
  INCBIN "build/tilesets/Tileset122647.malias"
SECTION "Tileset Data Tileset1227CE", ROMX[$67CE], BANK[$48]
Tileset1227CE::
  INCBIN "build/tilesets/Tileset1227CE.malias"
SECTION "Tileset Data Tileset122953", ROMX[$6953], BANK[$48]
Tileset122953::
  INCBIN "build/tilesets/Tileset122953.malias"
SECTION "Tileset Data Tileset122B40", ROMX[$6B40], BANK[$48]
Tileset122B40::
  INCBIN "build/tilesets/Tileset122B40.malias"
SECTION "Tileset Data Tileset122D11", ROMX[$6D11], BANK[$48]
Tileset122D11::
  INCBIN "build/tilesets/Tileset122D11.malias"
SECTION "Tileset Data Tileset122EF2", ROMX[$6EF2], BANK[$48]
Tileset122EF2::
  INCBIN "build/tilesets/Tileset122EF2.malias"
SECTION "Tileset Data Tileset12307F", ROMX[$707F], BANK[$48]
Tileset12307F::
  INCBIN "build/tilesets/Tileset12307F.malias"
SECTION "Tileset Data Tileset124000", ROMX[$4000], BANK[$49]
Tileset124000::
  INCBIN "build/tilesets/Tileset124000.malias"
SECTION "Tileset Data Tileset1241B5", ROMX[$41B5], BANK[$49]
Tileset1241B5::
  INCBIN "build/tilesets/Tileset1241B5.malias"
SECTION "Tileset Data Tileset1243D5", ROMX[$43D5], BANK[$49]
Tileset1243D5::
  INCBIN "build/tilesets/Tileset1243D5.malias"
SECTION "Tileset Data Tileset12466B", ROMX[$466B], BANK[$49]
Tileset12466B::
  INCBIN "build/tilesets/Tileset12466B.malias"
SECTION "Tileset Data Tileset124999", ROMX[$4999], BANK[$49]
Tileset124999::
  INCBIN "build/tilesets/Tileset124999.malias"
SECTION "Tileset Data Tileset124B35", ROMX[$4B35], BANK[$49]
Tileset124B35::
  INCBIN "build/tilesets/Tileset124B35.malias"
SECTION "Tileset Data Tileset124C85", ROMX[$4C85], BANK[$49]
Tileset124C85::
  INCBIN "build/tilesets/Tileset124C85.malias"
SECTION "Tileset Data Tileset124E2C", ROMX[$4E2C], BANK[$49]
Tileset124E2C::
  INCBIN "build/tilesets/Tileset124E2C.malias"
SECTION "Tileset Data Tileset124FB8", ROMX[$4FB8], BANK[$49]
Tileset124FB8::
  INCBIN "build/tilesets/Tileset124FB8.malias"
SECTION "Tileset Data Tileset12514C", ROMX[$514C], BANK[$49]
Tileset12514C::
  INCBIN "build/tilesets/Tileset12514C.malias"
SECTION "Tileset Data Tileset12528D", ROMX[$528D], BANK[$49]
Tileset12528D::
  INCBIN "build/tilesets/Tileset12528D.malias"
SECTION "Tileset Data Tileset12540C", ROMX[$540C], BANK[$49]
Tileset12540C::
  INCBIN "build/tilesets/Tileset12540C.malias"
SECTION "Tileset Data Tileset125556", ROMX[$5556], BANK[$49]
Tileset125556::
  INCBIN "build/tilesets/Tileset125556.malias"
SECTION "Tileset Data Tileset125823", ROMX[$5823], BANK[$49]
Tileset125823::
  INCBIN "build/tilesets/Tileset125823.malias"
SECTION "Tileset Data Tileset125A05", ROMX[$5A05], BANK[$49]
Tileset125A05::
  INCBIN "build/tilesets/Tileset125A05.malias"
SECTION "Tileset Data Tileset125C40", ROMX[$5C40], BANK[$49]
Tileset125C40::
  INCBIN "build/tilesets/Tileset125C40.malias"
SECTION "Tileset Data Tileset125E55", ROMX[$5E55], BANK[$49]
Tileset125E55::
  INCBIN "build/tilesets/Tileset125E55.malias"
SECTION "Tileset Data Tileset12600D", ROMX[$600D], BANK[$49]
Tileset12600D::
  INCBIN "build/tilesets/Tileset12600D.malias"
SECTION "Tileset Data Tileset126156", ROMX[$6156], BANK[$49]
Tileset126156::
  INCBIN "build/tilesets/Tileset126156.malias"
SECTION "Tileset Data Tileset12639B", ROMX[$639B], BANK[$49]
Tileset12639B::
  INCBIN "build/tilesets/Tileset12639B.malias"
SECTION "Tileset Data Tileset126518", ROMX[$6518], BANK[$49]
Tileset126518::
  INCBIN "build/tilesets/Tileset126518.malias"
SECTION "Tileset Data Tileset126702", ROMX[$6702], BANK[$49]
Tileset126702::
  INCBIN "build/tilesets/Tileset126702.malias"
SECTION "Tileset Data Tileset126879", ROMX[$6879], BANK[$49]
Tileset126879::
  INCBIN "build/tilesets/Tileset126879.malias"
SECTION "Tileset Data Tileset126A17", ROMX[$6A17], BANK[$49]
Tileset126A17::
  INCBIN "build/tilesets/Tileset126A17.malias"
SECTION "Tileset Data Tileset126BA4", ROMX[$6BA4], BANK[$49]
Tileset126BA4::
  INCBIN "build/tilesets/Tileset126BA4.malias"
SECTION "Tileset Data Tileset126D1C", ROMX[$6D1C], BANK[$49]
Tileset126D1C::
  INCBIN "build/tilesets/Tileset126D1C.malias"
SECTION "Tileset Data Tileset126EC8", ROMX[$6EC8], BANK[$49]
Tileset126EC8::
  INCBIN "build/tilesets/Tileset126EC8.malias"
SECTION "Tileset Data Tileset12706A", ROMX[$706A], BANK[$49]
Tileset12706A::
  INCBIN "build/tilesets/Tileset12706A.malias"
SECTION "Tileset Data Tileset127226", ROMX[$7226], BANK[$49]
Tileset127226::
  INCBIN "build/tilesets/Tileset127226.malias"
SECTION "Tileset Data Tileset1273C4", ROMX[$73C4], BANK[$49]
Tileset1273C4::
  INCBIN "build/tilesets/Tileset1273C4.malias"
SECTION "Tileset Data Tileset127554", ROMX[$7554], BANK[$49]
Tileset127554::
  INCBIN "build/tilesets/Tileset127554.malias"
SECTION "Tileset Data Tileset127703", ROMX[$7703], BANK[$49]
Tileset127703::
  INCBIN "build/tilesets/Tileset127703.malias"
SECTION "Tileset Data Tileset19C000", ROMX[$4000], BANK[$67]
Tileset19C000::
  INCBIN "build/tilesets/Tileset19C000.malias"
SECTION "Tileset Data Tileset19C957", ROMX[$4957], BANK[$67]
Tileset19C957::
  INCBIN "build/tilesets/Tileset19C957.malias"
SECTION "Tileset Data Tileset19D428", ROMX[$5428], BANK[$67]
Tileset19D428::
  INCBIN "build/tilesets/Tileset19D428.malias"
SECTION "Tileset Data Tileset19DDBA", ROMX[$5DBA], BANK[$67]
Tileset19DDBA::
  INCBIN "build/tilesets/Tileset19DDBA.malias"
SECTION "Tileset Data Tileset19E936", ROMX[$6936], BANK[$67]
Tileset19E936::
  INCBIN "build/tilesets/Tileset19E936.malias"
SECTION "Tileset Data Tileset19F13A", ROMX[$713A], BANK[$67]
Tileset19F13A::
  INCBIN "build/tilesets/Tileset19F13A.malias"
SECTION "Tileset Data Tileset1A0000", ROMX[$4000], BANK[$68]
Tileset1A0000::
  INCBIN "build/tilesets/Tileset1A0000.malias"
SECTION "Tileset Data Tileset1A08B0", ROMX[$48B0], BANK[$68]
Tileset1A08B0::
  INCBIN "build/tilesets/Tileset1A08B0.malias"
SECTION "Tileset Data Tileset1A1182", ROMX[$5182], BANK[$68]
Tileset1A1182::
  INCBIN "build/tilesets/Tileset1A1182.malias"
SECTION "Tileset Data Tileset1A18E2", ROMX[$58E2], BANK[$68]
Tileset1A18E2::
  INCBIN "build/tilesets/Tileset1A18E2.malias"
SECTION "Tileset Data Tileset1A2295", ROMX[$6295], BANK[$68]
Tileset1A2295::
  INCBIN "build/tilesets/Tileset1A2295.malias"
SECTION "Tileset Data Tileset1A2C26", ROMX[$6C26], BANK[$68]
Tileset1A2C26::
  INCBIN "build/tilesets/Tileset1A2C26.malias"
SECTION "Tileset Data Tileset1A35D9", ROMX[$75D9], BANK[$68]
Tileset1A35D9::
  INCBIN "build/tilesets/Tileset1A35D9.malias"
SECTION "Tileset Data Tileset1A4000", ROMX[$4000], BANK[$69]
Tileset1A4000::
  INCBIN "build/tilesets/Tileset1A4000.malias"
SECTION "Tileset Data Tileset1A482C", ROMX[$482C], BANK[$69]
Tileset1A482C::
  INCBIN "build/tilesets/Tileset1A482C.malias"
SECTION "Tileset Data Tileset1A52E4", ROMX[$52E4], BANK[$69]
Tileset1A52E4::
  INCBIN "build/tilesets/Tileset1A52E4.malias"
SECTION "Tileset Data Tileset1A5BF9", ROMX[$5BF9], BANK[$69]
Tileset1A5BF9::
  INCBIN "build/tilesets/Tileset1A5BF9.malias"
SECTION "Tileset Data Tileset1A65B8", ROMX[$65B8], BANK[$69]
Tileset1A65B8::
  INCBIN "build/tilesets/Tileset1A65B8.malias"
SECTION "Tileset Data Tileset1A6FB5", ROMX[$6FB5], BANK[$69]
Tileset1A6FB5::
  INCBIN "build/tilesets/Tileset1A6FB5.malias"
SECTION "Tileset Data Tileset1A8000", ROMX[$4000], BANK[$6A]
Tileset1A8000::
  INCBIN "build/tilesets/Tileset1A8000.malias"
SECTION "Tileset Data Tileset1A8968", ROMX[$4968], BANK[$6A]
Tileset1A8968::
  INCBIN "build/tilesets/Tileset1A8968.malias"
SECTION "Tileset Data Tileset1A92D9", ROMX[$52D9], BANK[$6A]
Tileset1A92D9::
  INCBIN "build/tilesets/Tileset1A92D9.malias"
SECTION "Tileset Data Tileset1A9C5B", ROMX[$5C5B], BANK[$6A]
Tileset1A9C5B::
  INCBIN "build/tilesets/Tileset1A9C5B.malias"
SECTION "Tileset Data Tileset1AA176", ROMX[$6176], BANK[$6A]
Tileset1AA176::
  INCBIN "build/tilesets/Tileset1AA176.malias"
SECTION "Tileset Data Tileset1AAA22", ROMX[$6A22], BANK[$6A]
Tileset1AAA22::
  INCBIN "build/tilesets/Tileset1AAA22.malias"
SECTION "Tileset Data Tileset1AB1E1", ROMX[$71E1], BANK[$6A]
Tileset1AB1E1::
  INCBIN "build/tilesets/Tileset1AB1E1.malias"
SECTION "Tileset Data Tileset1AC000", ROMX[$4000], BANK[$6B]
Tileset1AC000::
  INCBIN "build/tilesets/Tileset1AC000.malias"
SECTION "Tileset Data Tileset1AC97D", ROMX[$497D], BANK[$6B]
Tileset1AC97D::
  INCBIN "build/tilesets/Tileset1AC97D.malias"
SECTION "Tileset Data Tileset1AD153", ROMX[$5153], BANK[$6B]
Tileset1AD153::
  INCBIN "build/tilesets/Tileset1AD153.malias"
SECTION "Tileset Data Tileset1AD8E7", ROMX[$58E7], BANK[$6B]
Tileset1AD8E7::
  INCBIN "build/tilesets/Tileset1AD8E7.malias"
SECTION "Tileset Data Tileset1AE06E", ROMX[$606E], BANK[$6B]
Tileset1AE06E::
  INCBIN "build/tilesets/Tileset1AE06E.malias"
SECTION "Tileset Data Tileset1AE8EF", ROMX[$68EF], BANK[$6B]
Tileset1AE8EF::
  INCBIN "build/tilesets/Tileset1AE8EF.malias"
SECTION "Tileset Data Tileset1AF25E", ROMX[$725E], BANK[$6B]
Tileset1AF25E::
  INCBIN "build/tilesets/Tileset1AF25E.malias"
SECTION "Tileset Data Tileset1B0000", ROMX[$4000], BANK[$6C]
Tileset1B0000::
  INCBIN "build/tilesets/Tileset1B0000.malias"
SECTION "Tileset Data Tileset188000", ROMX[$4000], BANK[$62]
Tileset188000::
  INCBIN "build/tilesets/Tileset188000.malias"
SECTION "Tileset Data Tileset18834F", ROMX[$434F], BANK[$62]
Tileset18834F::
  INCBIN "build/tilesets/Tileset18834F.malias"
SECTION "Tileset Data Tileset18842D", ROMX[$442D], BANK[$62]
Tileset18842D::
  INCBIN "build/tilesets/Tileset18842D.malias"
SECTION "Tileset Data Tileset188612", ROMX[$4612], BANK[$62]
Tileset188612::
  INCBIN "build/tilesets/Tileset188612.malias"
SECTION "Tileset Data Tileset18873E", ROMX[$473E], BANK[$62]
Tileset18873E::
  INCBIN "build/tilesets/Tileset18873E.malias"
SECTION "Tileset Data Tileset18887C", ROMX[$487C], BANK[$62]
Tileset18887C::
  INCBIN "build/tilesets/Tileset18887C.malias"
SECTION "Tileset Data Tileset188A1E", ROMX[$4A1E], BANK[$62]
Tileset188A1E::
  INCBIN "build/tilesets/Tileset188A1E.malias"
SECTION "Tileset Data Tileset188C29", ROMX[$4C29], BANK[$62]
Tileset188C29::
  INCBIN "build/tilesets/Tileset188C29.malias"
SECTION "Tileset Data Tileset188DFC", ROMX[$4DFC], BANK[$62]
Tileset188DFC::
  INCBIN "build/tilesets/Tileset188DFC.malias"
SECTION "Tileset Data Tileset188FDF", ROMX[$4FDF], BANK[$62]
Tileset188FDF::
  INCBIN "build/tilesets/Tileset188FDF.malias"
SECTION "Tileset Data Tileset18912E", ROMX[$512E], BANK[$62]
Tileset18912E::
  INCBIN "build/tilesets/Tileset18912E.malias"
SECTION "Tileset Data Tileset189265", ROMX[$5265], BANK[$62]
Tileset189265::
  INCBIN "build/tilesets/Tileset189265.malias"
SECTION "Tileset Data Tileset1893C8", ROMX[$53C8], BANK[$62]
Tileset1893C8::
  INCBIN "build/tilesets/Tileset1893C8.malias"
SECTION "Tileset Data Tileset1894E8", ROMX[$54E8], BANK[$62]
Tileset1894E8::
  INCBIN "build/tilesets/Tileset1894E8.malias"
SECTION "Tileset Data Tileset18974F", ROMX[$574F], BANK[$62]
Tileset18974F::
  INCBIN "build/tilesets/Tileset18974F.malias"
SECTION "Tileset Data Tileset1898B8", ROMX[$58B8], BANK[$62]
Tileset1898B8::
  INCBIN "build/tilesets/Tileset1898B8.malias"
SECTION "Tileset Data Tileset1899DD", ROMX[$59DD], BANK[$62]
Tileset1899DD::
  INCBIN "build/tilesets/Tileset1899DD.malias"
SECTION "Tileset Data Tileset189B6A", ROMX[$5B6A], BANK[$62]
Tileset189B6A::
  INCBIN "build/tilesets/Tileset189B6A.malias"
SECTION "Tileset Data Tileset189C6E", ROMX[$5C6E], BANK[$62]
Tileset189C6E::
  INCBIN "build/tilesets/Tileset189C6E.malias"
SECTION "Tileset Data Tileset189D12", ROMX[$5D12], BANK[$62]
Tileset189D12::
  INCBIN "build/tilesets/Tileset189D12.malias"
SECTION "Tileset Data Tileset189EBA", ROMX[$5EBA], BANK[$62]
Tileset189EBA::
  INCBIN "build/tilesets/Tileset189EBA.malias"
SECTION "Tileset Data Tileset18A0BF", ROMX[$60BF], BANK[$62]
Tileset18A0BF::
  INCBIN "build/tilesets/Tileset18A0BF.malias"
SECTION "Tileset Data Tileset18A43B", ROMX[$643B], BANK[$62]
Tileset18A43B::
  INCBIN "build/tilesets/Tileset18A43B.malias"
SECTION "Tileset Data Tileset18A56C", ROMX[$656C], BANK[$62]
Tileset18A56C::
  INCBIN "build/tilesets/Tileset18A56C.malias"
SECTION "Tileset Data Tileset18A6F4", ROMX[$66F4], BANK[$62]
Tileset18A6F4::
  INCBIN "build/tilesets/Tileset18A6F4.malias"
SECTION "Tileset Data Tileset18A844", ROMX[$6844], BANK[$62]
Tileset18A844::
  INCBIN "build/tilesets/Tileset18A844.malias"
SECTION "Tileset Data Tileset18A9D9", ROMX[$69D9], BANK[$62]
Tileset18A9D9::
  INCBIN "build/tilesets/Tileset18A9D9.malias"
SECTION "Tileset Data Tileset18AB96", ROMX[$6B96], BANK[$62]
Tileset18AB96::
  INCBIN "build/tilesets/Tileset18AB96.malias"
SECTION "Tileset Data Tileset1C8000", ROMX[$4000], BANK[$72]
Tileset1C8000::
  INCBIN "build/tilesets/Tileset1C8000.malias"
SECTION "Tileset Data Tileset1C8808", ROMX[$4808], BANK[$72]
Tileset1C8808::
  INCBIN "build/tilesets/Tileset1C8808.malias"
SECTION "Tileset Data Tileset1C8C87", ROMX[$4C87], BANK[$72]
Tileset1C8C87::
  INCBIN "build/tilesets/Tileset1C8C87.malias"
SECTION "Tileset Data Tileset1C9296", ROMX[$5296], BANK[$72]
Tileset1C9296::
  INCBIN "build/tilesets/Tileset1C9296.malias"
SECTION "Tileset Data Tileset1C9CBD", ROMX[$5CBD], BANK[$72]
Tileset1C9CBD::
  INCBIN "build/tilesets/Tileset1C9CBD.malias"
SECTION "Tileset Data Tileset1CA128", ROMX[$6128], BANK[$72]
Tileset1CA128::
  INCBIN "build/tilesets/Tileset1CA128.malias"
SECTION "Tileset Data Tileset1CC000", ROMX[$4000], BANK[$73]
Tileset1CC000::
  INCBIN "build/tilesets/Tileset1CC000.malias"
SECTION "Tileset Data Tileset1CC4E4", ROMX[$44E4], BANK[$73]
Tileset1CC4E4::
  INCBIN "build/tilesets/Tileset1CC4E4.malias"
SECTION "Tileset Data Tileset1CC947", ROMX[$4947], BANK[$73]
Tileset1CC947::
  INCBIN "build/tilesets/Tileset1CC947.malias"
SECTION "Tileset Data Tileset1CCEDE", ROMX[$4EDE], BANK[$73]
Tileset1CCEDE::
  INCBIN "build/tilesets/Tileset1CCEDE.malias"
SECTION "Tileset Data Tileset1CD064", ROMX[$5064], BANK[$73]
Tileset1CD064::
  INCBIN "build/tilesets/Tileset1CD064.malias"
SECTION "Tileset Data Tileset1CD5D8", ROMX[$55D8], BANK[$73]
Tileset1CD5D8::
  INCBIN "build/tilesets/Tileset1CD5D8.malias"
SECTION "Tileset Data Tileset1C9841", ROMX[$5841], BANK[$72]
Tileset1C9841::
  INCBIN "build/tilesets/Tileset1C9841.malias"
SECTION "Tileset Data Tileset1CA584", ROMX[$6584], BANK[$72]
Tileset1CA584::
  INCBIN "build/tilesets/Tileset1CA584.malias"
SECTION "Tileset Data Tileset1CAA6F", ROMX[$6A6F], BANK[$72]
Tileset1CAA6F::
  INCBIN "build/tilesets/Tileset1CAA6F.malias"
SECTION "Tileset Data Tileset1CB0B0", ROMX[$70B0], BANK[$72]
Tileset1CB0B0::
  INCBIN "build/tilesets/Tileset1CB0B0.malias"
SECTION "Tileset Data Tileset1D1D33", ROMX[$5D33], BANK[$74]
Tileset1D1D33::
  INCBIN "build/tilesets/Tileset1D1D33.malias"
SECTION "Tileset Data Tileset1D217E", ROMX[$617E], BANK[$74]
Tileset1D217E::
  INCBIN "build/tilesets/Tileset1D217E.malias"
SECTION "Tileset Data Tileset1D26A2", ROMX[$66A2], BANK[$74]
Tileset1D26A2::
  INCBIN "build/tilesets/Tileset1D26A2.malias"
SECTION "Tileset Data Tileset1D0000", ROMX[$4000], BANK[$74]
Tileset1D0000::
  INCBIN "build/tilesets/Tileset1D0000.malias"
SECTION "Tileset Data Tileset1D055D", ROMX[$455D], BANK[$74]
Tileset1D055D::
  INCBIN "build/tilesets/Tileset1D055D.malias"
SECTION "Tileset Data Tileset1D0989", ROMX[$4989], BANK[$74]
Tileset1D0989::
  INCBIN "build/tilesets/Tileset1D0989.malias"
SECTION "Tileset Data Tileset1D0F8C", ROMX[$4F8C], BANK[$74]
Tileset1D0F8C::
  INCBIN "build/tilesets/Tileset1D0F8C.malias"
SECTION "Tileset Data Tileset1D2BBF", ROMX[$6BBF], BANK[$74]
Tileset1D2BBF::
  INCBIN "build/tilesets/Tileset1D2BBF.malias"
SECTION "Tileset Data Tileset1D13F1", ROMX[$53F1], BANK[$74]
Tileset1D13F1::
  INCBIN "build/tilesets/Tileset1D13F1.malias"
SECTION "Tileset Data Tileset1D1929", ROMX[$5929], BANK[$74]
Tileset1D1929::
  INCBIN "build/tilesets/Tileset1D1929.malias"
SECTION "Tileset Data Tileset1D2BCD", ROMX[$6BCD], BANK[$74]
Tileset1D2BCD::
  INCBIN "build/tilesets/Tileset1D2BCD.malias"
SECTION "Tileset Data Tileset1D30A1", ROMX[$70A1], BANK[$74]
Tileset1D30A1::
  INCBIN "build/tilesets/Tileset1D30A1.malias"
SECTION "Tileset Data Tileset1D3307", ROMX[$7307], BANK[$74]
Tileset1D3307::
  INCBIN "build/tilesets/Tileset1D3307.malias"
SECTION "Tileset Data Tileset1D3600", ROMX[$7600], BANK[$74]
Tileset1D3600::
  INCBIN "build/tilesets/Tileset1D3600.malias"
SECTION "Tileset Data Tileset1D368F", ROMX[$768F], BANK[$74]
Tileset1D368F::
  INCBIN "build/tilesets/Tileset1D368F.malias"
SECTION "Tileset Data Tileset29C000", ROMX[$4000], BANK[$A7]
Tileset29C000::
  INCBIN "build/tilesets/Tileset29C000.malias"
SECTION "Tileset Data Tileset29C4F8", ROMX[$44F8], BANK[$A7]
Tileset29C4F8::
  INCBIN "build/tilesets/Tileset29C4F8.malias"
SECTION "Tileset Data Tileset29CA1F", ROMX[$4A1F], BANK[$A7]
Tileset29CA1F::
  INCBIN "build/tilesets/Tileset29CA1F.malias"
SECTION "Tileset Data Tileset29CFB1", ROMX[$4FB1], BANK[$A7]
Tileset29CFB1::
  INCBIN "build/tilesets/Tileset29CFB1.malias"
SECTION "Tileset Data Tileset29D5AA", ROMX[$55AA], BANK[$A7]
Tileset29D5AA::
  INCBIN "build/tilesets/Tileset29D5AA.malias"
SECTION "Tileset Data Tileset29D8CE", ROMX[$58CE], BANK[$A7]
Tileset29D8CE::
  INCBIN "build/tilesets/Tileset29D8CE.malias"
SECTION "Tileset Data Tileset29DE85", ROMX[$5E85], BANK[$A7]
Tileset29DE85::
  INCBIN "build/tilesets/Tileset29DE85.malias"
SECTION "Tileset Data Tileset2A0000", ROMX[$4000], BANK[$A8]
Tileset2A0000::
  INCBIN "build/tilesets/Tileset2A0000.malias"
SECTION "Tileset Data Tileset2A04BB", ROMX[$44BB], BANK[$A8]
Tileset2A04BB::
  INCBIN "build/tilesets/Tileset2A04BB.malias"
SECTION "Tileset Data Tileset2A09CE", ROMX[$49CE], BANK[$A8]
Tileset2A09CE::
  INCBIN "build/tilesets/Tileset2A09CE.malias"
SECTION "Tileset Data Tileset2A0F04", ROMX[$4F04], BANK[$A8]
Tileset2A0F04::
  INCBIN "build/tilesets/Tileset2A0F04.malias"
SECTION "Tileset Data Tileset2A14FA", ROMX[$54FA], BANK[$A8]
Tileset2A14FA::
  INCBIN "build/tilesets/Tileset2A14FA.malias"
SECTION "Tileset Data Tileset2A1831", ROMX[$5831], BANK[$A8]
Tileset2A1831::
  INCBIN "build/tilesets/Tileset2A1831.malias"
SECTION "Tileset Data Tileset2A1DEB", ROMX[$5DEB], BANK[$A8]
Tileset2A1DEB::
  INCBIN "build/tilesets/Tileset2A1DEB.malias"
SECTION "Tileset Data Tileset2A4000", ROMX[$4000], BANK[$A9]
Tileset2A4000::
  INCBIN "build/tilesets/Tileset2A4000.malias"
SECTION "Tileset Data Tileset2A44D8", ROMX[$44D8], BANK[$A9]
Tileset2A44D8::
  INCBIN "build/tilesets/Tileset2A44D8.malias"
SECTION "Tileset Data Tileset2A4A00", ROMX[$4A00], BANK[$A9]
Tileset2A4A00::
  INCBIN "build/tilesets/Tileset2A4A00.malias"
SECTION "Tileset Data Tileset2A501D", ROMX[$501D], BANK[$A9]
Tileset2A501D::
  INCBIN "build/tilesets/Tileset2A501D.malias"
SECTION "Tileset Data Tileset2A50AD", ROMX[$50AD], BANK[$A9]
Tileset2A50AD::
  INCBIN "build/tilesets/Tileset2A50AD.malias"
SECTION "Tileset Data Tileset2A56D6", ROMX[$56D6], BANK[$A9]
Tileset2A56D6::
  INCBIN "build/tilesets/Tileset2A56D6.malias"
SECTION "Tileset Data Tileset2A5A4E", ROMX[$5A4E], BANK[$A9]
Tileset2A5A4E::
  INCBIN "build/tilesets/Tileset2A5A4E.malias"
SECTION "Tileset Data Tileset2A5F58", ROMX[$5F58], BANK[$A9]
Tileset2A5F58::
  INCBIN "build/tilesets/Tileset2A5F58.malias"
SECTION "Tileset Data Tileset2A8000", ROMX[$4000], BANK[$AA]
Tileset2A8000::
  INCBIN "build/tilesets/Tileset2A8000.malias"
SECTION "Tileset Data Tileset2A84B1", ROMX[$44B1], BANK[$AA]
Tileset2A84B1::
  INCBIN "build/tilesets/Tileset2A84B1.malias"
SECTION "Tileset Data Tileset2A898C", ROMX[$498C], BANK[$AA]
Tileset2A898C::
  INCBIN "build/tilesets/Tileset2A898C.malias"
SECTION "Tileset Data Tileset2A8F97", ROMX[$4F97], BANK[$AA]
Tileset2A8F97::
  INCBIN "build/tilesets/Tileset2A8F97.malias"
SECTION "Tileset Data Tileset2A906D", ROMX[$506D], BANK[$AA]
Tileset2A906D::
  INCBIN "build/tilesets/Tileset2A906D.malias"
SECTION "Tileset Data Tileset2A969D", ROMX[$569D], BANK[$AA]
Tileset2A969D::
  INCBIN "build/tilesets/Tileset2A969D.malias"
SECTION "Tileset Data Tileset2A99BC", ROMX[$59BC], BANK[$AA]
Tileset2A99BC::
  INCBIN "build/tilesets/Tileset2A99BC.malias"
SECTION "Tileset Data Tileset2A9ECA", ROMX[$5ECA], BANK[$AA]
Tileset2A9ECA::
  INCBIN "build/tilesets/Tileset2A9ECA.malias"
TilesetDataEnd::
