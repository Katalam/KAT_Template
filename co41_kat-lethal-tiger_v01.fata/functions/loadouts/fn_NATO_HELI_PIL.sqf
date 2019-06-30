#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Helicopter Pilot
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 1, true];
_player setVariable ["ACE_GForceCoef", 0.3, true];
_player setVariable ["ACE_isEngineer", 2, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform "rhs_uniform_abu";
_player addVest "V_TacVest_khk";
_player addHeadgear "H_PilotHelmetHeli_B";

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
_player addItemToVest "ACE_MapTools";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addWeapon WEAPON_RFM;
WEAPON_RFM_STUFF apply {_player addWeaponItem [WEAPON_RFM, _x]};

for "_i" from 1 to 4 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};

[_player, "KAT_Sergeant"] call BISFUNC(setUnitInsignia);

true;
