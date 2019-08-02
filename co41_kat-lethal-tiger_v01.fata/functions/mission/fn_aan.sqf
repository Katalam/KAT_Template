#include "script_component.hpp"
/*
 * Author: Katalam
 * Shows AAN article
 * AddActionHold is defined in initPlayerLocal.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call KAT_template_fnc_aan;
 *
 * Public: Yes
 */

[
	[
		["title","Verbrechen im Nahen Osten: Prell vor Gericht"],
		["meta",["Katherine Bishop",[2018,6,15,11,38],"EDT"]],
		["textbold","Mehr als zwei Jahrzehnte lang haben vier Witwen dafür gekämpft, von einem Gericht angehört zu werden."],
		["image",["data\aan\aan.paa","Umweltverschmutzung im Tamir River"]],
		["box",["data\aan\aan_box.paa","Vergeblicher Fischfang"]],
		["text","Der britisch-niederländische Ölmulti Prell muss sich in den Niederlanden wegen Menschenrechtsverbrechen im Nahen Osten verantworten. Vier Witwen des Volkes der Ogironi werfen dem Konzern vor, die Militärregierung in den 90er Jahren bei der Verhaftung und Ermordung ihrer Männer unterstützt zu haben. 'Über Jahre hat Prell dafür gekämpft, dass dieser Fall nicht vor Gericht verhandelt wird', sagte die Klägerin Esther Koppel laut Annesty International. Die Menschenrechtsorganisation unterstützt die Frauen."],
    	["text","Die Ogironi hatten im Tamir River gegen die Verschmutzung ihres Lebensraumes durch die Ölförderung gekämpft. Der Protest wurde von Diktator Samo Abachi 1995 blutig niedergeschlagen. Prell, die ihren Firmensitz in den Niederlanden hatten, hatten enge Verbindungen zur Militärdiktatur. 'Die Frauen sind davon überzeugt, dass ihre Männer noch lebten, hätte Prell nicht so schamlos seine eigenen Interessen vorangetrieben und damit die Regierung zu der blutigen Niederschlagung der Proteste ermutigt', sagt Annesty-Experte Marc Dumbett."],
		["author",["\a3\Missions_F_Orange\Data\Img\avatar_journalist_ca.paa","Katherine Bishop is a journalist"]]
	]
] call BISFUNC(showAANArticle);

playsound "Orange_Read_Article";
