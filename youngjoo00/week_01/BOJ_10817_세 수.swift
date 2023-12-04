// 세 수_10817.swift
//세 정수 A, B, C가 주어진다. 이때, 두 번째로 큰 정수를 출력하는 프로그램을 작성하시오.

let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

print(input[1])

// 20 30 10
// 20