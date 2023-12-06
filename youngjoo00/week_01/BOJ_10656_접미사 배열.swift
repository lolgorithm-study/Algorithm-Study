// BOJ_10656_접미사 배열.swift
//첫째 줄부터 S의 접미사를 사전순으로 한 줄에 하나씩 출력한다

var S = readLine()!.map { String($0) }
var arr : [String] = []

for _ in 0..<S.count {
    arr.append(S.joined())
    S.removeFirst()
}

arr.sorted().forEach { print($0) }

//baekjoon

//aekjoon
//baekjoon
//ekjoon
//joon
//kjoon
//n
//on
//oon