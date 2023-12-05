// BOJ_10825_국영수.swift
// 문제에 나와있는 정렬 기준으로 정렬한 후 첫째 줄부터 N개의 줄에 걸쳐 각 학생의 이름을 출력한다.
//1. 국어 점수가 감소하는 순서로
//2. 국어 점수가 같으면 영어 점수가 증가하는 순서로
//3. 국어 점수와 영어 점수가 같으면 수학 점수가 감소하는 순서로
//4. 모든 점수가 같으면 이름이 사전 순으로 증가하는 순서로 (단, 아스키 코드에서 대문자는 소문자보다 작으므로 사전순으로 앞에 온다.)

// 구조체를 만들어서 학생 데이터를 보관
struct studentData {
    var name: String
    var kor: Int
    var eng: Int
    var mat: Int
}

let N = Int(readLine()!)!

// studentData 구조체 타입을 가진 배열을 생성
var student: [studentData] = []

for _ in 0..<N {
    let data = readLine()!.split(separator: " ")
    // 입력받은 data를 student의 구조체 타입에 맞게 값을 넣어줌
    student.append(studentData(name: String(data[0]), kor: Int(data[1])!, eng: Int(data[2])!, mat: Int(data[3])!))
}

// 학생 배열 정렬
student.sort {
    if $0.kor != $1.kor { // 1. 국어 점수가 다르냐?
        return $0.kor > $1.kor // 국어 점수가 다르면 국어를 내림차순으로 정렬해서 리턴
    } else if $0.eng != $1.eng { // 2. 국어 점수는 같은데 영어 점수는 다르냐?
        return $0.eng < $1.eng // 영어 점수가 다르면 영어를 오름차순으로 정렬해서 리턴
    } else if $0.mat != $1.mat { // 3. 국어, 영어는 같은데 수학 점수는 다르냐?
        return $0.mat > $1.mat // 수학 점수가 다르면 수학을 내림차순으로 정렬해서 리턴
    } else { // 국어, 영어, 수학이 같구나!
        return $0.name < $1.name // 그럼 이름을 오름차순으로 정렬해서 리턴
    }
}

student.forEach { print($0.name) }

//12
//Junkyu 50 60 100
//Sangkeun 80 60 50
//Sunyoung 80 70 100
//Soong 50 60 90
//Haebin 50 60 100
//Kangsoo 60 80 100
//Donghyuk 80 60 100
//Sei 70 70 70
//Wonseob 70 70 90
//Sanghyun 70 70 80
//nsj 80 80 80
//Taewhan 50 60 90

//Donghyuk
//Sangkeun
//Sunyoung
//nsj
//Wonseob
//Sanghyun
//Sei
//Kangsoo
//Haebin
//Junkyu
//Soong
//Taewhan