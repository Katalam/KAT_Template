#include "script_component.hpp"
/*
 * Author: Sinus
 * Creates ace interactions for spectating.
 * Local effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [tv, "marker_teleport_spectator"] call KAT_template_fnc_createSpectator;
 *
 * Public: Yes
 */

if !(hasInterface) exitWith {};

params [
    ["_object", objNull, [objNull]],
    ["_markerName", "", [""]]
];

if ((getMarkerPos _markerName) isEqualTo [0, 0, 0]) exitWith {};

private _specCode = {
    player setVariable [QGVAR(isSpectator), true, false];
    ["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
    [player, true] remoteExec ["hideObjectGlobal", 2, false];
    player setCaptive true;
    player setPosATL (getMarkerPos (_this select 2));
    hint "Verlassen durch Respawn";
};

[_object, 0, [],
    [QGVAR(specActionParent), localize LSTRING(spectator), "", {}, {true}, {}, [], [0, 0.37, 0.4]] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[_object, 0, [QGVAR(specActionParent)],
    [QGVAR(specAction0), localize LSTRING(beSpectator), "", _specCode, {true}, {}, _markerName] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
