#include "script_component.hpp"
/*
 * Author: Sinus
 * Makes the given ai unit use grenades when useful. Works with vanilla RGO and RGN grenade.
 * Execute where unit is local. Does work with remote controlled ai, but will not be useful.
 * Changing the locality of the unit results in undefinded behaviour.
 * Returns the index of the event handler added.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * 0: Handle <NUMBER>
 *
 * Example:
 * [ai_1] call KAT_template_fnc_aiFrags;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]]
];

if (!local _unit) exitWith {};
if (isPlayer _unit) exitWith {};

if (isNil QGVAR(aiFragsChance)) then {
    GVAR(aiFragsChance) = 1;
};

_unit addEventHandler ["Fired", {
    params ["_unit", "_weapon", "_muzzle", "", "", "_magazine"];

    if (_muzzle isEqualTo "HandGrenadeMuzzle" || _muzzle isEqualTo "MiniGrenadeMuzzle") then {
        private _timeOutTime = _unit getVariable QGVAR(ai_timeOut);
        private _loadout = _unit getVariable QGVAR(ai_loadout);

        if (!isNil "_timeOutTime" && !isNil "_loadout") then {
            _unit setUnitLoadout _loadout;
            _unit removeMagazineGlobal _magazine;
            _unit setVariable [QGVAR(ai_timeOut), nil];
        };
    };

    if (_weapon isEqualTo primaryWeapon _unit) then {
        if (({_x isEqualTo "HandGrenade" || _x isEqualTo "MiniGrenade"} count (magazines _unit)) > 0) then {
            private _enemies = _unit targets [true, 60, [], 10];

            if (!(_enemies isEqualTo [])) then {
                if ({(_x distance2D _unit) < 10} count _enemies isEqualTo 0) then {
                    if (random 100 < GVAR(aiFragsChance)) then {
                        _unit setVariable [QGVAR(ai_loadout), getUnitLoadout _unit];
                        _unit setVariable [QGVAR(ai_timeOut), time + 5];

                        {
                            _unit removeMagazineGlobal _x;
                        } count ((magazines _unit) select {!(_x isEqualTo "HandGrenade" || _x isEqualTo "MiniGrenade")});

                        {_unit removePrimaryWeaponItem _x;} count (primaryWeaponMagazine _unit);
                        {_unit removeSecondaryWeaponItem _x;} count (secondaryWeaponMagazine _unit);
                        {_unit removeHandgunItem _x;} count (handgunMagazine _unit);

                        [{
                            params ["_unit"];

                            private _timeOutTime = _unit getVariable QGVAR(ai_timeOut);

                            if (!isNil "_timeOutTime") then {
                                if (_timeOutTime < time) then {
                                    _unit setUnitLoadout (_unit getVariable QGVAR(ai_loadout));
                                    _unit setVariable [QGVAR(ai_timeOut), nil];
                                };
                            };
                        }, [_unit], 6] call CBA_fnc_waitAndExecute;
                    };
                };
            };
        };
    };
}];
