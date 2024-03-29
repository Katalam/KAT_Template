#define PREFIX KAT
#define COMPONENT template

// Version
#define MAJOR 2
#define MINOR 1
#define PATCHLVL 12
#define MISSIONVERSION 1
#define DAY 27
#define MONTH 8
#define YEAR 2019

#define DEBUG_SYNCHRONOUS
//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

#define BISFUNC(var1) TRIPLES(BIS,fnc,var1)
#define QBISFUNC(var1) QUOTE(BISFUNC(var1))
#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)
#define QACEFUNC(var1,var2) QUOTE(TRIPLES(DOUBLES(ace,var1),fnc,var2))

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define GETMVAR(var1,var2) (missionNamespace GETVAR_SYS(var1,var2))
#define LINKFUNC(x) {_this call FUNC(x)}
#define CALLFUNC(x) {call FUNC(x)}
