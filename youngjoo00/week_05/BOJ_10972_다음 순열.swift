// BOJ_10972_다음 순열.swift
// 첫째 줄에 입력으로 주어진 순열의 다음에 오는 순열을 출력한다. 만약, 사전순으로 마지막에 오는 순열인 경우에는 -1을 출력한다.
// next permutation 알고리즘 사용
let N = Int(readLine()!)!
var permutation = readLine()!.split(separator: " ").map { Int($0)! }
var pivotIndex = -1

// 1. 배열의 뒤에서부터 permutation[i-1] < permution[i] 조건에 맞는 값 찾고, pivotIndex 에 담기
for i in stride(from: N-1, through: 1, by: -1) {
    if permutation[i-1] < permutation[i] {
        pivotIndex = i-1
        break
    }
}

// 2. pivotIndex 가 -1 이 아니면, permutation[pivotIndex] < permutation[j] 조건을 만족하는 값 찾아서 스왑
if pivotIndex != -1 {
    for j in stride(from: N-1, through: 1, by: -1) {
        if permutation[pivotIndex] < permutation[j] {
            permutation.swapAt(pivotIndex, j)
            break
        }
    }
    // 3. pivotIndex+1 부터 N 까지의 값은 내림차순으로 구성되어 있었으니 뒤집어서 오름차순으로 변경한다.
    (permutation[0...pivotIndex] + permutation[pivotIndex+1...N-1].reversed()).forEach { print($0, terminator: " ")}
} else {
    print(-1)
}