#include "..\script_component.hpp"

// Weapons
#define WEAPON_RFM QUOTE(arifle_MX_F)
#define WEAPON_RFM_AMMO QUOTE(ACE_30Rnd_65x39_mx_yellow)
#define WEAPON_RFM_STUFF [QUOTE(optic_Hamr),WEAPON_RFM_AMMO]
// first one is the flashlight, second laser
#define WEAPON_RFM_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]
// leave them
#define LASER(var1) (var1 select 1)
#define FLASHLIGHT(var1) (var1 select 0)

#define WEAPON_UGL QUOTE(arifle_MX_GL_F)
#define WEAPON_UGL_AMMO QUOTE(1Rnd_HE_Grenade_shell)
#define WEAPON_UGL_STUFF [QUOTE(optic_Hamr),WEAPON_RFM_AMMO,WEAPON_UGL_AMMO]
#define WEAPON_UGL_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]

#define WEAPON_CRW QUOTE(arifle_MXC_F)
#define WEAPON_CRW_STUFF [QUOTE(optic_Holosight),WEAPON_RFM_AMMO]
#define WEAPON_CRW_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]

#define WEAPON_MKM QUOTE(srifle_EBR_F)
#define WEAPON_MKM_AMMO QUOTE(20Rnd_762x51_Mag)
#define WEAPON_MKM_STUFF [QUOTE(optic_DMS),QUOTE(muzzle_snds_B),QUOTE(bipod_01_F_blk),WEAPON_MKM_AMMO]
#define WEAPON_MKM_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]

#define WEAPON_LMG QUOTE(LMG_Mk200_black_F)
#define WEAPON_LMG_AMMO QUOTE(ACE_200Rnd_65x39_cased_Box_green)
#define WEAPON_LMG_STUFF [QUOTE(optic_Holosight),QUOTE(bipod_01_F_blk),WEAPON_LMG_AMMO]
#define WEAPON_LMG_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]

#define WEAPON_MMG QUOTE(MMG_02_sand_F)
#define WEAPON_MMG_AMMO QUOTE(130Rnd_338_Mag)
#define WEAPON_MMG_STUFF [QUOTE(bipod_01_F_snd),WEAPON_MMG_AMMO]
#define WEAPON_MMG_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]

#define WEAPON_SMG QUOTE(SMG_01_F)
#define WEAPON_SMG_AMMO QUOTE(30Rnd_45ACP_Mag_SMG_01)
#define WEAPON_SMG_STUFF [WEAPON_LMG_AMMO]
#define WEAPON_SMG_NVG [QUOTE(acc_flashlight)]

#define WEAPON_SNI QUOTE(srifle_DMR_02_sniper_F)
#define WEAPON_SNI_AMMO [QUOTE(10Rnd_338_Mag),10]
#define WEAPON_SNI_STUFF [QUOTE(optic_LRPS),QUOTE(muzzle_snds_338_sand),QUOTE(bipod_01_F_snd)]
#define WEAPON_SNI_NVG [QUOTE(acc_flashlight),QUOTE(acc_pointer_ir)]

#define WEAPON_HGUN QUOTE(hgun_Pistol_heavy_01_F)
#define WEAPON_HGUN_AMMO QUOTE(11Rnd_45ACP_Mag)
#define WEAPON_HGUN_SCOPE QUOTE(optic_MRD)
#define WEAPON_HGUN_SILENCER QUOTE(muzzle_snds_acp)

#define WEAPON_LAUNCHER QUOTE(launch_MRAWS_sand_F)
#define WEAPON_LAUNCHER_AMMO_HEAT QUOTE(MRAWS_HEAT_F)
#define WEAPON_LAUNCHER_AMMO_HE QUOTE(MRAWS_HE_F)

#define WEAPON_HLAUNCHER QUOTE(launch_B_Titan_short_F)
#define WEAPON_HLAUNCHER_AMMO_AT QUOTE(Titan_AT)
#define WEAPON_HLAUNCHER_AMMO_AP QUOTE(Titan_AP)

// Uniforms
#define UNIFORM_RFM selectRandom[QUOTE(U_B_CombatUniform_mcam),QUOTE(U_B_CombatUniform_mcam_vest),QUOTE(U_B_CombatUniform_mcam_worn)]
#define UNIFORM_LMG QUOTE(U_B_CombatUniform_mcam_tshirt)
#define UNIFORM_HELI QUOTE(U_B_HeliPilotCoveralls)

// Vests
#define VEST_RFM QUOTE(V_PlateCarrier2_rgr)
#define VEST_CRW QUOTE(V_TacVest_oli)
#define VEST_HELI QUOTE(V_TacVest_blk)

// Backpacks
#define BACKPACK_COMPACT QUOTE(B_AssaultPack_khk)
#define BACKPACK_KITBAG QUOTE(B_Kitbag_rgr)
#define BACKPACK_CARRYALL QUOTE(B_Carryall_khk)

// Helmets
#define HELMET_RFM selectRandom[QUOTE(H_HelmetB),QUOTE(H_HelmetB_black),QUOTE(H_HelmetB_desert),QUOTE(H_HelmetB_grass),QUOTE(H_HelmetB_sand),QUOTE(H_HelmetB_snakeskin)]
#define HELMET_SQL selectRandom[QUOTE(H_HelmetSpecB),QUOTE(H_HelmetSpecB_blk),QUOTE(H_HelmetSpecB_paint2),QUOTE(H_HelmetSpecB_paint1),QUOTE(H_HelmetSpecB_sand),QUOTE(H_HelmetSpecB_snakeskin)]
#define HELMET_CRW QUOTE(H_HelmetCrew_I)

#define HELMET_BERET QUOTE(H_Beret_02)

#define HELMET_CAP QUOTE(H_Cap_oli)
#define HELMET_HELI_PIL QUOTE(H_PilotHelmetHeli_B)
#define HELMET_HELI_CRW QUOTE(H_CrewHelmetHeli_B)

// Nightvision
#define NVG_RFM QUOTE(ACE_NVG_Wide)

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
