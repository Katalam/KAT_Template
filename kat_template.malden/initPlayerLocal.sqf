#include "script_component.hpp"
/*
 * Author: Katalam
 * Intialize player side.
 */

// disable arma voice chat
player setVariable ["BIS_noCoreConversations", true];

// add a spawn protection to prevent fail grenades (hardcoded 75 m from "respawn_west" marker)
call FUNC(spawnProtection);

// add locations (can be found at most seaports) for all marker named "location_"
call FUNC(setUpLocations);

// add player side event handlers for the statistics at mission end
call FUNC(setUpStatistic);

// read and prepare available loadouts
call FUNC(prepareLoadouts);

// All loadouts in here are available at the loadout-board
// To add a new category the element has to be a <STRING>
// To add a new loadout to a existing category the element has to be a <ARRAY>
// The first element of the <ARRAY> has to be the display name and the second the classname of the loadout
// Both elements are <STRINGS>
GVAR(gui_player_loadouts) = [
    "Stabs-Loadouts",
    ["Platoon Leader",                      "NATO_PTL"],
    ["Platoon Sergeant",                    "NATO_PSG"],
    ["Platoon Medic",                       "NATO_MED_LEAD"],
    ["Joint Fires Observer",                "NATO_JFO"],
    "Mannschaftler-Loadouts",
    ["Squad Leader",                        "NATO_SQL"],
    ["Squad Medic",                         "NATO_MED"],
    ["Fire Team Leader",                    "NATO_FTL"],
    ["Autorifleman",                        "NATO_LMG"],
    ["Grenadier",                           "NATO_UGL"],
    ["Combat Life Saver",                   "NATO_CLS"],
    ["Rifleman (AT) [DLC]",                 "NATO_LAT"],
    ["Rifleman",                            "NATO_RFM"],
    "Waffenteam-Loadouts",
    ["Weapon Team Leader (MG)",             "NATO_WTL_MMG"],
    ["Machinegunner [DLC]",                 "NATO_MMG"],
    ["Assistant Machinegunner",             "NATO_AMG"],
    ["Weapon Team Leader (Launcher)",       "NATO_WTL_HAT"],
    ["Missile Specialist",                  "NATO_HAT"],
    ["Assistant Missile Specialist",        "NATO_AAT"],
    "Logistiker-Loadouts",
    ["Logistic Leader",                     "NATO_LOG_LEAD"],
    ["Logistic Assistant",                  "NATO_LOG"],
    ["Logistic Medic",                      "NATO_LOG_MED"],
    "Crew-Loadouts",
    ["Tank Commander",                      "NATO_CRW_LEAD"],
    ["Tank Crew",                           "NATO_CRW"],
    ["Jet Pilot",                           "NATO_JET"],
    ["Helicopter Pilot",                    "NATO_HELI_PIL"],
    ["Helicopter Crew",                     "NATO_HELI_CREW"],
    "Dienstgrade",
    ["Private",                             "PRIVATE"],
    ["Corporal",                            "CORPORAL"],
    ["Sergeant",                            "SERGEANT"],
    ["Lieutenant",                          "LIEUTENANT"],
    ["Captain",                             "CAPTAIN"],
    ["Major",                               "MAJOR"],
    ["Colonel",                             "COLONEL"],
    "weitere Loadouts",
    ["Ammo Bearer",                         "NATO_AMB"],
    ["Mortar Gunner",                       "NATO_MOR_GUN"],
    ["Mortar Loader",                       "NATO_MOR_ASS"],
    ["Marksman [DLC]",                      "NATO_MKM"],
    ["Rifleman (Explosives)",               "NATO_ESP"],
    ["Sniper [DLC]",                        "NATO_SNI"],
    ["Spotter",                             "NATO_SPO"]
];
// Same <ARRAY> for the crates
// First element is a <STRING> with the displayname
// Second element is a <STRING> with the crate loadout classname and after that a @ and the classname of the crate following
// In order to get wheels and tracks the second element have to be "WHEEL" or "TRACK"
// To get static weapon the second element have to be "STATIC@MyStaticWeaponClassname"
// To remove all crates in the near of hardcoded 4.5 meter the second element have to be "REMOVE"
GVAR(gui_crate_loadouts) = [
    "Infanterieversorgung",
    ["Infanterie-Kiste",                    "NATO_Crate_INF@Box_NATO_Ammo_F"],
    ["Medic-Kiste",                         "NATO_Crate_MED@ACE_medicalSupplyCrate_advanced"],
    ["Granaten-Kiste",                      "NATO_Crate_FRAG@Box_NATO_Grenades_F"],
    ["L.Launcher-Kiste",                    "NATO_Crate_LAT@Box_NATO_WpsLaunch_F"],
    ["MMG-Kiste",                           "NATO_Crate_MMG@Box_NATO_WpsSpecial_F"],
    ["H.Launcher-Munition",                 "NATO_Crate_HAT@Box_NATO_WpsSpecial_F"],
    "Ausrüstungskisten",
    ["Ausrüstungskiste",                    "NATO_Crate_SUPPORT@Box_NATO_Support_F"],
    ["Waffenkiste",                         "NATO_Crate_WEAPONS@Box_NATO_Wps_F"],
    ["Vollständige Ausrüstungskiste",       "NATO_Crate_FULL@Box_NATO_WpsSpecial_F"],
    ["Rations-Kiste",                       "NATO_Crate_STUFF@Box_NATO_Support_F"],
    "Fahrzeugversorgung",
    ["Ersatzreifen",                        "WHEEL"],
    ["Ersatzkette",                         "TRACK"],
    "Mörserversorgung",
    ["Mk6 Mortar",                          "STATIC@B_Mortar_01_F"],
    ["Mörsergranaten (HE)",                 "NATO_Crate_MOR_HE@Box_NATO_AmmoOrd_F"],
    ["Mörsergranaten (Smoke)",              "NATO_Crate_MOR_SMK@Box_NATO_AmmoOrd_F"],
    "Andere",
    ["Leere Kiste",                         "EMPTY@Box_NATO_Ammo_F"],
    ["Kisten in der Nähe löschen",          "REMOVE"]
];
// Same <ARRAY> for the vehicles
// First element is a <STRING> with the displayname
// Second element is a <STRING> with the vehicle loadout classname and after that a @ and the classname of the vehicle following
// To get empty vehicle cargos the loadout classname is "empty@MyVehicleClassname"
// To remove all crates in the near of hardcoded 15 meter the second element have to be "REMOVE"
GVAR(gui_vehicle_loadouts) = [
    "Helikopter",
    ["AH-99 'Blackfoot'",                        "empty@B_Heli_Attack_01_dynamicLoadout_F"],
    ["AH-6 'Pawnee'",                            "empty@B_Heli_Light_01_dynamicLoadout_F"],
    ["MH-6 'Hummingbird'",                       "empty@B_Heli_Light_01_F"],
    ["UH-80 'Ghost Hawk'",                       "empty@B_Heli_Transport_01_F"],
    ["CH-67 'Huron'",                            "empty@B_Heli_Transport_03_F"],
    "Flugzeuge",
    ["A-164 'Wipeout' (CAS)",                    "empty@B_Plane_CAS_01_dynamicLoadout_F"],
    ["V-44 X 'Blackfish' (Vehicle Transport)",   "empty@B_T_VTOL_01_vehicle_F"],
    ["V-44 X 'Blackfish' (Infantry Transport)",  "empty@B_T_VTOL_01_infantry_F"],
    ["V-44 X 'Blackfish' (Armed)",               "empty@B_T_VTOL_01_armed_F"],
    "Panzer",
    ["M2A1 'Slammer'",                           "NATO_Veh_TANK@B_MBT_01_cannon_F"],
    ["AMV-7 'Marshall'",                         "NATO_Veh_WTANK@B_APC_Wheeled_01_cannon_F"],
    "PKWs / LKWs",
    ["Prowler (Unarmed)",                        "NATO_Veh_CAR@B_LSV_01_unarmed_F"],
    ["HEMTT Transport",                          "NATO_Veh_CAR@B_Truck_01_transport_F"],
    ["HEMTT Ammo",                               "NATO_Veh_REPAIR@B_Truck_01_ammo_F"],
    ["HEMTT Repair",                             "NATO_Veh_REPAIR@B_Truck_01_Repair_F"],
    ["HEMTT Medical",                            "NATO_Veh_CAR@B_Truck_01_medical_F"],
    ["HEMTT Fuel",                               "NATO_Veh_CAR@B_Truck_01_fuel_F"],
    "weiteres",
    ["H-Pad leeren",                             "REMOVE"]
];

