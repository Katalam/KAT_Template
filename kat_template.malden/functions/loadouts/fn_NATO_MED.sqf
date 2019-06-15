#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: (Squad) Medic
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 2, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "CORPORAL";

/** CLOTHING */
_player forceAddUniform "U_B_CombatUniform_mcam_vest";
_player addVest selectRandom ["V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
_player addHeadgear "H_HelmetSpecB";
_player addBackpackGlobal "B_Kitbag_rgr";

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
_player addWeapon "Binocular";
for "_i" from 1 to 2 do {
	_player addItemToVest "ACE_CableTie";
};
_player addItemToVest "ACE_MapTools";

/** MEDICAL */
for "_i" from 1 to 32 do {
	_player addItemToBackpack "ACE_fieldDressing";
	_player addItemToBackpack "ACE_elasticBandage";
};
for "_i" from 1 to 6 do {
	_player addItemToVest "ACE_morphine";
};
for "_i" from 1 to 8 do {
	_player addItemToVest "ACE_epinephrine";
};
if (["AEDInSquad", 1] call BIS_fnc_getParamValue isEqualTo 1) then {
	_player addItemToVest "adv_aceCPR_AED";
};
for "_i" from 1 to 2 do {
	_player addItemToBackpack "ACE_morphine";
};
for "_i" from 1 to 12 do {
	_player addItemToBackpack "ACE_plasmaIV_500";
};
for "_i" from 1 to 4 do {
	_player addItemToBackpack "ACE_tourniquet";
};

/** THROWABLES */
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 2 do {
	_player addItemToVest "MiniGrenade";
	_player addItemToVest "SmokeShell";
};

/** PRIMARY */
_player addItemToVest "30Rnd_65x39_caseless_mag";

_player addWeapon selectRandom ["arifle_MX_Black_F", "arifle_MX_F"];

/** SCOPE */
switch (["ScopeLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: { // 4x-Zoom für alle
		_player addPrimaryWeaponItem selectRandom ["optic_Hamr", "optic_MRCO", "optic_Arco"];
	};
    default { // 4x-Zoom ab Corporal
		_player addPrimaryWeaponItem "optic_ACO_grn";
	};
};

for "_i" from 1 to 7 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag";
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_player addPrimaryWeaponItem "acc_flashlight";
		_player addItemToUniform "ACE_Flashlight_KSF1";
		_player addItemToUniform "ACE_HandFlare_Yellow";
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
_player addItemToUniform "11Rnd_45ACP_Mag";
_player addWeapon "hgun_Pistol_heavy_01_F";
_player addItemToUniform "11Rnd_45ACP_Mag";

[_player,"ADV_insignia_medic"] call BIS_fnc_setUnitInsignia;

true;
