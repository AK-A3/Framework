/*
	Author: Rezlind
	File: fn_loanInit.sqf

    Written by Rezlind
    You're not allowed to use this file without permission
*/

[] spawn {
	if (isServer && !hasInterface) exitWith {};

	RZ_Loan = 0;
	RZ_MaxLoan = getNumber (missionConfigFile >> "RZ_LoanShark" >> "Config" >> "MaxLoan");
};