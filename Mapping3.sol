// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Mapping {
    mapping(string => mapping(string=>uint)) accounts;

    function setAccount(string memory _name, string memory _bank, uint _amount) public {
        accounts[_name][_bank] = _amount;
    }

    function getAccount(string memory _name, string memory _bank) public view returns(uint) {
        return accounts[_name][_bank];
    }

    struct Student {
        string name;
        uint number;
    }

    mapping(string => Student) students1;
    mapping(string => Student[]) students2;

    function setTeacherStudent(string memory _teacher, Student memory _s1) public {
        students1[_teacher] = _s1;
    }

    function setTeacherStudent2(string memory _teacher, Student memory _s2) public {
        students2[_teacher].push(_s2);
    }

    function getStudent1(string memory _teacher) public view returns(Student memory) {
        return students1[_teacher];
    }

    function getStudent2(string memory _teacher) public view returns(Student[] memory)  {
        return students2[_teacher];
    }

}