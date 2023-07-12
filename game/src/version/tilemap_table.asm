INCLUDE "game/src/common/macros.asm"

SECTION "Tilemap Table 00", ROMX[$4000], BANK[$33]
TilemapTable00::
  dw Tilemap00_00 ; 00
  dw Tilemap00_01 ; 01
  dw Tilemap00_02 ; 02
  dw Tilemap00_03 ; 03
  dw Tilemap00_04 ; 04
  dw Tilemap00_05 ; 05
  dw Tilemap00_06 ; 06
  dw Tilemap00_07 ; 07
  dw Tilemap00_08 ; 08
  dw Tilemap00_09 ; 09
  dw Tilemap00_0A ; 0A
  dw Tilemap00_0B ; 0B
  dw Tilemap00_0C ; 0C
  dw Tilemap00_0C ; 0D (00_0D)
  dw Tilemap00_0C ; 0E (00_0E)
  dw Tilemap00_0C ; 0F (00_0F)
  dw Tilemap00_0C ; 10 (00_10)
  dw Tilemap00_11 ; 11
  dw Tilemap00_12 ; 12
  dw Tilemap00_13 ; 13
  dw Tilemap00_14 ; 14
  dw Tilemap00_15 ; 15
  dw Tilemap00_16 ; 16
  dw Tilemap00_17 ; 17
  dw Tilemap00_18 ; 18
  dw Tilemap00_19 ; 19
  dw Tilemap00_1A ; 1A
  dw Tilemap00_1B ; 1B
  dw Tilemap00_1C ; 1C
  dw Tilemap00_1D ; 1D
  dw Tilemap00_1E ; 1E
  dw Tilemap00_1F ; 1F
  dw Tilemap00_20 ; 20
  dw Tilemap00_21 ; 21
  dw Tilemap00_22 ; 22
  dw Tilemap00_23 ; 23
  dw Tilemap00_24 ; 24
  dw Tilemap00_25 ; 25
  dw Tilemap00_26 ; 26
  dw Tilemap00_27 ; 27
  dw Tilemap00_28 ; 28
  dw Tilemap00_29 ; 29
  dw Tilemap00_2A ; 2A
  dw Tilemap00_2B ; 2B
  dw Tilemap00_2C ; 2C
  dw Tilemap00_2D ; 2D
  dw Tilemap00_2D ; 2E (00_2E)
  dw Tilemap00_2F ; 2F
  dw Tilemap00_30 ; 30
  dw Tilemap00_31 ; 31
  dw Tilemap00_32 ; 32
  dw Tilemap00_33 ; 33
  dw Tilemap00_34 ; 34
  dw Tilemap00_35 ; 35
  dw Tilemap00_36 ; 36
  dw Tilemap00_36 ; 37 (00_37)
  dw Tilemap00_38 ; 38
  dw Tilemap00_39 ; 39
  dw Tilemap00_3A ; 3A
  dw Tilemap00_3A ; 3B (00_3B)
  dw Tilemap00_3C ; 3C
  dw Tilemap00_3D ; 3D
  dw Tilemap00_3E ; 3E
  dw Tilemap00_3F ; 3F
  dw Tilemap00_40 ; 40
  dw Tilemap00_41 ; 41
  dw Tilemap00_42 ; 42
  dw Tilemap00_43 ; 43
  dw Tilemap00_44 ; 44
  dw Tilemap00_45 ; 45
  dw Tilemap00_46 ; 46
  dw Tilemap00_47 ; 47
  dw Tilemap00_48 ; 48
  dw Tilemap00_49 ; 49
  dw Tilemap00_4A ; 4A
  dw Tilemap00_4B ; 4B
  dw Tilemap00_4C ; 4C
  dw Tilemap00_4D ; 4D
  dw Tilemap00_4E ; 4E
  dw Tilemap00_4F ; 4F
  dw Tilemap00_50 ; 50
  dw Tilemap00_51 ; 51
  dw Tilemap00_52 ; 52
  dw Tilemap00_53 ; 53
  dw Tilemap00_54 ; 54
  dw Tilemap00_55 ; 55
  dw Tilemap00_56 ; 56
  dw Tilemap00_57 ; 57
  dw Tilemap00_58 ; 58
  dw Tilemap00_59 ; 59
  dw Tilemap00_5A ; 5A
  dw Tilemap00_5B ; 5B
  dw Tilemap00_5C ; 5C
  dw Tilemap00_5D ; 5D
  dw Tilemap00_5E ; 5E
  dw Tilemap00_5F ; 5F
  dw Tilemap00_60 ; 60
  dw Tilemap00_61 ; 61
  dw Tilemap00_62 ; 62
  dw Tilemap00_63 ; 63
  dw Tilemap00_64 ; 64
  dw Tilemap00_65 ; 65
  dw Tilemap00_66 ; 66
  dw Tilemap00_67 ; 67
  dw Tilemap00_68 ; 68
  dw Tilemap00_69 ; 69
  dw Tilemap00_6A ; 6A
  dw Tilemap00_6B ; 6B
  dw Tilemap00_6C ; 6C
  dw Tilemap00_6D ; 6D
  dw Tilemap00_6E ; 6E
  dw Tilemap00_6F ; 6F
  dw Tilemap00_70 ; 70
  dw Tilemap00_71 ; 71
  dw Tilemap00_72 ; 72
  dw Tilemap00_73 ; 73
  dw Tilemap00_73 ; 74 (00_74)
  dw Tilemap00_75 ; 75
  dw Tilemap00_76 ; 76
  dw Tilemap00_77 ; 77
  dw Tilemap00_78 ; 78
  dw Tilemap00_79 ; 79
  dw Tilemap00_7A ; 7A
  dw Tilemap00_7B ; 7B
  dw Tilemap00_7C ; 7C
  dw Tilemap00_7D ; 7D
  dw Tilemap00_7E ; 7E
  dw Tilemap00_7F ; 7F
  dw Tilemap00_80 ; 80
  dw Tilemap00_81 ; 81
  dw Tilemap00_82 ; 82
  dw Tilemap00_83 ; 83
  dw Tilemap00_83 ; 84 (00_84)
  dw Tilemap00_83 ; 85 (00_85)
  dw Tilemap00_83 ; 86 (00_86)
  dw Tilemap00_83 ; 87 (00_87)
  dw Tilemap00_83 ; 88 (00_88)
  dw Tilemap00_83 ; 89 (00_89)
  dw Tilemap00_83 ; 8A (00_8A)
  dw Tilemap00_83 ; 8B (00_8B)
  dw Tilemap00_83 ; 8C (00_8C)
  dw Tilemap00_83 ; 8D (00_8D)
  dw Tilemap00_83 ; 8E (00_8E)
  dw Tilemap00_83 ; 8F (00_8F)
  dw Tilemap00_83 ; 90 (00_90)
  dw Tilemap00_91 ; 91
  dw Tilemap00_92 ; 92
  dw Tilemap00_93 ; 93
  dw Tilemap00_94 ; 94
  dw Tilemap00_95 ; 95
  dw Tilemap00_96 ; 96
  dw Tilemap00_97 ; 97
  dw Tilemap00_98 ; 98
  dw Tilemap00_99 ; 99
  dw Tilemap00_9A ; 9A
  dw Tilemap00_9B ; 9B
  dw Tilemap00_9C ; 9C
  dw Tilemap00_9D ; 9D
  dw Tilemap00_9D ; 9E (00_9E)
  dw Tilemap00_9D ; 9F (00_9F)
  dw Tilemap00_9D ; A0 (00_A0)
  dw Tilemap00_A1 ; A1
  dw Tilemap00_A2 ; A2
  dw Tilemap00_A3 ; A3
  dw Tilemap00_A4 ; A4
  dw Tilemap00_A5 ; A5
  dw Tilemap00_A6 ; A6
  dw Tilemap00_A7 ; A7
  dw Tilemap00_A8 ; A8
  dw Tilemap00_A9 ; A9
  dw Tilemap00_AA ; AA
  dw Tilemap00_AB ; AB
  dw Tilemap00_AC ; AC
  dw Tilemap00_AC ; AD (00_AD)
  dw Tilemap00_AC ; AE (00_AE)
  dw Tilemap00_AC ; AF (00_AF)
  dw Tilemap00_AC ; B0 (00_B0)
  dw Tilemap00_B1 ; B1
  dw Tilemap00_B2 ; B2
  dw Tilemap00_B3 ; B3
  dw Tilemap00_B4 ; B4
  dw Tilemap00_B5 ; B5
  dw Tilemap00_B5 ; B6 (00_B6)
  dw Tilemap00_B5 ; B7 (00_B7)
  dw Tilemap00_B5 ; B8 (00_B8)
  dw Tilemap00_B5 ; B9 (00_B9)
  dw Tilemap00_B5 ; BA (00_BA)
  dw Tilemap00_B5 ; BB (00_BB)
  dw Tilemap00_B5 ; BC (00_BC)
  dw Tilemap00_B5 ; BD (00_BD)
  dw Tilemap00_B5 ; BE (00_BE)
  dw Tilemap00_B5 ; BF (00_BF)
  dw Tilemap00_B5 ; C0 (00_C0)
  dw Tilemap00_C1 ; C1
  dw Tilemap00_C2 ; C2
  dw Tilemap00_C3 ; C3
  dw Tilemap00_C4 ; C4
  dw Tilemap00_C5 ; C5
  dw Tilemap00_C6 ; C6
  dw Tilemap00_C7 ; C7
  dw Tilemap00_C8 ; C8
  dw Tilemap00_C9 ; C9
  dw Tilemap00_CA ; CA
  dw Tilemap00_CA ; CB (00_CB)
  dw Tilemap00_CA ; CC (00_CC)
  dw Tilemap00_CA ; CD (00_CD)
  dw Tilemap00_CA ; CE (00_CE)
  dw Tilemap00_CA ; CF (00_CF)
  dw Tilemap00_CA ; D0 (00_D0)
  dw Tilemap00_CA ; D1 (00_D1)
  dw Tilemap00_CA ; D2 (00_D2)
  dw Tilemap00_CA ; D3 (00_D3)
  dw Tilemap00_CA ; D4 (00_D4)
  dw Tilemap00_CA ; D5 (00_D5)
  dw Tilemap00_CA ; D6 (00_D6)
  dw Tilemap00_CA ; D7 (00_D7)
  dw Tilemap00_CA ; D8 (00_D8)
  dw Tilemap00_CA ; D9 (00_D9)
  dw Tilemap00_CA ; DA (00_DA)
  dw Tilemap00_CA ; DB (00_DB)
  dw Tilemap00_CA ; DC (00_DC)
  dw Tilemap00_CA ; DD (00_DD)
  dw Tilemap00_CA ; DE (00_DE)
  dw Tilemap00_CA ; DF (00_DF)
  dw Tilemap00_CA ; E0 (00_E0)
  dw Tilemap00_CA ; E1 (00_E1)
  dw Tilemap00_CA ; E2 (00_E2)
  dw Tilemap00_CA ; E3 (00_E3)
  dw Tilemap00_CA ; E4 (00_E4)
  dw Tilemap00_CA ; E5 (00_E5)
  dw Tilemap00_CA ; E6 (00_E6)
  dw Tilemap00_CA ; E7 (00_E7)
  dw Tilemap00_CA ; E8 (00_E8)
  dw Tilemap00_CA ; E9 (00_E9)
  dw Tilemap00_CA ; EA (00_EA)
  dw Tilemap00_CA ; EB (00_EB)
  dw Tilemap00_CA ; EC (00_EC)
  dw Tilemap00_CA ; ED (00_ED)
  dw Tilemap00_CA ; EE (00_EE)
  dw Tilemap00_CA ; EF (00_EF)
  dw Tilemap00_CA ; F0 (00_F0)
  dw Tilemap00_F1 ; F1
  dw Tilemap00_F2 ; F2
  dw Tilemap00_F3 ; F3
  dw Tilemap00_F4 ; F4
  dw Tilemap00_F5 ; F5
  dw Tilemap00_F6 ; F6
  dw Tilemap00_F7 ; F7
  dw Tilemap00_F8 ; F8
  dw Tilemap00_F9 ; F9
  dw Tilemap00_FA ; FA
  dw Tilemap00_FB ; FB
  dw Tilemap00_FC ; FC
  dw Tilemap00_FD ; FD
  dw Tilemap00_FE ; FE
  dw TilemapTable00Terminator ; FF
