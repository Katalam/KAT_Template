#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Jet Pilot
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 1, true];
_player setVariable ["ACE_GForceCoef", 0.3, true];
_player setVariable ["ACE_isEngineer", 1, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "SERGEANT";

/** CLOTHING */
_player forceAddUniform "U_B_PilotCoveralls";
_player addHeadgear "H_PilotHelmetFighter_B";
_player addBackpackGlobal "B_Parachute";

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemAndroid";
_player linkItem "TFAR_anprc152";
_player addItemToUniform "ACE_MapTools";

/** MEDICAL */
for "_i" from 1 to 10 do {
	_player addItemToUniform "ACE_fieldDressing";
};
for "_i" from 1 to 2 do {
	_player addItemToUniform "ACE_tourniquet";
};
_player addItemToUniform "ACE_morphine";

/** THROWABLES */
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShellGreen";

/** NIGHT FIGHT STUFF */
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_player addItemToUniform "ACE_HandFlare_Yellow";
		_player addItemToUniform "ACE_Flashlight_KSF1";
	};
    case 2: {
		_player addItemToUniform "ACE_IR_Strobe_Item";
		_player addItemToUniform "ACE_Flashlight_KSF1";
	};
    default {
		_player addItemToUniform "SmokeShellOrange";
	};
};

/** PRIMARY */
_player addItemToUniform "30Rnd_45ACP_Mag_SMG_01";
_player addWeapon "SMG_01_F";

_player addItemToUniform "30Rnd_45ACP_Mag_SMG_01";

[_player,"ADV_insignia_usarmy_04"] call BIS_fnc_setUnitInsignia;

true;
