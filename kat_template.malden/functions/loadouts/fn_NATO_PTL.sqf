#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Platoon Leader
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 2, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 2, true];
_player setVariable ["ACE_isEOD", true, true];

_player setUnitRank "CAPTAIN";

/** CLOTHING */
_player forceAddUniform "U_B_CombatUniform_mcam";
_player addVest selectRandom ["V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
_player addHeadgear "H_Beret_02";

/** COMMS */
_player addBackpackGlobal "tfar_rt1523g_big_rhs";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
for "_i" from 1 to 2 do {
	_player addItemToVest "ACE_CableTie";
};
_player addItemToVest "ACE_MapTools";
_player addItemToVest "ACE_key_west";
_player addItemToBackpack "ItemcTab";
//[_player, "H_HelmetSpecB_blk"] call GRAD_slingHelmet_fnc_addSlungHelmet;

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
_player addPrimaryWeaponItem "optic_ACO_grn";

for "_i" from 1 to 7 do {
	_player addItemToVest "30Rnd_65x39_caseless_mag";
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
_player addHandgunItem "optic_MRD";
_player addItemToUniform "11Rnd_45ACP_Mag";
for "_i" from 1 to 2 do {
	_player addItemToVest "11Rnd_45ACP_Mag";
};

//[_player,"ADV_insignia_usarmy_10"] call BIS_fnc_setUnitInsignia;

true;
