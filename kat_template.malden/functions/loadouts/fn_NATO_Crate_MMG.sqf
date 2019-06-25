#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: MMG-Crate
 */

params [["_box", objNull, [objNull]]];

_box addItemCargoGlobal ["ACE_SpareBarrel", 1];
_box addMagazineCargoGlobal [WEAPON_MMG_AMMO, 12];

true;
