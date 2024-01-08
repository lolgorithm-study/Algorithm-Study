// BOJ_2960_에라토스테네스의 체.swift
// 2~N 까지의 에라토스테네스의 체를 활용해 K번째로 삭제된 수 찾기

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], K = input[1]

var number: [Bool] = [false, false] + (repeatElement(true, count: N-1))
var result = 0

for i in 2...N {
    if number[i] {
        for j in stride(from: i, through: N, by: i) {
            if number[j] {
                number[j] = false
                result += 1
                if result == K {
                    print(j)
                    break
                }
            }
        }
    }
}