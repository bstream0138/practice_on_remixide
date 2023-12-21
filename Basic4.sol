// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract Basic4{
    string a;
    uint b;

    function setA(string memory _a) public {
        a = _a;
    }

    function setAasABC() public {
        a = "abc";
    }

    function setAandB(string memory _a, uint _b) public {
        a = _a;
        b = _b;
    }

    function getA() public view returns(string memory) {
        return a;
    }
}