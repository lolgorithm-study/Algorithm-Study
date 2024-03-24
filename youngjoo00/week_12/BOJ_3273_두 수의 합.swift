// BOJ_3273_두 수의 합.swift

let n = Int(readLine()!)!
let list = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let x = Int(readLine()!)!

// 1<i<j<n 의 수를 정확하게 서치하기 위해 오름차순 정렬 진행
// 두 수의 덧셈과 비교하기위해서 처음과 끝을 기준으로 좁혀가면서 서치해야함
var start = 0
var end = list.count - 1
var count = 0

// 더한 값이 작으면 start ++
// 더한 값이 크면 end ++
while start < end { // start 가 end 보다 작을때만 서치
    let sum = list[start] + list[end]
    if sum == x {
        start += 1
        count += 1
    } else if sum > x {
        end -= 1
    } else {
        start += 1
    }
}

print(count)