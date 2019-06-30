#include "script_component.hpp"
/*
 * Author: Sinus
 * Sets the units skill to high values. Execute where unit is local, has global effect.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ai_1] call KAT_template_fnc_setSkill;
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]]
];

if (local _unit) then {
    if !(isPlayer _unit) then {
        _unit setSkill ["general", 1];
		_unit setSkill ["commanding", 1];
		_unit setSkill ["courage", 0.9];
		_unit setSkill ["aimingAccuracy", 0.5];
		_unit setSkill ["aimingShake", 0.9];
		_unit setSkill ["aimingSpeed", 0.8];
		_unit setSkill ["reloadSpeed", 0.8];
		_unit setSkill ["spotDistance", 1];
		_unit setSkill ["spotTime", 0.8];
    };
} else {
    [_unit] remoteExec [QFUNC(setSkill), _unit, false];
};
