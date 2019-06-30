#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds the given vehicle/crate loadout to the given vehicle or crate with global effect.
 * Returns true on success and false otherwise. Execute where vehicle is local.
 * Loadout name is case sensitive.
 * If loadoutName is "empty" then the vehicle is just cleared and not refilled.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: LoadoutName <STRING>
 *
 * Return Value:
 * Loadout applied <BOOL>
 *
 * Example:
 * [NATO_CRATE_FULL_1, "NATO_CRATE_FULL"] call KAT_template_fnc_applyVehicleLoadout;
 * [empty_1, "empty"] call KAT_template_fnc_applyVehicleLoadout;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_loadoutName", "", [""]]
];

if (_loadoutName isEqualTo "empty" || {!isNil "crate_logistic" && _vehicle isEqualTo crate_logistic}) exitWith {
    [_vehicle] call FUNC(clearVehicleInventory);
    true;
};

if (!local _vehicle) exitWith {false;};

if (isNil QGVAR(loadouts_vehicles)) exitWith {false;};

private _loadout = [GVAR(loadouts_vehicles), _loadoutName] call BISFUNC(getFromPairs);

if (isNil "_loadout") exitWith {false;};

[_vehicle] call FUNC(clearVehicleInventory);
[_vehicle] call _loadout;
