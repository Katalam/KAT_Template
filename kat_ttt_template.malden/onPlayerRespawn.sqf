#include "script_component.hpp"
/*
 * Author: Katalam
 * Applies the loadout after respawn.
 */

// unlinks the non tfar radio for technical reasons
// prevents radio duplications
player unlinkItem "ItemRadio";

// get the loadoutname from the variable name
private _loadoutName = [str player] call FUNC(getLoadoutName);

// applys the player laodout
[player, _loadoutName] call FUNC(applyPlayerLoadout);

// Close BI's spectator that may be open
if (player getVariable [QGVAR(isSpectator), false]) then {
    ["Terminate"] call BISFUNC(EGSpectator);

    [player, false] remoteExec ["hideObjectGlobal", 2, false];
    player setCaptive false;

    player setVariable [QGVAR(isSpectator), false, false];
};
