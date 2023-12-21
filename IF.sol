// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract IF {
    function grade(uint _score) public pure returns(string memory) {
        string memory _grade;

        if( _score >= 90 ) {
            _grade = "A";
        } else if( _score >= 80) {
            _grade = "B";
        } else if( _score >= 70) {
            _grade = "C";
        } else {
            _grade = "F";
        }
        return _grade;
    }

    function check(uint _num) public pure returns(string memory) {
        string memory _checker;

        if( _num %2 == 0 ) {
            _checker = "A";
        } else if( _num %3 == 0 ) {
            _checker = "B";
        } else if( _num %5 == 0 ) {
            _checker = "C";
        } else {
            _checker = "D";
        }
        return _checker;
    }

}