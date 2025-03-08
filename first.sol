// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Array{
    //fixed size array
    uint[3] public scores = [85, 80, 90];

    // dynamic size arrays
    uint[] public dynamicScores;

    function addScore(uint score) public {
        dynamicScores.push(score); // add a new number to the end
    }

    function getScore(uint index) public view returns (uint) {
        return dynamicScores[index];
    }
 
    function getNumberOfScores() public view returns (uint) {
        return dynamicScores.length;
    }

    function removeLastScode() public {
        dynamicScores.pop();
    }
}