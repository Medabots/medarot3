INCLUDE "game/src/common/hardware.inc"
INCLUDE "game/src/common/joypad.inc"
; Symbol prefix guide:
; X = 0000 to 7FFF (write mode only)
; V = 8000 to 9FFF (VRAM)
; S = A000 to BFFF (SRAM)
; W = C000 to DFFF (WRAM)
; O = FE00 to FE9F (OAM)
; H = FF00 to FFFF (HRAM and I/O, basically any address ldh works with)
; M = for symbolising values

DEF H_PushOAM             EQU $ff80

DEF H_VBlankCompleted     EQU $ff92
DEF H_SoundEffect         EQU $ffa1
DEF H_SoundSampleSelect   EQU $ffa8

DEF M_MedarotSlotLength   EQU $10

DEF M_MedarotEquipState   EQU $0
DEF M_MedarotType         EQU $1
DEF M_MedarotMedal        EQU $2
DEF M_MedarotHead         EQU $3
DEF M_MedarotLeftArm      EQU $4
DEF M_MedarotRightArm     EQU $5
DEF M_MedarotLegs         EQU $6
DEF M_MedarotPalette      EQU $7

DEF M_MedalSlotLength     EQU $40

DEF M_MedalStatus         EQU $0
DEF M_MedalType           EQU $1
DEF M_MedalExpLower       EQU $2
DEF M_MedalExpUpper       EQU $3
DEF M_MedalImage          EQU $4
DEF M_MedalMedaforceA     EQU $5
DEF M_MedalMedaforceB     EQU $6
DEF M_MedalMedaforceC     EQU $7
DEF M_MedalAttribute      EQU $8
DEF M_MedalLevel          EQU $9
DEF M_MedalPersonality    EQU $A
DEF M_MedalCompatibility  EQU $B
DEF M_MedalSkillAIndex    EQU $19
DEF M_MedalSkillAUses     EQU $1A
DEF M_MedalSkillAExp      EQU $1B
DEF M_MedalSkillAPadding  EQU $1C
DEF M_MedalSkillBIndex    EQU $1D
DEF M_MedalSkillBUses     EQU $1E
DEF M_MedalSkillBExp      EQU $1F
DEF M_MedalSkillBPadding  EQU $20
DEF M_MedalSkillCIndex    EQU $21
DEF M_MedalSkillCUses     EQU $22
DEF M_MedalSkillCExp      EQU $23
DEF M_MedalMedaliaAStatus EQU $24
DEF M_MedalMedaliaASkill  EQU $25
DEF M_MedalMedaliaAUses   EQU $26
DEF M_MedalMedaliaAExp    EQU $27
DEF M_MedalMedaliaBStatus EQU $28
DEF M_MedalMedaliaBSkill  EQU $29
DEF M_MedalMedaliaBUses   EQU $2A
DEF M_MedalMedaliaBExp    EQU $2B
DEF M_MedalMedaliaCStatus EQU $2C
DEF M_MedalMedaliaCSkill  EQU $2D
DEF M_MedalMedaliaCUses   EQU $2E
DEF M_MedalMedaliaCExp    EQU $2F
DEF M_MedalNickname       EQU $30

DEF M_CreditConfigLength    EQU $0C
DEF M_CreditConfigAniIndex  EQU $00
DEF M_CreditConfigDirection EQU $01
DEF M_CreditConfigTimer     EQU $02
DEF M_CreditConfigActIndex  EQU $03
DEF M_CreditConfigPageNum   EQU $04
DEF M_CreditConfigTextIndex EQU $05

DEF M_CreditTextConfigYPos        EQU $00
DEF M_CreditTextConfigXPos        EQU $01
DEF M_CreditTextConfigPalette     EQU $03
DEF M_CreditTextConfigText        EQU $04
