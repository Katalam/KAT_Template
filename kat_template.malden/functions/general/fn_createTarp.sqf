#include "script_component.hpp"
/*
 * Author: Katalam
 * Create a colorful tarp at given position.
 *
 * Arguments:
 * 0: Position <OBJECT>
 * 1: Color <OBJECT> (default: Red)
 *
 * Return Value:
 * Successful <BOOL>
 *
 * Example:
 * [[0,0,0], "RED"] call KAT_template_fnc_createTarp;
 *
 * Public: Yes
 */

params [
    ["_position", [0,0,0], [[]]],
    ["_color", "RED", [""]],
    ["_small", false, [false]]
];

private "_classname";

switch (_color) do {
    case "GREEN": {
        _classname = "Tarp_01_Large_Green_F";
        if (_small) then {_classname = "Tarp_01_Small_Green_F"};
    };
    case "BLACK": {
        _classname = "Tarp_01_Large_Black_F";
        if (_small) then {_classname = "Tarp_01_Small_Black_F"};
    };
    case "YELLOW": {
        _classname = "Tarp_01_Large_Yellow_F";
        if (_small) then {_classname = "Tarp_01_Small_Yellow_F"};
    };
    default {
        _classname = "Tarp_01_Large_Red_F";
        if (_small) then {_classname = "Tarp_01_Small_Red_F"};
    };
};

private _tarp = createVehicle [_classname, _position, [], 0, "CAN_COLLIDE"];
_tarp enableSimulation false;
private _vector = surfaceNormal getPos _tarp;
_vector params ["_xb", "_yb"];
_tarp setVectorUp [_xb, _yb, 1];

true;
