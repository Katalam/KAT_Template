#include "script_component.hpp"
/*
 * Author: Katalam
 * Action for unflipping a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call KAT_template_fnc_unflipVehicle
 *
 * Public: No
 */

params ["_vehicle"];

if !(isNull _vehicle) then {
    _vehicle allowDamage false;
    _vehicle setpos [(getpos _vehicle) select 0, (getpos _vehicle) select 1, 0.5];
    _vehicle setVectorUp surfaceNormal position _vehicle;
    sleep 3;
    _vehicle allowDamage true;
};
