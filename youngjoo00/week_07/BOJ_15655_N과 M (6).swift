// BOJ_15655_N과 M (6).swift
// N개의 숫자들 중 M개를 선택하는 모든 경우 출력
// 조건 : 오름차순, 이미 나왔던 값 중복 없이
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

let number = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr: [Int] = []

func backTraking(index: Int, _ arr: [Int]) {
    // 재귀가 끝나는 조건
    if arr.count == M {
        arr.forEach { print($0, terminator: " ") }
        print()
        return
    }
    
    // 0~N-1 까지의 숫자만 반복해서 돌림
    for i in index..<number.count {
        // 오름차순이니까 index 에는 자신의 바로 다음 숫자를 넣고, 배열 매개변수에 arr + [number[i]] 넣고 재귀
        backTraking(index: i + 1, arr + [number[i]])
    }
}

// 0번 인덱스부터 빈 배열을 넣음
backTraking(index: 0, [])