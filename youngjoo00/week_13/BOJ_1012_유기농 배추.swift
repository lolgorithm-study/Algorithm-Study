// BOJ_1012_유기농 배추.swift
// 각 테스트 케이스에 대해 필요한 최소의 배추흰지렁이 마리 수를 출력한다.

let T = Int(readLine()!)!
var dx = [0, 0, -1, 1]
var dy = [-1, 1, 0, 0]
var visited: [[Bool]] = []

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (M, N, K) = (input[0], input[1], input[2])
    
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    for _ in 0..<K {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let col = input[0]
        let row = input[1]
        graph[row][col] = 1
    }
    
    var count = 0
    visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    // 배추 영역 찾기
    for row in 0..<N {
        for col in 0..<M {
            // 배추가 존재하면서 방문하지 않았었다면, 해당 영역 서치
            if graph[row][col] == 1 && !visited[row][col] {
                visited[row][col] = true
                DFS(graph, x: row, y: col)
                count += 1
            }
        }
    }
    
    print(count)
}

func BFS(_ graph: [[Int]], x: Int, y: Int) {

    // 큐에 좌표를 담아놓고
    var queue: [(Int, Int)] = []
    queue.append((x, y))

    // 인접한 배추가 없을때까지 반복
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let x = node.0
        let y = node.1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            // 4개의 방향이 넘는지 체크
            if (nx < 0 || nx >= graph.count || ny < 0 || ny >= graph[0].count) {
                continue
            }

            // 인접한 값 확인
            if graph[nx][ny] == 1 && !visited[nx][ny] {
                // 인접한 위치에 배추가 있는데 방문을 안했다면 큐에 추가하고, 방문처리
                queue.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }

}

// BFS 와 굉장히 유사한 흐름. 배추의 영역을 찾았다면 서치하는 방법을 재귀로 함
func DFS(_ graph: [[Int]], x: Int, y: Int) {
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if (nx < 0 || nx >= graph.count || ny < 0 || ny >= graph[0].count) {
            continue
        }
        
        // 재귀를 통해 서치
        if graph[nx][ny] == 1 && !visited[nx][ny] {
            visited[nx][ny] = true
            DFS(graph, x: nx, y: ny)
        }
    }
}