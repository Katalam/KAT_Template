#include "script_component.hpp"
/*
 * Author: Katalam
 * Will create a new lightsources at given position.
 *
 * Arguments:
 * 0: House <OBJECT>
 *
 * Return Value:
 * Succesfull <BOOLEAN>
 *
 * Example:
 * [cursorTarget] call KAT_template_fnc_houseLightsLocal;
 *
 * Public: No
 */

params [
    ["_house", objNull, [objNull]]
];

private _middle = (getPosASL _house) vectoradd (boundingCenter _house) vectoradd [0, 0, 0.5];
private _testPos = _middle vectoradd [0, 0, 10];

private _ceiling = lineIntersectsSurfaces [_middle, _testpos];

if (count _ceiling > 0) then {
    private _lightPos = ASLToAGL ((_ceiling select 0) select 0) vectoradd [0, 0, -0.3];
    private _houseLight = "#lightpoint" createVehicleLocal _lightPos;

    _houseLight setLightColor [250, 200, 150];
    _houseLight setLightAmbient [1, 1, 0.2];
    _houseLight setLightAttenuation [1, 4, 4, 0, 1, 4];
    _houseLight setLightIntensity 10;
    _houseLight setLightUseFlare true;
    _houseLight setLightFlareSize 0.5;
    _houseLight setLightFlareMaxDistance 75;
    _house setvariable [QGVAR(houseLight), _houseLight];
    private _houseArray = player getvariable QGVAR(houses);
    _houseArray pushBack _house;
    player setvariable [QGVAR(houses), _houseArray];
};
