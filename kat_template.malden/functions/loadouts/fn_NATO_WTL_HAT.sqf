#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Weapon Team Leader (Missle Specialist)
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "CORPORAL";

/** CLOTHING */
_player forceAddUniform "U_B_CombatUniform_mcam_vest";
_player addVest selectRandom ["V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
_player addHeadgear "H_HelmetSpecB";
_player addBackpackGlobal "B_Kitbag_cbr";

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

/** HEAVY LAUNCHER AMMO */
switch (["HeavyLauncherEquipment", 0] call BIS_fnc_getParamValue) do {
    case 1: { // Vorona
		_player addItemToBackpack "Vorona_HE";
		_player addItemToBackpack "Vorona_HEAT";
	};
    case 2: { // Titan (AA)
		for "_i" from 1 to 2 do {
			_player addItemToBackpack "Titan_AA";
		};
	};
    default { // Titan (AT/AP)
		for "_i" from 1 to 2 do {
			_player addItemToBackpack "Titan_AT";
		};
		_player addItemToBackpack "Titan_AP";
	};
};

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
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 2 do {
	_player addItemToVest "MiniGrenade";
};

/** PRIMARY */
_player addItemToVest "30Rnd_65x39_caseless_mag";

_player addWeapon selectRandom ["arifle_MX_Black_F", "arifle_MX_F"];
_player addPrimaryWeaponItem selectRandom ["optic_Hamr", "optic_MRCO", "optic_Arco"];

for "_i" from 1 to 4 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag";
};
for "_i" from 1 to 3 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
};

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_player addWeapon "ACE_VectorDay";
		_player addPrimaryWeaponItem "acc_flashlight";
		_player addItemToUniform "ACE_Flashlight_KSF1";
		_player addItemToUniform "ACE_HandFlare_Yellow";
	};
    case 2: {
		_player addWeapon "ACE_Vector";
		_player addPrimaryWeaponItem "acc_pointer_IR";
		_player addItemToUniform "ACE_Flashlight_KSF1";
		_player linkItem "ACE_NVG_Wide";
		_player addItemToUniform "ACE_IR_Strobe_Item";
	};
    default {
		_player addWeapon "ACE_VectorDay";
		_player addItemToUniform "SmokeShellOrange";
	};
};

/** SIDEARM */
_player addItemToUniform "11Rnd_45ACP_Mag";
_player addWeapon "hgun_Pistol_heavy_01_F";
_player addItemToUniform "11Rnd_45ACP_Mag";

[_player,"ADV_insignia_usarmy_03"] call BIS_fnc_setUnitInsignia;

true;