Tilemap00_00::
  INCBIN "./build/tilemaps/0000.map"
Tilemap00_01::
  INCBIN "./build/tilemaps/MessageBox.map"
Tilemap00_02::
  INCBIN "./build/tilemaps/0002.map"
Tilemap00_03::
  INCBIN "./build/tilemaps/0003.map"
Tilemap00_04::
  INCBIN "./build/tilemaps/0004.map"
Tilemap00_05::
  INCBIN "./build/tilemaps/0005.map"
Tilemap00_06::
  INCBIN "./build/tilemaps/0006.map"
Tilemap00_07::
  INCBIN "./build/tilemaps/0007.map"
Tilemap00_08::
  INCBIN "./build/tilemaps/0008.map"
Tilemap00_09::
  INCBIN "./build/tilemaps/0009.map"
Tilemap00_0A::
  INCBIN "./build/tilemaps/GBCOnlyErrorScreen.map"
Tilemap00_0B::
  INCBIN "./build/tilemaps/OptionYesNo.map"
Tilemap00_0C::
  INCBIN "./build/tilemaps/000C.map"
Tilemap00_11::
  INCBIN "./build/tilemaps/0011.map"
Tilemap00_12::
  INCBIN "./build/tilemaps/MenuMainGame.map"
Tilemap00_13::
  INCBIN "./build/tilemaps/0013.map"
Tilemap00_14::
  INCBIN "./build/tilemaps/MenuMedawatchScreenIkki.map"
Tilemap00_15::
  INCBIN "./build/tilemaps/MenuMedawatchScreenTopSelect.map"
Tilemap00_16::
  INCBIN "./build/tilemaps/MenuMedawatchScreenMidSelect.map"
Tilemap00_17::
  INCBIN "./build/tilemaps/MenuMedawatchScreenBotSelect.map"
Tilemap00_18::
  INCBIN "./build/tilemaps/0018.map"
Tilemap00_19::
  INCBIN "./build/tilemaps/PartsScreen.map"
Tilemap00_1A::
  INCBIN "./build/tilemaps/PartsHead.map"
Tilemap00_1B::
  INCBIN "./build/tilemaps/PartsRightArm.map"
Tilemap00_1C::
  INCBIN "./build/tilemaps/PartsLeftArm.map"
Tilemap00_1D::
  INCBIN "./build/tilemaps/PartsLegs.map"
Tilemap00_1E::
  INCBIN "./build/tilemaps/001E.map"
Tilemap00_1F::
  INCBIN "./build/tilemaps/001F.map"
Tilemap00_20::
  INCBIN "./build/tilemaps/0020.map"
Tilemap00_21::
  INCBIN "./build/tilemaps/0021.map"
Tilemap00_22::
  INCBIN "./build/tilemaps/0022.map"
Tilemap00_23::
  INCBIN "./build/tilemaps/0023.map"
Tilemap00_24::
  INCBIN "./build/tilemaps/0024.map"
Tilemap00_25::
  INCBIN "./build/tilemaps/0025.map"
Tilemap00_26::
  INCBIN "./build/tilemaps/0026.map"
Tilemap00_27::
  INCBIN "./build/tilemaps/0027.map"
Tilemap00_28::
  INCBIN "./build/tilemaps/0028.map"
Tilemap00_29::
  INCBIN "./build/tilemaps/0029.map"
Tilemap00_2A::
  INCBIN "./build/tilemaps/002A.map"
Tilemap00_2B::
  INCBIN "./build/tilemaps/002B.map"
Tilemap00_2C::
  INCBIN "./build/tilemaps/PartsInfoHead.map"
Tilemap00_2D::
  INCBIN "./build/tilemaps/PartsInfoArms.map"
Tilemap00_2F::
  INCBIN "./build/tilemaps/PartsInfoLegs.map"
Tilemap00_30::
  INCBIN "./build/tilemaps/0030.map"
Tilemap00_31::
  INCBIN "./build/tilemaps/0031.map"
Tilemap00_32::
  INCBIN "./build/tilemaps/0032.map"
Tilemap00_33::
  INCBIN "./build/tilemaps/0033.map"
Tilemap00_34::
  INCBIN "./build/tilemaps/0034.map"
Tilemap00_35::
  INCBIN "./build/tilemaps/MedalsScreen.map"
Tilemap00_36::
  INCBIN "./build/tilemaps/MedalsListSymbols.map"
Tilemap00_38::
  INCBIN "./build/tilemaps/0038.map"
Tilemap00_39::
  INCBIN "./build/tilemaps/MedalsImage.map"
Tilemap00_3A::
  INCBIN "./build/tilemaps/MedalInfoAbility.map"
Tilemap00_3C::
  INCBIN "./build/tilemaps/MedalInfoSymbol.map"
Tilemap00_3D::
  INCBIN "./build/tilemaps/MedalsScreenSubmenu.map"
Tilemap00_3E::
  INCBIN "./build/tilemaps/MedalAbilitySubmenu.map"
Tilemap00_3F::
  INCBIN "./build/tilemaps/MedalMedaforceSubmenu.map"
Tilemap00_40::
  INCBIN "./build/tilemaps/MedalSkillSubmenu.map"
Tilemap00_41::
  INCBIN "./build/tilemaps/MedalInfoMedaforce.map"
Tilemap00_42::
  INCBIN "./build/tilemaps/MedalInfoSkills.map"
Tilemap00_43::
  INCBIN "./build/tilemaps/MedalInfoMedalia.map"
Tilemap00_44::
  INCBIN "./build/tilemaps/MedarotsScreen.map"
Tilemap00_45::
  INCBIN "./build/tilemaps/MedarotsInfo.map"
Tilemap00_46::
  INCBIN "./build/tilemaps/MedalIcon.map"
Tilemap00_47::
  INCBIN "./build/tilemaps/MedarotsInfoTextSelectToMedachange.map"
Tilemap00_48::
  INCBIN "./build/tilemaps/MedarotsInfoMedachangeSubscreen.map"
Tilemap00_49::
  INCBIN "./build/tilemaps/0049.map"
Tilemap00_4A::
  INCBIN "./build/tilemaps/MedarotsInfoTextSelectToReturn.map"
Tilemap00_4B::
  INCBIN "./build/tilemaps/MedachangeInfo.map"
Tilemap00_4C::
  INCBIN "./build/tilemaps/MedachangeInfoOverallStats.map"
Tilemap00_4D::
  INCBIN "./build/tilemaps/MedachangeInfoDriveAStats.map"
Tilemap00_4E::
  INCBIN "./build/tilemaps/MedachangeInfoDriveBCStats.map"
Tilemap00_4F::
  INCBIN "./build/tilemaps/ItemScreen.map"
Tilemap00_50::
  INCBIN "./build/tilemaps/InfoSaveScreen.map"
Tilemap00_51::
  INCBIN "./build/tilemaps/0051.map"
Tilemap00_52::
  INCBIN "./build/tilemaps/0052.map"
Tilemap00_53::
  INCBIN "./build/tilemaps/0053.map"
Tilemap00_54::
  INCBIN "./build/tilemaps/RobattleScreenTopHalf.map"
Tilemap00_55::
  INCBIN "./build/tilemaps/RobattleScreenBottomHalf.map"
Tilemap00_56::
  INCBIN "./build/tilemaps/RobattleTopAction.map"
Tilemap00_57::
  INCBIN "./build/tilemaps/RobattleTopActionHighlighted.map"
Tilemap00_58::
  INCBIN "./build/tilemaps/RobattleRightAction.map"
Tilemap00_59::
  INCBIN "./build/tilemaps/RobattleRightActionHighlighted.map"
Tilemap00_5A::
  INCBIN "./build/tilemaps/RobattleLeftAction.map"
Tilemap00_5B::
  INCBIN "./build/tilemaps/RobattleLeftActionHighlighted.map"
Tilemap00_5C::
  INCBIN "./build/tilemaps/005C.map"
Tilemap00_5D::
  INCBIN "./build/tilemaps/005D.map"
Tilemap00_5E::
  INCBIN "./build/tilemaps/RobattleSubmenu.map"
