#include "script_component.hpp"
/*
 * Author: Katalam
 * Short version for KAT_template_fnc_applyPlayerLoadout for debug console
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Loadout class name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "NATO_SQL"] call KAT_fnc_apl;
 *
 * Public: Yes
 */

_this call FUNC(applyPlayerLoadout);