// disable arma voice chat
player setVariable ["BIS_noCoreConversations", true];

// the variable name of the player has inb most cases a _1 this will removed here
// DO NOT REMOVE THIS LINE
private _loadoutName = [str player] call FUNC(getLoadoutName);

// add scripts to briefing for some players
// Admin and Platoon Leader get extra curator modules and a page with diary scripts
// With v1.95 change it to needle in haystack. "a" in "ab" returns true
if (_loadoutName in ["NATO_ADM", "NATO_PTL"]) then {
    call FUNC(setUpDiaryScripts);
    call FUNC(addAresHelpers);

    if (TFAR_pluginTimeout < 15) then {
        ["TFAR_pluginTimeout", 15] call CBA_settings_fnc_set;
    };
};

// creates the loadout gui at the object called board
if (!isNil "board") then {
    [board] call FUNC(createLoadoutGUI);
};

// creates the logistic crate spawner at the object called crate_logistic
// will spawn crates at the position of the "marker_cratespawn" called marker
if (!isNil "crate_logistic") then {
    [crate_logistic, "marker_cratespawn"] call FUNC(createCrateSpawn);
};

// add the teleporter to the object called flagTP
if (!isNil "flagTP") then {
    [flagTP] call FUNC(createTeleporter);
};

// add the spectator action to a object called tv
// will teleport people to the position of the "marker_teleport_spectator" called marker
// move the marker away from any possible alive player contact
// spectator can still talk with other spectator and will be heard by anybody near
if (!isNil "tv") then {
    [tv, "marker_teleport_spectator"] call FUNC(createSpectator);
};

