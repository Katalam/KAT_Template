#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: L.Launcher-Kiste
 */

params [["_box", objNull, [objNull]]];

_box addWeaponCargoGlobal [WEAPON_LAUNCHER, 1];
_box addItemCargoGlobal [WEAPON_LAUNCHER_AMMO_HEAT, 6];
_box addItemCargoGlobal [WEAPON_LAUNCHER_AMMO_HE, 4];

true;
