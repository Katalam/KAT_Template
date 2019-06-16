#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Infanterie-Kiste
 */

params [["_box", objNull, [objNull]]];

// Magazine
_box addItemCargoGlobal [WEAPON_RFM_AMMO, 26];
_box addItemCargoGlobal [WEAPON_LMG_AMMO, 5];

_box addItemCargoGlobal [WEAPON_HGUN_AMMO, 2];

// Throwables
_box addItemCargoGlobal ["MiniGrenade", 12];

_box addItemCargoGlobal ["SmokeShell", 8];
_box addItemCargoGlobal ["SmokeShellGreen", 4];

// Nachtkampfausrüstung
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 1: {
        _box addItemCargoGlobal ["ACE_HandFlare_Yellow", 2];
        _box addItemCargoGlobal ["UGL_FlareYellow_F", 2];
        _box addItemCargoGlobal [WEAPON_UGL_AMMO, 22];
    };
    case 2: {
        _box addItemCargoGlobal ["ACE_IR_Strobe_Item", 2];
        _box addItemCargoGlobal [WEAPON_UGL_AMMO, 24];
    };
    default {
        _box addItemCargoGlobal ["SmokeShellOrange", 2];
        _box addItemCargoGlobal [WEAPON_UGL_AMMO, 24];
    };
};

true;
