#include "script_component.hpp"
/*
 * Author: Sinus
 * Makes the group 'defend': disables pathing until any targets are close (< 20 meters from group leader),
 * then attacks with about half of the groups initial strength.
 * Execute where group and units are local. Remote controlling or changing the locality of a unit or the group results in undefinded behaviour.
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ai_grp_1] call KAT_template_fnc_aiDefend;
 *
 * Public: Yes
 */

params [
    ["_grp", grpNull, [grpNull]]
];

if !(local _grp) exitWith {};

// make units 'defend'
{
    _x disableAI "PATH";
} count units _grp;
_grp setVariable [QGVAR(aiAmountStart), {alive _x} count (units _grp)];

// add group to list
if (isNil QGVAR(ai_groups)) then {
    GVAR(ai_groups) = [_grp];
} else {
    GVAR(ai_groups) pushBackUnique _grp;
};

// check if perFrameHandler need to be started (again)
if (isNil QGVAR(ai_pfhRunning) || {!GVAR(ai_pfhRunning)}) then {
    GVAR(ai_pfhRunning) = true;

    GVAR(ai_pfh) = [{
        params ["", "_handle"];

        {
            // remove empty or deleted groups
            if (_x isEqualTo grpNull || ({alive _x} count (units _x)) isEqualTo 0) then {
                GVAR(ai_groups) deleteAt (GVAR(ai_groups) find _x); // prevent concurrent modification errors
            } else {
                if ((behaviour leader _x) isEqualTo "COMBAT") then {
                    private _enemies = (leader _x) targets [true, 20];

                    if (!(_enemies isEqualTo [])) then {
                        private _aiAlive = (units _x) select {alive _x};
                        private _attackAmount = (count _aiAlive) - ((_x getVariable [QGVAR(aiAmountStart), 0]) / 2);

                        if (_attackAmount > 0) then {
                            for "_i" from 1 to _attackAmount do {
                                private _selected = selectRandom _aiAlive;
                                private _enemy = _selected findNearestEnemy _selected;

                                _selected enableAI "PATH";
                                _selected doTarget _enemy;
                                _selected setUnitPos "AUTO";
                                _selected doMove (position _enemy);

                                _aiAlive deleteAt (_aiAlive find _selected);
                            };
                        };

                        GVAR(ai_groups) deleteAt (GVAR(ai_groups) find _x); // prevent concurrent modification errors
                    };
                };
            };
            true;
        } count GVAR(ai_groups);

        // end script when no more groups left
        if (GVAR(ai_groups) isEqualTo []) then {
            [_handle] call CBA_fnc_removePerFrameHandler;
            GVAR(ai_pfhRunning) = false;
        };
    }, 1] call CBA_fnc_addPerFrameHandler;
};
