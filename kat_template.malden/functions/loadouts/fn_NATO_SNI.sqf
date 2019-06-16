#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Sniper
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform UNIFORM_BLACK;
_player addVest VEST_BLACK;
_player addHeadgear HELMET_3;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
for "_i" from 1 to 2 do {
    _player addItemToVest "ACE_CableTie";
};
_player addItemToVest "ACE_MapTools";
_player addItemToVest "ACE_RangeCard";

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
(WEAPON_RFM_STUFF + ["muzzle_snds_H_snd_F"]) apply {_player addWeaponItem [WEAPON_RFM, _x]};

for "_i" from 1 to 4 do {
    _player addItemToVest WEAPON_RFM_AMMO;
};
for "_i" from 1 to 4 do {
    _player addItemToVest (WEAPON_SNI_AMMO select 0);
};

/** GUN BAG */
_player addBackpackGlobal "ace_gunbag_tan";
private _gunbagContainer = backpackContainer _player;
private _gunBagInv = [WEAPON_SNI, WEAPON_SNI_STUFF, [WEAPON_SNI_AMMO]];
_gunbagContainer setVariable ["ace_gunbag_gunbagWeapon", _gunBagInv, true];

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
        _player addItemToUniform "ACE_Flashlight_KSF1";
        _player addItemToUniform "ACE_HandFlare_Yellow";
    };
    case 2: {
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
_player addHandgunItem "muzzle_snds_acp";
_player addItemToUniform WEAPON_HGUN_AMMO;

[_player, "KAT_Sergeant"] call BIS_fnc_setUnitInsignia;

true;
