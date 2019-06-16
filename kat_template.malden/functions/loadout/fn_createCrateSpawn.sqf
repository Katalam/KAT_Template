#include "script_component.hpp"
/*
 * Author: Sinus
 * Creates ace interactions for spawning logistic crates with loadout specific content.
 * Local effect. Execute on server and all players.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate_logistic, "marker_cratespawn"] call KAT_template_fnc_createCrateSpawn;
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]],
    ["_markerName", "", [""]]
];

if (isServer) then {
    if ((typeOf _object) isEqualTo "Land_CargoBox_V1_F") then {
        [_object, 0] call ace_cargo_fnc_setSpace;
    };
};

if (isNil QGVAR(gui_crate_loadouts)) exitWith {};
if ((getMarkerPos _markerName) isEqualTo [0, 0, 0]) exitWith {};
if (!hasInterface) exitWith {};

private "_currentParent";

private _crateCode = {
    (_this select 2) params ["_loadoutString", "_markerName", "_object"];

    private _splits = [_loadoutString, "@"] call BIS_fnc_splitString;

    private _logistic = _splits select 0;
    private _class = "";

    if (count _splits > 1) then {
        _class = _splits select 1;
    };

    private _spawnPos = [getMarkerPos _markerName, 0, 3, 2.8] call BIS_fnc_findSafePos;

    switch (_logistic) do {
        case "WHEEL": {
            private _box = "ACE_Wheel" createVehicle [0, 0, 0];
            _box setPos _spawnPos;
        };
        case "TRACK": {
            private _box = "ACE_Track" createVehicle [0, 0, 0];
            _box setPos _spawnPos;
        };
        case "STATIC": {
            private _box = _class createVehicle [0, 0, 0];
            _box setPos _spawnPos;
        };
        case "EMPTY": {
            private _box = _class createVehicle [0, 0, 0];
            _box allowDamage false;
            _box setPos _spawnPos;

            [_box] call FUNC(clearVehicleInventory);
        };
        case "REMOVE": {
            {deleteVehicle _x} count ((nearestObjects [getMarkerPos _markerName, ["ReammoBox_F", "ACE_Wheel", "ACE_Track", "StaticWeapon"], 4.5, false]) - [_object]);
        };
        default {
            private _box = _class createVehicle [0, 0, 0];
            _box allowDamage false;
            _box setPos _spawnPos;

            [_box, _logistic] call FUNC(applyVehicleLoadout);
        };
    };
};

{
    if (_x isEqualType "") then {
        _currentParent = [_object, 0, ["ACE_MainActions"],
            [QGVAR(crateAction) + (str _forEachIndex), _x, "", {}, {true}] call ace_interact_menu_fnc_createAction
        ] call ace_interact_menu_fnc_addActionToObject;
    } else {
        [_object, 0, _currentParent,
            [QGVAR(crateAction) + (str _forEachIndex), _x select 0, "", _crateCode, {true}, {}, [_x select 1, _markerName, _object]] call ace_interact_menu_fnc_createAction
        ] call ace_interact_menu_fnc_addActionToObject;
    };
} forEach GVAR(gui_crate_loadouts);
