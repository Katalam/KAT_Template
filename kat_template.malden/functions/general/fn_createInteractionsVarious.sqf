#include "script_component.hpp"
/*
 * Author: Katalam
 * Creates ace interactions for open or close Ghost Hawk doors.
 * Local effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_createInteractionsVarious;
 *
 * Public: Yes
 */

if !(hasInterface) exitWith {};

// open or close ghost hawk doors
private _doorCode = {
    params ["_target"];

    if ((_target doorPhase "door_L") isEqualTo 0) then {
        _target animateDoor ["door_L", 1];
        _target animateDoor ["door_R", 1];
    } else {
        _target animateDoor ["door_L", 0];
        _target animateDoor ["door_R", 0];
    };
};
private _doorAction = ["switchDoorsGH", "Switch Doors", "", _doorCode, {true}] call ACEFUNC(interact_menu,createAction);
["B_Heli_Transport_01_F", 0, ["ACE_MainActions"], _doorAction, true] call ACEFUNC(interact_menu,addActionToClass);
["B_Heli_Transport_01_F", 1, ["ACE_SelfActions"], _doorAction, true] call ACEFUNC(interact_menu,addActionToClass);
