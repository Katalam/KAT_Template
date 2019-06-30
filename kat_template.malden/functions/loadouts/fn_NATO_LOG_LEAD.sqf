#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Logistic Leader
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 2, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 2, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform UNIFORM_SILVER;
_player addVest VEST_CRW;
_player addItemToVest HELMET_CAP;
_player addHeadgear HELMET_3;

/** COMMS */
_player addBackpackGlobal "tfar_rt1523g_big_rhs";
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
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addWeapon WEAPON_CRW;
WEAPON_CRW_STUFF apply {_player addWeaponItem [WEAPON_CRW, _x]};

for "_i" from 1 to 4 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 1: {
        _player addPrimaryWeaponItem "acc_flashlight";
        _player addItemToUniform "ACE_HandFlare_Yellow";
        _player addItemToUniform "ACE_Flashlight_KSF1";
    };
    case 2: {
        _player addPrimaryWeaponItem "acc_pointer_IR";
        _player addItemToUniform "ACE_Flashlight_KSF1";
        _player linkItem "ACE_NVG_Wide";
        _player addItemToUniform "ACE_IR_Strobe_Item";
    };
    default {
        _player addItemToUniform "SmokeShellOrange";
    };
};

/** SIDEARM */
_player addItemToUniform WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addItemToUniform WEAPON_HGUN_AMMO;

[_player, "KAT_Sergeant"] call BISFUNC(setUnitInsignia);

true;
