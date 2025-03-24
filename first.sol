// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Animal {
    string public species;
    function makeSound() public pure virtual returns (string memory) {
        return "...";
    }
}

contract Dog is Animal{
    constructor(){
        species = "Dog";
    }
    function makeSound() public pure override returns (string memory){
        return "Woof";
    }
}