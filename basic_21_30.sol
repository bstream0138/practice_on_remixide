// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract basic_21_30 {

    // 25. 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
    int[] A;
    function setA(int _n) public returns(int[] memory) {
        // i가 -1까지 가지 않도록 주의할 것
        for(int i = _n; i >= 0; i--) {
            A.push(i);
        }
        return A;
    }

    // i가 -1이 되지 않도록 n의 시작 위치, for문 종료 위치, 사용값을 조정
    uint[] A2;
    function setA2(uint _n) public returns(uint[] memory) {
        for(uint i = _n+1; i >= 1; i--) {
            A2.push(i-1);
        }
        return A2;
    }

    // 26. 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 
    // 숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    uint[] evenNums;
    uint[] oddNums;
    function setNums(uint _n) public {
        if(_n%2==0) evenNums.push(_n);
        else oddNums.push(_n);
    }
    function getEvens() public view returns(uint[] memory) { return evenNums; }
    function getOdds() public view returns(uint[] memory) { return oddNums; }
    
    // 27. string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요. 
    // 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.

}



/*
21. 3의 배수만 들어갈 수 있는 array를 구현하세요.
22. 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
    예) 2,5 input → 5-2=3(output)
    
23. 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
24. string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
28. ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
29. 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
30. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
(sorting 코드 응용 → 약간 까다로움)   
    예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
*/