Tilemap00_5F::
  INCBIN "./build/tilemaps/005F.map"
Tilemap00_60::
  INCBIN "./build/tilemaps/RobattleAutoRotationScreen.map"
Tilemap00_61::
  INCBIN "./build/tilemaps/0061.map"
Tilemap00_62::
  INCBIN "./build/tilemaps/0062.map"
Tilemap00_63::
  INCBIN "./build/tilemaps/0063.map"
Tilemap00_64::
  INCBIN "./build/tilemaps/0064.map"
Tilemap00_65::
  INCBIN "./build/tilemaps/0065.map"
Tilemap00_66::
  INCBIN "./build/tilemaps/0066.map"
Tilemap00_67::
  INCBIN "./build/tilemaps/0067.map"
Tilemap00_68::
  INCBIN "./build/tilemaps/0068.map"
Tilemap00_69::
  INCBIN "./build/tilemaps/0069.map"
Tilemap00_6A::
  INCBIN "./build/tilemaps/006A.map"
Tilemap00_6B::
  INCBIN "./build/tilemaps/006B.map"
Tilemap00_6C::
  INCBIN "./build/tilemaps/006C.map"
Tilemap00_6D::
  INCBIN "./build/tilemaps/006D.map"
Tilemap00_6E::
  INCBIN "./build/tilemaps/RobattleResultsMedalScreen.map"
Tilemap00_6F::
  INCBIN "./build/tilemaps/RobattleResultsMedalScreenMedalIcons.map"
Tilemap00_70::
  INCBIN "./build/tilemaps/0070.map"
Tilemap00_71::
  INCBIN "./build/tilemaps/0071.map"
Tilemap00_72::
  INCBIN "./build/tilemaps/0072.map"
Tilemap00_73::
  INCBIN "./build/tilemaps/0061.map"
Tilemap00_75::
  INCBIN "./build/tilemaps/0062.map"
Tilemap00_76::
  INCBIN "./build/tilemaps/0063.map"
Tilemap00_77::
  INCBIN "./build/tilemaps/0064.map"
Tilemap00_78::
  INCBIN "./build/tilemaps/0065.map"
Tilemap00_79::
  INCBIN "./build/tilemaps/0066.map"
Tilemap00_7A::
  INCBIN "./build/tilemaps/0067.map"
Tilemap00_7B::
  INCBIN "./build/tilemaps/007B.map"
Tilemap00_7C::
  INCBIN "./build/tilemaps/007C.map"
Tilemap00_7D::
  INCBIN "./build/tilemaps/RobattleSelectionText.map"
Tilemap00_7E::
  INCBIN "./build/tilemaps/007E.map"
Tilemap00_7F::
  INCBIN "./build/tilemaps/007F.map"
Tilemap00_80::
  INCBIN "./build/tilemaps/VehiclesMiniHandle.map"
Tilemap00_81::
  INCBIN "./build/tilemaps/VehiclesWingsOfWind.map"
Tilemap00_82::
  INCBIN "./build/tilemaps/VehiclesPeriscope.map"
Tilemap00_83::
  INCBIN "./build/tilemaps/0083.map"
Tilemap00_91::
  INCBIN "./build/tilemaps/0091.map"
Tilemap00_92::
  INCBIN "./build/tilemaps/0092.map"
Tilemap00_93::
  INCBIN "./build/tilemaps/0093.map"
Tilemap00_94::
  INCBIN "./build/tilemaps/0094.map"
Tilemap00_95::
  INCBIN "./build/tilemaps/0095.map"
Tilemap00_96::
  INCBIN "./build/tilemaps/0096.map"
Tilemap00_97::
  INCBIN "./build/tilemaps/0097.map"
Tilemap00_98::
  INCBIN "./build/tilemaps/0098.map"
Tilemap00_99::
  INCBIN "./build/tilemaps/0099.map"
Tilemap00_9A::
  INCBIN "./build/tilemaps/009A.map"
Tilemap00_9B::
  INCBIN "./build/tilemaps/009B.map"
Tilemap00_9C::
  INCBIN "./build/tilemaps/009C.map"
Tilemap00_9D::
  INCBIN "./build/tilemaps/009D.map"
Tilemap00_A1::
  INCBIN "./build/tilemaps/00A1.map"
Tilemap00_A2::
  INCBIN "./build/tilemaps/00A2.map"
Tilemap00_A3::
  INCBIN "./build/tilemaps/00A3.map"
Tilemap00_A4::
  INCBIN "./build/tilemaps/00A4.map"
Tilemap00_A5::
  INCBIN "./build/tilemaps/00A5.map"
Tilemap00_A6::
  INCBIN "./build/tilemaps/00A6.map"
Tilemap00_A7::
  INCBIN "./build/tilemaps/00A7.map"
Tilemap00_A8::
  INCBIN "./build/tilemaps/00A8.map"
Tilemap00_A9::
  INCBIN "./build/tilemaps/00A9.map"
Tilemap00_AA::
  INCBIN "./build/tilemaps/00AA.map"
Tilemap00_AB::
  INCBIN "./build/tilemaps/00AB.map"
Tilemap00_AC::
  INCBIN "./build/tilemaps/MedachangeTextShift.map"
Tilemap00_B1::
  INCBIN "./build/tilemaps/MedachangeTextPower.map"
Tilemap00_B2::
  INCBIN "./build/tilemaps/0004.map"
Tilemap00_B3::
  INCBIN "./build/tilemaps/0005.map"
Tilemap00_B4::
  INCBIN "./build/tilemaps/00B4.map"
Tilemap00_B5::
  INCBIN "./build/tilemaps/00B5.map"
Tilemap00_C1::
  INCBIN "./build/tilemaps/00C1.map"
Tilemap00_C2::
  INCBIN "./build/tilemaps/000C.map"
Tilemap00_C3::
  INCBIN "./build/tilemaps/00C3.map"
Tilemap00_C4::
  INCBIN "./build/tilemaps/00C4.map"
Tilemap00_C5::
  INCBIN "./build/tilemaps/00C5.map"
Tilemap00_C6::
  INCBIN "./build/tilemaps/00C6.map"
Tilemap00_C7::
  INCBIN "./build/tilemaps/00C7.map"
Tilemap00_C8::
  INCBIN "./build/tilemaps/00C8.map"
Tilemap00_C9::
  INCBIN "./build/tilemaps/00C9.map"
Tilemap00_CA::
  INCBIN "./build/tilemaps/RobattleTextChargeMF.map"
Tilemap00_F1::
  INCBIN "./build/tilemaps/RobattleTextMedachange.map"
Tilemap00_F2::
  INCBIN "./build/tilemaps/RobattleTextStrike.map"
Tilemap00_F3::
  INCBIN "./build/tilemaps/RobattleTextShoot.map"
Tilemap00_F4::
  INCBIN "./build/tilemaps/RobattleTextBerserk.map"
Tilemap00_F5::
  INCBIN "./build/tilemaps/RobattleTextSnipe.map"
Tilemap00_F6::
  INCBIN "./build/tilemaps/RobattleTextProtect.map"
Tilemap00_F7::
  INCBIN "./build/tilemaps/RobattleTextSetup.map"
Tilemap00_F8::
  INCBIN "./build/tilemaps/RobattleTextHeal.map"
Tilemap00_F9::
  INCBIN "./build/tilemaps/RobattleTextSpecial.map"
Tilemap00_FA::
  INCBIN "./build/tilemaps/RobattleTextSupport.map"
Tilemap00_FB::
  INCBIN "./build/tilemaps/RobattleTextDisrupt.map"
Tilemap00_FC::
  INCBIN "./build/tilemaps/RobattleTextDisabled.map"
Tilemap00_FD::
  INCBIN "./build/tilemaps/RobattleTextShiftChange.map"
Tilemap00_FE::
  INCBIN "./build/tilemaps/RobattleTextPowerChange.map"
TilemapTable00Terminator::

