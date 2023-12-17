// BOJ_15192_인사성 밝은 곰곰이.swift
// 새로운 사람이 입장한 이후 처음 채팅을 입력하는 사람은 반드시 곰곰티콘으로 인사를 한다. 그 외의 기록은 곰곰티콘을 쓰지 않은 평범한 채팅 기록이다.
// 채팅 기록 중 곰곰티콘이 사용된 횟수를 구해보자!

var N = Int(readLine()!)!
var nickname: Set<String> = []
var count = 0

for _ in 0..<N {
    let data = readLine()!
    // 입력받은 값이 ENTER 일 경우, count 에 Set 타입인 nickname.count 를 더해주고, 리셋시킨다.
    if data == "ENTER" {
        count += nickname.count
        nickname.removeAll()
    } else {
        // ENTER 가 아닐 경우, nickname 변수에 입력한 값을 넣어준다.
        nickname.insert(data)
    }
}

print(nickname.count + count)

//7
//ENTER
//pjshwa
//chansol
//chogahui05
//ENTER
//pjshwa
//chansol

//5

//3
//ENTER
//lms0806
//lms0806

//1
