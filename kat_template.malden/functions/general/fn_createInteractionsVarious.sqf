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

// open or close ghost hawk doors
private _doorCode = {
    params ["_target"];

    if ((_target doorPhase "door_L") isEqualTo 0) then {
        _target animateDoor ["door_L", 1];
        _target animateDoor ["door_R", 1];
    } else {
        _target animateDoor ["door_L", 0];
        _target animateDoor ["door_R", 0];
    };
};
private _doorAction = [QGVAR(switchDoorsGH), localize LSTRING(switchDoor), "", _doorCode, {true}] call ACEFUNC(interact_menu,createAction);
["B_Heli_Transport_01_F", 0, ["ACE_MainActions"], _doorAction, true] call ACEFUNC(interact_menu,addActionToClass);
["B_Heli_Transport_01_F", 1, ["ACE_SelfActions"], _doorAction, true] call ACEFUNC(interact_menu,addActionToClass);

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
private _unflipVehicleAction = [QGVAR(unflipVehicle), localize LSTRING(unflipVehicle), "data\interactions\unflipVehicle.paa", {_this spawn FUNC(unflipVehicle)}, LINKFUNC(canUnflip)] call ACEFUNC(interact_menu,createAction);
["Car", 0, ["ACE_MainActions"], _unflipVehicleAction, true] call ACEFUNC(interact_menu,addActionToClass);

// change group name
private _changeGroupNameAction = [QGVAR(changeGroupName), localize LSTRING(changeGroupName), "", {createDialog QGVAR(changeGroupName)}, {leader group player == player}] call ACEFUNC(interact_menu,createAction);
["CAManBase", 1, ["ACE_SelfActions", "ACE_TeamManagement"], _changeGroupNameAction, true] call ACEFUNC(interact_menu,addActionToClass);


// create panel
private _createPanelActionParent = [QGVAR(createPanelParent), localize LSTRING(createPanel), "", {}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment"], _createPanelActionParent, true] call ACEFUNC(interact_menu,addActionToClass);

// red
private _createPanelActionRed = [QGVAR(createPanelRed), localize LSTRING(createPanelRed), "", {[getPos _player] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionRed, true] call ACEFUNC(interact_menu,addActionToClass);

private _createPanelActionRedSmall = [QGVAR(createPanelRedSmall), localize LSTRING(createPanelRedSmall), "", {[getPos _player, "RED", true] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionRedSmall, true] call ACEFUNC(interact_menu,addActionToClass);

// black
private _createPanelActionBlack = [QGVAR(createPanelBlack), localize LSTRING(createPanelBlack), "", {[getPos _player, "BLACK"] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionBlack, true] call ACEFUNC(interact_menu,addActionToClass);

private _createPanelActionBlackSmall = [QGVAR(createPanelBlackSmall), localize LSTRING(createPanelBlackSmall), "", {[getPos _player, "BLACK", true] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionBlackSmall, true] call ACEFUNC(interact_menu,addActionToClass);

// yellow
private _createPanelActionBlack = [QGVAR(createPanelYellow), localize LSTRING(createPanelYellow), "", {[getPos _player, "YELLOW"] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionBlack, true] call ACEFUNC(interact_menu,addActionToClass);

private _createPanelActionBlackSmall = [QGVAR(createPanelYellowSmall), localize LSTRING(createPanelYellowSmall), "", {[getPos _player, "YELLOW", true] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionBlackSmall, true] call ACEFUNC(interact_menu,addActionToClass);

// green
private _createPanelActionGreen = [QGVAR(createPanelGreen), localize LSTRING(createPanelGreen), "", {[getPos _player, "GREEN"] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionGreen, true] call ACEFUNC(interact_menu,addActionToClass);

private _createPanelActionGreenSmall = [QGVAR(createPanelGreenSmall), localize LSTRING(createPanelGreenSmall), "", {[getPos _player, "GREEN", true] call FUNC(createTarp)}, {true}] call ACEFUNC(interact_menu,createAction);
["B_recon_JTAC_F", 1, ["ACE_SelfActions", "ACE_Equipment", QGVAR(createPanelParent)], _createPanelActionGreenSmall, true] call ACEFUNC(interact_menu,addActionToClass);
