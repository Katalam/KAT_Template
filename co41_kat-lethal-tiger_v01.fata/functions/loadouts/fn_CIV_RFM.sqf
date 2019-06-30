#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - CIV: Civilian
 */

params [["_player", objNull, [objNull]]];

/** VARIABLES */
_player setVariable ["ACE_medical_medicClass", 0, true];
_player setVariable ["ACE_GForceCoef", 0.7, true];
_player setVariable ["ACE_isEngineer", 0, true];
_player setVariable ["ACE_isEOD", false, true];

_player setUnitRank "PRIVATE";

/** CLOTHING */
_player forceAddUniform selectRandom CIV_UNIFORM;

/** COMMS */
_player linkItem "ItemMap";
_player linkItem "ItemWatch";

true;
