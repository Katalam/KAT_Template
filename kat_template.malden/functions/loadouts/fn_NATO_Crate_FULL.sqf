#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Vollständige Ausrüstungskiste
 */

params [["_box", objNull, [objNull]]];

// Waffen
_box addWeaponCargoGlobal [WEAPON_RFM, 1];
_box addWeaponCargoGlobal [WEAPON_UGL, 1];
_box addWeaponCargoGlobal [WEAPON_CRW, 1];
_box addWeaponCargoGlobal [WEAPON_MKM, 1];
_box addWeaponCargoGlobal [WEAPON_LMG, 1];
_box addWeaponCargoGlobal [WEAPON_MMG, 1];
_box addWeaponCargoGlobal [WEAPON_SMG, 1];
_box addWeaponCargoGlobal [WEAPON_HGUN, 1];
_box addWeaponCargoGlobal [WEAPON_LAUNCHER, 1];
_box addWeaponCargoGlobal [WEAPON_HLAUNCHER, 1];

_box addWeaponCargoGlobal ["ACE_Vector", 1];
_box addWeaponCargoGlobal ["Binocular", 1];
_box addWeaponCargoGlobal ["Laserdesignator", 1];

// Munition
_box addMagazineCargoGlobal [WEAPON_HLAUNCHER_AMMO_AT, 4];
_box addMagazineCargoGlobal [WEAPON_HLAUNCHER_AMMO_AP, 2];
_box addMagazineCargoGlobal [WEAPON_LAUNCHER_AMMO_HEAT, 2];
_box addMagazineCargoGlobal [WEAPON_LAUNCHER_AMMO_HE, 2];

_box addMagazineCargoGlobal [WEAPON_RFM_AMMO, 20];
_box addMagazineCargoGlobal [WEAPON_UGL_AMMO, 12];
_box addMagazineCargoGlobal [WEAPON_MKM_AMMO, 6];
_box addMagazineCargoGlobal [WEAPON_LMG_AMMO, 4];
_box addMagazineCargoGlobal [WEAPON_MMG_AMMO, 6];
_box addMagazineCargoGlobal [WEAPON_SMG_AMMO, 4];
_box addMagazineCargoGlobal [WEAPON_HGUN_AMMO, 2];
_box addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
_box addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 8];
_box addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 8];
_box addMagazineCargoGlobal ["UGL_FlareYellow_F", 12];

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

// Items
_box addItemCargoGlobal ["ACE_SpareBarrel", 1];
_box addItemCargoGlobal ["Laserbatteries", 1];
_box addItemCargoGlobal ["ACE_EntrenchingTool", 1];
_box addItemCargoGlobal ["ACE_Clacker", 1];
_box addItemCargoGlobal ["ACE_DefusalKit", 1];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
_box addItemCargoGlobal ["ACE_CableTie", 10];
_box addItemCargoGlobal ["ACE_Flashlight_KSF1", 1];
_box addItemCargoGlobal ["ACE_Flashlight_XL50", 1];
_box addItemCargoGlobal ["ItemcTabHCam", 2];
_box addItemCargoGlobal ["ACE_RangeCard", 1];
_box addItemCargoGlobal ["ACE_wirecutter", 1];
_box addItemCargoGlobal ["ToolKit", 1];
_box addItemCargoGlobal ["ACE_NVG_Wide", 1];

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
_box addItemCargoGlobal [HELMET_1, 1];
_box addItemCargoGlobal [HELMET_RED, 1];
_box addItemCargoGlobal [HELMET_CAP, 1];
_box addItemCargoGlobal [UNIFORM_RED, 1];
_box addItemCargoGlobal [VEST_RED, 1];
_box addBackpackCargoGlobal [BACKPACK_COMPACT, 1];
_box addBackpackCargoGlobal [BACKPACK_KITBAG, 1];
_box addBackpackCargoGlobal [BACKPACK_CARRYALL, 1];
_box addBackpackCargoGlobal ["B_Parachute", 1];

true;
