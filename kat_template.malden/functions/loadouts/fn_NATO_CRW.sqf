#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Tank Crew
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 1, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform UNIFORM_RFM;
_player addVest VEST_CRW;
_player addHeadgear HELMET_CRW;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemMicroDAGR";
_player addItemToUniform "ACE_microDAGR";
_player linkItem "TFAR_anprc152";
_player addItemToVest "ACE_MapTools";
_player addItemToVest "ACE_key_west";

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
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 1: {
        _player addPrimaryWeaponItem FLASHLIGHT(WEAPON_CRW_NVG);
        _player addItemToUniform "ACE_Flashlight_XL50";
    };
    case 2: {
        _player addPrimaryWeaponItem LASER(WEAPON_CRW_NVG);
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
