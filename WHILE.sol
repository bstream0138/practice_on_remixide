// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract WHILE {
    uint STATE=1;
    function while_1(uint _n) public returns(uint, uint) {
        uint a;

        while(_n > a) {
            STATE *= 2;
            a++;
        }

        return (STATE, a);
    }

    uint[] numbers;
    function while_2(uint _n) public returns(uint[] memory) {
        
        while(numbers.length < _n) {
            numbers.push((numbers.length+1)*2);
        }

        return numbers;
    }

    function while_3(uint _n) public pure returns(uint) {
        uint i;
        while( _n > 0) {
            _n/=10;
            i++;
        }
        return i;
    }

    
}