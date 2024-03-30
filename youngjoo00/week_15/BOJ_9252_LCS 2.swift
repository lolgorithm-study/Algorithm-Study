// BOJ_9252_LCS 2.swift

let input1 = readLine()!.map { $0 }
let input2 = readLine()!.map { $0 }

var dp = Array(repeating: Array(repeating: 0, count: input2.count + 1), count: input1.count + 1)

// input1과 input2의 각 문자를 순회하며 dp 테이블 업데이트
// 두 문자가 같다면 이전단계 까지의 최장 공통 수열이 가진 값 + 1 을 진행
for i in 1...input1.count {
    for j in 1...input2.count {
        // 현재 문자가 같은 경우, 왼쪽 위 대각선 값에 1을 더해 현재 위치에 저장
        if input1[i-1] == input2[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            // 현재 문자가 다른 경우, 왼쪽 값과 위쪽 값 중 더 큰 값을 현재 위치에 저장
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

// dp 테이블의 마지막 요소 출력: input1과 input2의 최장 공통 부분 수열(LCS)의 길이
print(dp[input1.count][input2.count])

// LCS를 추출하기 위한 결과 배열
var result: [Character] = []

// dp 테이블의 오른쪽 아래에서 시작
var i = input1.count
var j = input2.count

// 역추적 시작
while i > 0 && j > 0 {
    // 위쪽으로 이동: 현재 위치의 값이 위쪽 값과 같은 경우
    if dp[i][j] == dp[i-1][j] {
        i -= 1
    } else if dp[i][j] == dp[i][j-1] { // 왼쪽으로 이동: 현재 위치의 값이 왼쪽 값과 같은 경우
        j -= 1
    } else {
        // 대각선으로 이동: 현재 위치의 값이 왼쪽 위 대각선 값 + 1인 경우.
        // 해당 문자가 LCS에 포함되므로 결과 배열에 추가
        result.append(input1[i-1])
        i -= 1
        j -= 1
    }
}

// 결과 배열을 뒤집어서 올바른 순서로 만듬
let reversedResult = result.reversed()

// 결과 배열이 비어있지 않다면, 결과 배열의 각 문자를 출력함
if !reversedResult.isEmpty {
    reversedResult.forEach { print($0, terminator: "") }
}