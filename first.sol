// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Comparisons {

    uint public minmunAge = 18;
    uint public maximunAge = 100;

    // Equal to 
    function isAdult(uint age) public view returns (bool){
        return age >= minmunAge;
    }

    // Multiple Comparisons
    function isValidAge(uint age) public view returns (bool){
        return age >= minmunAge && age <= maximunAge;
    }

    //checking conditions
    function getAgeGroup (uint age) public pure returns (string memory){
        if (age <13){
            return "Children";
        } else if (age < 20){
            return "Teenage";
        } else {
            return "Adults";
        }
    }
}