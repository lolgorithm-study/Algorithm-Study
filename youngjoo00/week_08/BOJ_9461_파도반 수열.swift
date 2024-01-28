// BOJ_9461_파도반 수열.swift
//1 -> 1
//2 -> 1
//3 -> 1
//4 -> 2
//5 -> 2
//6 -> 3
//7 -> 4
//8 -> 5
//9 -> 7
//10 -> 9
//
//
//P 1, 2, 3 까지 k=1
//P 4, 5 까지 k=2
//
//
//P(6) = P(N-3)+P(N-2)
//P(7) = P(N-3)+P(N-2)

// 총 배열의 개수를 지정
var memo = Array(repeating: 0, count: 101)
// 기저상태를 확인하고 배열에 넣어줌
memo[1...5] = [1, 1, 1, 2, 2]

func DP(n:Int) -> Int {

    // 메모이제이션이 되어있는 상태라면 그대로 내보내고, 안됐으면 점화식대로 함수 호출
    if memo[n] != 0 {
        return memo[n]
    } else {
        memo[n] = DP(n: n-2) + DP(n: n-3)
    }
    
    return memo[n]
}

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let n = Int(readLine()!)!
    var result = 0
    
    result = DP(n: n)

    
    print(result)
}