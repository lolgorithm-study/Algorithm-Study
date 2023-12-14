// BOJ_29723_브실이의 입시전략.swift
// 첫 번째 줄에 브실이가 수강한 과목 수 N, 브실대학에서 요구하는 과목 수 M, 브실대학에서 공개한 과목 수 K가 공백으로 구분되어 주어진다.
// 브실이가 얻을 수 있는 최소 점수와 최대 점수를 공백으로 구분하여 출력한다.

let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstInput[0], M = firstInput[1], K = firstInput[2]

var studentScore: [String:Int] = [:]
var schoolScore: [String] = []
var kSum = 0

for _ in 0..<N {
    let data = readLine()!.split(separator: " ")
    studentScore[String(data[0])] = Int(data[1])!
}

for _ in 0..<K {
    schoolScore.append(readLine()!)
}

// K에 해당하는 과목은 kSum 에 더하고, 사용한 값은 지워줌
for i in schoolScore {
    kSum += studentScore[i]!
    studentScore.removeValue(forKey: i)
}

// 남은 과목들은 value 기준으로 내림차순 정렬
let sortedArr = studentScore.values.sorted(by: >)

// prifix : 앞에서부터 N 개를 잘라서 배열로 반환
// suffix : 뒤에서부터 N 개를 잘라서 배열로 반환
// reduce : N 값을 시작으로 배열의 모든 요소와 더한 결과를 Int값으로 뽑아냄
print("\(sortedArr.suffix(M-K).reduce(0, +) + kSum) \(sortedArr.prefix(M-K).reduce(0, +) + kSum)")


//6 3 2
//calculus 100
//probability 70
//physics 50
//chemistry 80
//python 90
//algorithm 100
//physics
//python
//
//210 240