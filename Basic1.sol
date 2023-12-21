// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract Basic1 {
    uint a;
    uint b;
    uint c = 2;

    function setA(uint _a) public {
        a = _a;
    }

    function setB(uint _b) public {
        b = _b;
    }

    function setC(uint _c) public {
        c = _c;
    }

    function setAandB(uint _a, uint _b) public {
        a = _a;
        b = _b;
    }

    function setAasFive() public {
        a = 5;        
    }

    function setAasSeven() public {
        a = 7;        
    }

    function setAasNine() public {
        a = 9;        
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(uint) {
        return b;
    }

    function getC() public view returns(uint) {
        return c;
    }

    function getAandB() public view returns(uint, uint) {
        return (a, b);
    }
    

}