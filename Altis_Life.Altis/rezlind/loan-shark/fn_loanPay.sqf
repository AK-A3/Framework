#include "..\..\script_macros.hpp"
/*
	Author: Rezlind
	File: fn_loanPay.sqf

    Written by Rezlind
    You're not allowed to use this file without permission
*/

private _amount = param [0,0,[""]];
_amount = parseNumber _amount;

if !(_amount isEqualType 0) exitWith {hint "Please enter a valid number"};
if (_amount <= 0) exitWith {hint "Please enter a valid amount above 0."};
if (_amount > RZ_Loan) exitWith {hint "You cannot pay more than you owe"};

RZ_Loan = (RZ_Loan - _amount);
BANK = BANK - _amount;

if (RZ_Loan > 0) then {
	hint format ["You have paid $%1 off of your loan. You have $%2 left to pay.",_amount,[RZ_Loan] call life_fnc_numberText];
} else {
	hint "You have paid off your loan.";
};

closeDialog 0;
[5] call life_fnc_updatePartial;
[0] call life_fnc_updatePartial;