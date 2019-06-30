#include "..\script_component.hpp"

// Uniforms
#define UNIFORM_1 QUOTE(rhs_uniform_FROG01_d)

// Vests
#define VEST_EMP QUOTE(rhsusf_spc)
#define VEST_MED QUOTE(rhsusf_spc_corpsman)
#define VEST_CRW QUOTE(rhsusf_spc_crewman)
#define VEST_RFM QUOTE(rhsusf_spc_iar)
#define VEST_FTL QUOTE(rhsusf_spc_teamleader)
#define VEST_SQL QUOTE(rhsusf_spc_squadleader)

// Backpacks
#define BACKPACK_COMPACT QUOTE(B_AssaultPack_cbr)
#define BACKPACK_KITBAG QUOTE(B_Kitbag_cbr)
#define BACKPACK_CARRYALL QUOTE(B_Carryall_cbr)

// Helmets
#define HELMET_RFM QUOTE(rhsusf_lwh_helmet_marpatd)
#define HELMET_SQL QUOTE(rhsusf_lwh_helmet_marpatd_headset)

#define HELMET_CAP QUOTE(rhs_8point_marpatd)

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
#define WEAPON_RFM QUOTE(hlc_rifle_M27IAR)
#define WEAPON_RFM_AMMO QUOTE(rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red)
#define WEAPON_RFM_STUFF [ARR_3(QUOTE(rhsusf_acc_ACOG_MDO),QUOTE(rhsusf_acc_harris_bipod),WEAPON_RFM_AMMO)]

#define WEAPON_UGL QUOTE(rhs_weap_M320)
#define WEAPON_UGL_AMMO QUOTE(1Rnd_HE_Grenade_shell)

#define WEAPON_MKM_STUFF [ARR_4(QUOTE(optic_AMS),QUOTE(hlc_muzzle_556NATO_rotexiiic_grey),QUOTE(rhsusf_acc_harris_bipod),WEAPON_RFM_AMMO)]

#define WEAPON_HGUN QUOTE(hlc_pistol_P226R_Combat)
#define WEAPON_HGUN_AMMO QUOTE(hlc_15Rnd_9x19_B_P226)

#define WEAPON_LAUNCHER QUOTE(launch_MRAWS_olive_F)
#define WEAPON_LAUNCHER_AMMO_HEAT QUOTE(MRAWS_HEAT_F)
#define WEAPON_LAUNCHER_AMMO_HE QUOTE(MRAWS_HE_F)

// East
#define EAST_UNIFORM [ARR_2(QUOTE(rhssaf_uniform_m10_digital),QUOTE(rhssaf_uniform_m10_digital_summer))]
#define EAST_VEST [ARR_6(QUOTE(rhssaf_vest_md99_digital),QUOTE(rhssaf_vest_md99_digital_radio),QUOTE(rhssaf_vest_md99_digital_rifleman),QUOTE(rhssaf_vest_md99_digital_rifleman_radio),QUOTE(rhssaf_vest_md12_digital_desert),QUOTE(rhssaf_vest_md12_m70_rifleman))]
#define EAST_HELMET [ARR_3(QUOTE(rhssaf_helmet_m97_digital),QUOTE(rhssaf_helmet_m97_digital_black_ess),QUOTE(rhssaf_helmet_m97_digital_black_ess_bare))]
#define EAST_BACKPACK QUOTE(rhs_assault_umbts)

#define EAST_WEAPON QUOTE(hlc_rifle_G36A1)
#define EAST_AMMO QUOTE(hlc_30rnd_556x45_EPR_G36)

#define EAST_LMG QUOTE(hlc_lmg_MG3_100rnd)
#define EAST_LMG_AMMO QUOTE(hlc_50Rnd_762x51_Barrier_MG3)

// Civilian
#define CIV_UNIFORM [ARR_6(QUOTE(U_I_C_Soldier_Bandit_3_F),QUOTE(U_I_C_Soldier_Bandit_5_F),QUOTE(U_I_C_Soldier_Bandit_2_F),QUOTE(U_I_C_Soldier_Bandit_1_F),QUOTE(U_I_C_Soldier_Bandit_4_F),QUOTE(U_C_Man_casual_2_F))]
