#include "script_component.hpp"
/*
 * Author: Katalam
 * Loadout - EAST: IED-Crate
 */

params [["_box", objNull, [objNull]]];

// Explosives
_box addItemCargoGlobal ["rhssaf_mine_mrud_b_mag", 4];
_box addItemCargoGlobal ["rhssaf_mine_mrud_a_mag", 2];
_box addItemCargoGlobal ["rhssaf_mine_mrud_c_mag", 3];
_box addItemCargoGlobal ["rhssaf_tm500_mag", 1];
_box addItemCargoGlobal ["rhssaf_tm200_mag", 3];
_box addItemCargoGlobal ["rhssaf_tm100_mag", 4];

true;
