// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FunctionVisibility {
    // public private internal external

    //public 

    // -inside contract
    // -outside contract
    // -derived contracts

    uint public counter = 0;

    function increment() public {
        counter += 1;
    }

    function incrementAgain() public {
        increment();
    }

    //private 

    //-inside contract
    // not from outside
    // not from derived


    //internal 
    // -inside contract
    // derived contract(inheritance)
    // not from outside contracts

    //external
    // - outside the contract
    // - not from insie the same contract (except using this)
    // often more gas efficient

    //function default public

    //state variable -> internal
}


contract AccessPublic {
    FunctionVisibility public publicExample = new FunctionVisibility();
    function textPublicAccess () public view returns(uint){
        return publicExample.counter();
    }

    function callIncrement() public {
        publicExample.increment();
    }
}