#include "script_component.hpp"
/*
 * Author: Katalam
 * Adds ambient flyby plane with one or two waypoints.
 * They will never engage.
 * They will fly with fullspeed.
 * They will get deleted after they completed the last waypoint.
 * They can't be destroyed.
 *
 * Arguments:
 * None.
 *
 * Return Value:
 * Succesfull <BOOLEAN>
 *
 * Example:
 * call KAT_template_fnc_plane;
 *
 * Public: Yes
 */

if (GETMVAR(stopJets,false)) exitWith {};

private _spawnPosition = getMarkerPos "marker_plane_0";
_spawnPosition = _spawnPosition vectorAdd [0, 0, 500];
private _wpPosition = getMarkerPos "marker_plane_1";

private _return = [_spawnPosition, 209, "RHS_C130J", civilian] call BISFUNC(spawnVehicle);
_return params ["_plane", "", "_group"];
_plane allowDamage false;
_plane flyinHeightASL [700, 700, 700];

_group setGroupIdGlobal [(selectRandom ["Anvil 2-1", "Anvil 2-2", "Anvil 2-3", "Anvil 2-4"])];

private _wp = _group addWaypoint [_wpPosition, 0];
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointStatements ["true", "{
    private _veh = vehicle _x;
    _veh deleteVehicleCrew driver _veh;
    deleteVehicle _veh;
    } forEach thisList;
    if (count units group this isEqualTo 0) then {
        deleteGroup group this;
}"];

[FUNC(plane), _this, random [1500, 1800, 3000]] call CBA_fnc_waitAndExecute;

true;
