// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Basic5 {

    //한글은 bytes로 어떻게 표현되길래 ㅋ 하나가 0xe3858b 로 표현되는지?
    // string 13과 uint 13 그리고 float 13의 byte 표현은 어떻게 다른지?

    bytes a;

    function setA(bytes memory _a) public {
        a = _a;
    }

    function setB() public {
        a = "ab";
    }

    function setC(string memory _a) public {
        a = bytes(_a);  // string 형의 _a가 bytes형의 a로 저장됨
    }

    function setD() public {
        a = "12";
    }

    function setE(uint _a) public {
        a = abi.encode(_a);
    }

    function getA() public view returns(bytes memory) {
        return a;
    }




}