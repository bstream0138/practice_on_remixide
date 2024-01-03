// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ClassManager {
    // 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.
    struct StudentInfo {
        uint number;
        string name;
        uint score;
    }

    StudentInfo[] students;

    // 학생 정보 입력
    function initStudentsList() public {
        // init students
        students.push(StudentInfo(1, "Alice", 85));
        students.push(StudentInfo(2, "Bob", 75));
        students.push(StudentInfo(3, "Charlie", 60));
        students.push(StudentInfo(4, "Dwayne", 90));
        students.push(StudentInfo(5, "Ellen", 65));
        students.push(StudentInfo(6, "Fitz", 50));
        students.push(StudentInfo(7, "Garret", 80));
        students.push(StudentInfo(8, "Hubert", 90));
        students.push(StudentInfo(9, "Isabel", 100));
        students.push(StudentInfo(10, "Jane", 70));
    }

    function getNumOfStudendts() public view returns(uint) {
        return students.length;
    }

    // 가장 점수가 낮은 사람의 정보를 보여주는 기능,
    function sortStudentByScore() public {
        StudentInfo memory tempStudentInfo;

        for(uint i=0; i < students.length; i++ ) {
            for(uint j=1; j < students.length; j++) {
                if(students[j-1].score > students[j].score) {
                    tempStudentInfo = students[j];
                    students[j] = students[j-1];
                    students[j-1] = tempStudentInfo;
                }
            }
        }

        return;
    }

    function getLowestScore() public returns(StudentInfo memory) {
        require( students.length >= 1, "No student");
        sortStudentByScore();
        return students[0];
    }

    function getNameOfLowestScore() public returns(string memory) {
        require( students.length >= 1, "No student");
        sortStudentByScore();
        return students[0].name;
    }

    

    // 총 점수 합계, 총 점수 평균을 보여주는 기능,
    function getTotalScore() public view returns(uint) {
        uint total;
        for( uint i=0; i < students.length; i++ ) {
            total += students[i].score;
        }
        return total;
    }

    function getAvgScore() public view returns(uint) {
        require( students.length >= 1, "No student");
        return getTotalScore() / students.length;
    }

    // 특정 학생을 반환하는 기능, -> 숫자로 반환
    function getStudentByNumber(uint _number) public view returns(StudentInfo memory) {
        StudentInfo memory tempStudentInfo;
        for( uint i=0; i < students.length; i++ ) {
            if( students[i].number == _number) {
                tempStudentInfo = students[i];
                break;
            }
        }
        return tempStudentInfo;
    }

    // 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
    function getAllStudents() public view returns(StudentInfo[] memory) {
        return students;
    }



}