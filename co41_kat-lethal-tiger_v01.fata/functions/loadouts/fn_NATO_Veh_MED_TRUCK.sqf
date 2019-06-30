#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Medical Truck
 */

params [["_box", objNull, [objNull]]];

["ACE_Wheel", _box, 2] call ace_cargo_fnc_addCargoItem;

_box addBackpackCargoGlobal [BACKPACK_COMPACT, 1];
_box addBackpackCargoGlobal [BACKPACK_KITBAG, 1];

_box addItemCargoGlobal ["ACE_packingBandage", 96];
_box addItemCargoGlobal ["ACE_elasticBandage", 96];
_box addItemCargoGlobal ["ACE_morphine", 24];
_box addItemCargoGlobal ["ACE_epinephrine", 24];
_box addItemCargoGlobal ["ACE_tourniquet", 12];
_box addItemCargoGlobal ["ACE_plasmaIV_500", 72];

{
    if (_forEachIndex isEqualTo 0) then {
        _x addItemCargoGlobal ["ToolKit", 1];
    };

    if (_forEachIndex isEqualTo 1) then {
        _x addItemCargoGlobal ["ACE_packingBandage", 32];
        _x addItemCargoGlobal ["ACE_elasticBandage", 32];
        _x addItemCargoGlobal ["ACE_morphine", 8];
        _x addItemCargoGlobal ["ACE_epinephrine", 8];
        _x addItemCargoGlobal ["ACE_tourniquet", 4];
        _x addItemCargoGlobal ["ACE_plasmaIV_500", 12];
    };
} forEach (everyBackpack _box);

true;
