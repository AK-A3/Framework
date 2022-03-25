#include "..\..\script_macros.hpp"
/*
	Author: Rezlind
	File: fn_loanRequestData.sqf

    Written by Rezlind
    You're not allowed to use this file without permission
*/

params [
    ["_unit", objNull, [objNull]],
	["_side", "", [""]]
];

if (isNull _unit || {_side isEqualTo ""}) exitWith {};

switch (_side) do {
	case civilian: {_query = format ["SELECT civ_loan FROM players WHERE pid = '%1'",getPlayerUID _unit]};
	case west: {_query = format ["SELECT cop_loan FROM players WHERE pid = '%1'",getPlayerUID _unit]};
  	case independent: {_query = format ["SELECT med_loan FROM players WHERE pid = '%1'",getPlayerUID _unit]};
};

if (_query isEqualTo "") exitwith {};

private _queryResult = [_query,2] call DB_fnc_asyncCall;

[_queryResult] remoteExecCall ["RZ_LoanShark_fnc_loanRecieveData", _unit];