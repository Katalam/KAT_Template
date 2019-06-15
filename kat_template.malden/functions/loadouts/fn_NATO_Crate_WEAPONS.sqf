#include "script_component.hpp"
/*
 * Author: [SeL] Sinus
 * Loadout - NATO: Waffenkiste
 */

params [["_box", objNull, [objNull]]];

_box addWeaponCargoGlobal ["arifle_MXC_F", 1];
_box addWeaponCargoGlobal ["arifle_MX_F", 1];
_box addWeaponCargoGlobal ["arifle_MX_SW_F", 1];
_box addWeaponCargoGlobal ["arifle_MX_GL_F", 1];
_box addWeaponCargoGlobal ["arifle_MXM_Black_F", 1];
_box addWeaponCargoGlobal ["LMG_Mk200_F", 1];
_box addWeaponCargoGlobal ["MMG_02_black_F", 1];
_box addWeaponCargoGlobal ["SMG_01_F", 1];

// Nachtkampfausrüstung
switch (["GearLevel", 0] call BIS_fnc_getParamValue) do {
    case 2: {
		_box addWeaponCargoGlobal ["ACE_Vector", 1];
		_box addItemCargoGlobal ["acc_pointer_IR", 1];
	};
    default {
		_box addWeaponCargoGlobal ["ACE_VectorDay", 1];
		_box addItemCargoGlobal ["acc_flashlight", 1];
	};
};

_box addWeaponCargoGlobal ["Binocular", 1];
_box addWeaponCargoGlobal ["Laserdesignator", 1];
_box addWeaponCargoGlobal ["hgun_Pistol_heavy_01_F", 1];

_box addItemCargoGlobal ["Laserbatteries", 1];

_box addItemCargoGlobal ["bipod_01_F_blk", 1];
_box addItemCargoGlobal ["bipod_01_F_snd", 1];
_box addItemCargoGlobal ["optic_MRD", 1];
_box addItemCargoGlobal ["optic_ACO_grn", 1];
_box addItemCargoGlobal ["optic_Hamr", 1];
_box addItemCargoGlobal ["optic_MRCO", 1];
_box addItemCargoGlobal ["optic_DMS", 1];

true;
