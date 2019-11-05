#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Sniper [DLC]
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform UNIFORM_RFM;
_player addVest VEST_RFM;
_player addHeadgear HELMET_SQL;

/** COMMS */
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
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 1: {
        _player addItemToUniform "ACE_Flashlight_XL50";
        _player addItemToUniform "ACE_HandFlare_Yellow";
    };
    case 2: {
        _player addPrimaryWeaponItem LASER(WEAPON_SNI_NVG);
        _player addItemToUniform "ACE_Flashlight_XL50";
        _player linkItem NVG_RFM;
        _player addItemToUniform "ACE_IR_Strobe_Item";
    };
    default {
        _player addItemToUniform "SmokeShellOrange";
    };
};


/** SIDEARM */
_player addItemToVest WEAPON_HGUN_AMMO;
_player addWeapon WEAPON_HGUN;
_player addHandgunItem WEAPON_HGUN_SILENCER;
_player addItemToVest WEAPON_HGUN_AMMO;

[_player, "KAT_Sergeant"] call BISFUNC(setUnitInsignia);

true;
