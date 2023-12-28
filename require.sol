// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Practice_Require {
    uint a;

    function setAsFive() public {
        a = 5;
    }


    function getInput( uint _n ) public {
        // require가 뒤에 있어도 외부함수 호출 무의미해짐
        setAsFive();
        require( _n >= 10, "go back");
    }

    function getA() public view returns(uint) {
        return a;
    }

    // 11을 input으로 넣으면 실행 안됨
    // a=_n가 먼저 와도 require 때문에 a가 초기상태로 복귀 됨. 
    // require의 순서는 상관없음.
    function require_1_3(uint _n) public returns(string memory) {
        a = _n;
        require(_n<=10, "_n should not be higher than 10.");
        if(a>=0 && a<=2) {
            return "A";
        } else if(a>=3 && a<=5) {
            return "B";
        } else if(a>=6 && a<=8) {
            return "C";
        } else {
            return "D";
        }
    }



}