#include "script_component.hpp"
/*
 * Author: Katalam
 * Intialize player side.
 */

// disable arma voice chat
player setVariable ["BIS_noCoreConversations", true];
call FUNC(spawnProtection);

// locations
call FUNC(setUpLocations);

// add player side event handlers for the statistics at mission end
call FUNC(setUpStatistic);

// read and prepare available loadouts
call FUNC(prepareLoadouts);

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
    ["Rifleman (AT)",                       "NATO_LAT"],
    ["Rifleman",                            "NATO_RFM"],
    "Waffenteam-Loadouts",
    ["Weapon Team Leader (MG)",             "NATO_WTL_MMG"],
    ["Machinegunner",                       "NATO_MMG"],
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
    ["Marksman",                            "NATO_MKM"],
    ["Rifleman (Explosives)",               "NATO_ESP"],
    ["Sniper",                              "NATO_SNI"],
    ["Spotter",                             "NATO_SPO"]
];
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

private _loadoutName = [str player] call FUNC(getLoadoutName);

// add scripts to briefing for some players
if (_loadoutName in ["NATO_ADM", "NATO_PTL"]) then {
    call FUNC(setUpDiaryScripts);
    call FUNC(addAresHelpers);
};

// add various ace interactions
[board] call FUNC(createLoadoutGUI);
[crate_logistic, "marker_cratespawn"] call FUNC(createCrateSpawn);
[flagTP] call FUNC(createTeleporter);
[tv, "marker_teleport_spectator"] call FUNC(createSpectator);
[batterie, "marker_vehiclespawn"] call FUNC(createVehicleSpawn);
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
call FUNC(createTechnicalDiaryRecord);
/*
player createDiaryRecord ["Diary", ["General Instructions", ""]];
player createDiaryRecord ["Diary", ["Mission", ""]];
player createDiaryRecord ["Diary", ["Situation", ""]];
*/

[player, _loadoutName] call FUNC(applyPlayerLoadout);
[player, currentWeapon player, currentMuzzle player] call ACEFUNC(safemode,lockSafety);
