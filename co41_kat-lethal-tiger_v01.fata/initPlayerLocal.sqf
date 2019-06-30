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
    "Platoon-Loadouts",
    ["Platoon Commander",                   "NATO_PTL"],
    ["Platoon Sergeant",                    "NATO_PSG"],
    ["Joint Fires Observer",                "NATO_JFO"],
    "Squad-Loadouts",
    ["Squad Leader",                        "NATO_SQL"],
    ["Assistant Squad Leader",              "NATO_ASL"],
    ["Squad System Operator",               "NATO_SSO"],
    ["Fire Team Leader",                    "NATO_FTL"],
    ["Fire Team Leader/ Marksman",          "NATO_MKM"],
    ["Autorifleman",                        "NATO_LMG"],
    ["Grenadier",                           "NATO_UGL"],
    ["Combat Life Saver",                   "NATO_CLS"],
    ["Rifleman (AT)",                       "NATO_LAT"],
    ["Rifleman",                            "NATO_RFM"],
    "Logistiker-Loadouts",
    ["Logistic Leader",                     "NATO_LOG_LEAD"],
    ["Logistic Assistant",                  "NATO_LOG"],
    ["Logistic Medic",                      "NATO_LOG_MED"],
    "Medical-Loadouts",
    ["Corpsman Leader",                     "NATO_MED_LEAD"],
    ["Corpsman",                            "NATO_MED"],
    "Crew-Loadouts",
    ["Commander",                           "NATO_CRW_LEAD"],
    ["Crew",                                "NATO_CRW"],
    "Ranks",
    ["Private",                             "PRIVATE"],
    ["Corporal",                            "CORPORAL"],
    ["Sergeant",                            "SERGEANT"],
    ["Lieutenant",                          "LIEUTENANT"],
    ["Captain",                             "CAPTAIN"],
    ["Major",                               "MAJOR"],
    ["Colonel",                             "COLONEL"],
    "other Loadouts",
    ["Admin",                               "NATO_ADM"]
];
GVAR(gui_crate_loadouts) = [
    "Infantry",
    ["Infantry-Crate",                      "NATO_Crate_INF@Box_NATO_Ammo_F"],
    ["Medic-Crate",                         "NATO_Crate_MED@ACE_medicalSupplyCrate_advanced"],
    ["Granade-Crate",                       "NATO_Crate_FRAG@Box_NATO_Grenades_F"],
    ["L.Launcher-Crate",                    "NATO_Crate_LAT@Box_NATO_WpsLaunch_F"],
    "Vehicle stuff",
    ["Ersatzreifen",                        "WHEEL"],
    ["Ersatzkette",                         "TRACK"],
    "Andere",
    ["Empty Crate",                         "EMPTY@Box_NATO_Ammo_F"],
    ["Delete Crates",                       "REMOVE"]
];
GVAR(gui_vehicle_loadouts) = [
    "Cars",
    ["Cougar Mk19",                         "NATO_Veh_COUGAR@rhsusf_CGRCAT1A2_Mk19_usmc_d"],
    ["Cougar Mk2",                          "NATO_Veh_COUGAR@rhsusf_CGRCAT1A2_M2_usmc_d"],
    ["Cougar (Unarmed)",                    "NATO_Veh_COUGAR@rhsusf_CGRCAT1A2_usmc_d"],
    "Trucks",
    ["Transport",                           "NATO_Veh_CAR@rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"],
    ["Ammo",                                "NATO_Veh_CAR@rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d"],
    ["Repair",                              "NATO_Veh_REPAIR@rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d (NATO_Veh_REPAIR_1)"],
    ["Medical",                             "NATO_Veh_CAR@rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy (NATO_Veh_MED_1)"],
    ["Fuel",                                "NATO_Veh_CAR@rhsusf_M978A4_BKIT_usarmy_d (NATO_Veh_CAR_2)"],
    "Artillery",
    ["M109A9",                              "EMPTY@itc_land_rhsusf_m109d_usarmy"],
    "weiteres",
    ["H-Pad leeren",                        "REMOVE"]
];

// disable arma voice chat
player setVariable ["BIS_noCoreConversations", true];

private _loadoutName = [str player] call FUNC(getLoadoutName);

// add scripts to briefing for some players
if (_loadoutName in ["NATO_ADM", "NATO_PTL"]) then {
    call FUNC(setUpDiaryScripts);
    call FUNC(addAresHelpers);

    if (TFAR_pluginTimeout < 15) then {
        ["TFAR_pluginTimeout", 15] call CBA_settings_fnc_set;
    };
};

// add various ace interactions
[board] call FUNC(createLoadoutGUI);
[crate_logistic, "marker_cratespawn"] call FUNC(createCrateSpawn);
[flagTP] call FUNC(createTeleporter);
[tv, "marker_teleport_spectator"] call FUNC(createSpectator);
[battery, "marker_vehiclespawn"] call FUNC(createVehicleSpawn);
call FUNC(createInteractionsVarious);

