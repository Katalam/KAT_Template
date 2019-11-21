#include "..\script_component.hpp"
/*
 * Author: Katalam
 * Returns version with date and number.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_version;
 *
 * Public: Yes
 */

[(format ["Version: %1.%2.%3<br/>Date: %4.%5.%6", MAJOR, MINOR, PATCHLVL, DAY, MONTH, YEAR]), 2] call ACEFUNC(common,displayTextStructured);
