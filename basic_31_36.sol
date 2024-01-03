// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Basic_31_36{
    // 1. string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
    function checkAliceOrBob(string memory _name) public pure returns(bool) {
        if( keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice")) ||
            keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Bob"))
        ) {
            return true;
        } else {
            return false;
        }        
    }

    // 2. 3의 배수만 들어갈 수 있는 array를 구현하되, 
    // 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
    // 예) 3 → o , 9 → o , 15 → o , 30 → x
    uint[] arrayFor2;

    function putArrayFor2(uint _n) public {
        require(_n%2==0 || _n%3==0, "N is NOT multiple of 2 or 3");
        //require(_n%3!=0 || _n%10!=0, "N is multiple of 30");
        require(_n%30!=0, "N is multiple of 30");
        arrayFor2.push(_n);
    }

    // 3. 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요. 
    // 고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 
    // 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
    
    struct client {
        //string name;
        uint number;
        address wallet;
        uint birthday;
    }

    mapping (string => client) clientList;

    function setClient(string memory _name, uint _number, address _wallet, uint _birthday) public {
        clientList[_name] = client(_number, _wallet, _birthday);
    }

    function getClient(string memory _name) public view returns(client memory) {
        return clientList[_name];
    }

    // 4. 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요. 
    // 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.
    struct student {
        string name;
        uint number;
        uint score;
    }

    student[] studentList;

    function initStudent() public {
        studentList.push(student("Alice", 1, 80));
        studentList.push(student("Bob", 2, 70));
        studentList.push(student("Charlie", 3, 50));
    }

    function setStudent(string memory _name, uint _number, uint _score) public {
        studentList.push(student(_name, _number, _score));
    }

    function getStudent(uint _number) public view returns(student memory) {
        return studentList[_number];
    }

    function getAvgScore() public view returns(uint) {
        uint total;
        for(uint i=0; i < studentList.length; i++) {
            total += studentList[i].score;
        }
        return total/studentList.length;
    }

    // 틀렸음! 문제 잘못 이해함
    // 5. 숫자만 들어갈 수 있는 array를 선언하고 
    // 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
    // 예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]
    uint[] numbers5;

    function pushNumbers(uint _n) public {
        numbers5.push(_n);
    }

    function putEvenElements() public view returns(uint[] memory){

        uint[] memory _numbers5 = new uint[](numbers5.length/2);

        uint index;
        for(uint i=0; i < numbers5.length; i+=2){
            _numbers5[index] = numbers5[i];
            index++;
        }

        return _numbers5;
    }

    // 5. 숫자만 들어갈 수 있는 array를 선언하고 
    // 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
    // 예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]
    uint[] arrayFor5;

    function initArrayFor5() public {
        for(uint i=1; i <= 20; i++){
            arrayFor5.push(i);
        }
    }

    function setArrayFor5(uint _n) public {
        arrayFor5.push(_n);
    }

    function getArrayFor5_EvenElements() public view returns(uint[] memory){
        uint[] memory tempArray;
        uint cnt;

        for(uint i=0; i < arrayFor5.length; i++){
            if( arrayFor5[i]%2 == 0 ){
                cnt++;
            }
        }

        tempArray = new uint[](cnt);

        cnt = 0;
        for(uint i=0; i < arrayFor5.length; i++){
            if( arrayFor5[i]%2 == 0 ){
                tempArray[cnt] = arrayFor5[i];
                cnt++;
            }
        }

        return tempArray;
        
    }

    // 6. high, neutral, low 상태를 구현하세요. 
    // a라는 변수의 값이 7이상이면 high, 4이상이면 neutral 
    // 그 이후면 low로 상태를 변경시켜주는 함수를 구현하세요.

    enum Level { high, neutral, low }

    Level numLevel;

    function checkLevel(uint _n) public returns(Level){
        if ( _n >= 7 ) {
            numLevel = Level.high;
        } else if ( _n >= 4 ){
            numLevel = Level.neutral;
        } else {
            numLevel = Level.low;
        }
        return numLevel;
    }

}

