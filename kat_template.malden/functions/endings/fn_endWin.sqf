#include "script_component.hpp"
/*
 * Author: Sinus
 * Ends the mission with a win for all players and the server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_endWin;
 *
 * Public: Yes
 */

if !(isServer) exitWith {};

["end1"] call BISFUNC(endMissionServer);
