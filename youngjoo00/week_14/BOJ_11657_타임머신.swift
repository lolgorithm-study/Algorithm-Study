// BOJ_11657_타임머신.swift

// 간선을 나타내는 구조체
struct Edge {
    let from: Int
    let to: Int
    let cost: Int
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (city, bus) = (input[0], input[1])

var edges: [Edge] = []
for _ in 0..<bus {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append(Edge(from: input[0], to: input[1], cost: input[2]))
}

func bellmanFord(edges: [Edge], vertexCount: Int, startVertex: Int) -> [Int]? {
    // 모든 정점까지의 최단 거리를 저장할 배열 생성
    var distance = [Int](repeating: Int.max, count: vertexCount)
    // 시작 정점 본인
    distance[startVertex] = 0

    for _ in 0..<vertexCount {
        for edge in edges {
            // 이 간선을 통해 도달하는 정점까지의 거리가 더 짧은 경우, 거리를 업데이트
            if distance[edge.from] != Int.max && distance[edge.from] + edge.cost < distance[edge.to] {
                distance[edge.to] = distance[edge.from] + edge.cost
            }
        }
    }

    // 음수 가중치 순환 감지
    for edge in edges {
        if distance[edge.from] != Int.max && distance[edge.from] + edge.cost < distance[edge.to] {
            return nil
        }
    }

    return distance
}

// 1번 도시를 기준으로 벨만포드 진행
if let distances = bellmanFord(edges: edges, vertexCount: city + 1, startVertex: 1) {
    // 2번 도시 부터 최단시간을 확인하기에 2 부터 반복
    for i in 2...city {
        if distances[i] == Int.max {
            print("-1")
        } else {
            print("\(distances[i])")
        }
    }
} else {
    print("-1")
}