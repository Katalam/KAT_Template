#include "script_component.hpp"
/*
 * Author: Sinus
 * Creates ace interactions for loadout exchange.
 * Local effect. Positioning of the interaction point and texture is made for the "Land_MapBoard_F" object.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [board] call KAT_template_fnc_createLoadoutGUI;
 *
 * Public: Yes
 */

if (!hasInterface) exitWith {};
if (isNil QGVAR(gui_player_loadouts)) exitWith {};

params [
    ["_object", objNull, [objNull]]
];

private "_currentParent";

// Loadout GUI
[_object, 0, [],
    [QGVAR(loadoutActionParent), localize LSTRING(loadout), "", {}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

{
    if (_x isEqualType "") then {
        _currentParent = [_object, 0, [QGVAR(loadoutActionParent)],
            [QGVAR(loadoutAction) + (str _forEachIndex), _x, "", {}, {true}] call ace_interact_menu_fnc_createAction
        ] call ace_interact_menu_fnc_addActionToObject;
    } else {
        [_object, 0, _currentParent,
            [QGVAR(loadoutAction) + (str _forEachIndex), _x select 0, "", {[player, _this select 2] call FUNC(applyPlayerLoadout);}, {true}, {}, _x select 1] call ace_interact_menu_fnc_createAction
        ] call ace_interact_menu_fnc_addActionToObject;
    };
} forEach GVAR(gui_player_loadouts);
