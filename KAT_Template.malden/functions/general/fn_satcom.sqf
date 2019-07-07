#include "script_component.hpp"
/*
 * Author: MorpheusXAUT Edited by Katalam
 * Enables a SatCom sytem for all vehicles with the provided classes (including inheritance), making use of a TFAR vehicleID override and the InterCom system.
 * Players can activate, switch and deactivate their SatCom links via vehicle ACE interaction menu while in a vehicle.
 * All SatCom Links provided are defined and can be used by players as defined via their playerVariables (see below).
 * SatCom Links will be displayed for soldiers depending on their "KAT_template_satComLinks" variable, thus allowing to restrict certain players to their own SatCom Links.
 * Optionally, SatCom Links can be displayed in an alternative color (defaults to #FFFFFF, white if not provided).
 * SatCom Links will persist for all players within a vehicle (that have access to the InterCom as defined by TFAR), the crew and cargo InterCom channels can also be used to
 * further devide SatCom Links into two more groups. Players that do not have access to any SatCom Links can still deactivate the Link if it has been previously activated.
 * Deactivating a SatCom Link returns the vehicle's TFAR InterCom to regular operations, allowing only communications between players within the same vehicle.
 *
 * Arguments:
 * 0: Vehicle classes <ARRAY> of <STRINGS>
 * 1: Available SatCom Links <ARRAY> of <STRINGS>
 *  0: Name <STRING>
 *  1: hex color <STRING> (optional)
 *
 * Return Value:
 * 0: Handle <NUMBER>
 *
 * Example:
 * [["B_Plane_Fighter_01_F", "B_MRAP_01_F"], [["Reaper", "#0000FF"], "Gambit"]] call KAT_template_fnc_satcom;
 * player setVariable ["KAT_template_satComLinks", ["Reaper", "Gambit"]];
 *
 * Public: No
 */

if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};
if !(isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) exitWith {};

params [
    ["_vehicleClasses", [""], [[""]]],
    ["_satComLinks", [""], [[""], [["", ""]]]]
];

_vehicleClasses apply {
    private _vehicleClass = _x;

    private _actionMenu = [QGVAR(Menu), "SatCom", "", {}, {
            params ["_vehicle", "_player"];

            private _vehicleSatComLink = _vehicle getVariable "TFAR_vehicleIDOverride";
            private _playerSatComLinks = _player getVariable [QGVAR(satComLinks), []];
            if ((isNil "_vehicleSatComLink") && (count _playerSatComLinks == 0)) exitWith {false};

            true;
        }, {}, []] call ACEFUNC(interact_menu,createAction);

    [_vehicleClass, 1, ["ACE_SelfActions"], _actionMenu, true] call ACEFUNC(interact_menu,addActionToClass);

    {
        _x params [
            ["_satComLink", "", [""]],
            ["_satComLinkColor", "#FFFFFF", [""]]
        ];

        // TO-DO localize
        private _actionActivate = [format [QGVAR(Activate_%1), _satComLink], format ["<t color=""%1"">Activate SatCom Link %2</t>", _satComLinkColor, _satComLink], "", {
            params ["_target", "", "_params"];
            _params params ["_satComLink"];
            _target setVariable ["TFAR_vehicleIDOverride", format ["VehicleSatComLink_%1", _satComLink], true];
        }, {
            params ["_vehicle", "_player", "_params"];
            _params params ["_satComLink"];

            private _vehicleSatComLink = _vehicle getVariable "TFAR_vehicleIDOverride";
            if !(isNil "_vehicleSatComLink") exitWith {false};

            private _playerSatComLinks = _player getVariable [QGVAR(satComLinks), []];
            if (count _playerSatComLinks == 0) exitWith {false};
            if (!(_satComLink in _playerSatComLinks)) exitWith {false};

            true;
        }, {}, [_satComLink]] call ACEFUNC(interact_menu,createAction);

        [_vehicleClass, 1, ["ACE_SelfActions", QGVAR(Menu)], _actionActivate, true] call ACEFUNC(interact_menu,addActionToClass);

        // TO-DO localize
        private _actionSwitch = [format [QGVAR(Switch_%1), _satComLink], format ["<t color=""%1"">Switch to SatCom Link %2</t>", _satComLinkColor, _satComLink], "", {
            params ["_target", "", "_params"];
            _params params ["_satComLink"];
            _target setVariable ["TFAR_vehicleIDOverride", format [QGVAR(%1), _satComLink], true];
        }, {
            params ["_vehicle", "_player", "_params"];
            _params params ["_satComLink"];

            private _vehicleSatComLink = _vehicle getVariable "TFAR_vehicleIDOverride";
            if (isNil "_vehicleSatComLink") exitWith {false};
            if (_vehicleSatComLink == format[QGVAR(%1), _satComLink]) exitWith { false };

            private _playerSatComLinks = _player getVariable [QGVAR(satComLinks), []];
            if (count _playerSatComLinks == 0) exitWith {false};
            if !(_satComLink in _playerSatComLinks) exitWith {false};

            true;
        }, {}, [_satComLink]] call ACEFUNC(interact_menu,createAction);

        [_vehicleClass, 1, ["ACE_SelfActions", QGVAR(Menu)], _actionSwitch, true] call ACEFUNC(interact_menu,addActionToClass);
    } forEach _satComLinks;

    private _actionDeactivate = [QGVAR(Deactivate), "<t color=""#FF0000"">Deactivate SatCom Link</t>", "", {
        params ["_target"];

        _target setVariable ["TFAR_vehicleIDOverride", nil, true];
    }, {
        params ["_target"];

        private _vehicleSatComLink = _target getVariable "TFAR_vehicleIDOverride";
        if (isNil "_vehicleSatComLink") exitWith {false};

        true;
    }, {}, []] call ACEFUNC(interact_menu,createAction);

    [_vehicleClass, 1, ["ACE_SelfActions", QGVAR(Menu)], _actionDeactivate, true] call ACEFUNC(interact_menu,addActionToClass);
};
