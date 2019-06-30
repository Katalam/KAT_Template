#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds the given values to the mission statistic values. Execute on server. Local effect.
 *
 * Arguments:
 * 0: Bandages <NUMBER>
 * 1: Pulse <NUMBER>
 * 2: CPR <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [KAT_template_end_bandagesApplied, KAT_template_end_pulseChecked, KAT_template_end_cprPerformed] call KAT_template_fnc_addStatisticValues;
 *
 * Public: No
 */

if !(isServer) exitWith {};

params [
    ["_bandages", 0, [0]],
    ["_pulse", 0, [0]],
    ["_cpr", 0, [0]]
];

GVAR(end_bandagesApplied) = GVAR(end_bandagesApplied) + _bandages;
GVAR(end_pulseChecked) = GVAR(end_pulseChecked) + _pulse;
GVAR(end_cprPerformed) = GVAR(end_cprPerformed) + _cpr;
