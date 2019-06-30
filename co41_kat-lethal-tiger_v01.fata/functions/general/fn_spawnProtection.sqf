#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds a fired event handler to the local player preventing throwing near the respawn
 * position of the local players side.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_spawnProtection;
 *
 * Public: Yes
 */

GVAR(spawnProtectPos) = [0, 0, 0];

switch (side player) do {
    case west: {
        GVAR(spawnProtectPos) = getMarkerPos "respawn_west";
    };
    case east: {
        GVAR(spawnProtectPos) = getMarkerPos "respawn_east";
    };
    case independent: {
        GVAR(spawnProtectPos) = getMarkerPos "respawn_guerrila";
    };
    case civilian: {
        GVAR(spawnProtectPos) = getMarkerPos "respawn_civilian";
    };
};

if (GVAR(spawnProtectPos) isEqualTo [0, 0, 0]) exitWith {};

[typeOf player, "Fired", {
    params ["_unit", "_weapon", "", "", "", "_magazine", "_projectile"];

    if (_weapon isEqualTo "Throw") then {
        if (_unit isEqualTo player) then {
            if ((_unit distance2D GVAR(spawnProtectPos)) < 75) then {
                deleteVehicle _projectile;
                _unit addMagazine [_magazine, 1];
            };
        };
    };
}] call CBA_fnc_addClassEventHandler;
