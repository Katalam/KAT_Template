#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - EAST: Weapon-Crate
 */

params [["_box", objNull, [objNull]]];

// Weapons
_box addWeaponCargoGlobal [EAST_WEAPON, 3];
_box addWeaponCargoGlobal [EAST_LMG, 1];

true;
