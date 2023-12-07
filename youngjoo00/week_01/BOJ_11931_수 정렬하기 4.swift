// BOJ_11931_수 정렬하기 4.swift
//N개의 수가 주어졌을 때, 이를 내림차순으로 정렬하는 프로그램을 작성하시오.
//단, 수는 중복되지 않는다.

let N = Int(readLine()!)!
var result: [Int] = []

for _ in 0..<N {
    result.append(Int(readLine()!)!)
}

result.sorted(by: >).forEach { print($0) }

//5
//1
//2
//3
//4
//5
//
//5
//4
//3
//2
//1