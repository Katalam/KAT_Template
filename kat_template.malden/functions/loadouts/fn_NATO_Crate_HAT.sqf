#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: H.Launcher-Munition
 */

params [["_box", objNull, [objNull]]];

switch (["HeavyLauncherEquipment", 0] call BIS_fnc_getParamValue) do {
    case 1: { // Vorona
		_box addMagazineCargoGlobal ["Vorona_HEAT", 4];
		_box addMagazineCargoGlobal ["Vorona_HE", 2];
	};
    case 2: { // Titan (AA)
		_box addMagazineCargoGlobal ["Titan_AA", 6];
	};
    default { // Titan (AT/AP)
		_box addMagazineCargoGlobal ["Titan_AT", 4];
		_box addMagazineCargoGlobal ["Titan_AP", 2];
	};
};

true;
