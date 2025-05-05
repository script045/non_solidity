// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StructArrayExample{
    struct Student{
        string name;
        uint[] grades;
        bool hasPassedExam;
    }
    // Array of Students
    Student[] public students;

    //adding student
    function addStudent(string memory _name) public {
        // creating a synamic array for grades
        uint[] memory emptyGrades = new uint[](0);

        //add student to array
        students.push(Student(_name, emptyGrades, false));

    }

    function addGrade(uint studentIndex, uint grade) public {
        students[studentIndex].grades.push(grade);
    }

    //check if the student pass the exam
    function updatePassStatus(uint studentIndex) public  returns (bool) {
        uint  sum =0;
        for (uint i = 0; i<students[studentIndex].grades.length; i++){
            sum += students[studentIndex].grades[i];
        }

        uint average = sum/students[studentIndex].grades.length;
        return students[studentIndex].hasPassedExam = (average >= 60);
    }

}