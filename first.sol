// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract First{

    //varialble & data types
    // numbers
    int public num1 = -10;
    uint public num2 = 20;

    uint8 public smallNumber = 255;
    uint16 public mediumNumber = 50000;
    uint256 public largeNumber = 5000000;

   //text

   string public message = "hello NonAcademian";
   string public muName = "Ai Arif";

   //boolean
   bool public isActive = true;
   bool public isComplete = false;

   //address 
   address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    uint public age = 20;
    uint public price = 100;
    uint public totalSupply = 100000;
    int public temperature = -5;
    int public myId = 10030;

    function updateNumers (uint newAge, int temp) public {
        age = newAge;
        temperature = temp;
    }


}