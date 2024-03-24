// BOJ_2178_미로 탐색.swift

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var dx = [0, 0, -1, 1]
var dy = [-1, 1, 0, 0]

var visitCount: [[Int]] = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)


for i in 1...N {
    let input = Array(readLine()!).map { Int(String($0))! }
    for j in 1...M {
        graph[i][j] = input[j-1]
    }
}

var queue: [(Int, Int)] = []
visitCount[1][1] = 1

func BFS(_ x: Int, _ y: Int) -> Int {
    queue.append((x, y))
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let x = node.0
        let y = node.1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            // 4개의 방향을 확인할때 1,1 부터 시작했기 때문에 [1...N][1...M] 의 영역만 체크해야함
            if nx <= 0 || nx > N || ny <= 0 || ny > M {
                continue
            }
            
            // BFS 특성에 맞도록 N,M 까지의 최단거리 노드를 확인하기 위해서는
            // 서치하는 노드가 1인지, 방문기록이 없었는지 확인하는 조건이 필요했다.
            if graph[nx][ny] == 1 && visitCount[nx][ny] == 0 {
                queue.append((nx, ny))
                // 조건이 맞았다면, 서치하는 노드쪽에 현재 위치가 갖고있는 방문횟수 + 1 해서 방문횟수를 끝까지 구해간다.
                visitCount[nx][ny] = visitCount[x][y] + 1
            }
        }
    }
    
    // 어짜피 최단거리로 노드를 서치하기 때문에 큐가 없을때 마지막을 리턴하면 끝
    return visitCount[N][M]
}

// 1,1 부터 시작하는 미로
print(BFS(1, 1))