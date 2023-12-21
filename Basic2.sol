// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// 전역 변수(chain 전체) > 상태 변수 > 지역변수

// 수업에서 unsigned integer를 이용하는 이유는 결정론적 프로그래밍을 위한 것
// 음수나 실수를 잘못 사용하면 동일한 함수를 수행해도 결과가 다르게 나올 수 있음

contract Basic2{
    function add(uint _a, uint _b) public pure returns (uint) {
        return _a + _b;
    }

    function mul(uint _a, uint _b) public pure returns (uint) {
        return _a * _b;
    }

    function sub(uint _a, uint _b) public pure returns (uint) {
        return _a - _b;
    }

    function sub2(int _a, int _b) public pure returns (int) {
        return _a - _b;
    }

    function div(uint _a, uint _b) public pure returns (uint, uint) {
        return (_a/_b, _a%_b);
    }

}