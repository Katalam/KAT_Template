#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - NATO: Equipment Crate
 */

params [["_box", objNull, [objNull]]];

// Nachtkampfausrüstung
switch (["GearLevel", 0] call BISFUNC(getParamValue)) do {
    case 2: {
        _box addWeaponCargoGlobal ["ACE_Vector", 1];
        _box addItemCargoGlobal ["acc_pointer_IR", 1];
        _box addItemCargoGlobal ["ACE_NVG_Wide", 1];
    };
    default {
        _box addWeaponCargoGlobal ["ACE_VectorDay", 1];
        _box addItemCargoGlobal ["acc_flashlight", 1];
    };
};

// Waffen
_box addWeaponCargoGlobal ["Binocular", 1];
_box addWeaponCargoGlobal ["Laserdesignator", 1];

// Medical
_box addItemCargoGlobal ["adv_aceCPR_AED", 1];
_box addItemCargoGlobal ["ACE_surgicalKit", 1];
_box addItemCargoGlobal ["ACE_personalAidKit", 1];

// Items
_box addItemCargoGlobal ["ACE_SpareBarrel", 1];
_box addItemCargoGlobal ["Laserbatteries", 1];
_box addItemCargoGlobal ["ACE_EntrenchingTool", 1];
_box addItemCargoGlobal ["ACE_Clacker", 1];
_box addItemCargoGlobal ["ACE_DefusalKit", 1];
_box addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
_box addItemCargoGlobal ["ACE_CableTie", 10];
_box addItemCargoGlobal ["ACE_Flashlight_KSF1", 1];
_box addItemCargoGlobal ["ItemcTabHCam", 2];
_box addItemCargoGlobal ["ACE_RangeCard", 1];
_box addItemCargoGlobal ["ACE_wirecutter", 1];
_box addItemCargoGlobal ["ToolKit", 1];

// COMMs
_box addItemCargoGlobal ["ItemMap", 1];
_box addItemCargoGlobal ["ItemCompass", 1];
_box addItemCargoGlobal ["ItemWatch", 1];
_box addItemCargoGlobal ["TFAR_rf7800str", 1];
_box addItemCargoGlobal ["TFAR_anprc152", 1];
_box addItemCargoGlobal ["ACE_MapTools", 1];
_box addItemCargoGlobal ["ACE_key_west", 1];
_box addItemCargoGlobal ["ItemAndroid", 1];
_box addItemCargoGlobal ["ItemcTab", 1];
_box addItemCargoGlobal ["ItemMicroDAGR", 1];
_box addBackpackCargoGlobal ["tfar_rt1523g_big_rhs", 1];
_box addBackpackCargoGlobal ["TFAR_rt1523g_rhs", 1];
_box addBackpackCargoGlobal ["TFAR_anarc210", 1];

true;
