// BOJ_10867_중복 빼고 정렬하기.swift
//N개의 정수가 주어진다. 이때, N개의 정수를 오름차순으로 정렬하는 프로그램을 작성하시오. 같은 정수는 한 번만 출력한다.

let input = Int(readLine()!)!

var numSet : Set<Int> = []

// 입력한 값을 map 을 이용하여 numSet 에 값이 중복되지 않게끔 넣어주고, 오름차순해서 출력하면 끝
readLine()!.split(separator: " ").map { numSet.insert(Int($0)!)}
numSet.sorted().forEach { print($0, terminator: " ") }

//10
//1 4 2 3 1 4 2 3 1 2

//1 2 3 4
