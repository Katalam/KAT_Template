#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Rifleman (AT)
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
for "_i" from 1 to 2 do {
	_player addItemToUniform "SmokeShell";
	_player addItemToVest "MiniGrenade";
};
_player addItemToUniform "SmokeShellGreen";

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

/** LAUNCHER */
switch (["LightLauncherEquipment", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_player addWeapon "launch_NLAW_F";
	};
    default {
		_player addBackpackGlobal "B_AssaultPack_rgr";

		_player addItemToBackpack "MRAWS_HEAT_F";

		_player addWeapon "launch_MRAWS_green_F";
		_player addItemToBackpack "MRAWS_HEAT_F";
		_player addItemToBackpack "MRAWS_HE_F";
	};
};

[_player,"ADV_insignia_usarmy_00"] call BIS_fnc_setUnitInsignia;

true;
