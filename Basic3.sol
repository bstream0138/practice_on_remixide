// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.8.2 < 0.9.0;

contract Basic3{
    uint a;

    // view, pure 를 쓸 수 있는데 사용하지 않으면 compile에서 문제가 생기지 않지만
    // view, pure 를 붙이지 않으면 MetaMask가 뜨고
    // 이 경우, 상태를 변경하지 않아도 함수만 호출해도 비용이 발생할 수 있음

    // 상태변수를 변경하는 경우, remix에서 함수 호출하면 함수명 옆에 초록색 체크마크가 붙음

    // 상태변수를 변경하는 경우 -> execution cost + transaction cost
    // 상태변수를 변경하지 않는 경우 -> (only) execution cost

    function setA(uint _a) public {
        a = _a;
    }

    function setAasFive() public {
        a = 5;        
    }

    function getA() public view returns(uint) {
        return a;
    }

    // pure라도 execution cost는 존재할 수 있음
    // cost가 0인 function이 존재한다면 그 자체로 체인에 대한 공격을 진행할 수 있음
    // 네트워크 부하 관리라고 생각하자
    function getB(uint _a) public pure returns(uint) {
        uint _b = _a**3;
        return (_a + _b);
    }

    function getAplusB(uint _b) public view returns(uint) {
        return a + _b;
    }

}