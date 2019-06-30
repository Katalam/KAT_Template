#include "script_component.hpp"
/*
 * Author: Sinus
 * Ends the mission for the given player with a win.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call KAT_template_fnc_endWinPrivate;
 *
 * Public: Yes
 */

params [
    ["_player", objNull, [objNull]]
];

["end4", true, true] remoteExec [QBISFUNC(endMission), _player];
