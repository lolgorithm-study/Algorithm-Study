// BOJ_9184_신나는 함수 실행.swift
// 점화식이 주어졌을때 DP 를 이용하여 해결해보기

// 모든 범위가 주어졌으니, 탑다운으로 해결
// 여러번 반복해서 input 을 넣기 때문에 메모이제이션을 통해 시간복잡도를 크게 아낄 수 있음

// 최대 20, 20, 20 의 조합까지만 계산하니 0~20 까지 21개의 공간이 있는 메모이제이션 배열 생성
var memo = Array(repeating: Array(repeating: Array(repeating: 0, count: 21), count: 21), count: 21)

func DP(a: Int, b: Int, c: Int) -> Int {
    
    // 제시해준 조건들
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    }
    
    // 제시해준 조건들
    if a > 20 || b > 20 || c > 20 {
        return DP(a: 20, b: 20, c: 20)
    }
    
    // 입력된 a,b,c 조합이 이미 메모가 되어있는 값이라면 메모이제이션 배열에 있는 값을 리턴
    if memo[a][b][c] != 0 {
        return memo[a][b][c]
    }
    
    // 제시해준 조건들
    if a < b && b < c {
        memo[a][b][c] = DP(a: a, b: b, c: c-1) + DP(a: a, b: b-1, c: c-1) - DP(a: a, b: b-1, c: c)
    } else {
        memo[a][b][c] = DP(a: a-1, b: b, c: c) + DP(a: a-1, b: b-1, c: c) + DP(a: a-1, b: b, c: c-1) - DP(a: a-1, b: b-1, c: c-1)
    }
    
    return memo[a][b][c]
}

// -1 -1 -1 이 입력될 경우 종료
while let input = readLine()?.split(separator: " ").map({ Int($0)! }), input != [-1, -1, -1] {
    let (a, b, c) = (input[0], input[1], input[2])
    
    print("w(\(a), \(b), \(c)) = \(DP(a: a, b: b, c: c))")
}