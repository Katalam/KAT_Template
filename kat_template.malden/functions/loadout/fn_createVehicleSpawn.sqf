#include "script_component.hpp"
/*
 * Author: Sinus
 * Creates ace interactions for spawning vehicles.
 * Local effect.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [batterie, "marker_vehiclespawn"] call KAT_template_fnc_createVehicleSpawn;
 *
 * Public: Yes
 */

if (!hasInterface) exitWith {};
if (isNil QGVAR(gui_vehicle_loadouts)) exitWith {};

params [
    ["_object", objNull, [objNull]],
    ["_markerName", "", [""]]
];

if ((getMarkerPos _markerName) isEqualTo [0, 0, 0]) exitWith {};

private "_currentParent";

private _vehCode = {
    (_this select 2) params ["_loadoutString", "_markerName"];

    private _splits = [_loadoutString, "@"] call BIS_fnc_splitString;

    private _loadout = _splits select 0;
    private _class = "";

    if (count _splits > 1) then {
        _class = _splits select 1;
    };

    private _pos = getMarkerPos _markerName;
    _pos deleteAt 2;

    // remove old vehicles
    {deleteVehicle _x} count (nearestObjects [_pos, ["Helicopter", "Plane", "Tank", "Car", "Ship", "ReammoBox_F"], 15, true]);

    if (_loadout isEqualTo "REMOVE") exitWith {};

    [{
        private _veh = (_this select 0) createVehicle getMarkerPos (_this select 2);
        _veh setDir (markerDir (_this select 2));
        _veh allowDamage false;
        [_veh, (_this select 1)] call FUNC(applyVehicleLoadout);

        [{_this allowDamage true;}, _veh, 1] call CBA_fnc_waitAndExecute;
    }, [_class, _loadout, _markerName], 1] call CBA_fnc_waitAndExecute;
};

{
    if (_x isEqualType "") then {
        _currentParent = [_object, 0, ["ACE_MainActions"],
            [QGVAR(vehAction) + (str _forEachIndex), _x, "", {}, {true}] call ace_interact_menu_fnc_createAction
        ] call ace_interact_menu_fnc_addActionToObject;
    } else {
        [_object, 0, _currentParent,
            [QGVAR(vehAction) + (str _forEachIndex), _x select 0, "", _vehCode, {true}, {}, [_x select 1, _markerName]] call ace_interact_menu_fnc_createAction
        ] call ace_interact_menu_fnc_addActionToObject;
    };
} forEach GVAR(gui_vehicle_loadouts);
