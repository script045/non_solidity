// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SchoolSystem{

    struct Student {
        string name;
        uint grade;
        bool active;
    }

    // array to keep track of all students ids
    uint[] public studentIds;
     mapping (uint => Student) public students;

    // mappping from student id to array of test scores
    mapping(uint => uint[]) public studentScores;

    // add a new student
    function addStudent(uint id, string memory name) public {
        students[id] = Student(name, 0, true);
        studentIds.push(id);
    }

    // add test score for a student
    function addScore(uint studentId, uint score) public {
        require(students[studentId].active, "Student not found");

        studentScores[studentId].push(score);

        //update grade based on average
        uint total = 0;
        uint[] memory scores = studentScores[studentId];
        for(uint i=0; i<scores.length; i++){
            total += scores[i];    
        }
         students[studentId].grade = total/scores.length;
        
    }

    //get all score for a student
    function getScores(uint studentId) public view returns (uint[] memory){
        return studentScores[studentId];
    }


    //get total number of students
    function getTotalStudents() public view returns(uint){
        return studentIds.length;
    }

}