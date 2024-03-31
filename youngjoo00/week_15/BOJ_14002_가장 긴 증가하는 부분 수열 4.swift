// BOJ_14002_가장 긴 증가하는 부분 수열 4.swift

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        // 실제 값이 어떤 것이 더 큰지 비교
        if array[i] > array[j] {
            // dp 배열에 있는 값중 현재 순회하는 dp[i] 와 직전의 담아둔 값 + 1 중에 어떤 것이 더 큰지 비교
            if dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
            }
        }
    }
}

var LIS: [Int] = []
var length = dp.max()!
print(length)

// 역순으로 순회
for i in (0..<n).reversed() {
    // 연속적으로 이루어진 수열이기에 큰 값부터 확인해서 역순으로 넣음
    if dp[i] == length {
        LIS.append(array[i])
        length -= 1
    }
}

// 내림차순 되어있는 값을 오름차순으로 변경해서 출력
print(LIS.reversed().map { String($0) }.joined(separator: " "))