// add the vehicle spawner gui
// spawns vehicle at the position of the "marker_vehiclespawn" called marker
if (!isNil "battery") then {
    [battery, "marker_vehiclespawn"] call FUNC(createVehicleSpawn);
};

// adds some different and small ace interaction
call FUNC(createInteractionsVarious);

// create briefing from the bottom up
player createDiaryRecord ["Diary", ["Funkfrequenzen", "Interne Funkfrequenzen:
    <br/><br/>
    - Jupiter: 41 MHz<br/>
    - Mars: 42 MHz<br/>
    - Deimos: 43 MHz<br/>
    - Phobos: 44 MHz<br/>
    - Vulkan: 45 MHz<br/>
    - Diana: 46 MHz<br/>
    - Merkur, Charon, Apollo, Saturn u.a.: 41 MHz, weiteres nach Absprache
    <br/><br/>
    Übergreifende Funkfrequenzen:
    <br/><br/>
    - Platoon: 52 MHz<br/>
    - Einsatzunterstützung: 57 MHz<br/>
    - Logistik (Anfragekanal): 58 MHz<br/>
    - Zeus/Out-Game-Channel: 59 MHz
    <br/><br/>
    Freie SW-Frequenzenbereiche:
    <br/><br/>
    - Infanterie: 100-199 MHz<br/>
    - Fahrzeuge: 200-299 MHz<br/>
    - Lufteinheiten: 300-399 MHz<br/>
    - weitere: 400-499 MHz"]];

// will evaluate the cba setting and show the active settings as a readable text
call FUNC(createTechnicalDiaryRecord);

// place your story here, people can re read it ingame
/*
player createDiaryRecord ["Diary", ["General Instructions", ""]];
player createDiaryRecord ["Diary", ["Mission", ""]];
player createDiaryRecord ["Diary", ["Situation", ""]];
*/

// applys the player loadout
[player, _loadoutName] call FUNC(applyPlayerLoadout);

// locks the player primary weapon at mission start
[player, currentWeapon player, currentMuzzle player] call ACEFUNC(safemode,lockSafety);

// let each client update their FPS into a public variable based on a fixed update interval
// zeusfpsmonitor have to have access to it so it is needed
[{
    player setVariable [QGVAR(PlayerFPS), floor diag_fps, true];
}, 3] call CBA_fnc_addPerFrameHandler;

// initialize the ui for the zeusfpsmonitor
[] call FUNC(initializeUI);

["CAManBase", "Take", FUNC(setInsignia)] call CBA_fnc_addClassEventHandler;
["CAManBase", "InventoryOpened", FUNC(getInsignia)] call CBA_fnc_addClassEventHandler;
