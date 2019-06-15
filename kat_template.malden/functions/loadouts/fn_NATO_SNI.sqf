#include "script_component.hpp"
/*
 * Author: [SeL] Katalam and [SeL] Sinus
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
_player forceAddUniform "U_B_GhillieSuit";
_player addVest selectRandom ["V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
_player addHeadgear "H_HelmetSpecB_blk";

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
_player addItemToVest "7Rnd_408_Mag";

_player addWeapon "srifle_LRR_camo_F";
_player addPrimaryWeaponItem "optic_LRPS";

for "_i" from 1 to 4 do {
	_player addItemToVest "7Rnd_408_Mag";
};

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
_player addItemToUniform "11Rnd_45ACP_Mag";
_player addWeapon "hgun_Pistol_heavy_01_F";
_player addHandgunItem "muzzle_snds_acp";
_player addItemToUniform "11Rnd_45ACP_Mag";

[_player,"ADV_insignia_usarmy_04"] call BIS_fnc_setUnitInsignia;

true;
