// BOJ_1931_동전 0.swift

let input = readLine()!.split(separator: " ").map { Int($0)! }
var coin: [Int] = []
var K = input[1]
var count = 0
for _ in 0..<input[0] {
    coin.append(Int(readLine()!)!)
}

// 코인을 내림차순으로 정렬해서 가장 큰 값부터 나눌수있도록 함
coin = coin.sorted(by: >)

for i in 0..<coin.count {
    // 현재 코인의 요소보다 K가 작다면, 동전갯수 세기
    if coin[i] <= K {
        count += K / coin[i]
        K = K % coin[i]
    }
}

print(count)