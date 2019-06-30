#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Medical Cougar
 */

params [["_box", objNull, [objNull]]];

["ACE_Wheel", _box, 2] call ace_cargo_fnc_addCargoItem;

_box addBackpackCargoGlobal [BACKPACK_COMPACT, 1];
_box addBackpackCargoGlobal [BACKPACK_KITBAG, 3];

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

    if (_forEachIndex isEqualTo 2) then {
        _x addItemCargoGlobal ["ACE_packingBandage", 32];
        _x addItemCargoGlobal ["ACE_elasticBandage", 32];
        _x addItemCargoGlobal ["ACE_morphine", 8];
        _x addItemCargoGlobal ["ACE_epinephrine", 8];
        _x addItemCargoGlobal ["ACE_tourniquet", 4];
        _x addItemCargoGlobal ["ACE_plasmaIV_500", 12];
    };

    if (_forEachIndex isEqualTo 3) then {
        _x addItemCargoGlobal ["ACE_packingBandage", 32];
        _x addItemCargoGlobal ["ACE_elasticBandage", 32];
        _x addItemCargoGlobal ["ACE_morphine", 8];
        _x addItemCargoGlobal ["ACE_epinephrine", 8];
        _x addItemCargoGlobal ["ACE_tourniquet", 4];
        _x addItemCargoGlobal ["ACE_plasmaIV_500", 12];
    };
} forEach (everyBackpack _box);

/** LAUNCHER */
_box addItemCargoGlobal [WEAPON_LAUNCHER, 1];
_box addItemCargoGlobal [WEAPON_LAUNCHER_AMMO_HEAT, 2];
_box addItemCargoGlobal [WEAPON_LAUNCHER_AMMO_HE, 1];

true;
