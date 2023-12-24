// BOJ_2752_세수정렬.swift
//정수 세 개가 주어진다. 이 수는 1보다 크거나 같고, 1,000,000보다 작거나 같다. 이 수는 모두 다르다.
//제일 작은 수, 그 다음 수, 제일 큰 수를 차례대로 출력한다.

let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

print(input[0], input[1], input[2])

//3 1 2

//1 2 3