// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


// CHECK
// 글자수를 체크하는 로직 - bytes 이용할 듯
// string을 bytes로 변경한 다음 length를 비교
// global variable 처리
// 
contract basic_41_50 {

    // 1. 숫자만 들어갈 수 있으며 길이가 4인 배열을 (상태변수로)선언하고 
    // 그 배열에 숫자를 넣는 함수를 구현하세요. 
    // 배열을 초기화하는 함수도 구현하세요. 
    // (길이가 4가 되면 자동으로 초기화하는 기능은 굳이 구현하지 않아도 됩니다.)
    uint[4] num4;

    function setNum4(uint _n) public {
        uint i;
        for(i=0; i < num4.length; i++){
            if(num4[i] == 0){
                num4[i] = _n;
                break;
            }
        }

        if(i == 4) {
            initNum4();
            num4[0] = _n;
        }
    }

    function initNum4() public {
        for(uint i=0; i < num4.length; i++){
            delete num4[i];
        }
    }

    function initNum4All() public {
        delete num4;
    }

    function getNum4() public view returns(uint[4] memory){
        return num4;
    }

    // 2. 이름과 번호 그리고 지갑주소를 가진 '고객'이라는 구조체를 선언하세요. 
    // 새로운 고객 정보를 만들 수 있는 함수도 구현하되 이름의 글자가 최소 5글자가 되게 설정하세요.
    struct Client {
        string name;
        uint number;
        address wallet;
    }

    Client[] clientList;

    function setClient(string memory _name, uint _number, address _wallet) public {
        // require(bytes(_name).length >= bytes("abcde").length, "revert");
        require(bytes(_name).length >= 5, "revert");
        clientList.push(Client(_name, _number, _wallet));        
    }

    // 3. 은행의 역할을 하는 contract를 만드려고 합니다. 별도의 고객 등록 과정은 없습니다. 
    // 해당 contract에 ether를 예치할 수 있는 기능을 만드세요. 
    // 또한, 자신이 현재 얼마를 예치했는지도 볼 수 있는 함수 
    // 그리고 자신이 예치한만큼의 ether를 인출할 수 있는 기능을 구현하세요.
    // 힌트 : mapping을 꼭 이용하세요.
    mapping(address => uint) account;

    function desposit() public payable {
        account[msg.sender] += msg.value;
    }

    function checkBalance() public view returns(uint) {
        return account[msg.sender];
    }

    function withdraw(uint _n) public {
        require(account[msg.sender] >= _n);
        account[msg.sender] -= _n;
        payable(msg.sender).transfer(_n);

    }



    // 4. string만 들어가는 array를 만들되, 4글자 이상인 문자열만 들어갈 수 있게 구현하세요.
    string[] nameList;

    function setNameList(string memory _name) public {
        require(bytes(_name).length >= bytes("abcd").length, "revert");
        nameList.push(_name);
    }


    // 5. 숫자만 들어가는 array를 만들되, 100이하의 숫자만 들어갈 수 있게 구현하세요.
    uint[] numList;

    function setNumList(uint _n) public {
        require(_n <= 100, "revert");
        numList.push(_n);
    }

    /*
    6. 3의 배수이거나 10의 배수이면서 50보다 작은 수만 들어갈 수 있는 array를 구현하세요.    
        (예 : 15 -> 가능, 3의 배수 // 40 -> 가능, 10의 배수이면서 50보다 작음 
        // 66 -> 가능, 3의 배수 // 70 -> 불가능 10의 배수이지만 50보다 큼)
        */


    // 7. 배포와 함께 배포자가 owner로 설정되게 하세요. 
    // owner를 바꿀 수 있는 함수도 구현하되 그 함수는 owner만 실행할 수 있게 해주세요.
    address owner;
    constructor() {
        owner = msg.sender;
    }

    function newOwner(address _addr) public {
        require(owner == _addr, "back");
        owner = _addr;
    }

    /*
    8. A라는 contract에는 2개의 숫자를 더해주는 함수를 구현하세요. 
    B라고 하는 contract를 따로 만든 후에 A의 더하기 함수를 사용하는 코드를 구현하세요.
    */

    // 9. 긴 숫자를 넣었을 때, 마지막 3개의 숫자만 반환하는 함수를 구현하세요.    
    // 예) 459273 → 273 // 492871 → 871 // 92218 → 218
    function getRemainUnder1000(uint _n) public pure returns(uint) {
        return _n%1000;
    }

    // 맨 앞의 세자리 숫자
    function getFirstThree(uint _n) public pure returns(uint) {
        uint len = 1;
        for(uint i=_n; i>=10; i/=10) {
            len++;
        }

        return _n/(10**(len-3));
    }

    function getDigits(uint _n) public pure returns(uint) {
        uint _m = 1;
        while( _n >= 10**_m) {
            _m++;
        }
        return _m;
    }

    // 10. 숫자 3개가 부여되면 그 3개의 숫자를 이어붙여서 반환하는 함수를 구현하세요. 
    // 예) 3,1,6 → 316 // 1,9,3 → 193 // 0,1,5 → 15 
    // 응용 문제 : 3개 아닌 n개의 숫자 이어붙이기
    function concatNum(uint _n1, uint _n2, uint _n3) public pure returns(uint) {
        uint b = getDigits(_n2); // 5678
        uint c = getDigits(_n3); // 90
        return _n1*(10**(b+c)) + _n2*(10**c) + _n3;
    }

}
