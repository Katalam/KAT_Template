#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Platoon Leader
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 2, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 2, true];
_player setVariable ["ACE_isEOD", true, true];

_player setUnitRank "LIEUTENANT";

/** CLOTHING */
_player forceAddUniform UNIFORM_RFM;
_player addVest VEST_RFM;
_player addHeadgear HELMET_BERET;

/** COMMS */
_player addBackpackGlobal "tfar_rt1523g_big_rhs";
_player addItemToBackpack HELMET_SQL;
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player addItemToUniform "ACE_microDAGR";
_player linkItem "TFAR_anprc152";

for "_i" from 1 to 2 do {
    _player addItemToVest "ACE_CableTie";
};
_player addItemToVest "ACE_MapTools";
_player addItemToVest "ACE_key_west";
_player addItemToBackpack "ItemcTab";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 2 do {
    _player addItemToVest "MiniGrenade";
};

/** PRIMARY */
_player addWeapon WEAPON_RFM;
WEAPON_RFM_STUFF apply {_player addWeaponItem [WEAPON_RFM, _x]};

for "_i" from 1 to 7 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 1: {
        _player addWeapon "ACE_VectorDay";
        _player addPrimaryWeaponItem FLASHLIGHT(WEAPON_RFM_NVG);
        _player addItemToUniform "ACE_Flashlight_XL50";
        _player addItemToUniform "ACE_HandFlare_Yellow";
    };
    case 2: {
        _player addWeapon "ACE_Vector";
        _player addPrimaryWeaponItem LASER(WEAPON_RFM_NVG);
        _player addItemToUniform "ACE_Flashlight_XL50";
        _player linkItem NVG_RFM;
        _player addItemToUniform "ACE_IR_Strobe_Item";
    };
    default {
        _player addWeapon "ACE_VectorDay";
        _player addItemToUniform "SmokeShellOrange";
    };
};

/** SIDEARM */
_player addItemToUniform WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addHandgunItem WEAPON_HGUN_SCOPE;
_player addItemToUniform WEAPON_HGUN_AMMO;
for "_i" from 1 to 2 do {
    _player addItemToVest WEAPON_HGUN_AMMO;
};

[_player, "KAT_Lieutenant"] call BISFUNC(setUnitInsignia);

true;
