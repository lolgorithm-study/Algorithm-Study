// BOJ_2740_행렬 곱셈.swift

let inputA = readLine()!.split(separator: " ").map { Int($0)! }
var A = Array(repeating: Array(repeating: 0, count: 0), count: inputA[0])

for i in 0..<inputA[0] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    A[i].append(contentsOf: input)
}

let inputB = readLine()!.split(separator: " ").map { Int($0)! }
var B = Array(repeating: Array(repeating: 0, count: 0), count: inputB[0])

for i in 0..<inputB[0] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    B[i].append(contentsOf: input)
}

// n*k 행렬을 만들어서 값을 저장
var result = Array(repeating: Array(repeating: 0, count: inputB[1]), count: inputA[0])

for i in 0..<inputA[0] {
    for j in 0..<inputB[1] {
        for k in 0..<inputA[1] {
            result[i][j] += A[i][k] * B[k][j]
        }
    }
    print(result[i].map { String($0) }.joined(separator: " "))
}