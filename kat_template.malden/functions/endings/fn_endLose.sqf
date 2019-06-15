#include "script_component.hpp"
/*
 * Author: Katalam
 * Ends the mission with a lose for all players and the server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_endLose;
 *
 * Public: Yes
 */

if !(isServer) exitWith {};

["end2"] call BIS_fnc_endMissionServer;
