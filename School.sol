// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.10 <0.9.0;

contract School {

    struct Student{
        string name;
        uint number;
        uint score;
        string grade;
    }

    uint a;

    Student[] students;

    function setGrade(uint _n) public pure returns(string memory){
        if(_n >=90){
            return "A";
        } else{
            return "F";
        }
    }

    function setStudent(string memory _name, uint _number, uint _score) public {
        students.push(Student(_name, _number, _score, setGrade(_score)));
    }

    function getStudents() public view returns(Student[] memory) {
        return students;
    }

    function addToA(uint _b) public view returns(uint) {
        return a + _b;
    }
     

}