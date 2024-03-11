// BOJ_11444_피보나치 수 6.swift
//첫째 줄에 n번째 피보나치 수를 1,000,000,007으로 나눈 나머지를 출력한다.

// F(n) + F(n-1) = F(n+1) 인 이유
/*
 1. 기존 피보나치 방식 : 피보나치는 F(n) = F(n-1) + F(n-2)
 2. 조금만 생각을 바꿔본다면?
 여기서 F(n+1) = F(n) + F(n-1)
 n+1 번째 숫자는 바로 앞에 있는 두 숫자, 즉 n번째 숫자와 n-1 번째 숫자를 더한 값이된다.
 따라서 F(n+1) = F(n) + F(n-1)이라는 식이 성립한다.
 */

let n = Int(readLine()!)!
let MOD = 1_000_000_007

// 피보나치 수열의 행렬 표현을 저장하는 2x2 행렬
// 이 행렬을 거듭제곱하여 피보나치 수를 계산함
var fibo = [[1, 1], [1, 0]]

// 2x2 항등행렬을 저장하는 변수, A 가 자기 자신을 계속해서 거듭제곱 할 수 있게끔 해줌
var matrix = [[1, 0], [0, 1]]

func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
    // 계산 결과를 저장할 2x2 행렬을 초기화
    var c = [[0, 0], [0, 0]]
    
    for i in 0..<2 {
        for j in 0..<2 {
            for k in 0..<2 {
                c[i][j] = (c[i][j] + a[i][k] * b[k][j]) % MOD
            }
        }
    }
    
    return c
}

func power(_ fibo: [[Int]], _ n: Int) -> [[Int]] {
    // 베이스 조건일 때 항등행렬이 나오도록 함
    if n == 0 {
        return matrix
    } else if n % 2 == 0 {
        let half = power(fibo, n / 2)
        return multiply(half, half)
    } else {
        return multiply(fibo, power(fibo, n - 1))
    }
}

let result = power(fibo, n)
print(result[0][1])