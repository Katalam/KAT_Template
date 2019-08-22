#include "script_component.hpp"
/*
 * Author: Katalam
 * Initialises the server side.
 */

//Removes corpse after disconnect.
addMissionEventHandler ["HandleDisconnect", {
    deleteVehicle (_this select 0);
}];

// set time and weather based on the release day
// have to be changed or removed in order to set date or change the weather ingame
setDate [YEAR, MONTH, DAY, 12, 0]; // year, month, day, hour, minute
0 setOvercast 0.3; // from 0 to 1, 0 is complete clear 0.3 is cloudy, 0.5 very cloudy, 0.7 is rainy
forceWeatherChange;

// will only execute on real server
if (isDedicated) then {
    // add server side event handlers for the statistics at mission end
    call FUNC(setUpStatistic);
    // will set the ace-cargo of the object to 0 is object isEqualTo Land_CargoBox_V1_F
    [crate_logistic] call FUNC(createCrateSpawn);
};

// set the ai (it doesnt matter if pre placed or curator placed) to a specific skill
["Man", "InitPost", LINKFUNC(setSkill), true, [], true] call CBA_fnc_addClassEventHandler;
// execute a script on the ai to let them throwing grenades
["Man", "InitPost", LINKFUNC(aiFrags), true, [], true] call CBA_fnc_addClassEventHandler;

// Prevent looting at dead ai
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

// Switch slingload-cargo locality to helicopter if possible
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

// adds satcom ability to all planes
// player have to have the "KAT_template_satComLinks" variable set to the same
// standard is SATCOM 1 and SATCOM 2 for all pilots, no crew member
[["Plane"], ["SATCOM 1", "SATCOM 2"]] call FUNC(satcom);
