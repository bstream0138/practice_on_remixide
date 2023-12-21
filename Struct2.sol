// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.10 <0.9.0;

contract Mapping {

    struct Student {
        uint number;
        uint score;
        string home_address;
    }

    mapping (string => uint) age;
    mapping (string => bool) gender;
    mapping (string => Student) students;

    function setStudent(string memory _name, uint _number, uint _score, string memory _address ) public {
        students[_name] = Student(_number, _score, _address);
    }

    function setAge(string memory _name, uint _age) public {
        age[_name] = _age;
    }

    function getAge(string memory _name) public view returns(uint) {
        return age[_name];
    }

    function setGender(string memory _name, bool _gender) public {
        gender[_name] = _gender;
    }

    function getGender(string memory _name) public view returns(bool) {
        return gender[_name];
    }

    
}