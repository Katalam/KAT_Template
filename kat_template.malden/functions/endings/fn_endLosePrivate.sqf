#include "script_component.hpp"
/*
 * Author: Sinus
 * Ends the mission for the given player with a lose.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call KAT_template_fnc_endLosePrivate;
 *
 * Public: Yes
 */

params [
	["_player", objNull, [objNull]]
];

["end3", false, true] remoteExec ["BIS_fnc_endMission", _player];
