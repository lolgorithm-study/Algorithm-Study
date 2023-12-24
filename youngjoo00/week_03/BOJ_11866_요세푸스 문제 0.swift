// BOJ_11866_요세푸스 문제 0.swift
// N과 K가 주어지면 (N, K)-요세푸스 순열을 구하는 프로그램을 작성하시오.

public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) -> T? {
        array.append(element)
        return element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        // 일정 비율이 넘어가면 배열의 크기를 줄이고 헤드까지 날림
        if array.count > 50 && percentage > 0.25 {
            // removeFirst(_:)는 배열의 앞에서부터 지정된 개수만큼의 요소를 제거하는 메서드
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], K = input[1]

var queue = Queue<Int>()
var result: [Int] = []

for i in 1...N {
    queue.enqueue(i)
}

// 큐가 비어있으면 멈춤
while !queue.isEmpty {
    // 1부터 K까지 반복
    for i in 1...K {
        if i < K {
            // K 번째가 아닐경우 빼낸걸 다시 넣어줌
            let returnQueue = queue.dequeue()
            queue.enqueue(returnQueue!)
        } else {
            // K 번째일 경우 그냥 빼버림
            result.append(queue.dequeue()!)
        }
    }
}

// 출력형식에 맞게 출력
print("<\(result.map { String($0) }.joined(separator: ", "))>")

//7 3
//<3, 6, 2, 7, 5, 1, 4>