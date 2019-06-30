#include "script_component.hpp"
/*
 * Author: Katalam
 * Adds ambient flyby jets with one or two waypoints.
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
 * call KAT_template_fnc_jets;
 *
 * Public: Yes
 */

if (GETMVAR(stopJets,false)) exitWith {};

private _plane = selectRandom ["FIR_A10C", "rhsusf_f22"];

private _spawnPosition = getMarkerPos "marker_jets_0";
_spawnPosition = _spawnPosition vectorAdd [0, 0, 500];

private _return1 = [_spawnPosition, 209, _plane, civilian] call BISFUNC(spawnVehicle);
_return1 params ["_jet1", "", "_group"];
_jet1 allowDamage false;
_jet1 flyinHeightASL [500, 500, 500];

_group setGroupIdGlobal [(selectRandom ["Falcon 1-1", "Falcon 1-2", "Falcon 1-3", "Falcon 1-4"])];

private _return2 = [_spawnPosition vectorAdd [20, 20, 0], 209, _plane, _group] call BISFUNC(spawnVehicle);
_return2 params ["_jet2"];
_jet2 allowDamage false;
_jet2 flyinHeightASL [500, 500, 500];

private _wp1 = _group addWaypoint [(getMarkerPos "marker_jets_1"), 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointCombatMode "BLUE";

private _wp2 = _group addWaypoint [(getMarkerPos "marker_jets_2"), 1];
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointCombatMode "BLUE";
_wp2 setWaypointStatements ["true", "{
private _veh = vehicle _x;
_veh deleteVehicleCrew driver _veh;
deleteVehicle _veh;
} forEach thisList;
if (count units group this isEqualTo 0) then {
	deleteGroup group this;
}"];

[FUNC(jets), [], random [1200, 1500, 3000]] call CBA_fnc_waitAndExecute;

true;
