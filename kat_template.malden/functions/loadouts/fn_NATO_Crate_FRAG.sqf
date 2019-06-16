#include "script_component.hpp"
/*
 * Author: Sinus
 * Loadout - NATO: Granaten-Kiste
 */

params [["_box", objNull, [objNull]]];

// Throwables
_box addItemCargoGlobal ["SmokeShell", 8];
_box addItemCargoGlobal ["SmokeShellGreen", 8];
_box addItemCargoGlobal ["SmokeShellOrange", 8];
_box addItemCargoGlobal ["SmokeShellRed", 8];
_box addItemCargoGlobal ["MiniGrenade", 8];
_box addItemCargoGlobal ["ACE_HandFlare_Yellow", 8];
_box addItemCargoGlobal ["ACE_M84", 8];
_box addItemCargoGlobal ["ACE_M14", 8];

_box addMagazineCargoGlobal [WEAPON_UGL_AMMO, 8];
_box addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
_box addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 8];
_box addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 8];
_box addMagazineCargoGlobal ["UGL_FlareYellow_F", 8];

true;
