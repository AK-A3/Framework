#include "..\..\script_macros.hpp"
/*
	Author: Rezlind
	File: fn_loanTake.sqf

    Written by Rezlind
    You're not allowed to use this file without permission
*/

private _amount = param [0,0,[""]];

_amount = parseNumber _amount;
if (_amount < 0) exitWith {hint "Please enter a valid amount above 0."};

if !(_amount isEqualType 0) exitWith {hint "Please enter a valid number"};
if (_amount <= 0) exitwith {hint "Please enter a valid amount above 0."};

if (_amount > RZ_MaxLoan) exitWith {hint format ["You cannot take a loan that is higher than $%1",[RZ_MaxLoan] call life_fnc_numberText]};
if (RZ_Loan > 0) exitWith {hint format ["You cannot take out a loan until you pay off your existing loan of $%1.",[RZ_Loan] call life_fnc_numberText]};

RZ_Loan = (_amount + (_amount * getNumber (missionConfigFile >> "RZ_LoanShark" >> "Config" >> "LoanInterest")));
BANK = BANK + _amount;

hint format ["You have taken out a loan of $%1",[RZ_Loan] call life_fnc_numberText];
systemchat "You can pay it back through our app or we can take a percentage out of your paycheck";

closeDialog 0;

[5] call life_fnc_updatePartial;
[0] call life_fnc_updatePartial;