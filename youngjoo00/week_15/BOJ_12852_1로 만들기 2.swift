// BOJ_12852_1로 만들기 2.swift

var n = Int(readLine()!)!

if n == 1 {
    print(0)
    print(1)
} else {
    // dp[i] 는 n 을 1로 만드는데 필요한 계산 횟수를 담아둠
    var dp: [Int] = Array(repeating: Int.max, count: n + 1)
    var path: [Int] = Array(repeating: 0, count: n + 1)
    
    dp[1] = 0
    
    for i in 2...n {
        // i 를 1로 만들기 위해 필요한 최소 계산 횟수
        dp[i] = dp[i-1] + 1
        
        // 현재 계산하고 있는 인덱스를 기억하는 배열
        path[i] = i - 1
        
        // 현재 인덱스의 횟수 vs. 인덱스를 2로 나누고 + 1(나누는 데 사용한 횟수)
        // 이 둘을 비교해서 적은 횟수를 dp[i] 에 담음
        if i % 2 == 0 && dp[i] > dp[i/2] + 1 {
            dp[i] = dp[i/2] + 1
            path[i] = i / 2
        }

        // 현재 인덱스의 횟수 vs. 인덱스를 3로 나누고 + 1(나누는 데 사용한 횟수)
        // 이 둘을 비교해서 적은 횟수를 dp[i] 에 담음
        if i % 3 == 0 && dp[i] > dp[i/3] + 1 {
            dp[i] = dp[i/3] + 1
            path[i] = i / 3
        }
    }

    print(dp[n])

    var list: [Int] = []

    // 인덱스를 갖고 역추적하기
    var current = n

    while current != 0 {
        list.append(current)
        current = path[current]
    }

    list.forEach { print($0, terminator: " ") }
}
