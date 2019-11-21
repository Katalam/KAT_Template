#include "script_component.hpp"
/*
 * Author: Katalam
 * Will add lightsources to the nearest buildings from the actual player position.
 * Version 1.0 still needs testing and improvements
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_houseLights;
 *
 * Public: No
 */

private _posNow = getPos player;
private _posOld = player getVariable [QGVAR(lastPos), [0, 0, 0]];
private _countHouse = count (player getVariable [QGVAR(houses), []]);
private _isTimeForLightsOn = [0, 0, 0] getEnvSoundController "night" > 0.7;
private "_houseArray";

if (_countHouse < 25 && {_posNow distance _posOld > 3} && {_isTimeForLightsOn}) then {
    player setVariable [QGVAR(lastPos), _posNow];
    _houseArray = nearestTerrainObjects [_posNow, ["HOUSE"], 80, true, true];
    private _houseArraySortedOut = _houseArray select {!(_x buildingPos -1 isEqualTo [])};

    _houseArraySortedOut apply {
        if (isNil {_x getVariable QGVAR(houseLight)}) then {
            private _random = random 10;
            if (_random > 3) then {
                [_x] call FUNC(houseLightsLocal);
            };
        };
    };
};

_houseArray apply {
    if (getPos _x distance _posNow > 60) then {
        deleteVehicle (_x getVariable QGVAR(houseLight));
        _x setVariable [QGVAR(houseLight), nil];
        private _houseArrayPlayer = player getvariable QGVAR(houses);
        _houseArrayPlayer - [_x];
        player setvariable [QGVAR(houses), _houseArrayPlayer];
    };
};

if !(_isTimeForLightsOn) then {
    private _houseArrayPlayer = player getvariable QGVAR(houses);
    player setvariable [QGVAR(houses), nil];
    _houseArrayPlayer apply {
        deleteVehicle (_x getVariable QGVAR(houseLight));
        _x setVariable [QGVAR(houseLight), nil];
    };
};

[CALLFUNC(houseLights), [], 120] call CBA_fnc_waitAndExecute;
