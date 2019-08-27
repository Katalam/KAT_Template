#include "script_component.hpp"
/*
 * Author: Katalam
 * Callback for clicking OK in the change group dialog. Changes the name of the
 * group of the player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_changeGroupNameCallback
 *
 * Public: No
 */

disableSerialization;
private _groupName = ctrlText ((uiNamespace getVariable QGVAR(changeGroupName)) displayCtrl 1400);
(group player) setGroupIdGlobal [_groupName];

closeDialog 1;
