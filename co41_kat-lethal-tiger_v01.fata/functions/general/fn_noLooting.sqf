#include "script_component.hpp"
/*
 * Author: Katalam
 * Removes all ammo (but not mags in weapons), grenades, items, nvgs and primary weapon attachments from ai entitys who got killed.
 * Adds some medical stuff.
 * Execute on server.
 * Returns the index of the event handler added.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Handle <NUMBER>
 *
 * Example:
 * call KAT_template_fnc_noLooting;
 *
 * Public: Yes
 */

if (!isServer) exitWith {};

addMissionEventHandler ["EntityKilled", {
    params ["_unit"];

    if (isNull _unit) exitWith {};

    {
        _unit removeMagazineGlobal _x;
        true;
    } count magazines _unit; // Magazines, Frags, Chemlights, ...

    {
        _unit removeItem _x;
        true;
    } count items _unit; // Medical Items, ...

    {
        _unit unlinkItem _x;
        true;
    } count assignedItems _unit; // Map, Clock, Googles, NVG, Radio, GPS, Compass

    _unit removeWeaponGlobal (binocular _unit);
    [_unit] remoteExec ["removeAllPrimaryWeaponItems", _unit, false]; // Scope, ...

    /** MEDICAL */
    private _container = (uniformContainer _unit); // uniform _unit isn't available anymore so we have to take the container for adding stuff
    _container addItemCargoGlobal ["ACE_packingBandage", 5];
    _container addItemCargoGlobal ["ACE_elasticBandage", 3];
    _container addItemCargoGlobal ["adv_aceSplint_splint", 2];
    _container addItemCargoGlobal ["ACE_morphine", 1];

    private _weaponHolders = nearestObjects [_unit, ["WeaponHolderSimulated"], 5];
    {
        _x setDamage 1;
    } forEach _weaponHolders;
}];
