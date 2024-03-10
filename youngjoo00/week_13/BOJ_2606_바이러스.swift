// BOJ_2606_바이러스.swift
//1번 컴퓨터가 웜 바이러스에 걸렸을 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 첫째 줄에 출력한다.

let N = Int(readLine()!)!
let M = Int(readLine()!)!

// 각 컴퓨터가 연결되어있는 상태 배열
var graph: [[Int]] = Array(Array(repeating: [], count: N+1))

// 각 컴퓨터를 방문했는지 확인하는 배열
var visit = Array(repeating: false, count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let a = input[0]
    let b = input[1]
    
    graph[a].append(b)
    graph[b].append(a)
}

// DFS
func DFS(_ node: Int) -> Int {
    visit[node] = true
    var count = 1 // 하나 방문했으니 1부터 시작

    // 이미 반복문만으로 재귀가 끝나는 조건이 만들어짐
    // N번째 노드 전체를 서치
    for i in graph[node] {
        // 방문을 안했다면, 방문처리를 해야지
        if !visit[i] {
            count += DFS(i)
        }
    }
    
    return count
}

print(DFS(1) - 1)

// BFS
func BFS(_ node: Int) -> Int {
    var queue = [node]
    visit[node] = true // 맨 처음에 들어온 노드도 방문처리 해줍시다.
    var count = 0 // 1번 컴퓨터를 제외하고 숫자세기
    
    // 큐에 값이 없을때까지 반복
    while !queue.isEmpty {
        let node = queue.removeFirst() // 큐에서 노드를 하나 꺼냅니다.
        
        for i in graph[node] { // 현재 노드와 연결된 모든 노드에 대해
            if !visit[i] { // 만약 아직 방문하지 않은 노드라면
                visit[i] = true // 그 노드를 방문했다는 것을 표시하고
                count += 1
                queue.append(i) // 그 노드를 큐에 삽입
            }
        }
    }

    return count
}

print(BFS(1))