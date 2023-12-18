// BOJ_17608_막대기.swift
// N개의 막대기에 대한 높이 정보가 주어질 때, 오른쪽에서 보아서 몇 개가 보이는지를 알아내는 프로그램을 작성하려고 한다.

let N = Int(readLine()!)!
var bar: [Int] = []

for _ in 0..<N {
    bar.append(Int(readLine()!)!)
}

var max = 0
var count = 0

for _ in 0..<N {
    // max 값보다 큰 막대기가 있을때마다 count += 1
    if bar.last! > max {
        max = bar.last!
        count += 1
    }
    bar.removeLast()
}

print(count)

//6
//6
//9
//7
//6
//4
//6
//
//3