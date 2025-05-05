// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StructExample {
    struct Person{
        string name;
        uint age;
        address walletAddress;
        bool isActive;
    }

    Person public person1; 
    Person public person2;

    function setPerson(string memory _name, uint _age, address _walletAddress) public {
        person1 = Person(_name, _age, _walletAddress, true);
    }

    function setPersonAlternative(string memory _name, uint _age, address _walletAddress) public {
        person2.name = _name;
        person2.age = _age;
        person2.walletAddress = _walletAddress;
        person2.isActive = true;
    }

    function getPerson() public view returns (string memory, uint, address, bool){
        return (person1.name, person1.age, person1.walletAddress, person1.isActive);
    }
}