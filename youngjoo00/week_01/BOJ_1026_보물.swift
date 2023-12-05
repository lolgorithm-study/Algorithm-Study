// BOJ_1026_보물.swift
//첫째 줄에 N이 주어진다. 둘째 줄에는 A에 있는 N개의 수가 순서대로 주어지고, 셋째 줄에는 B에 있는 수가 순서대로 주어진다.
//N은 50보다 작거나 같은 자연수이고, A와 B의 각 원소는 100보다 작거나 같은 음이 아닌 정수이다.

let N = Int(readLine()!)!
var A : [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var B : [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

// 오름차순으로 정렬된 A 배열의 i * B의 max값 을 result에 더하면 끝
// B의 max 값은 반복횟수마다 remove 로 배열에서 값을 날려버림
for i in A {
    result += i * B.max()!
    B.remove(at: B.firstIndex(of: B.max()!)!)
}

print(result)

//5
//1 1 1 6 0
//2 7 8 3 1
//
//18