// BOJ_29715_비밀번호 찾기.swift
// 브실이가 집에 들어가는데 걸리는 최대 시간을 초 단위로 출력

import Foundation

let inputNM = readLine()!.split(separator: " ").map { Int($0)! }
var (N, M) = (inputNM[0], inputNM[1])

let inputXY = readLine()!.split(separator: " ").map { Int($0)! }
let (X, Y) = (inputXY[0], inputXY[1])

var pwCnt = 0
var cnt = 0
var result = 1

for _ in 0..<M {
    let inputAB = readLine()!.split(separator: " ").map { Int($0)! }
    let A = inputAB[0]
    
    if A != 0 {
        pwCnt += 1
    } else {
        cnt += 1
    }
}

N = N - pwCnt

// cnt가 0보다 크다면, N에서 cnt를 선택하는 조합의 개수를 계산하고, cnt의 팩토리얼 값과 곱한다.
// 조합(N개 중 cnt개를 선택하는 방법의 수) * 선택된 cnt개를 줄 세우는 방법의 수
if cnt > 0 {
    result *= combinations(N, cnt) * factorial(cnt)
    N -= cnt
}


// N이 0보다 크다면, 남은 개수 중에서 N개를 선택하는 순열의 개수를 계산한다.
// 여기서 남은 개수는 9에서 이미 사용한 개수(pwCnt와 cnt)를 뺀 것
// 모든 경우의 수에 관한 결과를 result 변수에 넣음
if N > 0 {
    result *= permutations(9 - (pwCnt + cnt), N)
}

// 한 번의 경우마다 X 를 곱하고,
// 마지막 경우는 성공할테니, 그 경우를 제외하고 3으로 나눈 값을 Y랑 곱한다.
let time = result * X + ((result - 1) / 3) * Y
print(time)

// 팩토리얼
func factorial(_ n: Int) -> Int {
    return n < 2 ? 1 : (2...n).reduce(1, *)
}

// 조합
func combinations(_ n: Int, _ r: Int) -> Int {
    return n >= r ? factorial(n) / (factorial(r) * factorial(n - r)) : 0
}

// 순열
func permutations(_ n: Int, _ r: Int) -> Int {
    return n >= r ? factorial(n) / factorial(n - r) : 0
}

// 이 분의 풀이방법을 보며 해결했습니다.
// https://velog.io/@justice/백준-29715-비밀번호-찾기 