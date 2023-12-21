// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.10 <0.9.0;

contract Struct {
    struct Student {
        string name;
        uint serial;
        uint score;
        string grade;
    }

    Student[] class;

    function setStudent(string memory _name, uint _serial, uint _score, string memory _grade) public {
        class.push(Student(_name, _serial, _score, _grade));
    }

    function setStudent2(Student memory _st) public {
        class.push(_st);
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return class[_n-1];
    }

    function getScoreOfStudent(uint _n) public view returns(uint) {
        return class[_n-1].score;
    }

    function getNumberOfStudent() public view returns(uint) {
        return class.length;
    }

    function getClass() public view returns(Student[] memory) {
        return class;
    }

}