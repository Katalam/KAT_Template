#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds some useful ares functions. Local effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_addAresHelpers;
 *
 * Public: Yes
 */

if !(hasInterface) exitWith {};

// Captive
["KAT Template Helper", localize LSTRING(captive),
        {[_this select 1, true] remoteExec ["setCaptive", _this select 1, true];}
] call Ares_fnc_RegisterCustomModule;

["KAT Template Helper", localize LSTRING(decaptive),
        {[_this select 1, false] remoteExec ["setCaptive", _this select 1, true];}
] call Ares_fnc_RegisterCustomModule;

// End
["KAT Template Helper", localize LSTRING(endWinNice),
        {[] remoteExec [QFUNC(endWinNice), 0, false];}
] call Ares_fnc_RegisterCustomModule;

["KAT Template Helper", localize LSTRING(endLose),
        {[] remoteExec [QFUNC(endLose), 2, false];}
] call Ares_fnc_RegisterCustomModule;

// Loadout
["KAT Template Helper", localize LSTRING(loadout_1),
        {[_this select 1, "EAST_LMG"] remoteExec [QFUNC(applyPlayerLoadout), _this select 1, true];}
] call Ares_fnc_RegisterCustomModule;

["KAT Template Helper", localize LSTRING(loadout_2),
        {[_this select 1, "EAST_RFM"] remoteExec [QFUNC(applyPlayerLoadout), _this select 1, true];}
] call Ares_fnc_RegisterCustomModule;

["KAT Template Helper", localize LSTRING(loadout_3),
        {[_this select 1, "NATO_HELI_PIL"] remoteExec [QFUNC(applyPlayerLoadout), _this select 1, true];}
] call Ares_fnc_RegisterCustomModule;
