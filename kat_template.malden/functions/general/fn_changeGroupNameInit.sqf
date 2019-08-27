#include "script_component.hpp"
/*
 * Author: Katalam
 * Initializer for the change group dialog. Displays the current name of
 * the group in the edit field.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_changeGroupNameInit
 *
 * Public: No
 */

params ["_display"];

disableSerialization;

private _ctrlGroupName = _display displayCtrl 1400;
private _groupName = groupId (group player);
_ctrlGroupName ctrlSetText _groupName;
