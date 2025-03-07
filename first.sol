// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract First{

    int public num = 10;
    string public greeting = "Welcome";
    bool public isActive = false;
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    function getNumber() public view returns (int){
        return num;
    }
 
}