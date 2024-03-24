// BOJ_1753_최단경로.swift

// Comparable 프로토콜 채택으로 우선순위 큐에서 구조체의 cost 값을 비교할 수 있게 함
struct EdgeData: Comparable {
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        return lhs.cost < rhs.cost
    }
    let node: Int
    let cost: Int
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let V = input[0], E = input[1]
let K = Int(readLine()!)!
let INF = Int.max
var graph = [[EdgeData]](repeating: [], count: V + 1)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]].append(EdgeData(node: input[1], cost: input[2]))
}

// 가중치 값을 담아둘 배열
var distance = [Int](repeating: INF, count: V + 1)

// 해당 문제는 VE 로는 시간초과가 났음
// 우선순위 큐를 이용하여 VlogE 로 진행
func dijkstra(start: Int) {
    var minHeap = Heap<EdgeData>(comparer: <)
    // 처음 들어온 자기 자신의 가중치 값은 0
    distance[start] = 0
    minHeap.insert(element: EdgeData(node: start, cost: 0))
    
    while !minHeap.isEmpty {
        let now = minHeap.pop()!
        
        // 이미 더 짧은 경로가 존재함을 의미하며, 현재 노드(now)를 통해 인접한 노드들로의 거리를 갱신하는 것은 불필요
        if distance[now.node] < now.cost {
            continue
        }
        
        // 현재 노드와 연결된 노드 확인
        for next in graph[now.node] {
            // 현재노드가 다음 노드로 가는 비용
            let cost = now.cost + next.cost
            
            // 현재 노드를 거쳐서 다음 노드로 가는 비용이 더 적다면 비용 갱신 및 힙에 삽입
            if cost < distance[next.node] {
                distance[next.node] = cost
                minHeap.insert(element: EdgeData(node: next.node, cost: cost))
            }
        }
    }
}

dijkstra(start: K)

distance[1...].forEach { print($0 == INF ? "INF" : $0) }

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.count <= 1
    }
    
    var top: T? {
        return isEmpty ? nil : elements[1]
    }
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    
    mutating private func swimUp(index: Int) {
        var index = index
        while index > 1 && comparer(elements[index], elements[index / 2]) {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
    
    mutating func pop() -> T? {
        if elements.count < 2 { return nil }
        elements.swapAt(1, elements.count - 1)
        let deletedElement = elements.removeLast()
        diveDown(index: 1)
        return deletedElement
    }
    
    mutating private func diveDown(index: Int) {
        var swapIndex = index
        var isSwap = false
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1

        if leftIndex < elements.endIndex && comparer(elements[leftIndex], elements[swapIndex]) {
            swapIndex = leftIndex
            isSwap = true
        }
        
        if rightIndex < elements.endIndex && comparer(elements[rightIndex], elements[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }

        if isSwap {
            elements.swapAt(swapIndex, index)
            diveDown(index: swapIndex)
        }
    }
}