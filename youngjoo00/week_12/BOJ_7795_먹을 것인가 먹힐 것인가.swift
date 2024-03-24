// BOJ_7795_먹을 것인가 먹힐 것인가.swift
// 첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스의 첫째 줄에는 A의 수 N과 B의 수 M이 주어진다.
// 둘째 줄에는 A의 크기가 모두 주어지며, 셋째 줄에는 B의 크기가 모두 주어진다. 크기는 양의 정수이다. (1 ≤ N, M ≤ 20,000)

let T = Int(readLine()!)!

for _ in 0..<T {
    let _ = readLine()!.split(separator: " ").map { Int($0)! }
    
    // 순차적으로 크기 비교하고 카운트를 올리기 위해 두 배열 오름차순 정렬
    let listA = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let listB = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var aStart = 0
    var bStart = 0
    var count = 0
    
    // AStart와 BStart 인덱스가 count 보다 작아지지 않을 때 종료
    while aStart < listA.count && bStart < listB.count {
        if listA[aStart] > listB[bStart] {
            // listA 의 요소가 더 크다면,
            // A 뒤에 있는 모든 값이 현재 요소보다 더 크기 때문에 -> 전체 개수 - 현재 인덱스로 count 를 올려줌
            count = count + (listA.count - aStart)
            bStart += 1 // bStart 도 잊지말고 올려줍시다.
        } else {
            aStart += 1 // listA 의 요소가 더 작다면, 더 커지게끔 aStart 를 올려줌
        }
    }
    print(count)
}