#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: H.Launcher-Ammunition
 */

params [["_box", objNull, [objNull]]];

_box addMagazineCargoGlobal [WEAPON_HLAUNCHER_AMMO_AT, 4];
_box addMagazineCargoGlobal [WEAPON_HLAUNCHER_AMMO_AP, 2];

true;
