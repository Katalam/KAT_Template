#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
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
_player forceAddUniform "U_B_CombatUniform_mcam";
_player addVest "V_TacVest_blk";
_player addHeadgear "H_HelmetB_sand";
_player addItemToVest "H_Cap_oli";
_player addBackpackGlobal "B_Assaultpack_blk";

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
for "_i" from 1 to 10 do {
	_player addItemToUniform "ACE_fieldDressing";
};
for "_i" from 1 to 2 do {
	_player addItemToUniform "ACE_tourniquet";
};
_player addItemToUniform "ACE_morphine";

/** THROWABLES */
for "_i" from 1 to 2 do {
	_player addItemToUniform "SmokeShell";
};
_player addItemToUniform "SmokeShellGreen";

/** PRIMARY */
_player addItemToVest "30Rnd_65x39_caseless_mag";

_player addWeapon selectRandom ["arifle_MXC_Black_F", "arifle_MXC_F"];

for "_i" from 1 to 4 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag";
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
		_player linkItem "ACE_NVG_Wide";
	};
    default {};
};

/** SIDEARM */
_player addItemToUniform "11Rnd_45ACP_Mag";
_player addWeapon "hgun_Pistol_heavy_01_F";
_player addItemToUniform "11Rnd_45ACP_Mag";

[_player,"ADV_insignia_usarmy_00"] call BIS_fnc_setUnitInsignia;

true;
