#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds all units, vehicles and vehicle crews to the curator logic of the given player.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call KAT_template_fnc_addToZeus;
 *
 * Public: Yes
 */

params [
	["_player", objNull, [objNull]]
];

if (isServer) then {
	private _logic = getAssignedCuratorLogic _player;

	if (!isNull(_logic)) then {
		_logic addCuratorEditableObjects [allUnits, false];
		_logic addCuratorEditableObjects [vehicles, true];
	};
} else {
	[_player] remoteExec [QFUNC(addToZeus), 2, false];
};
