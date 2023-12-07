// BOJ_5800_성적 통계.swift
//각 반의 학생들의 수학 시험 성적이 주어졌을 때, 최대 점수, 최소 점수, 점수 차이를 구하는 프로그램을 작성하시오.

let K = Int(readLine()!)!
var score: [[Int]] = []

for i in 0..<K {
    score.append(readLine()!.split(separator: " ").map { Int($0)! })
    score[i].remove(at: 0)
    score[i].sort(by: >)
}

for i in 0..<K {
    var gap = 0
    
    for j in 0..<score[i].count-1 {
        if gap < score[i][j] - score[i][j+1] {
            gap = score[i][j] - score[i][j+1]
        }
    }
    print("Class \(i+1)\nMax \(score[i].max()!), Min \(score[i].min()!), Largest gap \(gap)")
}

// 처음은 이렇게 풀었으나 다른 사람의 풀이를 보았다... 나는 아직도 swift 문법을 조금밖에 모르는 듯 하다...

for i in 1...Int(readLine()!)! {
    // 이런일이?? 입력받아서 나온 배열은 더 이상 조작하지 못하는 줄 알았으나 [1...].sorted 를 이용해서 그 배열을 또 조작했다??!!?!??!
    let score = readLine()!.split { $0 == " " }.map { Int($0)! }[1...].sorted(by: >)
    var n = 0
    
    for j in 0..<score.count-1 {
        // max(_ x: T, _ y: T ) -> T where T : Comparable
        // 첫 번째 매개변수와 두 번째 매개변수의 값을 비교해서 max함수의 의도대로 더 큰 값을 빼내서 변수에 할당해주는 방법이 존재했다!!!!???
        n = max(n, score[j]-score[j+1])
    }

    print("Class \(i)\nMax \(score.first!), Min \(score.last!), Largest gap \(n)")
}

//2
//5 30 25 76 23 78
//6 25 50 70 99 70 90
//
//Class 1
//Max 78, Min 23, Largest gap 46
//Class 2
//Max 99, Min 25, Largest gap 25