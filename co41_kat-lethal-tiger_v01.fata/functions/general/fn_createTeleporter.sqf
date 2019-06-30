#include "script_component.hpp"
/*
 * Author: Sinus, with code parts from Belbo
 * Creates ace interactions for teleport to the squad or the platoon leader NATO_PTL_1.
 * Local effect. Execute on server and all players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [flagTP] call KAT_template_fnc_createTeleporter;
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]]
];

if (isServer) then { // no exitWith here because iirc there is a way to be false on isServer but false on hasInterface (HC iirc). Double exit is useless. Can't remove !hasInterface
    _object setFlagTexture "data\flag.paa";
};

if !(hasInterface) exitWith {};

private _tpCodeLead = {
    if (isNil "NATO_PTL_1") exitWith {
        [localize LSTRING(noPlatoonLeader)] call ACEFUNC(common,displayTextStructured);
    };
    [player, NATO_PTL_1] call FUNC(teleport);
};

private _tpCodeSquad = {
    private "_target";

    if (player isEqualTo (leader player)) then {
        private _grp = (units group player) select {alive _x && !(_x getVariable ["ACE_isUnconscious", false]) && (_x distance player) > 500};

        if (_grp isEqualTo []) exitWith {
            [localize LSTRING(groupNear), 2.5] call ACEFUNC(common,displayTextStructured);
        };

        _target = selectRandom _grp;
    } else {
        _target = leader player;
    };

    [player, _target] call FUNC(teleport);
};

[_object, 0, [],
    [QGVAR(tpActionParent), localize LSTRING(teleport), "", {}, {true}, {}, [], [-0.1, -0.4, -3]] call ACEFUNC(interact_menu,createAction)
] call ace_interact_menu_fnc_addActionToObject;

[_object, 0, [QGVAR(tpActionParent)],
    [QGVAR(tpAction0), localize LSTRING(toSquad), "", _tpCodeSquad, {true}] call ACEFUNC(interact_menu,createAction)
] call ace_interact_menu_fnc_addActionToObject;

[_object, 0, [QGVAR(tpActionParent)],
    [QGVAR(tpAction1), localize LSTRING(toPL), "", _tpCodeLead, {!isNil "NATO_PTL_1"}] call ACEFUNC(interact_menu,createAction)
] call ace_interact_menu_fnc_addActionToObject;
