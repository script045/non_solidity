// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract InvestmentCalculator {
    function calculatorROI (uint investment, uint returnAmount) public pure returns(uint) {
        return (returnAmount *100) /investment;
    }

    function calculateInterest(uint principal, uint rate) public pure returns (uint){
        return (principal * rate)/100;
    }
}