#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Logistic Assistant
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 2, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform UNIFORM_1;
_player addVest VEST_RFM;
_player addItemToVest HELMET_CAP;
_player addHeadgear HELMET_RFM;
_player addBackpackGlobal BACKPACK_COMPACT;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
_player addItemToVest "ACE_MapTools";
_player addItemToVest "ACE_key_west";

_player addItemToBackpack "Toolkit";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
for "_i" from 1 to 2 do {
    _player addItemToUniform "SmokeShell";
};
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addWeapon WEAPON_RFM;
WEAPON_RFM_STUFF apply {_player addWeaponItem [WEAPON_RFM, _x]};

for "_i" from 1 to 4 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 1: {
        _player addPrimaryWeaponItem "acc_flashlight";
        _player addItemToUniform "ACE_Flashlight_KSF1";
    };
    case 2: {
        _player addPrimaryWeaponItem "acc_pointer_IR";
        _player addItemToUniform "ACE_Flashlight_KSF1";
        _player linkItem "ACE_NVG_Wide";
    };
    default {};
};

/** SIDEARM */
_player addItemToVest WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addItemToVest WEAPON_HGUN_AMMO;

[_player, "KAT_Private"] call BISFUNC(setUnitInsignia);

true;