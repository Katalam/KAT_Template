#include "script_component.hpp"
/*
 * Author: Katalam
 * Applies the loadout after respawn.
 */

player unlinkItem "ItemRadio";

private _loadoutName = [str player] call FUNC(getLoadoutName);
[player, _loadoutName] call FUNC(applyPlayerLoadout);

// Close BI's spectator that may be open
if (player getVariable [QGVAR(isSpectator), false]) then {
	["Terminate"] call BIS_fnc_EGSpectator;

	[player, false] remoteExec ["hideObjectGlobal", 2, false];
	player setCaptive false;

	player setVariable [QGVAR(isSpectator), false, false];
};
