// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER {
    uint a;
    modifier higherThanFive() {
        require(a>=5, "go back");
        _; 
    }

    function A() public view returns(uint) {
        require(a >=5, "go back");
        return a*5;
    }

    function setA(uint _n) public {
        a = _n;
    }

    function B() public view higherThanFive returns(uint) {
        //require(a>=5, "go back");
        return a**2;
    }
}

contract MODIFIER2 {
    uint a = 1;
    uint b = 1;

    modifier mul1() {
        a *=2;
        _;
        a *=2;
    }

    modifier mul2() {
        _;
        b *=2;
        _;
    }

    function getAB() public view returns(uint, uint) {
        return (a, b);
    }

    function A() public mul1 {
        a += 7;
    }

    function B() public mul2 {
        b += 7;
    }
}