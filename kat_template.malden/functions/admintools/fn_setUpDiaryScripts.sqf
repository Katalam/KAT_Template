#include "script_component.hpp"
/*
 * Author: Sinus
 * Adds a diary entry with script execution links for the local player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_setUpDiaryScripts;
 *
 * Public: No
 */

if !(hasInterface) exitWith {};

player createDiaryRecord ["Diary", ["Skripte", "
Probleme beheben:<br/><br/>
- Den lokalen Spieler heilen (LOCAL EXEC):
<br/><t align='center'>call KAT_template_fnc_heal</t><br/>
- Alle Spieler heilen (GLOBAL EXEC):
<br/><t align='center'><executeClose expression='[] remoteExec [""KAT_template_fnc_heal"", 0, false]'>call KAT_template_fnc_heal</executeClose></t><br/>
- Geg. Einheit das geg. Loadout neu vergeben (LOCAL EXEC):
<br/><t align='center'>[NATO_SQL_1, ""NATO_SQL""] call KAT_template_fnc_applyPlayerLoadout</t><br/>
- Geg. Kiste bzw. Fahrzeug das geg. Loadout neu vergeben (SERVER EXEC):
<br/><t align='center'>[NATO_Veh_CAR_1, ""NATO_Veh_CAR""] call KAT_template_fnc_applyVehicleLoadout</t><br/><br/>
Zeus:<br/><br/>
- Neues Zeus Modul für lokalen Spieler erstellen:
<br/><t align='center'><executeClose expression='_s = str player; [_s, 3] remoteExec [""KAT_template_fnc_createZeus"", 2, false]'>Klick mich</executeClose></t><br/>
- Geg. Einheit Zugriff auf Zeus geben (SERVER EXEC):
<br/><t align='center'>[""NATO_SQL_1"", 3] call KAT_template_fnc_createZeus</t><br/>
- Alle Einheiten und Objekte zum Zeus-Modul des geg. Spielers hinzufügen (SERVER EXEC):
<br/><t align='center'>[NATO_SQL_1] call KAT_template_fnc_addToZeus</t><br/>
- Alle Einheiten und Objekte zum Zeus-Modul des lokalen Spielers hinzufügen:
<br/><t align='center'><executeClose expression='[player] remoteExec [""KAT_template_fnc_addToZeus"", 2, false]'>Klick mich</executeClose></t><br/><br/>
Missionsablauf:<br/><br/>
- Mission siegreich mit Statistik und Musik beenden (GLOBAL EXEC):
<br/><t align='center'><executeClose expression='[] remoteExec [""KAT_template_fnc_endWinNice"", 0, false]'>call KAT_template_fnc_endWinNice</executeClose></t><br/>
- Mission siegreich beenden (SERVER EXEC):
<br/><t align='center'><executeClose expression='[] remoteExec [""KAT_template_fnc_endWin"", 2, false]'>call KAT_template_fnc_endWin</executeClose></t><br/>
- Mission mit Niederlage beenden (SERVER EXEC):
<br/><t align='center'><executeClose expression='[] remoteExec [""KAT_template_fnc_endLose"", 2, false]'>call KAT_template_fnc_endLose</executeClose></t><br/>
- Mission für einzelnen Spieler siegreich beenden (LOCAL EXEC):
<br/><t align='center'>[NATO_SQL_1] call KAT_template_fnc_endWinPrivate</t><br/>
- Mission für einzelnen Spieler als Niederlage beenden (LOCAL EXEC):
<br/><t align='center'>[NATO_SQL_1] call KAT_template_fnc_endLosePrivate</t>
"]];

true;