// create briefing from the bottom up
player createDiaryRecord ["Diary", ["Frequenzen", "Interne Frequenzen:
    <br/><br/>
    - Warrior 1: 110 MHz<br/>
    - Warrior 1-1: 111 MHz<br/>
    - Warrior 1-2: 112 MHz<br/>
    - Outlaw 1-1: 141 MHz<br/>
    - Workhorse 1-1: 151 MHz<br/>
    - Guardian 1-1: 161 MHz<br/>
    <br/><br/>
    Übergreifende Funkfrequenzen:
    <br/><br/>
    - Platoon: 52 MHz<br/>
    - Artillery: 57 MHz<br/>
    - Logistic: 58 MHz<br/>
    - Zeus/Out-Game-Channel: 59 MHz
    <br/><br/>
    Freie SW-Frequenzenbereiche:
    <br/><br/>
    - Infanterie: 200-299 MHz<br/>
    - Fahrzeuge: 300-349 MHz<br/>
    - Flugzeuge: 350-399 MHz<br/>
    - andere: 400-499 MHz"]];
call FUNC(createTechnicalDiaryRecord);

player createDiaryRecord ["Diary", ["Zivilisten", "Im Gebiet sind Zivilisten zu erwarten. Auch der zivile motorisierte Verkehr ist nicht zu unterschätzen. Von den Stützpunkten der Rebellen halten diese sich meist fern."]];
player createDiaryRecord ["Diary", ["Feindlage", "Die Bilder einer AC-130 konnten mehrere Stützpunkte der Rebellen ausmachen. Zwei davon sind ganz in der Nähe und sollen nun beseitigt werden. Der Feind verfügt über deutsche G36 und MG3. Als Technicals dienen einige serbische PKMs die auf einen Nissan geschraubt wurden. Außerdem sind einige DSchK verteilt."]];
player createDiaryRecord ["Diary", ["Eigene Lage", "Es wurden mehrere Stützpunkte innerhalb des Förderungsgebiets errichtet. Eine davon ist die FOB Glory. Das Platoon Warrior 1 als Teil der Alpha Kompanie des ersten Bataillon des fünften Marine Regiments zusammen mit einer Artillerie Batterie Sektion des ersten Panzer Bataillon der ersten Marine Division befindet sich in der FOB Glory. Einige logistische Güter unter anderem Munition und Treibstoff und eine medizinische Versorgung können dort bereitgestellt werden. Das Platoon Warrior 1 ist mit zwei MRAPs des Typs Cougar ausgestattet."]];
player createDiaryRecord ["Diary", ["Historisches", "Seit mehreren Jahren erweitert die Firma Prell ihr Gebiet im Nahen Osten, um dort Öl zu fördern. Immer mehr zivile Gebiete werden dem Öl zuliebe enteignet. Die aktuell regierende Partei strebt keine Eindämmung der Expansion des Unternehmens an, sondern lässt diesem freien Lauf. Zum Schutz der Ölanlagen setzt Prell seit einiger Zeit Teile der Bevölkerung als privaten Dienstleister ein. Die Bevölkerung ist mit dem aktuellen Umstand nicht zufrieden, viele haben bereits ihre Grundstücke verloren und ein Ende ist nicht in Sicht. Die als Wachschutz eingesetzten Zivilisten erhalten unter anderem Uniformen, Schusswesten und westliche Waffen. Alles durch Öl finanziert, welches dort vor Ort gefördert wird. Die Kriminalitätsrate ist dort so hoch wie seit zehn Jahren nicht mehr. Immer wieder kam es in der Vergangenheit zu Unruhen innerhalb der Bevölkerung. Der Missstand ist kaum zu erklären.<br/>
Prell ist, natürlich nicht dazu bereit ihre Abbaugebiete zu verkleinern. Dies zieht eine Spaltung der Bevölkerung nach sich. Die eine Hälfte splittert sich weiter in Rebellengruppierungen. Immer wieder kommt es zu Anschlägen auf Ölanlagen durch die Personen die, als Wachschutz eingesetzt waren. Die andere Hälfte möchte einfach nur in Ruhe gelassen werden. Eine Einigung bezüglich der Gebietsaufteilung zwischen Prell und der Bevölkerung konnte nicht erzielt werden.
Der Nachbarschaftsstreit eskalierte soweit, dass aufgrund des mangelndem Interesse seitens Prell, eine Einigung zu erzielen, 72 Tage lang täglich ca. 4320 Barrel ausgelaufen sind. Was eine massive Umweltkatastrophe zur Folge hatte. Eine Klage vor einem amerikanischen Gericht wurde abgewiesen.
In der Zwischenzeit gerieten einige Splittergruppen außer Kontrolle und nahmen mehrere Arbeiter von Prell als Geisel und brachten sie später um. Nun erweitert die ohnehin anwesende US Armee ihr Gebiet aus. Aufgrund der Bedrohung der Bevölkerung (durch die Rebellengruppierungen) erlaubt sich die USA ein Kriegsgeschehen innerhalb der Region."]];

[player, _loadoutName] call FUNC(applyPlayerLoadout);
[player, currentWeapon player, currentMuzzle player] call ACEFUNC(safemode,lockSafety);

// aan article holdActionAdd
laptop setObjectTextureGlobal [0, "data\aan\laptop_bg.paa"];
[
	laptop,
	localize LSTRING(aan),
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{},
	{},
	CALLFUNC(aan),
	{},
	[],
	2,
	0,
	false,
	false
] call BISFUNC(holdActionAdd);

// let each client update their FPS into a public variable based on a fixed update interval
[{
    player setVariable [QGVAR(PlayerFPS), floor diag_fps, true];
}, 3] call CBA_fnc_addPerFrameHandler;

call FUNC(initializeUI);

waitUntil {!(isNull findDisplay 46)}; // wait for afterMap (they are still in the loading screen, + 30 sec at start)
call FUNC(aan);
