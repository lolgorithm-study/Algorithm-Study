// BOJ_2346_풍선 터뜨리기.swift
// 1~N 까지의 풍선이 있으며, 종이에 적힌 숫자대로 움직이며 터트리자
// 첫째 줄에 터진 풍선의 번호를 차례로 나열한다.

let N = Int(readLine()!)!
let paper = readLine()!.split(separator: " ").map { Int($0)! }

var deq = Deque<Int>()
var result: [Int] = []

for i in 1...N {
    deq.enqueueBack(i)
}

// 우선 첫번째 풍선을 터트리고, 인덱스를 넘김
result.append(deq.peekFront()!)
var index = deq.dequeueFront()! - 1

// 풍선 하나를 이미 터트렸으니, 1..<N
for _ in 1..<N {
    // 터트린 풍선의 종이에 적힌 값이 양수일 경우
    if paper[index] > 0 {
        // front 에 있는 값을 back으로 옮김 (터트린 풍선은 제외하니 1부터 반복)
        for _ in 1..<paper[index] {
            let deqData = deq.dequeueFront()
            deq.enqueueBack(deqData!)
        }
        // 옮기고 난 뒤 앞에 있는 값이 표적이 됨
        result.append(deq.peekFront()!)
        index = deq.dequeueFront()! - 1
    } else {
        // 터트린 풍선의 종이에 적힌 값이 음수일 경우
        // back에 있는 값을 front로 옮김 (터트린 풍선을 제외하고 절대값만큼 1부터 반복)
        for _ in 1..<abs(paper[index]) {
            let deqData = deq.dequeueBack()
            deq.enqueueFront(element: deqData!)
        }
        // 옮기고 난 뒤 뒤에 있는 값이 표적이 됨
        result.append(deq.peekBack()!)
        index = deq.dequeueBack()! - 1
    }
}

result.forEach { print($0, terminator: " ")}

//5
//3 2 1 -3 -1
//
//1 4 5 3 2
// 덱 구현
public struct Deque<T> {
    private var array: [T?]
    private var head: Int
    private var capacity: Int
    private let originalCapacity:Int
    
    // 기본적으로 10개의 공간에 nil 을 갖는 배열 생성
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        originalCapacity = self.capacity
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var elements: [T?] {
        return array
    }
    
    public var headValue: Int {
        return head
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueueBack(_ element: T) {
        array.append(element)
    }
    
    // head가 0일 경우, capacity를 늘려서 배열의 앞부분에 빈 공간을 더 넣어줌
    public mutating func enqueueFront(element: T) {
        if head == 0 {
          capacity *= 2
          let emptySpace = [T?](repeating: nil, count: capacity)
          array.insert(contentsOf: emptySpace, at: 0)
          head = capacity
        }

        head -= 1
        array[head] = element
      }
    
    public mutating func dequeueFront() -> T? {
        guard head < array.count, let element = array[head] else { return nil }

        array[head] = nil
        head += 1

        // 잦은 dequeFront 로 배열의 앞부분이 과하게 커지는 경우 배열의 앞부분을 잘라내고 25% 정도 남김
        if capacity >= originalCapacity && head >= capacity*2 {
          let amountToRemove = capacity + capacity/2
          array.removeFirst(amountToRemove)
          head -= amountToRemove
          capacity /= 2
        }
        return element
      }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peekBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
}
