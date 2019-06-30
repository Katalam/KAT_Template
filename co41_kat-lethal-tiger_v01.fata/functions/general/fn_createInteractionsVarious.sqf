#include "script_component.hpp"
/*
 * Author: Katalam
 * Creates ace interactions for open or close Ghost Hawk doors.
 * Local effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_createInteractionsVarious;
 *
 * Public: Yes
 */

if !(hasInterface) exitWith {};

// switch weapon gunbag
private _gunbagCondition = {
    params ["", "_player"];

    private _gunbag = backpackContainer _player;
    private _weapon = primaryWeapon _player;

    !((_gunbag getVariable ["ace_gunbag_gunbagWeapon", []]) isEqualTo []) && {!(_weapon call ACEFUNC(gunbag,isMachineGun))} && {!(primaryWeapon _player isEqualTo "")};
};

private _gunbagCode = {
    params ["", "_player"];

    _player call ACEFUNC(common,goKneeling);
    private _gunbag = backpackContainer _player;

    // play sound
    if (["ace_backpacks"] call ACEFUNC(common,isModLoaded)) then {
        [_player, _gunbag] call ACEFUNC(backpacks,backpackOpened);
    };

    [5, _player, {
        params ["_player"];
        private _gunbag = backpackContainer _player;
        private _state = _gunbag getVariable ["ace_gunbag_gunbagWeapon", []];
        [_player, _player] call ACEFUNC(gunbag,toGunbagCallback);

        _state params ["_weapon", "_items", "_magazines"];

        _player addWeapon _weapon;

        // Game will auto add magazines from player's inventory, put these back in player inventory as they will be overwritten
        ([_player, _weapon] call ACEFUNC(common,getWeaponState)) params ["", "", "_addedMags", "_addedAmmo"];
        {
            if (((_x select 0) != "") && {(_addedMags select _forEachIndex) != ""}) then {
                _player addMagazine [_addedMags select _forEachIndex, _addedAmmo select _forEachIndex];
            };
        } forEach _magazines;

        removeAllPrimaryWeaponItems _player;

        {
            _player addWeaponItem [_weapon, _x];
        } forEach (_items + _magazines);
        _player selectWeapon _weapon;
    }, {}, localize "STR_ACE_Gunbag_OffGunbag", {true}] call ACEFUNC(common,progressBar);
};

private _gunbagAction = [QGVAR(weaponSwitch), localize LSTRING(switchGun), "\z\ace\addons\gunbag\ui\gunbag_icon_ca.paa", _gunbagCode, _gunBagCondition] call ACEFUNC(interact_menu,createAction);
["CAManBase", 1, ["ACE_SelfActions", "ACE_Equipment", "ace_gunbag_actions"], _gunbagAction, true] call ACEFUNC(interact_menu,addActionToClass);

// unflip vehicle
private _unflipVehicleAction = [QGVAR(unflipVehicle), localize LSTRING(unflipVehicle), "data\interactions\unflipVehicle.paa", {_this spawn FUNC(unflipVehicle)}, {true}] call ACEFUNC(interact_menu,createAction);
["Car", 0, ["ACE_MainActions"], _unflipVehicleAction, true] call ACEFUNC(interact_menu,addActionToClass);
