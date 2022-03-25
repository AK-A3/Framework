#include "..\..\script_macros.hpp"
/*
	Author: Rezlind
	File: fn_loanOpen.sqf

    Written by Rezlind
    You're not allowed to use this file without permission
*/

disableSerialization;
createDialog "rezlind-loan-shark";

waitUntil {!isNull (findDisplay 1500)};

_help = CONTROL(1500,1501);
_button = CONTROL(1500,1503);

if (RZ_Loan > 0) then {
	_button ctrlSetText "Pay On Loan";
	_help ctrlSetStructuredText parseText format ["You are uneligible to take a loan out at this time. You currently have an active balance of $%1.",[RZ_Loan] call life_fnc_numberText];
} else {
	_button ctrlSetText "Take Out Loan";
	_help ctrlSetStructuredText parseText format ["Congratulations, You are eligible to take out a loan. The maximum amount you are eligible for is $%2. We charge a 25%1 interest rate on our loans. You can make payments via this app or via your paycheck.","%",[RZ_MaxLoan] call life_fnc_numberText];
};