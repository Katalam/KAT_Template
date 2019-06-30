#include "script_component.hpp"
/*
 * Author: Katalam
 * Creates the diary record with some of the technical settings.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_createTechnicalDiaryRecord;
 *
 * Public: No
 */

if !(hasInterface) exitWith {};

private _advancedWounds = "müssen nicht";
if (GETMVAR(ace_medical_enableAdvancedWounds,false)) then {
    _advancedWounds = "können";
};

private _maxReviveTime = GETMVAR(ace_medical_maxReviveTime,600);
private _reviveTimeString = format ["%1", _maxReviveTime / 60];

private _pylonsLevel = "allen Spielern";
if (GETMVAR(ace_pylons_requireEngineer,false)) then {
    _pylonsLevel = "Pionieren";
};

private _pylonsToolkit = "ohne Werkzeugkasten";
if (GETMVAR(ace_pylons_requireToolkit,false)) then {
    _pylonsToolkit = "mit Werkzeugkasten";
};

private _rearmLevel = "- Gesamtes Fahrzeug wird aufmunitioniert";
switch (GETMVAR(ace_rearm_level,0)) do {
    case (1): {};
    case (2): {
        _rearmLevel = "- Munition wird im ganzen Magazin nachgeladen";
    };
    case (3): {
        _rearmLevel = "- Munition wird in Kaliberbasierte Anzahl nachgeladen"
    };
};

private _wheelsLevel = "allen Spielern";
switch (GETMVAR(ace_repair_engineerSetting_wheel,0)) do {
    case (0): {};
    case (1): {
        _wheelsLevel = "Pionieren";
    };
    case (2): {
        _wheelsLevel = "Instandsetzern";
    };
};

private _wheelsToolkit = "ohne Werkzeugkasten";
if (GETMVAR(ace_repair_wheelRepairRequiredItems,0) isEqualTo 1) then {
    _wheelsToolkit = "mit Werkzeugkasten";
};

private _repairDamageThreshold = str (GETMVAR(ace_repair_repairDamageThreshold,0) * 100);
private _repairDamageThreshold_engineer = str (GETMVAR(ace_repair_repairDamageThreshold_engineer,0) * 100);

private _toolkitReuse = "können";
if (GETMVAR(ace_repair_consumeItem_toolKit,0) isEqualTo 1) then {
    _toolkitReuse = "können nicht";
};

private _fullRepairLevel = "Jeder";
switch (GETMVAR(ace_repair_engineerSetting_fullRepair,0)) do {
    case (0): {};
    case (1): {
        _fullRepairLevel = "Pionieren";
    };
    case (2): {
        _fullRepairLevel = "Instandsetzer";
    };
};

private _fullRepairLocation = "überall, auch ohne Reparaturfahrzeug,";
switch (GETMVAR(ace_repair_engineerSetting_fullRepair,0)) do {
    case (1): {};
    case (2): {
        _fullRepairLocation = "mit Reparaturfahrzeug überall";
    };
    case (3): {
        _fullRepairLocation = "in der Nähe von Werkstätten";
    };
    case (4): {
        _fullRepairLocation = "in der Nähe von Werkstätten oder mit Reparaturfahrzeug";
    };
    case (5): {
        _fullRepairLocation = "nicht";
    };
};

player createDiaryRecord ["Diary", ["Technische Hinweise", format ["Loadout,
Logistik und Teleport über ACE-Interaction.
<br/><br/>
Missionseinstellungen:
<br/><br/>
- Revive-Zeit: " + _reviveTimeString + " Minuten.
<br/>
- Wunden " + _advancedWounds + " vernäht werden.
<br/><br/>
- Waffenpylone können von " + _pylonsLevel  + " " + _pylonsToolkit + " geändert werden.
<br/>" +
_rearmLevel +
"<br/>
- Reifen können von " + _wheelsLevel + ", " + _wheelsToolkit + ", gewechselt werden.
<br/>
- Logistiker mit einem Toolkit können ohne Reparaturfahrzeug auf bis zu " + _repairDamageThreshold + " Prozent reparieren,
Crew-Mitglieder auf bis zu " + _repairDamageThreshold_engineer + " Prozent.
<br/>
- Toolkits " + _toolkitReuse +  " wiederverwendet werden.
<br/>
- FullRepair ist für " + _fullRepairLevel + " mit Toolkit " + _fullRepairLocation + " möglich.
<br/><br/>
Organisatorisches:
<br/><br/>
- Wenn ihr technische Schwierigkeiten habt, schreibt bitte ausschließlich den Spiel-Admin an.
<br/>
- Es ist am nahe dem Respawnpunkt eine Flagge für einen Teleport nach technischen Problemen vorhanden.
<br/>
- Bitte haltet euch zurück mit out-of-character-Gesprächen.
Die anderen Spielerinnen und Spieler werden es euch danken."]]];
