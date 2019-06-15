#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Joint Terminal Attack Controller
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform "U_B_CombatUniform_mcam";
_player addVest selectRandom ["V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
_player addHeadgear "H_HelmetSpecB_blk";

/** COMMS */
_player addBackpackGlobal "TFAR_anarc210";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
for "_i" from 1 to 2 do {
	_player addItemToVest "ACE_CableTie";
};
_player addItemToVest "ACE_MapTools";
_player addItemToVest "Laserbatteries";
_player addWeapon "Laserdesignator";

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

/** NIGHT FIGHT STUFF: PART 1/2 */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		for "_i" from 1 to 4 do {
			_player addItemToVest "UGL_FlareYellow_F";
		};
		_player addItemToVest "UGL_FlareRed_F";
		_player addItemToVest "UGL_FlareGreen_F";
	};
    case 2: {
		for "_i" from 1 to 4 do {
			_player addItemToVest "UGL_FlareYellow_F";
		};
		_player addItemToVest "UGL_FlareRed_F";
		_player addItemToVest "UGL_FlareGreen_F";
	};
    default {
		for "_i" from 1 to 4 do {
			_player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
		};
		_player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
	};
};

/** PRIMARY */
_player addItemToVest "30Rnd_65x39_caseless_mag";

_player addWeapon selectRandom ["arifle_MX_GL_Black_F", "arifle_MX_GL_F"];
_player addPrimaryWeaponItem selectRandom ["optic_Hamr", "optic_MRCO", "optic_Arco"];

for "_i" from 1 to 4 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag";
};
for "_i" from 1 to 3 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
};

/** NIGHT FIGHT STUFF: PART 2/2 */
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

[_player,"ADV_insignia_jtac"] call BIS_fnc_setUnitInsignia;

true;
