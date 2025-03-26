// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Ownable {
    address public owner;
    constructor() {
        owner = msg.sender;  // Assign the contract creator as the owner of the contract
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the  owner, you can't call it");
        _;
    }
}

contract Pausable is Ownable {
    bool public paused;

    modifier whenNotPaused(){
        require(!paused, "The contract is paused.");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner{
        paused = false;
    }
}

contract Token is Ownable, Pausable {
    mapping (address => uint) public balances;

    function transfer(address to, uint amount) public whenNotPaused {
        require(balances[msg.sender] >= amount, "Insuffient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function mint(address to, uint amount) public onlyOwner {
        balances[to] += amount;
    }
}