SECTION "Tilemap Table 01", ROMX[$4000], BANK[$34]
TilemapTable01::
  dw Tilemap01_00 ; 00
  dw Tilemap01_01 ; 01
  dw Tilemap01_02 ; 02
  dw Tilemap01_02 ; 03 (01_03)
  dw Tilemap01_04 ; 04
  dw Tilemap01_05 ; 05
  dw Tilemap01_06 ; 06
  dw Tilemap01_07 ; 07
  dw Tilemap01_08 ; 08
  dw Tilemap01_08 ; 09 (01_09)
  dw Tilemap01_08 ; 0A (01_0A)
  dw Tilemap01_08 ; 0B (01_0B)
  dw Tilemap01_08 ; 0C (01_0C)
  dw Tilemap01_08 ; 0D (01_0D)
  dw Tilemap01_08 ; 0E (01_0E)
  dw Tilemap01_08 ; 0F (01_0F)
  dw Tilemap01_10 ; 10
  dw Tilemap01_11 ; 11
  dw Tilemap01_12 ; 12
  dw Tilemap01_13 ; 13
  dw Tilemap01_14 ; 14
  dw Tilemap01_15 ; 15
  dw Tilemap01_16 ; 16
  dw Tilemap01_17 ; 17
  dw Tilemap01_18 ; 18
  dw Tilemap01_19 ; 19
  dw Tilemap01_1A ; 1A
  dw Tilemap01_1B ; 1B
  dw Tilemap01_1C ; 1C
  dw Tilemap01_1D ; 1D
  dw Tilemap01_1E ; 1E
  dw Tilemap01_1F ; 1F
  dw Tilemap01_20 ; 20
  dw Tilemap01_21 ; 21
  dw Tilemap01_22 ; 22
  dw Tilemap01_23 ; 23
  dw Tilemap01_24 ; 24
  dw Tilemap01_25 ; 25
  dw Tilemap01_26 ; 26
  dw Tilemap01_27_GAMEVERSION ; 27
  dw Tilemap01_28 ; 28
  dw Tilemap01_28 ; 29 (01_29)
  dw Tilemap01_28 ; 2A (01_2A)
  dw Tilemap01_2B ; 2B
  dw Tilemap01_2C ; 2C
  dw Tilemap01_2C ; 2D (01_2D)
  dw Tilemap01_2C ; 2E (01_2E)
  dw Tilemap01_2F ; 2F
  dw Tilemap01_30 ; 30
  dw Tilemap01_31 ; 31
  dw Tilemap01_32 ; 32
  dw Tilemap01_33 ; 33
  dw Tilemap01_34 ; 34
  dw Tilemap01_35 ; 35
  dw Tilemap01_36 ; 36
  dw Tilemap01_37 ; 37
  dw Tilemap01_38 ; 38
  dw Tilemap01_39 ; 39
  dw Tilemap01_39 ; 3A (01_3A)
  dw Tilemap01_39 ; 3B (01_3B)
  dw Tilemap01_39 ; 3C (01_3C)
  dw Tilemap01_39 ; 3D (01_3D)
  dw Tilemap01_39 ; 3E (01_3E)
  dw Tilemap01_39 ; 3F (01_3F)
  dw Tilemap01_39 ; 40 (01_40)
  dw Tilemap01_41 ; 41
  dw Tilemap01_42 ; 42
  dw Tilemap01_43 ; 43
  dw Tilemap01_44 ; 44
  dw Tilemap01_45 ; 45
  dw Tilemap01_46 ; 46
  dw Tilemap01_47 ; 47
  dw Tilemap01_48 ; 48
  dw Tilemap01_49 ; 49
  dw Tilemap01_4A ; 4A
  dw Tilemap01_4B ; 4B
  dw Tilemap01_4C_GAMEVERSION ; 4C
  dw Tilemap01_4D_GAMEVERSION ; 4D
  dw Tilemap01_4E_GAMEVERSION ; 4E
  dw Tilemap01_4F_GAMEVERSION ; 4F
  dw Tilemap01_50 ; 50
  dw Tilemap01_51 ; 51
  dw Tilemap01_52 ; 52
  dw Tilemap01_53 ; 53
  dw Tilemap01_54 ; 54
  dw Tilemap01_55 ; 55
  dw Tilemap01_56_GAMEVERSION ; 56
  dw Tilemap01_57_GAMEVERSION ; 57
  dw Tilemap01_58_GAMEVERSION ; 58
  dw Tilemap01_59_GAMEVERSION ; 59
  dw Tilemap01_5A_GAMEVERSION ; 5A
  dw Tilemap01_5B_GAMEVERSION ; 5B
  dw Tilemap01_5C_GAMEVERSION ; 5C
  dw Tilemap01_5D_GAMEVERSION ; 5D
  dw Tilemap01_5E_GAMEVERSION ; 5E
  dw Tilemap01_5F ; 5F
  dw Tilemap01_60 ; 60
  dw Tilemap01_61 ; 61
  dw Tilemap01_62 ; 62
  dw Tilemap01_63 ; 63
  dw Tilemap01_64 ; 64
  dw Tilemap01_65 ; 65
  dw Tilemap01_66 ; 66
  dw Tilemap01_67 ; 67
  dw Tilemap01_68 ; 68
  dw Tilemap01_69 ; 69
  dw Tilemap01_6A ; 6A
  dw Tilemap01_6B ; 6B
  dw Tilemap01_6C ; 6C
  dw Tilemap01_6D ; 6D
  dw Tilemap01_6E ; 6E
  dw Tilemap01_6F ; 6F
  dw Tilemap01_70 ; 70
  dw Tilemap01_71 ; 71
  dw Tilemap01_72 ; 72
  dw Tilemap01_73 ; 73
  dw Tilemap01_74 ; 74
  dw Tilemap01_75 ; 75
  dw Tilemap01_75 ; 76 (01_76)
  dw Tilemap01_75 ; 77 (01_77)
  dw Tilemap01_75 ; 78 (01_78)
  dw Tilemap01_75 ; 79 (01_79)
  dw Tilemap01_75 ; 7A (01_7A)
  dw Tilemap01_75 ; 7B (01_7B)
  dw Tilemap01_75 ; 7C (01_7C)
  dw Tilemap01_75 ; 7D (01_7D)
  dw Tilemap01_75 ; 7E (01_7E)
  dw Tilemap01_75 ; 7F (01_7F)
  dw Tilemap01_75 ; 80 (01_80)
  dw Tilemap01_81 ; 81
  dw Tilemap01_82 ; 82
  dw Tilemap01_83 ; 83
  dw Tilemap01_84 ; 84
  dw Tilemap01_85 ; 85
  dw Tilemap01_86 ; 86
  dw Tilemap01_87 ; 87
  dw Tilemap01_88 ; 88
  dw Tilemap01_89 ; 89
  dw Tilemap01_8A ; 8A
  dw Tilemap01_8B ; 8B
  dw Tilemap01_8C ; 8C
  dw Tilemap01_8D ; 8D
  dw Tilemap01_8E ; 8E
  dw Tilemap01_8F ; 8F
  dw Tilemap01_90 ; 90
  dw Tilemap01_91 ; 91
  dw Tilemap01_92 ; 92
  dw Tilemap01_93 ; 93
  dw Tilemap01_94 ; 94
  dw Tilemap01_95 ; 95
  dw Tilemap01_96 ; 96
  dw Tilemap01_97 ; 97
  dw Tilemap01_98 ; 98
  dw Tilemap01_99 ; 99
  dw Tilemap01_9A ; 9A
  dw Tilemap01_9B ; 9B
  dw Tilemap01_9C ; 9C
  dw Tilemap01_9D ; 9D
  dw Tilemap01_9E ; 9E
  dw Tilemap01_9F ; 9F
  dw Tilemap01_A0 ; A0
  dw Tilemap01_A1 ; A1
  dw Tilemap01_A2 ; A2
  dw Tilemap01_A3 ; A3
  dw Tilemap01_A4 ; A4
  dw Tilemap01_A5 ; A5
  dw Tilemap01_A6 ; A6
  dw Tilemap01_A7 ; A7
  dw Tilemap01_A8 ; A8
  dw Tilemap01_A8 ; A9 (01_A9)
  dw Tilemap01_A8 ; AA (01_AA)
  dw Tilemap01_AB ; AB
  dw Tilemap01_AC ; AC
  dw Tilemap01_AD ; AD
  dw Tilemap01_AE ; AE
  dw Tilemap01_AF ; AF
  dw Tilemap01_B0 ; B0
  dw Tilemap01_B1 ; B1
  dw Tilemap01_B2 ; B2
  dw Tilemap01_B3 ; B3
  dw Tilemap01_B4 ; B4
  dw Tilemap01_B5 ; B5
  dw Tilemap01_B6 ; B6
  dw Tilemap01_B7 ; B7
  dw Tilemap01_B8 ; B8
  dw TilemapTable01Terminator ; B9
  dw TilemapTable01Terminator ; BA
  dw TilemapTable01Terminator ; BB
  dw TilemapTable01Terminator ; BC
  dw TilemapTable01Terminator ; BD
  dw TilemapTable01Terminator ; BE
  dw TilemapTable01Terminator ; BF
  dw TilemapTable01Terminator ; C0
  dw TilemapTable01Terminator ; C1
  dw TilemapTable01Terminator ; C2
  dw TilemapTable01Terminator ; C3
  dw TilemapTable01Terminator ; C4
  dw TilemapTable01Terminator ; C5
  dw TilemapTable01Terminator ; C6
  dw TilemapTable01Terminator ; C7
  dw TilemapTable01Terminator ; C8
  dw TilemapTable01Terminator ; C9
  dw TilemapTable01Terminator ; CA
  dw TilemapTable01Terminator ; CB
  dw TilemapTable01Terminator ; CC
  dw TilemapTable01Terminator ; CD
  dw TilemapTable01Terminator ; CE
  dw TilemapTable01Terminator ; CF
  dw TilemapTable01Terminator ; D0
  dw TilemapTable01Terminator ; D1
  dw TilemapTable01Terminator ; D2
  dw TilemapTable01Terminator ; D3
  dw TilemapTable01Terminator ; D4
  dw TilemapTable01Terminator ; D5
  dw TilemapTable01Terminator ; D6
  dw TilemapTable01Terminator ; D7
  dw TilemapTable01Terminator ; D8
  dw TilemapTable01Terminator ; D9
  dw TilemapTable01Terminator ; DA
  dw TilemapTable01Terminator ; DB
  dw TilemapTable01Terminator ; DC
  dw TilemapTable01Terminator ; DD
  dw TilemapTable01Terminator ; DE
  dw TilemapTable01Terminator ; DF
  dw TilemapTable01Terminator ; E0
  dw TilemapTable01Terminator ; E1
  dw TilemapTable01Terminator ; E2
  dw TilemapTable01Terminator ; E3
  dw TilemapTable01Terminator ; E4
  dw TilemapTable01Terminator ; E5
  dw TilemapTable01Terminator ; E6
  dw TilemapTable01Terminator ; E7
  dw TilemapTable01Terminator ; E8
  dw TilemapTable01Terminator ; E9
  dw TilemapTable01Terminator ; EA
  dw TilemapTable01Terminator ; EB
  dw TilemapTable01Terminator ; EC
  dw TilemapTable01Terminator ; ED
  dw TilemapTable01Terminator ; EE
  dw TilemapTable01Terminator ; EF
  dw TilemapTable01Terminator ; F0
  dw TilemapTable01Terminator ; F1
  dw TilemapTable01Terminator ; F2
  dw TilemapTable01Terminator ; F3
  dw TilemapTable01Terminator ; F4
  dw TilemapTable01Terminator ; F5
  dw TilemapTable01Terminator ; F6
  dw TilemapTable01Terminator ; F7
  dw TilemapTable01Terminator ; F8
  dw TilemapTable01Terminator ; F9
  dw TilemapTable01Terminator ; FA
  dw TilemapTable01Terminator ; FB
  dw TilemapTable01Terminator ; FC
  dw TilemapTable01Terminator ; FD
  dw TilemapTable01Terminator ; FE
  dw TilemapTable01Terminator ; FF
Tilemap01_00::
  INCBIN "./build/tilemaps/MinigameAOverlay.map"
Tilemap01_01::
  INCBIN "./build/tilemaps/MinigameAEnvironment.map"
Tilemap01_02::
  INCBIN "./build/tilemaps/MinigameBOverlay.map"
Tilemap01_04::
  INCBIN "./build/tilemaps/MinigameBEnvironment.map"
