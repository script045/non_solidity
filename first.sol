// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleBank{
    uint public balance = 0;
    
    // deposite, withdraw, get balance

    function deposit(uint amount) public {
        balance += amount;
    }

    function withdraw(uint amount) public {
        require(balance >= amount, "Not enough balance");
        balance -= amount;
    }

    function checkBalance() public view returns (uint) {
        return balance;
    }
}