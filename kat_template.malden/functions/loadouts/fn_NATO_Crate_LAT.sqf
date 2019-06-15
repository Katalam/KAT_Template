#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: L.Launcher-Kiste
 */

params [["_box", objNull, [objNull]]];

switch (["LightLauncherEquipment", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_box addWeaponCargoGlobal ["launch_NLAW_F", 4];
	};
    default {
		_box addWeaponCargoGlobal ["launch_MRAWS_green_F", 1];
		_box addItemCargoGlobal ["MRAWS_HE_F", 4];
		_box addItemCargoGlobal ["MRAWS_HEAT_F", 6];
	};
};

true;