Tilemap01_05::
  INCBIN "./build/tilemaps/0105.map"
Tilemap01_06::
  INCBIN "./build/tilemaps/0106.map"
Tilemap01_07::
  INCBIN "./build/tilemaps/0107.map"
Tilemap01_08::
  INCBIN "./build/tilemaps/ItemUseCancel.map"
Tilemap01_10::
  INCBIN "./build/tilemaps/0110.map"
Tilemap01_11::
  INCBIN "./build/tilemaps/0111.map"
Tilemap01_12::
  INCBIN "./build/tilemaps/0112.map"
Tilemap01_13::
  INCBIN "./build/tilemaps/0113.map"
Tilemap01_14::
  INCBIN "./build/tilemaps/0114.map"
Tilemap01_15::
  INCBIN "./build/tilemaps/0115.map"
Tilemap01_16::
  INCBIN "./build/tilemaps/0116.map"
Tilemap01_17::
  INCBIN "./build/tilemaps/0117.map"
Tilemap01_18::
  INCBIN "./build/tilemaps/0118.map"
Tilemap01_19::
  INCBIN "./build/tilemaps/0119.map"
Tilemap01_1A::
  INCBIN "./build/tilemaps/011A.map"
Tilemap01_1B::
  INCBIN "./build/tilemaps/MenuStartScreen.map"
Tilemap01_1C::
  INCBIN "./build/tilemaps/MenuTestScreen.map"
Tilemap01_1D::
  INCBIN "./build/tilemaps/OptionYesNo.map"
Tilemap01_1E::
  INCBIN "./build/tilemaps/InputNameScreen.map"
Tilemap01_1F::
  INCBIN "./build/tilemaps/InputNameCharacterMap1.map"
Tilemap01_20::
  INCBIN "./build/tilemaps/InputNameCharacterMap2.map"
Tilemap01_21::
  INCBIN "./build/tilemaps/InputNamePlayerName.map"
Tilemap01_22::
  INCBIN "./build/tilemaps/InputNameMedabotName.map"
Tilemap01_23::
  INCBIN "./build/tilemaps/InputNameUnderscores.map"
Tilemap01_24::
  INCBIN "./build/tilemaps/CorruptedSaveScreen.map"
Tilemap01_25::
  INCBIN "./build/tilemaps/0125.map"
Tilemap01_26::
  INCBIN "./build/tilemaps/0126.map"
Tilemap01_27_GAMEVERSION::
  INCBIN cTilemap01_27_GAMEVERSION
Tilemap01_28::
  INCBIN "./build/tilemaps/0128.map"
Tilemap01_2B::
  INCBIN "./build/tilemaps/012B.map"
Tilemap01_2C::
  INCBIN "./build/tilemaps/GameOverScreen.map"
Tilemap01_2F::
  INCBIN "./build/tilemaps/012F.map"
Tilemap01_30::
  INCBIN "./build/tilemaps/0130.map"
Tilemap01_31::
  INCBIN "./build/tilemaps/0131.map"
Tilemap01_32::
  INCBIN "./build/tilemaps/0132.map"
Tilemap01_33::
  INCBIN "./build/tilemaps/0133.map"
Tilemap01_34::
  INCBIN "./build/tilemaps/0134.map"
Tilemap01_35::
  INCBIN "./build/tilemaps/0135.map"
Tilemap01_36::
  INCBIN "./build/tilemaps/0136.map"
Tilemap01_37::
  INCBIN "./build/tilemaps/0137.map"
Tilemap01_38::
  INCBIN "./build/tilemaps/0138.map"
Tilemap01_39::
  INCBIN "./build/tilemaps/0139.map"
Tilemap01_41::
  INCBIN "./build/tilemaps/0141.map"
Tilemap01_42::
  INCBIN "./build/tilemaps/0142.map"
Tilemap01_43::
  INCBIN "./build/tilemaps/0143.map"
Tilemap01_44::
  INCBIN "./build/tilemaps/0144.map"
Tilemap01_45::
  INCBIN "./build/tilemaps/0145.map"
Tilemap01_46::
  INCBIN "./build/tilemaps/0146.map"
Tilemap01_47::
  INCBIN "./build/tilemaps/0147.map"
Tilemap01_48::
  INCBIN "./build/tilemaps/0148.map"
Tilemap01_49::
  INCBIN "./build/tilemaps/0149.map"
Tilemap01_4A::
  INCBIN "./build/tilemaps/014A.map"
Tilemap01_4B::
  INCBIN "./build/tilemaps/014B.map"
Tilemap01_4C_GAMEVERSION::
  INCBIN cTilemap01_4C_GAMEVERSION
Tilemap01_4D_GAMEVERSION::
  INCBIN cTilemap01_4D_GAMEVERSION
Tilemap01_4E_GAMEVERSION::
  INCBIN cTilemap01_4E_GAMEVERSION
Tilemap01_4F_GAMEVERSION::
  INCBIN cTilemap01_4F_GAMEVERSION
Tilemap01_50::
  INCBIN "./build/tilemaps/0150.map"
Tilemap01_51::
  INCBIN "./build/tilemaps/0151.map"
Tilemap01_52::
  INCBIN "./build/tilemaps/0152.map"
Tilemap01_53::
  INCBIN "./build/tilemaps/0153.map"
Tilemap01_54::
  INCBIN "./build/tilemaps/0154.map"
Tilemap01_55::
  INCBIN "./build/tilemaps/0155.map"
Tilemap01_56_GAMEVERSION::
  INCBIN cTilemap01_56_GAMEVERSION
Tilemap01_57_GAMEVERSION::
  INCBIN cTilemap01_57_GAMEVERSION
Tilemap01_58_GAMEVERSION::
  INCBIN cTilemap01_58_GAMEVERSION
Tilemap01_59_GAMEVERSION::
  INCBIN cTilemap01_59_GAMEVERSION
Tilemap01_5A_GAMEVERSION::
  INCBIN cTilemap01_5A_GAMEVERSION
Tilemap01_5B_GAMEVERSION::
  INCBIN cTilemap01_5B_GAMEVERSION
Tilemap01_5C_GAMEVERSION::
  INCBIN cTilemap01_5C_GAMEVERSION
Tilemap01_5D_GAMEVERSION::
  INCBIN cTilemap01_5D_GAMEVERSION
Tilemap01_5E_GAMEVERSION::
  INCBIN cTilemap01_5E_GAMEVERSION
Tilemap01_5F::
  INCBIN "./build/tilemaps/015F.map"
Tilemap01_60::
  INCBIN "./build/tilemaps/0160.map"
Tilemap01_61::
  INCBIN "./build/tilemaps/0161.map"
Tilemap01_62::
  INCBIN "./build/tilemaps/0162.map"
Tilemap01_63::
  INCBIN "./build/tilemaps/0163.map"
Tilemap01_64::
  INCBIN "./build/tilemaps/0164.map"
Tilemap01_65::
  INCBIN "./build/tilemaps/0165.map"
Tilemap01_66::
  INCBIN "./build/tilemaps/0166.map"
Tilemap01_67::
  INCBIN "./build/tilemaps/0167.map"
Tilemap01_68::
  INCBIN "./build/tilemaps/0168.map"
Tilemap01_69::
  INCBIN "./build/tilemaps/0169.map"
Tilemap01_6A::
  INCBIN "./build/tilemaps/016A.map"
Tilemap01_6B::
  INCBIN "./build/tilemaps/016B.map"
Tilemap01_6C::
  INCBIN "./build/tilemaps/016C.map"
Tilemap01_6D::
  INCBIN "./build/tilemaps/016D.map"
Tilemap01_6E::
  INCBIN "./build/tilemaps/016E.map"
Tilemap01_6F::
  INCBIN "./build/tilemaps/016F.map"
Tilemap01_70::
  INCBIN "./build/tilemaps/0170.map"
Tilemap01_71::
  INCBIN "./build/tilemaps/0171.map"
Tilemap01_72::
  INCBIN "./build/tilemaps/0172.map"
Tilemap01_73::
  INCBIN "./build/tilemaps/SplashScreenConceptCredit.map"
Tilemap01_74::
  INCBIN "./build/tilemaps/0174.map"
Tilemap01_75::
  INCBIN "./build/tilemaps/ShopMainScreen.map"
Tilemap01_81::
  INCBIN "./build/tilemaps/ShopPartTypeSelect.map"
Tilemap01_82::
  INCBIN "./build/tilemaps/ShopBuyParts.map"
Tilemap01_83::
  INCBIN "./build/tilemaps/ShopSellParts.map"
Tilemap01_84::
  INCBIN "./build/tilemaps/ShopPartHead.map"
Tilemap01_85::
  INCBIN "./build/tilemaps/ShopPartRightArm.map"
Tilemap01_86::
  INCBIN "./build/tilemaps/ShopPartLeftArm.map"
Tilemap01_87::
  INCBIN "./build/tilemaps/ShopPartLegs.map"
Tilemap01_88::
  INCBIN "./build/tilemaps/0188.map"
Tilemap01_89::
  INCBIN "./build/tilemaps/ShopPasswordScreen.map"
Tilemap01_8A::
  INCBIN "./build/tilemaps/018A.map"
Tilemap01_8B::
  INCBIN "./build/tilemaps/PaintShopMainScreen.map"
Tilemap01_8C::
  INCBIN "./build/tilemaps/PaintShopPaintSelectScreen.map"
Tilemap01_8D::
  INCBIN "./build/tilemaps/018D.map"
Tilemap01_8E::
  INCBIN "./build/tilemaps/018E.map"
Tilemap01_8F::
  INCBIN "./build/tilemaps/018F.map"
Tilemap01_90::
  INCBIN "./build/tilemaps/0190.map"
Tilemap01_91::
  INCBIN "./build/tilemaps/0191.map"
Tilemap01_92::
  INCBIN "./build/tilemaps/0192.map"
Tilemap01_93::
  INCBIN "./build/tilemaps/0193.map"
Tilemap01_94::
  INCBIN "./build/tilemaps/0194.map"
Tilemap01_95::
  INCBIN "./build/tilemaps/0195.map"
Tilemap01_96::
  INCBIN "./build/tilemaps/0196.map"
Tilemap01_97::
  INCBIN "./build/tilemaps/0197.map"
