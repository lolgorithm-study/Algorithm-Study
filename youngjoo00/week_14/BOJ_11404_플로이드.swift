// BOJ_11404_플로이드.swift

let city = Int(readLine()!)!
let bus = Int(readLine()!)!
let INF = Int.max
var graph: [[Int]] = Array(repeating: Array(repeating: INF, count: city + 1), count: city + 1)

// 본인은 가중치 0
for i in 1...city {
    graph[i][i] = 0
}

for _ in 0..<bus {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    // 시작 도시와 도착 도시를 연결하는 노선이 1개가 아닐 수 있기 때문에, 비용이 가장 작은 비용으로 저장해야 함
    graph[input[0]][input[1]] = min(graph[input[0]][input[1]], input[2])
}

floydWarshall(graph: &graph)

func floydWarshall(graph: inout [[Int]]) {
    // 모든 정점 쌍에 대해 1...n 까지 순회
    let n = city + 1

    for k in 1..<n { // 첫 번째 반복문은 거쳐가는 노드를 선택하는 k를 반복한다.
        for i in 1..<n { // 두 번째 반복문은 출발 노드를 선택하는 i를 순회한다.
            for j in 1..<n { // 세 번째 반복문은 도착 노드를 선택하는 j를 순회한다.
                // 실제 경로가 존재하지 않으면 해당 덧셈 연산을 수행하지 않고 오버플로우를 방지
                if graph[i][k] < Int.max && graph[k][j] < Int.max {
                    // 더 짧은 경로를 찾으면 업데이트
                    graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                }
            }
        }
    }
}

for y in 1...city {
    for x in 1...city {
        print(graph[y][x] == INF ? 0 : graph[y][x], terminator: " ")
    }
    print()
}