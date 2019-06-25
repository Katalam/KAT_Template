#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds a diary entry with script execution links for the local player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_setUpDiaryScripts;
 *
 * Public: No
 */

if !(hasInterface) exitWith {};

private _healAll = [QGVAR(healAll), localize LSTRING(healAll), "\z\ace\addons\medical\UI\icons\medical_cross.paa", {[] remoteExec [QFUNC(heal), 0, false]}, {true}] call ACEFUNC(interact_menu,createAction);
private _addToZeus = [QGVAR(addToZeus), localize LSTRING(addToZeus), "", {[player] remoteExec [QFUNC(addToZeus), 2, false]}, {true}] call ACEFUNC(interact_menu,createAction);

[_healAll, _addToZeus] apply {[["ACE_ZeusActions"], _x] call ACEFUNC(interact_menu,addActionToZeus);};

true;
