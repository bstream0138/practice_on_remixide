// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Basic_37_40{
    // 7. 1 wei를 기부하는 기능, 1finney를 기부하는 기능 
    // 그리고 1 ether를 기부하는 기능을 구현하세요. 
    // 최초의 배포자만이 해당 smart contract에서 자금을 회수할 수 있고 
    // 다른 이들은 못하게 막는 함수도 구현하세요.
    // (힌트 : 기부는 EOA가 해당 Smart Contract에게 돈을 보내는 행위, contract가 돈을 받는 상황)    
    address payable owner;
    uint balance;

    string a;

    constructor() {
        owner = payable(msg.sender);
        a = "A";
    }
    
    function depositWei() public payable {
        require(msg.value == 1 wei, "revert");
        balance += msg.value;
    }

    // 1000 finney = 1 ether
    function depositFinney() public payable {
        require(msg.value == 0.001 ether, "revert");
        balance += msg.value;
    }

    function depositEther() public payable {
        require(msg.value == 1 ether, "revert");
        balance += msg.value;
    }

    function deposit() public payable {
    }

    function getBalance() public view returns(uint){
        return balance;
    }

    // msg.sender: contract 호출자의 주소
    // address(this): contract의 주소
    function withdraw() public {
        require(owner == msg.sender, "revert");
        owner.transfer(address(this).balance);
    }

    // 8. 상태변수 a를 "A"로 설정하여 선언하세요. 
    // 이 함수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요. 
    // 단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.
    // (힌트 : 동일한 조건이 서로 다른 두 함수에 적용되니 더욱 효율성 있게 적용시킬 수 있는 방법을 생각해볼 수 있음)
    modifier mod {
        require(owner == msg.sender, "revert");
        _;
    }
    function setAtoB() public mod { a = "B"; }
    function setAtoC() public mod { a = "C"; }
    function getA() public view returns(string memory) { return a;}

    // 9. 특정 숫자의 자릿수까지의 
    // 2의 배수, 3의 배수, 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
    // 예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개) 
    //     100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)
    function checkMultipleOf(uint _n) public pure returns(uint[4] memory) {
        uint[4] memory mList;

        for(uint i=1; i <= _n; i++) {
            if (i%2 == 0) mList[0]++;
            if (i%3 == 0) mList[1]++;
            if (i%5 == 0) mList[2]++;
            if (i%7 == 0) mList[3]++;
        }

        return mList;
    }

    function test39(uint _n) public pure returns(uint[4] memory) {
        uint[4] memory mList;

        mList[0] = _n/2;
        mList[1] = _n/3;
        mList[2] = _n/5;
        mList[3] = _n/7;

        return mList;
    }

    // 10. 숫자를 임의로 넣었을 때 오름차순으로 정렬하고 
    // 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요. 
    // 가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.
    // 예) [5,2,4,7,1] -> [1,2,4,5,7], 4 
    //     [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 
    //     [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6
    function Ascending(uint[] memory _list) public pure returns(uint, uint) {
        // bubble sort
        for(uint i=0; i < _list.length; i++) {
            for(uint j=i+1; j < _list.length; j++) {
                if( _list[i] > _list[j]) {
                    (_list[j], _list[i]) = (_list[i], _list[j]);
                }
            }
        }

        // 상황에 따라 output의 개수를 달리 할 수 있는지...
        if( _list.length%2 == 1 ){// 하나인 경우
            return (_list[_list.length/2], _list[_list.length/2]);
        } else {// 둘인 경우
            return (_list[_list.length/2-1], _list[_list.length/2]);
        }
    }

    function getMedian(uint[] memory _a) public pure returns(uint[] memory) {
        //_a = sorting(_a);
        for(uint i=0; i < _a.length; i++) {
            for(uint j=i+1; j < _a.length; j++) {
                if( _a[i] > _a[j]) {
                    (_a[j], _a[i]) = (_a[i], _a[j]);
                }
            }
        }

        uint[] memory b;

        // 하나인 경우
        if( _a.length%2 == 1 ){
            b = new uint[](1);
            b[0] = _a[_a.length/2];
        } 
        // 둘인 경우
        else {
            b = new uint[](2);
            (b[0], b[1]) = (_a[_a.length/2-1], _a[_a.length/2]);
        }

        return b;
    }

}

