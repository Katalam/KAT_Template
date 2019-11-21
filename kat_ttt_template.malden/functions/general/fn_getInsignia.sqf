#include "script_component.hpp"
/*
 * Author: Katalam
 * Gets insignia from a player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_setInsignia;
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (!local _unit || {_unit != player}) exitWith {};

private _insignia = _unit getVariable [QGVAR(activeInsignia), ""];

[_unit, ""] call BIS_fnc_setUnitInsignia;
[_unit, _insignia] call BIS_fnc_setUnitInsignia;
