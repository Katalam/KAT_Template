#include "script_component.hpp"
/*
 * Author: Katalam
 * Creates a local, visible location on the map, for every map marker named according to this pattern:
 * 'location_VISIBLE NAME ON MAP' or 'location_VISIBLENAMEONMAP' or 'location_VISIBLENAMEONMAP_12' or ...
 * This is intended for placing invisible empty markers in editor where the location should be created.
 * Effect is local, so execute on every client.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_setUpLocations;
 *
 * Public: No
 */

if !(hasInterface) exitWith {};

{
    if (_x select [0, 9] isEqualTo "location_") then {
        if (count _x > 9) then {
            private _loc = createLocation ["NameMarine", getMarkerPos _x, 5, 5];
            private _splits = _x splitString "_";

            if ((count _splits) isEqualTo 2) then {
                private _xSelectedAfter9 = _x select [9];
                if (isLocalized _xSelectedAfter9) then {
                    _loc setText (localize _xSelectedAfter9);
                } else {
                    _loc setText _xSelectedAfter9;
                };
            } else {
                if (_splits select 1 isEqualTo "STR") then {
                    _loc setText (localize (_x select [9]));
                } else {
                    _loc setText ((_x call FUNC(getLoadoutName)) select [9]);
                };
            };

            true;
        } else {
            false;
        };
    } else {
        false;
    };
} count allMapMarkers;
