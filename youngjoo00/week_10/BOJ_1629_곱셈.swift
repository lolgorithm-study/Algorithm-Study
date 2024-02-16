// BOJ_1629_곱셈.swift
// 첫째 줄에 A를 B번 곱한 수를 C로 나눈 나머지를 출력한다.

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (A, B, C) = (input[0], input[1], input[2])

func multiple(_ A: Int, _ B: Int) -> Int {
    // 베이스 조건
    if B == 1 {
        return A
    } else {
        // 베이스 조건이 되게끔 재귀 구성
        var temp = multiple(A, B / 2)
        
        // 가장 작게 나눈 문제
        temp = temp * temp % C
        
        // 작게 나눈 문제를 구한 값을 최종적으로 어떻게 합쳐줄지 구성
        if B % 2 == 0 {
            return temp
        } else {
            return temp * A % C
        }
    }
}

print(multiple(A, B) % C)