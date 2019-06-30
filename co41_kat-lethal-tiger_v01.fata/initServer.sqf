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
//setDate [YEAR, MONTH, DAY, 12, 0]; // year, month, day, hour, minute
setDate [2024, 9, 5, 6, 15];
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

// apply editor placed ai with loadout
{
    if !(isNil str _x) then {
        private _loadoutName = [str _x] call FUNC(getLoadoutName);
        [_x, _loadoutName] call FUNC(applyPlayerLoadout);
    };
} count entities [["O_Soldier_F", "O_Soldier_AR_F"], []];

// adding removeable markers
call FUNC(marker);

// adds radio ambient sound to the radio in the first mission target
[radio] call FUNC(radio);

// move into gunner of vehicles due a loadout bug
[EAST_RFM_28, empty_2] remoteExec ["moveInGunner", EAST_RFM_28]; // Nissan PKM Tower
[EAST_RFM_29, empty_3] remoteExec ["moveInGunner", EAST_RFM_29]; // Nissan PKM Tower
[EAST_RFM_30, empty_4] remoteExec ["moveInGunner", EAST_RFM_30]; // DSchK Tower
[EAST_RFM_31, empty_5] remoteExec ["moveInGunner", EAST_RFM_31]; // DSchK Tower

// starts jets and plane waitAndExecute ambient
call FUNC(jets);
call FUNC(plane);
