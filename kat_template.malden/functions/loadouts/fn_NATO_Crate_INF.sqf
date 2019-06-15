#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Infanterie-Kiste
 */

params [["_box", objNull, [objNull]]];

// Magazine
_box addItemCargoGlobal ["30Rnd_65x39_caseless_mag", 22];
_box addItemCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 4];
_box addItemCargoGlobal ["200Rnd_65x39_cased_Box_Tracer_red", 5];

_box addItemCargoGlobal ["11Rnd_45ACP_Mag", 2];

// Throwables
_box addItemCargoGlobal ["MiniGrenade", 12];

_box addItemCargoGlobal ["SmokeShell", 8];
_box addItemCargoGlobal ["SmokeShellGreen", 4];

// Nachtkampfausrüstung
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_box addItemCargoGlobal ["ACE_HandFlare_Yellow", 2];
		_box addItemCargoGlobal ["UGL_FlareYellow_F", 2];
		_box addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 22];
	};
    case 2: {
		_box addItemCargoGlobal ["ACE_IR_Strobe_Item", 2];
		_box addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 24];
	};
    default {
		_box addItemCargoGlobal ["SmokeShellOrange", 2];
		_box addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 24];
	};
};

true;
