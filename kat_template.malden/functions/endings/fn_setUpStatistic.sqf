#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds the needed variables and event handler for the statistics at mission end. Execute in initPlayerLocal and initServer.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call KAT_template_fnc_setUpStatistic;
 *
 * Public: No
 */

// initServer part
if (isServer) then {
    GVAR(end_fragsOut) = 0;
    GVAR(end_shotsFired) = 0;
    GVAR(end_aiKilled) = 0;
    GVAR(end_bandagesApplied) = 0;
    GVAR(end_pulseChecked) = 0;
    GVAR(end_cprPerformed) = 0;
    GVAR(end_launcherFired) = 0;
    GVAR(end_handGunFired) = 0;
    GVAR(end_vehicleFired) = 0;

    addMissionEventHandler ["EntityKilled", {
        params ["_unit"];

        if (_unit isKindOf "Man") then {
            if (!(isPlayer _unit)) then {
                GVAR(end_aiKilled) = GVAR(end_aiKilled) + 1;
            };
        };
    }];

    ["CAManBase", "Fired", {
        params ["_unit", "_weapon", "_muzzle"];

        if (isPlayer _unit) then {
            if (_muzzle isEqualTo "HandGrenadeMuzzle" || _muzzle isEqualTo "MiniGrenadeMuzzle") then {
                GVAR(end_fragsOut) = GVAR(end_fragsOut) + 1;
            };

            if (_weapon isEqualTo primaryWeapon _unit) then {
                GVAR(end_shotsFired) = GVAR(end_shotsFired) + 1;
            };
            if (_weapon isEqualTo secondaryWeapon _unit) then {
                GVAR(end_launcherFired) = GVAR(end_launcherFired) + 1;
            };
            if (_weapon isEqualTo handgunWeapon _unit) then {
                GVAR(end_handGunFired) = GVAR(end_handGunFired) + 1;
            };
        };
    }] call CBA_fnc_addClassEventHandler;

    ["Car", "Fired", {
        params ["_unit", "", "", "", "", "", "", "_vehicle"];

        if (isPlayer _unit && !(_vehicle isEqualTo objNull)) then {
            GVAR(end_vehicleFired) = GVAR(end_vehicleFired) + 1;
        };
    }] call CBA_fnc_addClassEventHandler;
};

// initPlayerLocal part
if (hasInterface) then {
    GVAR(end_bandagesApplied) = 0;
    GVAR(end_pulseChecked) = 0;
    GVAR(end_cprPerformed) = 0;

    ["ace_treatmentSucceded", {
        params ["", "", "", "_className"];

        if (toLower _className in ["fielddressing", "packingbandage", "elasticbandage", "quikclot"]) exitWith {
            GVAR(end_bandagesApplied) = GVAR(end_bandagesApplied) + 1;
        };

        if (toLower _className isEqualTo "checkpulse") exitWith {
            GVAR(end_pulseChecked) = GVAR(end_pulseChecked) + 1;
        };

        if (toUpper _className isEqualTo "CPR") exitWith {
            GVAR(end_cprPerformed) = GVAR(end_cprPerformed) + 1;
        };
    }] call CBA_fnc_addEventHandler;
};
