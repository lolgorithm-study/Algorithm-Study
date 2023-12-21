// BOJ_17952_과제는 끝나지 않아!.swift
// 받은 과제의 점수를 출력하자

// 1 or 0, A(점수), T(분) 순서로 값이 들어옴
struct AssignmentData {
    var A: Int
    var T: Int
}
let N = Int(readLine()!)!

var assignment: [AssignmentData] = []
var result = 0

// 스택의 top 표시하기 위한 변수
var top = -1

for _ in 0..<N {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    
    // 입력받은 값이 0이면서 과제 배열이 비어있지 않다면 top 의 점수를 -1
    if data[0] == 0 && !(assignment.isEmpty) {
        assignment[top].T -= 1
    } else if data[0] == 1 {
        // 입력 받은 값이 1이라면, 과제 배열에 데이터 추가
        assignment.append(AssignmentData(A: data[1], T: data[2]-1))
        top = top + 1
    }
    
    // top이 -1 이 나오는 경우가 있어서 0 이상일 경우,
    if top >= 0 {
        // result 에 top 의 점수를 넣고, pop 해줌
        if assignment[top].T == 0 {
            result += assignment[top].A
            assignment.popLast()
            top -= 1
        }
    }
}

print(result)

//5
//1 10 3
//0
//1 100 2
//1 20 1
//0