// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Practice {
    uint[] numbers;

    function setNumber(uint _n) public  {
        while(numbers.length != 0){
            numbers.pop();
        }

        for(uint i=1; i <= _n; i++){
            numbers.push(i);
        }
    }

    function gerNumber(uint _n) public view returns(uint) {
        return numbers[_n];
    }

    function getAverage() public view returns (uint){
        uint total = 0;
        for(uint i = 0; i < numbers.length; i++){
            total += numbers[i];        }
        return total / numbers.length;
    }

    // 지역변수에는 push 불가. 메모리를 편하게 가변적으로 사용할 수 없음
    function getMultipleOf2() public view returns (uint[5] memory) {
        uint[5] memory results;
        uint seq;

        for(uint i=0; i < numbers.length; i++){
            if( numbers[i]%2 == 0){
                results[seq] = numbers[i];
                seq++;
            }
            if(seq >= results.length){
                break;
            }
        }

        return results;
    }

    function getOddsCount() public view returns (uint) {
        uint index;
        for(uint i=0; i < numbers.length; i++){
            if( numbers[i]%2 == 0){
                index++;
            }
        }
        return index;
    }

    function getMultipleOf2_new() public view returns (uint[] memory) {
        uint[] memory odds = new uint[](getOddsCount());
        uint index;

        for(uint i=0; i < numbers.length; i++){
            if( numbers[i]%2 == 0){
                odds[index] = numbers[i];
                index++;
            }
        }
        return odds;
    }

}


contract ENUM {
    enum Status {
        TurnedOff,
        Stop,
        Moving
    }

    Status CarStatus;

    function setCarStop() public {
        CarStatus = Status.Stop;
    }

    function getStatus() public view returns(Status) {
        return CarStatus;
    }
}