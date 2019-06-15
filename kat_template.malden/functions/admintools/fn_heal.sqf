#include "script_component.hpp"
/*
 * Author: Sinus
 * Heals the player where the function is executed on with global effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call KAT_template_fnc_heal;
 *
 * Public: Yes
 */

if (isDedicated) exitWith {};

player setDamage 0;
[player, player] call ACEFUNC(medical,treatmentAdvanced_fullHealLocal);
//player setVariable ["adv_aceSplint_reopenUndo", true];
