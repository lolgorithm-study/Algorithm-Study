// BOJ_10819_차이를 최대로.swift

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

var visited = [Bool](repeating: false, count: N)
var arr: [Int] = []
var result = 0

func backTraking(arr: [Int]) {
    // 재귀가 끝나는 조건
    if arr.count == N {
        // arr 배열내부에 abs(i - i+1...) 로 바꿔줘야함
        result = max(result, absSum(arr))
        return
    }

    // N과 M (1) 처럼 주어진 모든 수를 순차적으로 조건이 만족할때까지 배열에 넣어주면 된다.
    for i in 0..<N {
        // 방문하지 않았다면,
        if !visited[i] {
            visited[i] = true
            backTraking(arr: arr + [A[i]])
            visited[i] = false
        }
    }
}

// 절대값 합을 구하는 함수
func absSum(_ arr: [Int]) -> Int {
    var sum = 0
    for i in 0..<arr.count-1 {
        sum += abs(arr[i] - arr[i+1])
    }
    return sum
}

backTraking(arr: [])

print(result)