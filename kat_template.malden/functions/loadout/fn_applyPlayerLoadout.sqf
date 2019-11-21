#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds the given player loadout to the given player with global effect.
 * Loadout name is case sensitive.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Loadout class name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "NATO_SQL"] call KAT_template_fnc_applyPlayerLoadout;
 *
 * Public: Yes
 */

params [
    ["_player", objNull, [objNull]],
    ["_loadoutName", "", [""]]
];

if (_loadoutName in ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"]) exitWith {
    _player setUnitRank _loadoutName;
};

if (local _player) then {
    if (isNil QGVAR(loadouts_player)) exitWith {};

    private _loadout = [GVAR(loadouts_player), _loadoutName] call BISFUNC(getFromPairs);

    if (isNil "_loadout") exitWith {
        "Loadout not found"
    };

    [_player] call FUNC(clearPlayerInventory);

    [_player] call _loadout;

    [_loadoutName] call FUNC(setChannels);
} else {
    [_player, _loadoutName] remoteExec [QFUNC(applyPlayerLoadout), _player];
};
