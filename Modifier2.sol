// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER3{
    uint a =1;

    uint b;
    uint c;

    function getA() public view returns(uint) { return a; }
    function getB() public view returns(uint) { return b; }
    function getC() public view returns(uint) { return c; }

    modifier mul1() {
        a *=3;
        _;
    }

    modifier mul2(uint _n) {
        a += _n;
        _;
    }

    function resetA() public {
        a = 1;
    }

    function setB() public mul1 mul2(a) {
        b = a;
    }

    function setC() public mul2(3) mul1 {
        c = a;
    }
}


contract MODIFIER4 {
    uint a;

    modifier plusoneBefore() {
        a++;
        _;
    }

    modifier plusoneAfter() {
        _;
        a++;
    }

    function setA(uint _n) public {
        a = _n;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setA1() public plusoneBefore returns(bool) {
        if(a>=3) {
            return true;
        } else {
            return false;
        }
    }

    function setA2() public plusoneAfter returns(bool) {
        if(a>=3) {
            return true;
        } else {
            return false;
        }
    }
}