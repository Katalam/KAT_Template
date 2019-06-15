#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Vollständige Ausrüstungskiste
 */

params [["_box", objNull, [objNull]]];

// Waffen
_box addWeaponCargoGlobal ["launch_B_Titan_F", 1];
_box addWeaponCargoGlobal ["launch_B_Titan_short_F", 1];
_box addWeaponCargoGlobal ["launch_NLAW_F", 1];
_box addWeaponCargoGlobal ["launch_MRAWS_green_F", 1];
_box addWeaponCargoGlobal ["arifle_MXC_F", 1];
_box addWeaponCargoGlobal ["arifle_MX_F", 1];
_box addWeaponCargoGlobal ["arifle_MX_SW_F", 1];
_box addWeaponCargoGlobal ["arifle_MX_GL_F", 1];
_box addWeaponCargoGlobal ["arifle_MXM_Black_F", 1];
_box addWeaponCargoGlobal ["LMG_Mk200_F", 1];
_box addWeaponCargoGlobal ["MMG_02_black_F", 1];
_box addWeaponCargoGlobal ["SMG_01_F", 1];
_box addWeaponCargoGlobal ["srifle_LRR_camo_F", 1];

_box addWeaponCargoGlobal ["ACE_Vector", 1];
_box addWeaponCargoGlobal ["Binocular", 1];
_box addWeaponCargoGlobal ["Laserdesignator", 1];

_box addWeaponCargoGlobal ["hgun_Pistol_heavy_01_F", 1];

_box addBackpackCargoGlobal ["B_HMG_01_weapon_F", 1];
_box addBackpackCargoGlobal ["B_HMG_01_support_F", 1];

// Attachments
_box addItemCargoGlobal ["bipod_01_F_blk", 1];
_box addItemCargoGlobal ["bipod_01_F_snd", 1];
_box addItemCargoGlobal ["optic_MRD", 1];
_box addItemCargoGlobal ["optic_ACO_grn", 1];
_box addItemCargoGlobal ["optic_Hamr", 1];
_box addItemCargoGlobal ["optic_MRCO", 1];
_box addItemCargoGlobal ["optic_DMS", 1];
_box addItemCargoGlobal ["optic_LRPS", 1];
_box addItemCargoGlobal ["muzzle_snds_acp", 1];
_box addItemCargoGlobal ["acc_flashlight", 1];
_box addItemCargoGlobal ["acc_pointer_IR", 1];

// Munition
_box addMagazineCargoGlobal ["Titan_AT", 4];
_box addMagazineCargoGlobal ["Titan_AP", 2];
_box addMagazineCargoGlobal ["Titan_AA", 2];
_box addMagazineCargoGlobal ["MRAWS_HE_F", 2];
_box addMagazineCargoGlobal ["MRAWS_HEAT_F", 2];

_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 4];
_box addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer", 6];
_box addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer_red", 4];
_box addMagazineCargoGlobal ["130Rnd_338_Mag", 6];
_box addMagazineCargoGlobal ["30Rnd_45ACP_Mag_SMG_01", 4];
_box addMagazineCargoGlobal ["7Rnd_408_Mag", 5];

_box addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 12];
_box addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
_box addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 8];
_box addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 8];
_box addMagazineCargoGlobal ["UGL_FlareYellow_F", 12];

_box addMagazineCargoGlobal ["11Rnd_45ACP_Mag", 2];

// Throwables
_box addItemCargoGlobal ["SmokeShell", 8];
_box addItemCargoGlobal ["SmokeShellGreen", 8];
_box addItemCargoGlobal ["SmokeShellOrange", 8];
_box addItemCargoGlobal ["SmokeShellRed", 8];
_box addItemCargoGlobal ["MiniGrenade", 8];
_box addItemCargoGlobal ["ACE_HandFlare_Yellow", 8];
_box addItemCargoGlobal ["ACE_M84", 8];
_box addItemCargoGlobal ["ACE_M14", 8];
_box addItemCargoGlobal ["ACE_IR_Strobe_Item", 8];

// Medical
_box addItemCargoGlobal ["ACE_fieldDressing", 56];
_box addItemCargoGlobal ["ACE_elasticBandage", 48];
_box addItemCargoGlobal ["ACE_packingBandage", 24];