Tilemap01_98::
  INCBIN "./build/tilemaps/0198.map"
Tilemap01_99::
  INCBIN "./build/tilemaps/0199.map"
Tilemap01_9A::
  INCBIN "./build/tilemaps/019A.map"
Tilemap01_9B::
  INCBIN "./build/tilemaps/019B.map"
Tilemap01_9C::
  INCBIN "./build/tilemaps/019C.map"
Tilemap01_9D::
  INCBIN "./build/tilemaps/019D.map"
Tilemap01_9E::
  INCBIN "./build/tilemaps/019E.map"
Tilemap01_9F::
  INCBIN "./build/tilemaps/019F.map"
Tilemap01_A0::
  INCBIN "./build/tilemaps/01A0.map"
Tilemap01_A1::
  INCBIN "./build/tilemaps/01A1.map"
Tilemap01_A2::
  INCBIN "./build/tilemaps/01A2.map"
Tilemap01_A3::
  INCBIN "./build/tilemaps/01A3.map"
Tilemap01_A4::
  INCBIN "./build/tilemaps/01A4.map"
Tilemap01_A5::
  INCBIN "./build/tilemaps/01A5.map"
Tilemap01_A6::
  INCBIN "./build/tilemaps/01A6.map"
Tilemap01_A7::
  INCBIN "./build/tilemaps/01A7.map"
Tilemap01_A8::
  INCBIN "./build/tilemaps/01A8.map"
Tilemap01_AB::
  INCBIN "./build/tilemaps/01AB.map"
Tilemap01_AC::
  INCBIN "./build/tilemaps/ChapterTitleScreen.map"
Tilemap01_AD::
  INCBIN "./build/tilemaps/01AD.map"
Tilemap01_AE::
  INCBIN "./build/tilemaps/01AE.map"
Tilemap01_AF::
  INCBIN "./build/tilemaps/01AF.map"
Tilemap01_B0::
  INCBIN "./build/tilemaps/01B0.map"
Tilemap01_B1::
  INCBIN "./build/tilemaps/01B1.map"
Tilemap01_B2::
  INCBIN "./build/tilemaps/01B2.map"
Tilemap01_B3::
  INCBIN "./build/tilemaps/01B3.map"
Tilemap01_B4::
  INCBIN "./build/tilemaps/01B4.map"
Tilemap01_B5::
  INCBIN "./build/tilemaps/01B5.map"
Tilemap01_B6::
  INCBIN "./build/tilemaps/01B6.map"
Tilemap01_B7::
  INCBIN "./build/tilemaps/0006.map"
Tilemap01_B8::
  INCBIN "./build/tilemaps/01B8.map"
TilemapTable01Terminator::

SECTION "Tilemap Table 02", ROMX[$4000], BANK[$19]
TilemapTable02::
  dw Tilemap02_00 ; 00
  dw Tilemap02_01 ; 01
  dw Tilemap02_02 ; 02
  dw Tilemap02_02 ; 03 (02_03)
  dw Tilemap02_02 ; 04 (02_04)
  dw Tilemap02_02 ; 05 (02_05)
  dw Tilemap02_02 ; 06 (02_06)
  dw Tilemap02_02 ; 07 (02_07)
  dw Tilemap02_02 ; 08 (02_08)
  dw Tilemap02_02 ; 09 (02_09)
  dw Tilemap02_02 ; 0A (02_0A)
  dw Tilemap02_02 ; 0B (02_0B)
  dw Tilemap02_02 ; 0C (02_0C)
  dw Tilemap02_02 ; 0D (02_0D)
  dw Tilemap02_02 ; 0E (02_0E)
  dw Tilemap02_02 ; 0F (02_0F)
  dw Tilemap02_02 ; 10 (02_10)
  dw Tilemap02_02 ; 11 (02_11)
  dw Tilemap02_02 ; 12 (02_12)
  dw Tilemap02_02 ; 13 (02_13)
  dw Tilemap02_02 ; 14 (02_14)
  dw Tilemap02_02 ; 15 (02_15)
  dw Tilemap02_02 ; 16 (02_16)
  dw Tilemap02_02 ; 17 (02_17)
  dw Tilemap02_02 ; 18 (02_18)
  dw Tilemap02_02 ; 19 (02_19)
  dw Tilemap02_02 ; 1A (02_1A)
  dw Tilemap02_02 ; 1B (02_1B)
  dw Tilemap02_02 ; 1C (02_1C)
  dw Tilemap02_02 ; 1D (02_1D)
  dw Tilemap02_02 ; 1E (02_1E)
  dw Tilemap02_02 ; 1F (02_1F)
  dw Tilemap02_02 ; 20 (02_20)
  dw Tilemap02_02 ; 21 (02_21)
  dw Tilemap02_02 ; 22 (02_22)
  dw Tilemap02_02 ; 23 (02_23)
  dw Tilemap02_02 ; 24 (02_24)
  dw Tilemap02_02 ; 25 (02_25)
  dw Tilemap02_02 ; 26 (02_26)
  dw Tilemap02_02 ; 27 (02_27)
  dw Tilemap02_02 ; 28 (02_28)
  dw Tilemap02_02 ; 29 (02_29)
  dw Tilemap02_02 ; 2A (02_2A)
  dw Tilemap02_02 ; 2B (02_2B)
  dw Tilemap02_02 ; 2C (02_2C)
  dw Tilemap02_02 ; 2D (02_2D)
  dw Tilemap02_02 ; 2E (02_2E)
  dw Tilemap02_02 ; 2F (02_2F)
  dw Tilemap02_02 ; 30 (02_30)
  dw Tilemap02_02 ; 31 (02_31)
  dw Tilemap02_02 ; 32 (02_32)
  dw Tilemap02_02 ; 33 (02_33)
  dw Tilemap02_02 ; 34 (02_34)
  dw Tilemap02_02 ; 35 (02_35)
  dw Tilemap02_02 ; 36 (02_36)
  dw Tilemap02_02 ; 37 (02_37)
  dw Tilemap02_02 ; 38 (02_38)
  dw Tilemap02_02 ; 39 (02_39)
  dw Tilemap02_02 ; 3A (02_3A)
  dw Tilemap02_02 ; 3B (02_3B)
  dw Tilemap02_02 ; 3C (02_3C)
  dw Tilemap02_02 ; 3D (02_3D)
  dw Tilemap02_02 ; 3E (02_3E)
  dw Tilemap02_02 ; 3F (02_3F)
  dw Tilemap02_02 ; 40 (02_40)
  dw Tilemap02_02 ; 41 (02_41)
  dw Tilemap02_02 ; 42 (02_42)
  dw Tilemap02_02 ; 43 (02_43)
  dw Tilemap02_02 ; 44 (02_44)
  dw Tilemap02_02 ; 45 (02_45)
  dw Tilemap02_02 ; 46 (02_46)
  dw Tilemap02_02 ; 47 (02_47)
  dw Tilemap02_02 ; 48 (02_48)
  dw Tilemap02_02 ; 49 (02_49)
  dw Tilemap02_02 ; 4A (02_4A)
  dw Tilemap02_02 ; 4B (02_4B)
  dw Tilemap02_02 ; 4C (02_4C)
  dw Tilemap02_02 ; 4D (02_4D)
  dw Tilemap02_02 ; 4E (02_4E)
  dw Tilemap02_02 ; 4F (02_4F)
  dw Tilemap02_02 ; 50 (02_50)
  dw Tilemap02_02 ; 51 (02_51)
  dw Tilemap02_02 ; 52 (02_52)
  dw Tilemap02_02 ; 53 (02_53)
  dw Tilemap02_02 ; 54 (02_54)
  dw Tilemap02_02 ; 55 (02_55)
  dw Tilemap02_02 ; 56 (02_56)
  dw Tilemap02_02 ; 57 (02_57)
  dw Tilemap02_02 ; 58 (02_58)
  dw Tilemap02_02 ; 59 (02_59)
  dw Tilemap02_02 ; 5A (02_5A)
  dw Tilemap02_02 ; 5B (02_5B)
  dw Tilemap02_02 ; 5C (02_5C)
  dw Tilemap02_02 ; 5D (02_5D)
  dw Tilemap02_02 ; 5E (02_5E)
  dw Tilemap02_02 ; 5F (02_5F)
  dw Tilemap02_02 ; 60 (02_60)
  dw Tilemap02_02 ; 61 (02_61)
  dw Tilemap02_02 ; 62 (02_62)
  dw Tilemap02_02 ; 63 (02_63)
  dw Tilemap02_02 ; 64 (02_64)
  dw Tilemap02_02 ; 65 (02_65)
  dw Tilemap02_02 ; 66 (02_66)
  dw Tilemap02_02 ; 67 (02_67)
  dw Tilemap02_02 ; 68 (02_68)
  dw Tilemap02_69 ; 69
  dw Tilemap02_6A ; 6A
  dw Tilemap02_6B ; 6B
  dw Tilemap02_6C ; 6C
  dw Tilemap02_6D ; 6D
  dw Tilemap02_6E ; 6E
  dw Tilemap02_6F ; 6F
  dw Tilemap02_70 ; 70
  dw Tilemap02_71 ; 71
  dw Tilemap02_72 ; 72
  dw Tilemap02_73 ; 73
  dw Tilemap02_74 ; 74
  dw Tilemap02_75 ; 75
  dw Tilemap02_76 ; 76
  dw Tilemap02_77 ; 77
  dw Tilemap02_78 ; 78
  dw TilemapTable02Terminator ; 79
  dw TilemapTable02Terminator ; 7A
  dw TilemapTable02Terminator ; 7B
  dw TilemapTable02Terminator ; 7C
  dw TilemapTable02Terminator ; 7D
  dw TilemapTable02Terminator ; 7E
  dw TilemapTable02Terminator ; 7F
  dw TilemapTable02Terminator ; 80
  dw TilemapTable02Terminator ; 81
  dw TilemapTable02Terminator ; 82
  dw TilemapTable02Terminator ; 83
  dw TilemapTable02Terminator ; 84
  dw TilemapTable02Terminator ; 85
  dw TilemapTable02Terminator ; 86
  dw TilemapTable02Terminator ; 87
  dw TilemapTable02Terminator ; 88
  dw TilemapTable02Terminator ; 89
  dw TilemapTable02Terminator ; 8A
  dw TilemapTable02Terminator ; 8B
  dw TilemapTable02Terminator ; 8C
  dw TilemapTable02Terminator ; 8D
  dw TilemapTable02Terminator ; 8E
  dw TilemapTable02Terminator ; 8F
  dw TilemapTable02Terminator ; 90
  dw TilemapTable02Terminator ; 91
  dw TilemapTable02Terminator ; 92
  dw TilemapTable02Terminator ; 93
  dw TilemapTable02Terminator ; 94
  dw TilemapTable02Terminator ; 95
  dw TilemapTable02Terminator ; 96
  dw TilemapTable02Terminator ; 97
  dw TilemapTable02Terminator ; 98
  dw TilemapTable02Terminator ; 99
  dw TilemapTable02Terminator ; 9A
  dw TilemapTable02Terminator ; 9B
  dw TilemapTable02Terminator ; 9C
  dw TilemapTable02Terminator ; 9D
  dw TilemapTable02Terminator ; 9E
  dw TilemapTable02Terminator ; 9F
  dw TilemapTable02Terminator ; A0
  dw TilemapTable02Terminator ; A1
  dw TilemapTable02Terminator ; A2
  dw TilemapTable02Terminator ; A3
  dw TilemapTable02Terminator ; A4
  dw TilemapTable02Terminator ; A5
  dw TilemapTable02Terminator ; A6
  dw TilemapTable02Terminator ; A7
  dw TilemapTable02Terminator ; A8
  dw TilemapTable02Terminator ; A9
  dw TilemapTable02Terminator ; AA
  dw TilemapTable02Terminator ; AB
  dw TilemapTable02Terminator ; AC
  dw TilemapTable02Terminator ; AD
  dw TilemapTable02Terminator ; AE
  dw TilemapTable02Terminator ; AF
  dw TilemapTable02Terminator ; B0
  dw TilemapTable02Terminator ; B1
  dw TilemapTable02Terminator ; B2
  dw TilemapTable02Terminator ; B3
  dw TilemapTable02Terminator ; B4
  dw TilemapTable02Terminator ; B5
  dw TilemapTable02Terminator ; B6
  dw TilemapTable02Terminator ; B7
  dw TilemapTable02Terminator ; B8
  dw TilemapTable02Terminator ; B9
  dw TilemapTable02Terminator ; BA
  dw TilemapTable02Terminator ; BB
  dw TilemapTable02Terminator ; BC
  dw TilemapTable02Terminator ; BD
  dw TilemapTable02Terminator ; BE
  dw TilemapTable02Terminator ; BF
  dw TilemapTable02Terminator ; C0
  dw TilemapTable02Terminator ; C1
  dw TilemapTable02Terminator ; C2
  dw TilemapTable02Terminator ; C3
  dw TilemapTable02Terminator ; C4
  dw TilemapTable02Terminator ; C5
  dw TilemapTable02Terminator ; C6
  dw TilemapTable02Terminator ; C7
  dw TilemapTable02Terminator ; C8
  dw TilemapTable02Terminator ; C9
  dw TilemapTable02Terminator ; CA
  dw TilemapTable02Terminator ; CB
  dw TilemapTable02Terminator ; CC
  dw TilemapTable02Terminator ; CD
  dw TilemapTable02Terminator ; CE
  dw TilemapTable02Terminator ; CF
  dw TilemapTable02Terminator ; D0
  dw TilemapTable02Terminator ; D1
  dw TilemapTable02Terminator ; D2
  dw TilemapTable02Terminator ; D3
  dw TilemapTable02Terminator ; D4
  dw TilemapTable02Terminator ; D5
  dw TilemapTable02Terminator ; D6
  dw TilemapTable02Terminator ; D7
  dw TilemapTable02Terminator ; D8
  dw TilemapTable02Terminator ; D9
  dw TilemapTable02Terminator ; DA
  dw TilemapTable02Terminator ; DB
  dw TilemapTable02Terminator ; DC
  dw TilemapTable02Terminator ; DD
  dw TilemapTable02Terminator ; DE
  dw TilemapTable02Terminator ; DF
  dw TilemapTable02Terminator ; E0
  dw TilemapTable02Terminator ; E1
  dw TilemapTable02Terminator ; E2
  dw TilemapTable02Terminator ; E3
  dw TilemapTable02Terminator ; E4
  dw TilemapTable02Terminator ; E5
  dw TilemapTable02Terminator ; E6
  dw TilemapTable02Terminator ; E7
  dw TilemapTable02Terminator ; E8
  dw TilemapTable02Terminator ; E9
  dw TilemapTable02Terminator ; EA
  dw TilemapTable02Terminator ; EB
  dw TilemapTable02Terminator ; EC
  dw TilemapTable02Terminator ; ED
  dw TilemapTable02Terminator ; EE
  dw TilemapTable02Terminator ; EF
  dw TilemapTable02Terminator ; F0
  dw TilemapTable02Terminator ; F1
  dw TilemapTable02Terminator ; F2
  dw TilemapTable02Terminator ; F3
  dw TilemapTable02Terminator ; F4
  dw TilemapTable02Terminator ; F5
  dw TilemapTable02Terminator ; F6
  dw TilemapTable02Terminator ; F7
  dw TilemapTable02Terminator ; F8
  dw TilemapTable02Terminator ; F9
  dw TilemapTable02Terminator ; FA
  dw TilemapTable02Terminator ; FB
  dw TilemapTable02Terminator ; FC
  dw TilemapTable02Terminator ; FD
  dw TilemapTable02Terminator ; FE
  dw TilemapTable02Terminator ; FF
