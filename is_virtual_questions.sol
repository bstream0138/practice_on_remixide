// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY_Variable {
    uint a = 1;
    uint private b = 2;
    uint internal c = 3;
    uint public d = 4;

    uint[] numbers1;
    uint[] private numbers2;
    uint[] internal numbers3;
    uint[] public numbers4; // [1,3,5,7,9,11,13,15,117,19]

    mapping(uint => string) mapping1;
    mapping(uint => string) private mapping2;
    mapping(uint => string) internal mapping3;
    mapping(uint => string) public mapping4;

    struct A {
        uint a;
        string b;
        bytes32 c;
    }

    A a_1;
    A private a_2;
    A internal a_3;
    A public a_4;

    function set1(uint[] memory _n) public {
        numbers1 = _n;
    }

    function set2(uint[] memory _n) public {
        numbers2 = _n;
    }

    function set3(uint[] memory _n) public {
        numbers3 = _n;
    }

    function set4(uint[] memory _n) public {
        numbers4 = _n;
    }

    function setm1(uint _n, string memory _s) public {
        mapping1[_n]= _s;
    }

    function setm2(uint _n, string memory _s) public {
        mapping2[_n]= _s;
    }

    function setm3(uint _n, string memory _s) public {
        mapping3[_n]= _s;
    }

    function setm4(uint _n, string memory _s) public {
        mapping4[_n]= _s;
    }

    function getABCD() public view returns(uint, uint, uint, uint) {
        return (a, b, c, d);
    }
}