// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StudentRegistry {
    //Mapping from student id to their score
    mapping (uint => uint) public studentScore;

    //Store a  student's score
    function setScore(uint studentId, uint score) public {
        studentScore[studentId] = score;
    }

    function getScore(uint studentId) public view returns (uint){
        return studentScore[studentId];
    }

    //check if student passed (score >= 60)
    function hasPassed (uint studentId) public view returns (bool) {
        return studentScore[studentId]>= 60;
    }
}