Tilemap02_00::
  INCBIN "./build/tilemaps/0049.map"
Tilemap02_01::
  INCBIN "./build/tilemaps/0201.map"
Tilemap02_02::
  INCBIN "./build/tilemaps/0202.map"
Tilemap02_69::
  INCBIN "./build/tilemaps/0269.map"
Tilemap02_6A::
  INCBIN "./build/tilemaps/026A.map"
Tilemap02_6B::
  INCBIN "./build/tilemaps/026B.map"
Tilemap02_6C::
  INCBIN "./build/tilemaps/026C.map"
Tilemap02_6D::
  INCBIN "./build/tilemaps/026D.map"
Tilemap02_6E::
  INCBIN "./build/tilemaps/026E.map"
Tilemap02_6F::
  INCBIN "./build/tilemaps/026F.map"
Tilemap02_70::
  INCBIN "./build/tilemaps/0270.map"
Tilemap02_71::
  INCBIN "./build/tilemaps/0271.map"
Tilemap02_72::
  INCBIN "./build/tilemaps/0272.map"
Tilemap02_73::
  INCBIN "./build/tilemaps/0273.map"
Tilemap02_74::
  INCBIN "./build/tilemaps/0274.map"
Tilemap02_75::
  INCBIN "./build/tilemaps/0275.map"
Tilemap02_76::
  INCBIN "./build/tilemaps/0276.map"
Tilemap02_77::
  INCBIN "./build/tilemaps/0277.map"
Tilemap02_78::
  INCBIN "./build/tilemaps/GlossaryScreen.map"
TilemapTable02Terminator::

