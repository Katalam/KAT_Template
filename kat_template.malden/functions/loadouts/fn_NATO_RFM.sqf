#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
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
_player forceAddUniform "U_B_CombatUniform_mcam";
_player addVest selectRandom ["V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
_player addHeadgear selectRandom ["H_HelmetB", "H_HelmetB_black", "H_HelmetB_desert", "H_HelmetB_grass"];

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemMicroDAGR";
_player linkItem "TFAR_rf7800str";

/** MEDICAL */
for "_i" from 1 to 10 do {
	_player addItemToUniform "ACE_fieldDressing";
};
for "_i" from 1 to 2 do {
	_player addItemToUniform "ACE_elasticBandage";
	_player addItemToUniform "ACE_tourniquet";
};
_player addItemToUniform "ACE_morphine";
_player addItemToUniform "ACE_salineIV_500";

/** THROWABLES */
switch (["RFMEquiment", 0] call BIS_fnc_getParamValue) do {
	case 2: { // Rifleman mit mehr Frags / Smoke
		for "_i" from 1 to 2 do {
			_player addItemToUniform "SmokeShell";
			_player addItemToVest "SmokeShell";
		};
		_player addItemToUniform "SmokeShellGreen";
		for "_i" from 1 to 6 do {
			_player addItemToVest "MiniGrenade";
		};
	};
    default {
		for "_i" from 1 to 2 do {
			_player addItemToUniform "SmokeShell";
			_player addItemToVest "MiniGrenade";
		};
		_player addItemToUniform "SmokeShellGreen";
	};
};

/** PRIMARY */
_player addItemToVest "30Rnd_65x39_caseless_mag";

switch (["RFMEquiment", 0] call BIS_fnc_getParamValue) do {
    case 1: { // Rifleman (mit Optik und schwerem Lauf)
		_player addWeapon selectRandom ["arifle_MXM_F"];

		_player addPrimaryWeaponItem selectRandom ["optic_Hamr", "optic_MRCO", "optic_Arco"];
		_player addPrimaryWeaponItem "bipod_01_F_snd";
	};
    default { // Rifleman
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
