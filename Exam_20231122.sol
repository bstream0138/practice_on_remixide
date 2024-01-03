// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract MyClass {
    // 학생 정보: 번호, 점수, 학점
    struct StudentInfo {
        uint number;
        uint score;
        string grade;
    }

    // 학생(이름 + 학생 정보)
    mapping(string => StudentInfo ) students;

    // 학생(only 학생 정보)
    StudentInfo[] studentArray;

    function getGrade(uint _score) public pure returns(string memory) {
        string memory grade;
        if( _score >= 90 ){
            grade = "A";
        }else if( _score >= 80 ){
            grade = "B";
        }else if( _score >= 70){
            grade = "C";
        }else if( _score >= 60){
            grade = "D";            
        }else{
            grade = "F";
        }
        return grade;
    }

    // 각종 기능 테스트를 위한 배열 정보 초기화 함수
    function initStudentsList() public {
        // init students
        students["Alice"] = StudentInfo(1, 85, getGrade(85));
        students["Bob"] = StudentInfo(2, 75, getGrade(75));
        students["Charlie"] = StudentInfo(3,60, getGrade(60));
        students["Dwayne"] = StudentInfo(4, 90, getGrade(90));
        students["Ellen"] = StudentInfo(5,65, getGrade(65));
        students["Fitz"] = StudentInfo(6,50, getGrade(50));
        students["Garret"] = StudentInfo(7,80, getGrade(80));
        students["Hubert"] = StudentInfo(8,90, getGrade(90));
        students["Isabel"] = StudentInfo(9,100, getGrade(100));
        students["Jane"] = StudentInfo(10,70, getGrade(70));
        // init studentArray
        studentArray.push(StudentInfo(1, 85, getGrade(85)));
        studentArray.push(StudentInfo(2, 75, getGrade(75)));
        studentArray.push(StudentInfo(3,60, getGrade(60)));
        studentArray.push(StudentInfo(4, 90, getGrade(90)));
        studentArray.push(StudentInfo(5,65, getGrade(65)));
        studentArray.push(StudentInfo(6,50, getGrade(50)));
        studentArray.push(StudentInfo(7,80, getGrade(80)));
        studentArray.push(StudentInfo(8,90, getGrade(90)));
        studentArray.push(StudentInfo(9,100, getGrade(100)));
        studentArray.push(StudentInfo(10,70, getGrade(70)));

    }

    //* 학생 추가 기능 - 특정 학생의 정보를 추가
    function setStudent(string memory _name, uint _number, uint _score) public {        
        students[_name] = StudentInfo(_number, _score, getGrade(_score));
        studentArray.push(StudentInfo(_number, _score, getGrade(_score)));
    }

    // * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudentByNumber(uint _number) public view returns(StudentInfo memory){
        StudentInfo memory student_info;
        for(uint i; i < studentArray.length; i++){
            if( studentArray[i].number == _number ){
                student_info = studentArray[i];
                break;
            }
        }
        return student_info;
    }

    // * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getStudentByName(string memory _name) public view returns(StudentInfo memory){
        return students[_name];
    }

    // * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getStudentScoreByName(string memory _name) public view returns(uint){
        return students[_name].score;
    }

    // * 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getNumOfStudents() public view returns(uint) {
        return studentArray.length;
    }

    // * 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudentInfos() public view returns(StudentInfo[] memory){
        return studentArray;
    }

    // * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAvgOfScore() public view returns(uint) {
        uint total_score;
        for(uint i; i < studentArray.length; i++){
            total_score += studentArray[i].score;
        }
        return total_score/studentArray.length;
    }

    // * 선생 지도 자격 자가 평가 시스템
    // - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function evaluateTeacher() public view returns(bool) {
        if( getAvgOfScore() >= 70 ){
            return true;
        } else {
            return false;
        }
    }

    // * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function getNumFClass() public view returns(uint) {
        uint numF;
        for(uint i; i < studentArray.length; i++){
            //if( studentArray.grade == "F" ){
            if( studentArray[i].score < 60 ){
                numF++;
            }
        }
        return numF;
    }

    function getFClassInfo() public view returns(StudentInfo[] memory) {
        uint index;
        StudentInfo[] memory FStudents = new StudentInfo[](getNumFClass());

        for(uint i; i < studentArray.length; i++){
            if( studentArray[i].score < 60 ){
                FStudents[index] = studentArray[i];
                index++;                
            }
        }

        return FStudents;
    }

    // * S반 조회 기능 
    // - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 
    // 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    
    function getTop4Info() public view returns(StudentInfo[4] memory) {
        // *** 전체 학생수는 4명 이상이라고 가정
        StudentInfo[4] memory Top4Info;       

        // studentArray 복제
        uint tmp_length = getNumOfStudents();
        StudentInfo[] memory tempInfo = new StudentInfo[](tmp_length);        
        tempInfo = studentArray;

        StudentInfo memory temp_studentinfo;

        // tempInfo 정렬, 동점자 처리 불가
        for(uint i=0; i < tmp_length-1; i++){
            for(uint j=0; j < tmp_length-1; j++){
                if( tempInfo[j].score < tempInfo[j+1].score ){
                    temp_studentinfo = tempInfo[j];
                    tempInfo[j] = tempInfo[j+1];
                    tempInfo[j+1] = temp_studentinfo;
                }
            }            
        }

        // 상위 4명 설정
        for(uint i=0; i < 4; i++){
            Top4Info[i] = tempInfo[i];
        }

        return Top4Info;
    }

}