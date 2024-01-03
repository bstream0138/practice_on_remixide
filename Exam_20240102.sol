// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
간단한 게임이 있습니다.
유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다. 

참가할 때 참가비용 0.01ETH를 내야합니다.
4명까지만 들어올 수 있는 방이 있습니다.
선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.

예) 
방 안 : "empty" 
-- A 입장 --
방 안 : A 
-- B, D 입장 --
방 안 : A , B , D 
-- F 입장 --
방 안 : A , B , D , F 
A : 4점, B : 3점 , D : 2점 , F : 1점 부여 후 
방 안 : "empty" 

유저는 10점 단위로 점수를 0.1ETH만큼 변환시킬 수 있습니다.
예) A : 12점 => A : 2점, 0.1ETH 수령 // B : 9점 => 1점 더 필요 // C : 25점 => 5점, 0.2ETH 수령

---------------------------------------------------------------------------------------------------

*/

contract SimpleGame {
    
    address payable owner;

    // game info
    uint balance;
    uint userIndex;
    uint[4] seats;
    uint seatIndex;

    struct User {
        uint index;
        string name;
        address account;
        uint deposit;
        uint score;
    }

    User[] userList;

    constructor() {
        userIndex = 0;
        seatIndex = 0;
        // * 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 
        owner = payable(msg.sender);
        balance = 0;
    }

    function userSample() public {
        userList.push(User(userIndex++, "Jimmy", 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C, 0, 0));
        userList.push(User(userIndex++, "Amy", 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB, 0, 0));
        userList.push(User(userIndex++, "Max", 0x583031D1113aD414F02576BD6afaBfb302140225, 0, 0));
        userList.push(User(userIndex++, "Hainz", 0xdD870fA1b7C4700F2BD7f44238821C26f7392148, 0, 0));
    }

    // * 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작    
    function join(string memory _name) public {
        userList.push(User(userIndex++, _name, msg.sender, 0, 0));

    }

    // * 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
    function getUserInfo(uint _n) public view returns(User memory) {
        return userList[_n];
    }

    function findUserbyAddress() public view returns(uint) {
        uint i;
        for(i=0; i < userIndex; i++) {
            if(userList[i].account == msg.sender) {
                break;
            }
        }
        return i;
    }

    function findUserbyAddress(address _addr) public view returns(uint) {
        uint i;
        for(i=0; i < userIndex; i++) {
            if(userList[i].account == _addr) {
                break;
            }
        }
        return i;
    }

    // * 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
    function deposit() public payable{
        userList[findUserbyAddress(msg.sender)].deposit += msg.value;
    }

    // * 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
    function getSeats() public payable{
        require(userList[findUserbyAddress(msg.sender)].deposit >= 0.01 ether || msg.value == 0.01 ether, "inefficient ETH");
        // 잔액 정리
        if( msg.value == 0.01 ether ) {
            balance += msg.value;
        } else {
            userList[findUserbyAddress(msg.sender)].deposit -= 0.01 ether;
            balance += 0.01 ether;
        }

        getSeat(userList[findUserbyAddress(msg.sender)].index);
    }

    function showSeats() public view returns(uint[4] memory) {
        return seats;
    }

    function getSeat(uint _n) public {
        // 자리를 잡는다
        seats[seatIndex%4] = _n;    
        seatIndex++;

        if (seatIndex%4 == 0) {
            // 자리 잡은 후 좌석이 꽉 찼으면 스코어 정산 시작
            userList[seats[0]].score += 4;
            userList[seats[1]].score += 3;
            userList[seats[2]].score += 2;
            userList[seats[3]].score += 1;

            // 좌석 초기화
            delete seats;
        }
    }

    // * 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
    function getReward() public {
        // 편의상 getReward 실행 시 마다 10점을 0.1eth로 변환
        require(userList[findUserbyAddress(msg.sender)].score >= 10, "inefficient Score");

        // 점수 차감
        userList[findUserbyAddress(msg.sender)].score -= 10;
        
        // balance에서 0.1 ETH 차감, user Deposit에 0.1 ETH 증액
        balance -= 0.1 ether;
        userList[findUserbyAddress(msg.sender)].deposit += 0.1 ether;
    }

    /*
    function withdrawUser() public {
        uint deposit = userList[findUserbyAddress(msg.sender)].deposit;
        userList[findUserbyAddress(msg.sender)].deposit = 0;
        msg.transfer(deposit);
    }
    */


    // * 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 
    // 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
    function withdrawOwner(uint _amount) public {
        require(balance >= _amount, "revert");
        require(owner == msg.sender, "revert");
        balance -= _amount;
        owner.transfer(address(this).balance);
    }
    
}