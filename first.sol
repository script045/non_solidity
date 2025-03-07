// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract First{

    // how to data store in solidity

    string public studentName;
    int public studentAge;
    string public courseName;
    bool public isEnrolled;

    function setProfile(string memory name, int age, string memory course ) public {
        studentName = name ;
        studentAge=age;
        courseName=  course ;
        isEnrolled =  true;
    }

 
}