#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Normal Vehicle
 */

params [["_box", objNull, [objNull]]];

["ACE_Wheel", _box, 2] call ace_cargo_fnc_addCargoItem;

true;
