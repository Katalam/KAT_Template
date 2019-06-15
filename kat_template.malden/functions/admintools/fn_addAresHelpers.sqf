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

[QGVAR(helperScripts), localize LSTRING(captive),
		{[_this select 1, true] remoteExec ["setCaptive", _this select 1, true];}
	] call Ares_fnc_RegisterCustomModule;

[QGVAR(helperScripts), localize LSTRING(decaptive),
		{[_this select 1, false] remoteExec ["setCaptive", _this select 1, true];}
	] call Ares_fnc_RegisterCustomModule;

[QGVAR(helperScripts), localize LSTRING(endWinNice),
		{[] remoteExec [QFUNC(endWinNice), 0, false];}
	] call Ares_fnc_RegisterCustomModule;

[QGVAR(helperScripts), localize LSTRING(endLose),
		{[] remoteExec [QFUNC(endLose), 2, false];}
	] call Ares_fnc_RegisterCustomModule;
