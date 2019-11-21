#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut/BlauBär Edit: Redd
 * Checks if the vehicle is upside down.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call KAT_template_fnc_canUnflip
 *
 * Public: No
 */

params ["_vehicle"];

(vectorUp _vehicle) vectorDotProduct (surfaceNormal position _vehicle) < 0.8
