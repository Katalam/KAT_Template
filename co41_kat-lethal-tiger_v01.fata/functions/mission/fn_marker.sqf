#include "script_component.hpp"
/*
 * Author: Katalam
 * Adds ingame for clients removeable marker.
 * Will be changed if needed (platoon commander decides).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_marker;
 *
 * Public: No
 */

private _markerNameContinue = 1;

[
    ["Fhz 1", [1992.667, 330.765, 0], "hd_dot"],
    ["Fhz 2", [1992.667, 316.578, 0], "hd_dot"],
    ["Fhz 3", [1992.667, 303.988, 0], "hd_dot"],
    ["Fhz 4", [1992.667, 285.06, 0], "hd_dot"],
    ["Fhz 5", [1992.667, 272.614, 0], "hd_dot"],

    ["SP", [2039.381, 371.458, 0], "hd_start"],

    ["", [2149.427, 689.049, 0], "hd_dot"],
    ["", [2195.366, 711.686, 0], "hd_dot"],

    ["", [2230.499, 722.006, 0], "hd_dot"],
    ["", [2264.532, 716.589, 0], "hd_dot"],

    ["", [4023.173, 627.777, 0], "hd_dot"],
    ["PP 1", [4080.141, 661.603, 0], "hd_dot"],
    ["", [4138.088, 660.093, 0], "hd_dot"],

    ["", [6387.465, 606.816, 0], "hd_dot"],
    ["", [6453.147, 652.795, 0], "hd_dot"],

    ["RP", [6856.130, 2463.97, 0], "hd_end"]
] apply {
    _x params ["_text", "_pos", "_type"];
    _markerNameContinue = _markerNameContinue + 1;
    private _userDefined = format ["_USER_DEFINED marker_%1", _markerNameContinue];
    private _markerName = createMarker [_userDefined, _pos];
    _markerName setMarkerType _type;
    if !(_text isEqualTo "") then {
        _markerName setMarkerText _text;
    };
};
