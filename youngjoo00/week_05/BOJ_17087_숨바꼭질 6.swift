// BOJ_17087_숨바꼭질 6.swift
// 모든 동생을 찾기위해 D의 값을 정하려고 한다. 가능한 D의 최댓값을 구해보자.

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], S = input[1]
let A = readLine()!.split(separator: " ").map { abs(Int($0)! - S) }

// 유클리드 호제법을 이용한 최대공약수 구하기
func gcd(_ first: Int, _ second: Int) -> Int {
    var first = first
    var second = second
    
    while first != 0 && second != 0 {
        let temp = second
        second = first % second
        first = temp
    }
    
    return first
}

// 동생이 한 명만 있을 경우를 위해 우선적으로 0번째의 값을 넣음
var result = A[0]

for i in 1..<A.count {
    // 최대공약수를 구하는 함수에 a>b 조건에 맞게 호출한다.
    if result > A[i] {
        result = gcd(result, A[i])
    } else {
        result = gcd(A[i], result)
    }
}

print(result)