#include "script_component.hpp"
/*
 * Author: Katalam
 * Initialises the server side.
 */

//Removes corpse after disconnect.
addMissionEventHandler ["HandleDisconnect", {
    deleteVehicle (_this select 0);
}];

// set time and weather
setDate [YEAR, MONTH, DAY, 12, 0]; // year, month, day, hour, minute
0 setOvercast 0.3; // from 0 to 1, 0 is complete clear 0.3 is cloudy, 0.5 very cloudy, 0.7 is rainy
forceWeatherChange;

// add server side event handlers for the statistics at mission end
if (isDedicated) then {
    call FUNC(setUpStatistic);
    [flagTP] call FUNC(createTeleporter);
    [crate_logistic] call FUNC(createCrateSpawn);
};

["Man", "InitPost", LINKFUNC(setSkill), true, [], true] call CBA_fnc_addClassEventHandler;
["Man", "InitPost", LINKFUNC(aiFrags), true, [], true] call CBA_fnc_addClassEventHandler;

GVAR(noLootingEVH) = call FUNC(noLooting);

// read and prepare available loadouts
call FUNC(prepareLoadouts);

// fill editor placed vehicles with loadout
{
    if !(isNil str _x) then {
        private _loadoutName = [str _x] call FUNC(getLoadoutName);
        [_x, _loadoutName] call FUNC(applyVehicleLoadout);
    };
} count entities [["Helicopter", "Plane", "Tank", "Car", "Ship", "ReammoBox_F"], []];

// Switch cargo locality to helicopter if possible
["Helicopter", "init", {
    params ["_heli"];

    _heli addEventHandler ["RopeAttach", {
        params ["_heli", "", "_cargo"];

        // Only transfer if cargo empty to avoid RPT warnings from 'setOwner'
        // Transfer actually works in all cases except if driver is present,
        // but "Script command setOwner cannot be used for object 'B_MRAP_01_F'.
        // Use setGroupOwner instead." is printed in RPT either way (BI T136908)
        if ((fullCrew _cargo) isEqualTo []) then {
            private _heliOwner = owner _heli;
            if (_heliOwner != owner _cargo) then {
                _cargo setOwner _heliOwner;
            };
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;