_box addItemCargoGlobal ["ACE_tourniquet", 6];

_box addItemCargoGlobal ["ACE_morphine", 12];
_box addItemCargoGlobal ["ACE_epinephrine", 12];
_box addItemCargoGlobal ["ACE_adenosine", 4];
_box addItemCargoGlobal ["ACE_atropine", 4];

_box addItemCargoGlobal ["ACE_salineIV_500", 14];
_box addItemCargoGlobal ["ACE_plasmaIV_500", 18];

_box addItemCargoGlobal ["adv_aceCPR_AED", 1];
_box addItemCargoGlobal ["ACE_surgicalKit", 1];
_box addItemCargoGlobal ["ACE_personalAidKit", 1];
_box addItemCargoGlobal ["ACE_bodyBag", 2];

_box addItemCargoGlobal ["adv_aceRefill_FAK", 10];
_box addItemCargoGlobal ["adv_aceRefill_manualKit", 2];

// Items
_box addItemCargoGlobal ["ACE_SpareBarrel", 1];
_box addItemCargoGlobal ["Laserbatteries", 1];
_box addItemCargoGlobal ["ACE_EntrenchingTool", 1];
_box addItemCargoGlobal ["ACE_Clacker", 1];
_box addItemCargoGlobal ["ACE_DefusalKit", 1];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
_box addItemCargoGlobal ["AMP_Breaching_Charge_Mag", 4];
_box addItemCargoGlobal ["ACE_CableTie", 10];
_box addItemCargoGlobal ["ACE_Flashlight_KSF1", 1];
_box addItemCargoGlobal ["ACE_Flashlight_XL50", 1];
_box addItemCargoGlobal ["ItemcTabHCam", 2];
_box addItemCargoGlobal ["ACE_RangeCard", 1];
_box addItemCargoGlobal ["ACE_wirecutter", 1];
_box addItemCargoGlobal ["SAN_Headlamp_v1", 1];
_box addItemCargoGlobal ["SAN_Headlamp_v2", 1];
_box addItemCargoGlobal ["ToolKit", 1];
_box addItemCargoGlobal ["ACE_NVG_Wide", 1];
_box addItemCargoGlobal ["G_Combat", 1];

// COMMs
_box addItemCargoGlobal ["ItemMap", 1];
_box addItemCargoGlobal ["ItemCompass", 1];
_box addItemCargoGlobal ["ItemWatch", 1];
_box addItemCargoGlobal ["TFAR_rf7800str", 1];
_box addItemCargoGlobal ["TFAR_anprc152", 1];
_box addItemCargoGlobal ["ACE_MapTools", 1];
_box addItemCargoGlobal ["ACE_key_west", 1];
_box addItemCargoGlobal ["ItemAndroid", 1];
_box addItemCargoGlobal ["ItemcTab", 1];
_box addItemCargoGlobal ["ItemMicroDAGR", 1];
_box addBackpackCargoGlobal ["tfar_rt1523g_big_rhs", 1];
_box addBackpackCargoGlobal ["TFAR_rt1523g_rhs", 1];
_box addBackpackCargoGlobal ["TFAR_anarc210", 1];

// Garderobe
_box addItemCargoGlobal ["H_HelmetB", 1];
_box addItemCargoGlobal ["H_HelmetB_sand", 1];
_box addItemCargoGlobal ["H_HelmetSpecB", 1];
_box addItemCargoGlobal ["H_HelmetSpecB_blk", 1];
_box addItemCargoGlobal ["H_HelmetB", 1];
_box addItemCargoGlobal ["H_Cap_oli", 1];
_box addItemCargoGlobal ["U_B_CombatUniform_mcam", 1];
_box addItemCargoGlobal ["V_PlateCarrier2_rgr", 1];
_box addBackpackCargoGlobal ["B_Kitbag_cbr", 1];
_box addBackpackCargoGlobal ["B_Kitbag_rgr", 1];
_box addBackpackCargoGlobal ["B_Assaultpack_blk", 1];
_box addBackpackCargoGlobal ["B_AssaultPack_rgr", 1];
_box addBackpackCargoGlobal ["B_Parachute", 1];

true;
