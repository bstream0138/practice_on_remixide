// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Test_1 {
    uint t1;
    uint t2;
    uint t3;
    function setT1(uint _n) public {
        t1 = _n;
    }
    function getT1() public view returns(uint) {
        return t1;
    }
    function setT2(uint _n) public {
        t2 = _n;
    }
    function getT2() public view returns(uint) {
        return t2;
    }
    function setT3(uint _n) public {
        t3 = _n;
    }
    function getT3() public view returns(uint) {
        return t3;
    }
}

contract Test_2 {
    uint t0;
    uint ttttttttttttttttttttttttttt2;
    uint t3;
    uint t2;
    function setT1(uint _n) public {
        t0 = _n;
    }
    function getT1() public view returns(uint) {
        return t0;
    }
    function setT2(uint _n) public {
        ttttttttttttttttttttttttttt2 = _n;
    }
    function getT2() public view returns(uint) {
        return ttttttttttttttttttttttttttt2;
    }
    function setT4(uint _n) public {
        t3 = _n;
    }
    function getT4() public view returns(uint) {
        return t3;
    }
    function setT3(uint _n) public {
        t3 = _n;
    }
    function getT3() public view returns(uint) {
        return t3;
    }

    
}

