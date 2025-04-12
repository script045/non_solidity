// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryVsStorage {
    // Memory vs storage
    struct Person{
        string name;
        uint256 age;
    }

    // Storage e person structure array
    Person[] public people;

    function addPerson(string memory _name, uint256 _age) public {
        Person memory newPerson = Person(_name, _age); //creating in memory
        people.push(newPerson); //storing in storage
    }

    function modifyPerson(uint256 _index, string memory _name) public {
        Person storage personToChange = people[_index];
        personToChange.name = _name; //directly changing to storage
    }

    function readPersonMemory(uint256 _index) public view returns (string memory, uint256){
        Person memory personToRead = people[_index];
        return (personToRead.name, personToRead.age);
    }
}