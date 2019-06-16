#include "..\script_component.hpp"

// Uniforms
#define UNIFORM_YELLOW QUOTE(TTT_Uniform_Yellow_US_Desert)
#define UNIFORM_GREEN QUOTE(TTT_Uniform_Green_US_Desert)
#define UNIFORM_RED QUOTE(TTT_Uniform_Red_US_Desert)
#define UNIFORM_BLACK QUOTE(TTT_Uniform_Black_US_Desert)
#define UNIFORM_SILVER QUOTE(TTT_Uniform_Silver_US_Desert)
#define UNIFORM_WHITE QUOTE(TTT_Uniform_White_US_Desert)
#define UNIFORM_BRONZE QUOTE(TTT_Uniform_Bronze_US_Desert)
#define UNIFORM_BLUE QUOTE(TTT_Uniform_Blue_US_Desert)
#define UNIFORM_VIOLET QUOTE(TTT_Uniform_Violet_US_Desert)
#define UNIFORM_BLACK QUOTE(TTT_Uniform_Black_US_Desert)

// Vests
#define VEST_YELLOW QUOTE(TTT_Vest_Heavy_Yellow_US_Desert)
#define VEST_GREEN QUOTE(TTT_Vest_Heavy_Green_US_Desert)
#define VEST_RED QUOTE(TTT_Vest_Heavy_Red_US_Desert)
#define VEST_BLACK QUOTE(TTT_Vest_Heavy_Black_US_Desert)
#define VEST_SILVER QUOTE(TTT_Vest_Heavy_Silver_US_Desert)
#define VEST_WHITE QUOTE(TTT_Vest_Heavy_White_US_Desert)
#define VEST_BRONZE QUOTE(TTT_Vest_Heavy_Bronze_US_Desert)
#define VEST_BLUE QUOTE(TTT_Vest_Heavy_Blue_US_Desert)
#define VEST_VIOLET QUOTE(TTT_Vest_Heavy_Violet_US_Desert)
#define VEST_BLACK QUOTE(TTT_Vest_Heavy_Black_US_Desert)
#define VEST_CRW QUOTE(TTT_Vest_Crew_US_Desert)

// Backpacks
#define BACKPACK_COMPACT QUOTE(B_AssaultPack_cbr)
#define BACKPACK_KITBAG QUOTE(B_Kitbag_cbr)
#define BACKPACK_CARRYALL QUOTE(B_Carryall_cbr)

// Helmets
#define HELMET_1 QUOTE(TTT_Helmet_1_US_Desert)
#define HELMET_2 QUOTE(TTT_Helmet_2_US_Desert)
#define HELMET_3 QUOTE(TTT_Helmet_3_US_Desert)
#define HELMET_4 QUOTE(TTT_Helmet_4_US_Desert)
#define HELMET_5 QUOTE(TTT_Helmet_5_US_Desert)
#define HELMET_6 QUOTE(TTT_Helmet_6_US_Desert)
#define HELMET_7 QUOTE(TTT_Helmet_7_US_Desert)
#define HELMET_8 QUOTE(TTT_Helmet_8_US_Desert)
#define HELMET_CRW QUOTE(TTT_Helmet6_Vehiclecrew)

#define HELMET_YELLOW QUOTE(TTT_Beret_Yellow)
#define HELMET_GREEN QUOTE(TTT_Beret_Green)
#define HELMET_RED QUOTE(TTT_Beret_Red)
#define HELMET_BLACK QUOTE(TTT_Beret_Black)
#define HELMET_SILVER QUOTE(TTT_Beret_Silver)
#define HELMET_WHITE QUOTE(TTT_Beret_White)
#define HELMET_BRONZE QUOTE(TTT_Beret_Bronze)
#define HELMET_BLUE QUOTE(TTT_Beret_Blue)
#define HELMET_VIOLET QUOTE(TTT_Beret_Yiolet)

#define HELMET_CAP QUOTE(H_Cap_oli)
#define HELMET_HELI [ARR_3(QUOTE(TTT_Helmet_Eagle),QUOTE(TTT_Helmet_Falcon),QUOTE(TTT_Helmet_Hawk))]

// Medical
#define MEDICAL_RFM \
for "_i" from 1 to 10 do {\
    _player addItemToUniform "ACE_packingBandage";\
};\
for "_i" from 1 to 8 do {\
    _player addItemToUniform "ACE_elasticBandage";\
};\
for "_i" from 1 to 2 do {\
    _player addItemToUniform "ACE_tourniquet";\
};\
_player addItemToUniform "ACE_morphine";\
_player addItemToUniform "ACE_salineIV_500"

