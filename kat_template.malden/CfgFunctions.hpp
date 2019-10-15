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
            class aiDefend;
            class aiFrags;
            class setSkill;
        };
        class endings {
            file = "functions\endings";
            class addStatisticValues;
            class endLose;
            class endLoseNice;
            class endLosePrivate;
            class endWin;
            class endWinNice;
            class endWinPrivate;
            class setUpStatistic;
        };
        class general {
            file = "functions\general";
            class canUnflip;
            class changeGroupNameCallback;
            class changeGroupNameInit;
            class createInteractionsVarious;
            class createSpectator;
            class createTechnicalDiaryRecord;
            class createTeleporter;
            class getInsignia;
            class noLooting;
            class satcom;
            class setInsignia;
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
            class ambientFlyby;
            class houseLights;
            class houseLightsLocal;
            class test;
        };
    };
    class LOADOUT_PLAYER {
        tag = "LOADOUT_PLAYER";
        class loadouts {
            file = "functions\loadouts";
            class NATO_AAT;
            class NATO_ADM;
            class NATO_AMB;
            class NATO_AMG;
            class NATO_CLS;
            class NATO_CRW;
            class NATO_CRW_LEAD;
            class NATO_ESP;
            class NATO_FTL;
            class NATO_HAT;
            class NATO_HELI_CREW;
            class NATO_HELI_PIL;
            class NATO_JET;
            class NATO_JFO;
            class NATO_LAT;
            class NATO_LMG;
            class NATO_LOG;
            class NATO_LOG_LEAD;
            class NATO_LOG_MED;
            class NATO_MED;
            class NATO_MED_LEAD;
            class NATO_MKM;
            class NATO_MMG;
            class NATO_MOR_GUN;
            class NATO_MOR_ASS;
            class NATO_PSG;
            class NATO_PTL;
            class NATO_RFM;
            class NATO_SNI;
            class NATO_SPO;
            class NATO_SQL;
            class NATO_UGL;
            class NATO_WTL_HAT;
            class NATO_WTL_MMG;
        };
    };
    class LOADOUT_VEH {
        tag = "LOADOUT_VEH";
        class loadouts {
            file = "functions\loadouts";
            class NATO_Crate_FRAG;
            class NATO_Crate_FULL;
            class NATO_Crate_HAT;
            class NATO_Crate_INF;
            class NATO_Crate_LAT;
            class NATO_Crate_MED;
            class NATO_Crate_MMG;
            class NATO_Crate_MOR_HE;
            class NATO_Crate_MOR_SMK;
            class NATO_Crate_STUFF;
            class NATO_Crate_SUPPORT;
            class NATO_Crate_WEAPONS;
            class NATO_Veh_CAR;
            class NATO_Veh_REPAIR;
            class NATO_Veh_TANK;
            class NATO_Veh_WTANK;
        };
    };
};
