#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Autorifleman
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform UNIFORM_LMG;
_player addVest VEST_RFM;
_player addHeadgear HELMET_RFM;
_player addBackpackGlobal BACKPACK_COMPACT;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemMicroDAGR";
_player addItemToUniform "ACE_microDAGR";
_player linkItem "TFAR_rf7800str";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
for "_i" from 1 to 2 do {
    _player addItemToUniform "SmokeShell";
};
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addWeapon WEAPON_LMG;
WEAPON_LMG_STUFF apply {_player addWeaponItem [WEAPON_LMG, _x]};

for "_i" from 1 to 2 do {
    _player addItemToVest WEAPON_LMG_AMMO;
    _player addItemToBackpack WEAPON_LMG_AMMO;
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 1: {
        _player addPrimaryWeaponItem FLASHLIGHT(WEAPON_LMG_NVG);
        _player addItemToUniform "ACE_Flashlight_XL50";
    };
    case 2: {
        _player addPrimaryWeaponItem LASER(WEAPON_LMG_NVG);
        _player addItemToUniform "ACE_Flashlight_XL50";
        _player linkItem NVG_RFM;
    };
    default {};
};

/** SIDEARM */
_player addItemToVest WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addItemToVest WEAPON_HGUN_AMMO;

[_player, "KAT_Private"] call BISFUNC(setUnitInsignia);

true;
