#include "script_component.hpp"
/*
 * Author: Katalam
 * Adds insignia to a player.
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

private _insignia = [_unit] call BIS_fnc_getUnitInsignia;
_unit setVariable [QGVAR(activeInsignia), _insignia];