SECTION "Tilemap Table 03", ROMX[$4000], BANK[$AB]
TilemapTable03::
  dw Tilemap03_00 ; 00
  dw Tilemap03_01 ; 01
  dw Tilemap03_02 ; 02
  dw Tilemap03_03 ; 03
  dw Tilemap03_04 ; 04
  dw Tilemap03_05 ; 05
  dw Tilemap03_06 ; 06
  dw Tilemap03_07 ; 07
  dw Tilemap03_08 ; 08
  dw Tilemap03_09 ; 09
  dw Tilemap03_0A ; 0A
  dw Tilemap03_0B ; 0B
  dw Tilemap03_0C ; 0C
  dw TilemapTable03Terminator ; 0D
  dw TilemapTable03Terminator ; 0E
  dw TilemapTable03Terminator ; 0F
  dw TilemapTable03Terminator ; 10
  dw TilemapTable03Terminator ; 11
  dw TilemapTable03Terminator ; 12
  dw TilemapTable03Terminator ; 13
  dw TilemapTable03Terminator ; 14
  dw TilemapTable03Terminator ; 15
  dw TilemapTable03Terminator ; 16
  dw TilemapTable03Terminator ; 17
  dw TilemapTable03Terminator ; 18
  dw TilemapTable03Terminator ; 19
  dw TilemapTable03Terminator ; 1A
  dw TilemapTable03Terminator ; 1B
  dw TilemapTable03Terminator ; 1C
  dw TilemapTable03Terminator ; 1D
  dw TilemapTable03Terminator ; 1E
  dw TilemapTable03Terminator ; 1F
  dw TilemapTable03Terminator ; 20
  dw TilemapTable03Terminator ; 21
  dw TilemapTable03Terminator ; 22
  dw TilemapTable03Terminator ; 23
  dw TilemapTable03Terminator ; 24
  dw TilemapTable03Terminator ; 25
  dw TilemapTable03Terminator ; 26
  dw TilemapTable03Terminator ; 27
  dw TilemapTable03Terminator ; 28
  dw TilemapTable03Terminator ; 29
  dw TilemapTable03Terminator ; 2A
  dw TilemapTable03Terminator ; 2B
  dw TilemapTable03Terminator ; 2C
  dw TilemapTable03Terminator ; 2D
  dw TilemapTable03Terminator ; 2E
  dw TilemapTable03Terminator ; 2F
  dw TilemapTable03Terminator ; 30
  dw TilemapTable03Terminator ; 31
  dw TilemapTable03Terminator ; 32
  dw TilemapTable03Terminator ; 33
  dw TilemapTable03Terminator ; 34
  dw TilemapTable03Terminator ; 35
  dw TilemapTable03Terminator ; 36
  dw TilemapTable03Terminator ; 37
  dw TilemapTable03Terminator ; 38
  dw TilemapTable03Terminator ; 39
  dw TilemapTable03Terminator ; 3A
  dw TilemapTable03Terminator ; 3B
  dw TilemapTable03Terminator ; 3C
  dw TilemapTable03Terminator ; 3D
  dw TilemapTable03Terminator ; 3E
  dw TilemapTable03Terminator ; 3F
  dw TilemapTable03Terminator ; 40
  dw TilemapTable03Terminator ; 41
  dw TilemapTable03Terminator ; 42
  dw TilemapTable03Terminator ; 43
  dw TilemapTable03Terminator ; 44
  dw TilemapTable03Terminator ; 45
  dw TilemapTable03Terminator ; 46
  dw TilemapTable03Terminator ; 47
  dw TilemapTable03Terminator ; 48
  dw TilemapTable03Terminator ; 49
  dw TilemapTable03Terminator ; 4A
  dw TilemapTable03Terminator ; 4B
  dw TilemapTable03Terminator ; 4C
  dw TilemapTable03Terminator ; 4D
  dw TilemapTable03Terminator ; 4E
  dw TilemapTable03Terminator ; 4F
  dw TilemapTable03Terminator ; 50
  dw TilemapTable03Terminator ; 51
  dw TilemapTable03Terminator ; 52
  dw TilemapTable03Terminator ; 53
  dw TilemapTable03Terminator ; 54
  dw TilemapTable03Terminator ; 55
  dw TilemapTable03Terminator ; 56
  dw TilemapTable03Terminator ; 57
  dw TilemapTable03Terminator ; 58
  dw TilemapTable03Terminator ; 59
  dw TilemapTable03Terminator ; 5A
  dw TilemapTable03Terminator ; 5B
  dw TilemapTable03Terminator ; 5C
  dw TilemapTable03Terminator ; 5D
  dw TilemapTable03Terminator ; 5E
  dw TilemapTable03Terminator ; 5F
  dw TilemapTable03Terminator ; 60
  dw TilemapTable03Terminator ; 61
  dw TilemapTable03Terminator ; 62
  dw TilemapTable03Terminator ; 63
  dw TilemapTable03Terminator ; 64
  dw TilemapTable03Terminator ; 65
  dw TilemapTable03Terminator ; 66
  dw TilemapTable03Terminator ; 67
  dw TilemapTable03Terminator ; 68
  dw TilemapTable03Terminator ; 69
  dw TilemapTable03Terminator ; 6A
  dw TilemapTable03Terminator ; 6B
  dw TilemapTable03Terminator ; 6C
  dw TilemapTable03Terminator ; 6D
  dw TilemapTable03Terminator ; 6E
  dw TilemapTable03Terminator ; 6F
  dw TilemapTable03Terminator ; 70
  dw TilemapTable03Terminator ; 71
  dw TilemapTable03Terminator ; 72
  dw TilemapTable03Terminator ; 73
  dw TilemapTable03Terminator ; 74
  dw TilemapTable03Terminator ; 75
  dw TilemapTable03Terminator ; 76
  dw TilemapTable03Terminator ; 77
  dw TilemapTable03Terminator ; 78
  dw TilemapTable03Terminator ; 79
  dw TilemapTable03Terminator ; 7A
  dw TilemapTable03Terminator ; 7B
  dw TilemapTable03Terminator ; 7C
  dw TilemapTable03Terminator ; 7D
  dw TilemapTable03Terminator ; 7E
  dw TilemapTable03Terminator ; 7F
  dw TilemapTable03Terminator ; 80
  dw TilemapTable03Terminator ; 81
  dw TilemapTable03Terminator ; 82
  dw TilemapTable03Terminator ; 83
  dw TilemapTable03Terminator ; 84
  dw TilemapTable03Terminator ; 85
  dw TilemapTable03Terminator ; 86
  dw TilemapTable03Terminator ; 87
  dw TilemapTable03Terminator ; 88
  dw TilemapTable03Terminator ; 89
  dw TilemapTable03Terminator ; 8A
  dw TilemapTable03Terminator ; 8B
  dw TilemapTable03Terminator ; 8C
  dw TilemapTable03Terminator ; 8D
  dw TilemapTable03Terminator ; 8E
  dw TilemapTable03Terminator ; 8F
  dw TilemapTable03Terminator ; 90
  dw TilemapTable03Terminator ; 91
  dw TilemapTable03Terminator ; 92
  dw TilemapTable03Terminator ; 93
  dw TilemapTable03Terminator ; 94
  dw TilemapTable03Terminator ; 95
  dw TilemapTable03Terminator ; 96
  dw TilemapTable03Terminator ; 97
  dw TilemapTable03Terminator ; 98
  dw TilemapTable03Terminator ; 99
  dw TilemapTable03Terminator ; 9A
  dw TilemapTable03Terminator ; 9B
  dw TilemapTable03Terminator ; 9C
  dw TilemapTable03Terminator ; 9D
  dw TilemapTable03Terminator ; 9E
  dw TilemapTable03Terminator ; 9F
  dw TilemapTable03Terminator ; A0
  dw TilemapTable03Terminator ; A1
  dw TilemapTable03Terminator ; A2
  dw TilemapTable03Terminator ; A3
  dw TilemapTable03Terminator ; A4
  dw TilemapTable03Terminator ; A5
  dw TilemapTable03Terminator ; A6
  dw TilemapTable03Terminator ; A7
  dw TilemapTable03Terminator ; A8
  dw TilemapTable03Terminator ; A9
  dw TilemapTable03Terminator ; AA
  dw TilemapTable03Terminator ; AB
  dw TilemapTable03Terminator ; AC
  dw TilemapTable03Terminator ; AD
  dw TilemapTable03Terminator ; AE
  dw TilemapTable03Terminator ; AF
  dw TilemapTable03Terminator ; B0
  dw TilemapTable03Terminator ; B1
  dw TilemapTable03Terminator ; B2
  dw TilemapTable03Terminator ; B3
  dw TilemapTable03Terminator ; B4
  dw TilemapTable03Terminator ; B5
  dw TilemapTable03Terminator ; B6
  dw TilemapTable03Terminator ; B7
  dw TilemapTable03Terminator ; B8
  dw TilemapTable03Terminator ; B9
  dw TilemapTable03Terminator ; BA
  dw TilemapTable03Terminator ; BB
  dw TilemapTable03Terminator ; BC
  dw TilemapTable03Terminator ; BD
  dw TilemapTable03Terminator ; BE
  dw TilemapTable03Terminator ; BF
  dw TilemapTable03Terminator ; C0
  dw TilemapTable03Terminator ; C1
  dw TilemapTable03Terminator ; C2
  dw TilemapTable03Terminator ; C3
  dw TilemapTable03Terminator ; C4
  dw TilemapTable03Terminator ; C5
  dw TilemapTable03Terminator ; C6
  dw TilemapTable03Terminator ; C7
  dw TilemapTable03Terminator ; C8
  dw TilemapTable03Terminator ; C9
  dw TilemapTable03Terminator ; CA
  dw TilemapTable03Terminator ; CB
  dw TilemapTable03Terminator ; CC
  dw TilemapTable03Terminator ; CD
  dw TilemapTable03Terminator ; CE
  dw TilemapTable03Terminator ; CF
  dw TilemapTable03Terminator ; D0
  dw TilemapTable03Terminator ; D1
  dw TilemapTable03Terminator ; D2
  dw TilemapTable03Terminator ; D3
  dw TilemapTable03Terminator ; D4
  dw TilemapTable03Terminator ; D5
  dw TilemapTable03Terminator ; D6
  dw TilemapTable03Terminator ; D7
  dw TilemapTable03Terminator ; D8
  dw TilemapTable03Terminator ; D9
  dw TilemapTable03Terminator ; DA
  dw TilemapTable03Terminator ; DB
  dw TilemapTable03Terminator ; DC
  dw TilemapTable03Terminator ; DD
  dw TilemapTable03Terminator ; DE
  dw TilemapTable03Terminator ; DF
  dw TilemapTable03Terminator ; E0
  dw TilemapTable03Terminator ; E1
  dw TilemapTable03Terminator ; E2
  dw TilemapTable03Terminator ; E3
  dw TilemapTable03Terminator ; E4
  dw TilemapTable03Terminator ; E5
  dw TilemapTable03Terminator ; E6
  dw TilemapTable03Terminator ; E7
  dw TilemapTable03Terminator ; E8
  dw TilemapTable03Terminator ; E9
  dw TilemapTable03Terminator ; EA
  dw TilemapTable03Terminator ; EB
  dw TilemapTable03Terminator ; EC
  dw TilemapTable03Terminator ; ED
  dw TilemapTable03Terminator ; EE
  dw TilemapTable03Terminator ; EF
  dw TilemapTable03Terminator ; F0
  dw TilemapTable03Terminator ; F1
  dw TilemapTable03Terminator ; F2
  dw TilemapTable03Terminator ; F3
  dw TilemapTable03Terminator ; F4
  dw TilemapTable03Terminator ; F5
  dw TilemapTable03Terminator ; F6
  dw TilemapTable03Terminator ; F7
  dw TilemapTable03Terminator ; F8
  dw TilemapTable03Terminator ; F9
  dw TilemapTable03Terminator ; FA
  dw TilemapTable03Terminator ; FB
  dw TilemapTable03Terminator ; FC
  dw TilemapTable03Terminator ; FD
  dw TilemapTable03Terminator ; FE
  dw TilemapTable03Terminator ; FF
Tilemap03_00::
  INCBIN "./build/tilemaps/0300.map"
Tilemap03_01::
  INCBIN "./build/tilemaps/0301.map"
Tilemap03_02::
  INCBIN "./build/tilemaps/0302.map"
Tilemap03_03::
  INCBIN "./build/tilemaps/0303.map"
Tilemap03_04::
  INCBIN "./build/tilemaps/0304.map"
Tilemap03_05::
  INCBIN "./build/tilemaps/0305.map"
Tilemap03_06::
  INCBIN "./build/tilemaps/0306.map"
Tilemap03_07::
  INCBIN "./build/tilemaps/0307.map"
Tilemap03_08::
  INCBIN "./build/tilemaps/0308.map"
Tilemap03_09::
  INCBIN "./build/tilemaps/0309.map"
Tilemap03_0A::
  INCBIN "./build/tilemaps/030A.map"
Tilemap03_0B::
  INCBIN "./build/tilemaps/030B.map"
Tilemap03_0C::
  INCBIN "./build/tilemaps/030C.map"
TilemapTable03Terminator::

