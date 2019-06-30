#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - EAST: Rifleman
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform selectRandom EAST_UNIFORM;
_player addVest selectRandom EAST_VEST;
_player addHeadgear selectRandom EAST_HELMET;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemGPS";
_player linkItem "TFAR_rf7800str";

/** THROWABLES */
for "_i" from 1 to 4 do {
    _player addItemToUniform "MiniGrenade";
};

/** PRIMARY */
_player addItemToVest EAST_AMMO;
_player addWeapon EAST_WEAPON;

for "_i" from 1 to 7 do {
    _player addItemToVest EAST_AMMO;
};

true;
