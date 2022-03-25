#include "..\..\script_macros.hpp"
/*
	Author: Rezlind
	File: fn_loanUpdateDataBase.sqf

    Written by Rezlind
    You're not allowed to use this file without permission
*/

params [
	["_loan", -1, [0]],
	["_side", sideUnknown, [civilian]],
	["_pid", "", [""]]
];

if (_loan isEqualTo -1 || {_side isEqualTo ""} || {_pid isEqualTo ""}) exitWith {};

private _query = "";

switch (_side) do {
	case civilian: {_query = format ["UPDATE players SET civ_loan = '%1' WHERE pid = '%2'", [_loan] call DB_fnc_numberSafe, _pid];};
	case west: {_query = format ["UPDATE players SET cop_loan = '%1' WHERE pid = '%2'", [_loan] call DB_fnc_numberSafe, _pid]};
  	case independent: {_query = format ["UPDATE players SET med_loan = '%1' WHERE pid = '%2'", [_loan] call DB_fnc_numberSafe, _pid];};
};

if (_query isEqualTo "") exitWith {};

[_query,1] call DB_fnc_asyncCall;