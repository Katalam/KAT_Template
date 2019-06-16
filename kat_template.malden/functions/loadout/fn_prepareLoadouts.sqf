#include "script_component.hpp"
/*
 * Author: Sinus
 * Fills the loadout-name to loadout-function mapping "KAT_template_loadouts_player" and "KAT_template_loadouts_player" with
 * the funtions found with tag "LOADOUT_PLAYER" and "LOADOUT_VEH".
 * Existing mapping is overwritten. Local effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_prepareLoadouts;
 *
 * Public: No
 */

GVAR(loadouts_player) = [];
GVAR(loadouts_vehicles) = [];

private _configPath = missionConfigFile >> "CfgFunctions" >> "LOADOUT_PLAYER";

{
    {
        [GVAR(loadouts_player), _x, compile ("call LOADOUT_PLAYER_fnc_" + _x)] call BIS_fnc_setToPairs;
        true;
    } count ((_configPath >> _x) call BIS_fnc_getCfgSubClasses);
    true;
} count (_configPath call BIS_fnc_getCfgSubClasses);

_configPath = missionConfigFile >> "CfgFunctions" >> "LOADOUT_VEH";

{
    {
        [GVAR(loadouts_vehicles), _x, compile ("call LOADOUT_VEH_fnc_" + _x)] call BIS_fnc_setToPairs;
        true;
    } count ((_configPath >> _x) call BIS_fnc_getCfgSubClasses);
    true;
} count (_configPath call BIS_fnc_getCfgSubClasses);
