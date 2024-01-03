// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    uint public a;
    uint[] public b;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }
}

// DAD
// 0xd9145CCE52D386f254917e481eB44e9943F39138, 10, [1,2,3,4,5]
// 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8, 20, [2,4,6,8,10]
// 0xf8e81D47203A594245E36C48e151709F0C19fBe8, 30, [10,20,30,40,50]

// MOM
// 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B

contract MOM {
    DAD husband = new DAD();

    function setHusband(address _a) public {
        husband = DAD(_a);
    }

    function getA() public view returns(uint) {
        return husband.a();
    }

    function getB(uint _n) public view returns(uint) {
        return husband.b(_n);
    }
}