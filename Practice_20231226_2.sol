// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Q1 {
    // 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.
    struct Student {
        string name;
        uint number;
        uint score;
        string grade;
        string[] classes;
    }

    Student[] students; // 혹은 mapping?

    // 번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.

    // 학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
    function setGrade(uint _score) public pure returns(string memory) {
        if(_score >=90) {
            return "A";
        } else if(_score >=80) {
            return "B";
        } else if(_score >=70) {
            return "C";
        } else if(_score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }
    
    // * 학생 추가 기능 - 특정 학생의 정보를 추가
    function pushStudent(string memory _name, uint _score, string[] memory _classes) public {
        students.push(Student(_name, students.length+1, _score, setGrade(_score), _classes));
    }

    function getString(string memory _s) public pure returns(bool) {
        if(keccak256(bytes(_s))==keccak256((bytes("ABC")))){
            return true;
        }
        else {
            return false;
        }
    }

    // keccak 256 함수: uint 256은 bytes memory로 변환 불가능
    // bytes <--> string 형변환 가능

    function hashFunction(uint _n) public pure returns(bytes32) {
        return keccak256(bytes(abi.encodePacked(_n)));
    }

    function hashFunction2(string memory _s2) public pure returns(bytes32) {
        return keccak256(bytes(abi.encodePacked(_s2)));
    }

    function hashFunction3(string memory _s) public pure returns(bytes32) {
        return keccak256(bytes(_s));
    }

    function hashFunction4(string memory _s) public pure returns(bytes32) {
        bytes32 aa= keccak256(bytes(_s));
        return aa;
    }


}