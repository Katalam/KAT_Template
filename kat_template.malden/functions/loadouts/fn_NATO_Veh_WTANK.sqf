#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Wheeled Tank Vehicle
 */

params [["_box", objNull, [objNull]]];

["ACE_Wheel", _box, 3] call ace_cargo_fnc_addCargoItem;

_box addBackpackCargoGlobal ["B_Assaultpack_blk", 1];
_box addBackpackCargoGlobal ["B_Kitbag_rgr", 1];
_box addBackpackCargoGlobal ["B_Kitbag_cbr", 1];

{
	if (_forEachIndex isEqualTo 0) then {
		_x addItemCargoGlobal ["ToolKit", 1];
	};

	if (_forEachIndex isEqualTo 1) then {
		_x addItemCargoGlobal ["ACE_fieldDressing", 32];
		_x addItemCargoGlobal ["ACE_elasticBandage", 32];
		_x addItemCargoGlobal ["ACE_morphine", 8];
		_x addItemCargoGlobal ["ACE_epinephrine", 8];
		_x addItemCargoGlobal ["ACE_tourniquet", 4];
		_x addItemCargoGlobal ["ACE_plasmaIV_500", 12];
	};

	if (_forEachIndex isEqualTo 2) then {
		_x addItemCargoGlobal ["30Rnd_65x39_caseless_mag", 12];
		_x addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 12];
		_x addItemCargoGlobal ["200Rnd_65x39_cased_Box_Tracer_red", 2];
	};
} forEach (everyBackpack _box);

/** LAUNCHER */
switch (["LightLauncherEquipment", 0] call BIS_fnc_getParamValue) do {
    case 1: {
		_box addItemCargoGlobal ["launch_NLAW_F", 2];
	};
    default {
		_box addItemCargoGlobal ["launch_MRAWS_green_F", 1];
		_box addItemCargoGlobal ["MRAWS_HEAT_F", 3];
		_box addItemCargoGlobal ["MRAWS_HE_F", 3];
	};
};

_box addItemCargoGlobal ["adv_aceRefill_FAK", 5];
_box addItemCargoGlobal ["adv_aceRefill_manualKit", 1];

true;
