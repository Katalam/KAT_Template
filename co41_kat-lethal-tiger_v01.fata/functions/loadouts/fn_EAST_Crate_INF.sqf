#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - EAST: Infantry-Crate
 */

params [["_box", objNull, [objNull]]];

// Magazine
_box addItemCargoGlobal [EAST_AMMO, 26];

_box addItemCargoGlobal [EAST_LMG_AMMO, 3];

true;
