#include "script_component.hpp"
/*
 * Author: Sinus
 * Teleports the given unit to the given target unit or in the given target player vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, NATO_SQL_1] call KAT_template_fnc_teleport;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_target", objNull, [objNull]]
];

if (vehicle _target != _target) then {
    private _vehicle = vehicle _target;

    if (local _unit) then {
        _unit moveInAny _vehicle;
    } else {
        [_unit, _vehicle] remoteExec ["moveInAny", _unit];
    };
} else {
    _unit setPosATL (getPosATL _target);
};