#define MEDICAL_MED \
for "_i" from 1 to 32 do {\
    _player addItemToBackpack "ACE_packingBandage";\
    _player addItemToBackpack "ACE_elasticBandage";\
};\
for "_i" from 1 to 6 do {\
    _player addItemToVest "ACE_morphine";\
};\
for "_i" from 1 to 8 do {\
    _player addItemToVest "ACE_epinephrine";\
};\
_player addItemToVest "adv_aceCPR_AED";\
for "_i" from 1 to 2 do {\
    _player addItemToBackpack "ACE_morphine";\
};\
for "_i" from 1 to 12 do {\
    _player addItemToBackpack "ACE_plasmaIV_500";\
};\
for "_i" from 1 to 4 do {\
    _player addItemToBackpack "ACE_tourniquet";\
}

// Weapons
#define WEAPON_RFM QUOTE(arifle_MX_F)
#define WEAPON_RFM_AMMO QUOTE(ACE_30Rnd_65x39_mx_yellow)
#define WEAPON_RFM_STUFF [ARR_2(QUOTE(optic_Hamr),WEAPON_RFM_AMMO)]

#define WEAPON_UGL QUOTE(arifle_MX_GL_F)
#define WEAPON_UGL_AMMO QUOTE(1Rnd_HE_Grenade_shell)
#define WEAPON_UGL_STUFF [ARR_3(QUOTE(optic_Hamr),WEAPON_RFM_AMMO,WEAPON_UGL_AMMO)]

#define WEAPON_CRW QUOTE(arifle_MXC_F)
#define WEAPON_CRW_STUFF [ARR_2(QUOTE(optic_Holosight),WEAPON_RFM_AMMO)]

#define WEAPON_MKM QUOTE(srifle_EBR_F)
#define WEAPON_MKM_AMMO QUOTE(20Rnd_762x51_Mag)
#define WEAPON_MKM_STUFF [ARR_3(QUOTE(optic_DMS),QUOTE(muzzle_snds_B),QUOTE(bipod_01_F_blk),WEAPON_MKM_AMMO)]

#define WEAPON_LMG QUOTE(LMG_Mk200_F)
#define WEAPON_LMG_AMMO QUOTE(ACE_200Rnd_65x39_cased_Box_green)
#define WEAPON_LMG_STUFF [ARR_3(QUOTE(optic_Holosight),QUOTE(bipod_01_F_blk),WEAPON_LMG_AMMO)]

#define WEAPON_MMG QUOTE(MMG_02_sand_F)
#define WEAPON_MMG_AMMO QUOTE(130Rnd_338_Mag)
#define WEAPON_MMG_STUFF [ARR_2(QUOTE(bipod_01_F_snd),WEAPON_MMG_AMMO)]

#define WEAPON_SMG QUOTE(SMG_01_F)
#define WEAPON_SMG_AMMO QUOTE(30Rnd_45ACP_Mag_SMG_01)
#define WEAPON_SMG_STUFF [ARR_1(WEAPON_LMG_AMMO)]

#define WEAPON_HGUN QUOTE(hgun_Pistol_heavy_01_F)
#define WEAPON_HGUN_AMMO QUOTE(11Rnd_45ACP_Mag)

#define WEAPON_SNI QUOTE(srifle_DMR_02_sniper_F)
#define WEAPON_SNI_AMMO [ARR_2(QUOTE(10Rnd_338_Mag),10)]
#define WEAPON_SNI_STUFF [ARR_3(QUOTE(optic_LRPS),QUOTE(muzzle_snds_338_sand),QUOTE(bipod_01_F_snd))]

#define WEAPON_LAUNCHER QUOTE(launch_MRAWS_sand_F)
#define WEAPON_LAUNCHER_AMMO_HEAT QUOTE(MRAWS_HEAT_F)
#define WEAPON_LAUNCHER_AMMO_HE QUOTE(MRAWS_HE_F)

#define WEAPON_HLAUNCHER QUOTE(launch_B_Titan_short_F)
#define WEAPON_HLAUNCHER_AMMO_AT QUOTE(Titan_AT)
#define WEAPON_HLAUNCHER_AMMO_AP QUOTE(Titan_AP)
