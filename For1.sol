// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FOR {
    uint[] numbers;

    function push(uint a) public {
        numbers.push(a);
    }

    function getArray() public view returns(uint[] memory) {
        return numbers;
    }

    function add2All() public {
        for(uint i=0; i < numbers.length; i++) {
            numbers[i] += 2;
        }
    }

    function add2All(uint[] memory _numbers) public pure returns(uint[] memory) {
        for(uint i=0; i < _numbers.length; i++) {
            _numbers[i] += 2;
        }
        return _numbers;
    }

    function add2All2() public view returns(uint[] memory) {
        uint[] memory temp = numbers;
        for(uint i=0; i < temp.length; i++) {
            temp[i] += 2;
        }
        return temp;
    }
  

    // 지금 뭐 해야 한다고 했더라

    function loop1() public pure returns(uint) {
        uint a;

        for(uint i=0; i<5; i++) {
            a += i;
        }
        return a;
    }

    function loop2() public pure returns(uint) {
        uint sum;
        uint i;

        for(i=1; i<=100; i++) {
            sum += i;
        }

        return sum;
    }

    function loop3() public pure returns(uint) {
        uint sum;
        for(uint i=1; i<=100; i+=2) {
            sum += i;
        }
        return sum;
    }

    function loop4() public pure returns(uint) {
        uint sum;
        for(uint i=1; i<=100; i*=2) {
            sum += i;
        }
        return sum;
    }

}