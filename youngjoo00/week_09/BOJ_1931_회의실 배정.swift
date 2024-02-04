// BOJ_1931_회의실 배정.swift

struct meeting {
    let start: Int
    let end: Int
}

let N = Int(readLine()!)!
var list: [meeting] = []
var count = 0
var recentMettingEndTime = 0
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let data: meeting = meeting(start: input[0], end: input[1])
    list.append(data)
}

// 일단 빨리 시작하고 빨리 끝나는게 좋으니 그걸 기준으로 정렬
// 회의가 끝나는 시간이 다른지 확인
// 다르다면, 빨리 끝나는 순서대로 오름차순 정렬
// 같다면, 회의가 빨리 시작하는 순서대로 오름차순 정렬
list.sort { $0.end != $1.end ? $0.end < $1.end : $0.start < $1.start }

for i in 0..<list.count {
    // 최근에 끝난 회의시간이 list[i] 의 시작시간보다 작거나 같은지 확인 (이 과정중에 겹치는 회의시간을 걸러낼 수 있음)
    if recentMettingEndTime <= list[i].start {
        // 최근에 끝난 회의시간을 이번 요소의 끝난시간으로 넣어주고, count += 1
        recentMettingEndTime = list[i].end
        count += 1
    }
}

print(count)