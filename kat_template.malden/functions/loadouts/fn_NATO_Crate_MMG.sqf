#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: MMG-Kiste
 */

params [["_box", objNull, [objNull]]];

_box addItemCargoGlobal ["ACE_SpareBarrel", 1];
_box addMagazineCargoGlobal ["130Rnd_338_Mag", 12];

true;
