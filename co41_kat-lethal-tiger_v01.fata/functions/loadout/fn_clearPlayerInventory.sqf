#include "script_component.hpp"
/*
 * Author: Sinus
 * Cleares the inventory of the given player with global effect.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call KAT_template_fnc_clearPlayerInventory;
 *
 * Public: No
 */

params [
    ["_player", objNull, [objNull]]
];

if (local _player) then {
    removeAllAssignedItems _player;
    removeAllContainers _player;
    removeAllWeapons _player;
    removeHeadgear _player;

    if ((goggles _player) in
        ["rhs_balaclava","PBW_Balaclava_beige","G_Balaclava_blk","PBW_Balaclava_schwarz",
        "G_Balaclava_combat","PBW_Balaclava_beigeR","PBW_Balaclava_schwarzR","G_Balaclava_lowprofile",
        "G_Balaclava_oli","rhs_balaclava1_olive","rhs_ess_black","G_Bandanna_aviator","G_Bandanna_beast",
        "G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport",
        "G_Bandanna_tan","G_Combat","G_Combat_Goggles_tna_F","G_Diving","G_I_Diving","G_O_Diving",
        "G_B_Diving","G_Lowprofile","None","PBW_Headset","G_Respirator_blue_F","G_Respirator_white_F",
        "G_Respirator_yellow_F","PBW_RevisionF_klar","PBW_RevisionF_Dunkel","PBW_RevisionT_Klar",
        "PBW_RevisionT_Dunkel","G_EyeProtectors_F","G_EyeProtectors_Earpiece_F","rhsusf_shemagh_grn",
        "rhsusf_shemagh2_grn","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh_tan","rhsusf_shemagh2_tan",
        "rhsusf_shemagh_white","rhsusf_shemagh2_white","rhsusf_shemagh_gogg_grn","rhsusf_shemagh2_gogg_grn",
        "rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_od","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan",
        "rhsusf_shemagh_gogg_white","rhsusf_shemagh2_gogg_white","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr",
        "rhsusf_oakley_goggles_ylw","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F",
        "G_Balaclava_TI_G_tna_F","G_Goggles_VR","G_WirelessEarpiece_F"]
    ) then {
        removeGoggles _player;
    };
} else {
    _player remoteExec [QFUNC(clearPlayerInventory), _player];
};
