#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Rifleman
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform UNIFORM_1;
_player addVest VEST_RFM;
_player addHeadgear HELMET_RFM;
_player addBackpackGlobal "B_rhsusf_B_BACKPACK";
//private _backpack = unitBackpack _player; // Don't work
//_backpack setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_infantry\gear\backpacks\data\eagleaii_coy_co.paa"];

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "TFAR_rf7800str";
_player linkItem "ItemcTab";

/** MEDICAL */
MEDICAL_RFM;

/** THROWABLES */
for "_i" from 1 to 2 do {
    _player addItemToUniform "SmokeShell";
    _player addItemToVest "MiniGrenade";
};
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addWeapon WEAPON_RFM;
WEAPON_RFM_STUFF apply {_player addWeaponItem [WEAPON_RFM, _x]};

for "_i" from 1 to 7 do {
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