// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ErrorHandling {
    // require()
    // revert()
    // assert()

    // require -> sequirity guard 
    mapping(address=>uint) public balances;

    function transferTokens(address to, uint amount) public {
        require (amount > 0, "Cannot transfer zero tokens");

        require(balances[msg.sender] >= amount, "Not enoguh tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    //remaining gas will be return if fail


    // revert -> emergency stop button

    uint public maxTransactionLimit = 100;

    function processLargeTransaction(uint amount) public {
        if (amount > maxTransactionLimit ){
            revert("Transaction is too large");
        }
        balances[msg.sender] -= amount;
    }

    //remaining gas will be return if fail
}

