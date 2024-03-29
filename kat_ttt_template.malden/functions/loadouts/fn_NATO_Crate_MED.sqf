#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Medic-Crate
 */

params [["_box", objNull, [objNull]]];

// Medical
_box addItemCargoGlobal ["ACE_packingBandage", 64];
_box addItemCargoGlobal ["ACE_elasticBandage", 56];

_box addItemCargoGlobal ["ACE_tourniquet", 6];

_box addItemCargoGlobal ["ACE_morphine", 12];
_box addItemCargoGlobal ["ACE_epinephrine", 12];
_box addItemCargoGlobal ["ACE_atropine", 4];

_box addItemCargoGlobal ["ACE_salineIV_500", 14];
_box addItemCargoGlobal ["ACE_plasmaIV_500", 18];

_box addItemCargoGlobal ["ACE_bodyBag", 2];

true;
