class CfgFunctions {
    class KAT_template {
        tag = "KAT_template";
        class functions {
            file = "functions";
            class quote;
            class version;
        };
        class admintools {
            file = "functions\admintools";
            class addAresHelpers;
            class addToZeus;
            class heal;
            class initializeUI;
            class setUpDiaryScripts;
        };
        class ai {
            file = "functions\ai";
            class aiFrags;
            class setSkill;
        };
        class endings {
            file = "functions\endings";
            class addStatisticValues;
            class endLose;
            class endLosePrivate;
            class endWin;
            class endWinNice;
            class endWinPrivate;
            class setUpStatistic;
        };
        class general {
            file = "functions\general";
            class createInteractionsVarious;
            class createSpectator;
            class createTechnicalDiaryRecord;
            class createTeleporter;
            class noLooting;
            class setUpLocations;
            class spawnProtection;
            class teleport;
            class unflipVehicle;
        };
        class loadout {
            file = "functions\loadout";
            class applyPlayerLoadout;
            class applyVehicleLoadout;
            class clearPlayerInventory;
            class clearVehicleInventory;
            class createCrateSpawn;
            class createLoadoutGUI;
            class createVehicleSpawn;
            class getLoadoutName;
            class prepareLoadouts;
            class setChannels;
        };
        class mission {
            file = "functions\mission";
            class aan;
            class jets;
            class marker;
            class plane;
            class radio;
        };
    };
    class KAT_short {
        tag = "KAT";
        class functions {
            class apl {file = "functions\loadout\fn_apl.sqf"};
        };
    };
    class LOADOUT_PLAYER {
        tag = "LOADOUT_PLAYER";
        class loadouts {
            file = "functions\loadouts";
            class CIV_RFM;
            class EAST_LMG;
            class EAST_RFM;
            class NATO_ADM;
            class NATO_ASL;
            class NATO_CLS;
            class NATO_CRW;
            class NATO_CRW_LEAD;
            class NATO_FTL;
            class NATO_HELI_PIL;
            class NATO_JFO;
            class NATO_LAT;
            class NATO_LMG;
            class NATO_LOG;
            class NATO_LOG_LEAD;
            class NATO_LOG_MED;
            class NATO_MED;
            class NATO_MED_LEAD;
            class NATO_MKM;
            class NATO_PSG;
            class NATO_PTL;
            class NATO_RFM;
            class NATO_SQL;
            class NATO_SSO;
            class NATO_UGL;
        };
    };
    class LOADOUT_VEH {
        tag = "LOADOUT_VEH";
        class loadouts {
            file = "functions\loadouts";
            class EAST_Crate_IED;
            class EAST_Crate_INF;
            class EAST_Crate_LAT;
            class EAST_Crate_WPN;
            class NATO_Crate_FRAG;
            class NATO_Crate_INF;
            class NATO_Crate_LAT;
            class NATO_Crate_MED;
            class NATO_Veh_CAR;
            class NATO_Veh_COUGAR;
            class NATO_Veh_MED;
            class NATO_Veh_MED_TRUCK;
            class NATO_Veh_REPAIR;
            class NATO_Veh_TANK;
            class NATO_Veh_WTANK;
        };
    };
};
