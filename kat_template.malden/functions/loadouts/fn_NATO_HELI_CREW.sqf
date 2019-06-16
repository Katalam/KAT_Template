#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Helicopter Crew
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.3, true];
_player setVariable ["ACE_isEngineer", 1, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform UNIFORM_SILVER;
_player addVest VEST_CRW;
_player addHeadgear selectRandom HELMET_HELI;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
for "_i" from 1 to 2 do {
    _player addItemToUniform "SmokeShell";
};
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addWeapon WEAPON_CRW;
WEAPON_CRW_STUFF apply {_player addWeaponItem [WEAPON_CRW, _x]};

for "_i" from 1 to 4 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
        _player addPrimaryWeaponItem "acc_flashlight";
        _player addItemToUniform "ACE_Flashlight_KSF1";
    };
    case 2: {
        _player addPrimaryWeaponItem "acc_pointer_IR";
        _player addItemToUniform "ACE_Flashlight_KSF1";
    };
    default {};
};

/** SIDEARM */
_player addItemToUniform WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addItemToUniform WEAPON_HGUN_AMMO;

[_player, ""] call BIS_fnc_setUnitInsignia;

true;
