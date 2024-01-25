// BOJ_24416_알고리즘 수업 - 피보나치 수 1.swift
// 재귀와 DP 의 효율성 비교하는 문제

import Foundation

// 재귀로 실행되는 횟수 구하기
func fibo1(n: Int, count: inout Int) -> Int {
    if n <= 2 {
        count += 1
        return 1
    } else {
        // 한 메모리에 동시에 읽기 쓰기 접근이 불가능해서, count1, count2 로 나눠서 각각 값을 저장함
        var count1 = 0
        var count2 = 0
        let result = fibo1(n: n - 1, count: &count1) + fibo1(n: n - 2, count: &count2)
        // inout 키워드를 이용하여 바깥의 count 에 접근해서 값을 넣어줄 수 있음
        count += (count1 + count2)
        return result
    }
}


// 다이나믹 프로그래밍으로 실행되는 횟수 구하기
func fibo2(n: Int, count: inout Int) -> Int {
    var fiboArr = [Int](repeating: 0, count: n+1)
    fiboArr[1] = 1
    fiboArr[2] = 1
    if n <= 2 {
        return fiboArr[n]
    } else {
        for i in 3...n {
            // 여기서는 메모리에 여러 함수가 접근하지 않기에 count 변수 하나만 다룸
            count += 1
            // 메모이제이션을 이용한 DP
            fiboArr[i] = fiboArr[i-1] + fiboArr[i-2]
        }
    }
    return count
}

let n = Int(readLine()!)!
var count1 = 0
var count2 = 0

fibo1(n: n, count: &count1)
fibo2(n: n, count: &count2)
print("\(count1) \(count2)")