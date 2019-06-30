#include "script_component.hpp"
/*
 * Author: Katalam
 * Adds ingame looped radio.
 *
 * Arguments:
 * 0: Radio <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [radio] call KAT_template_fnc_radio;
 *
 * Public: No
 */

params [
    ["_radio", objNull, [objNull]]
];

if (_radio getVariable [QGVAR(radioStop), false]) exitWith {};

_radio say (selectRandom ["KAT_radio1", "KAT_radio2", "KAT_radio3"]);

[CALLFUNC(radio), [_radio], random [20, 30, 40]] call CBA_fnc_waitAndExecute;
