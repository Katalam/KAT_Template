#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Repair Vehicle
 */

params [["_box", objNull, [objNull]]];

["ACE_Wheel", _box, 6] call ace_cargo_fnc_addCargoItem;
["ACE_Track", _box, 4] call ace_cargo_fnc_addCargoItem;

true;
