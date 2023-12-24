// BOJ_1021_회전하는 큐.swift
// 1. pop은 첫번째 원소만 뽑을 수 있다.
// 2. 왼쪽으로 한 칸 밀기
// 3. 오른쪽으로 한 칸 밀기
// 첫째 줄에 큐의 크기 N과 뽑아내려고 하는 수의 개수 M이 주어진다. N은 50보다 작거나 같은 자연수이고, M은 N보다 작거나 같은 자연수이다.
// 둘째 줄에는 지민이가 뽑아내려고 하는 수의 위치가 순서대로 주어진다. 위치는 1보다 크거나 같고, N보다 작거나 같은 자연수이다.

import Foundation

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

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
let searchNumber = readLine()!.split(separator: " ").map { Int($0)! }

var deq = Deque<Int>()
var result = 0

for i in 1...N {
    deq.enqueueBack(i)
}

for i in 0..<M {
    // 찾을 번호의 인덱스와 배열을 2로 나눈 값을 비교
    let numberIndex = deq.elements.firstIndex(of: searchNumber[i])! - deq.headValue
    let halfArray = Int(ceil(Double(deq.count)/Double(2)))
    if numberIndex >= halfArray {
        // 번호의 인덱스가 큰 경우, 우측으로 밀면서 숫자를 빼냄
        let repeatCount = deq.count - numberIndex
        for _ in 0..<repeatCount {
            let backNumber = deq.dequeueBack()
            deq.enqueueFront(element: backNumber!)
        }
        result += repeatCount
        deq.dequeueFront()
    } else {
        // 번호의 인덱스가 작은 경우, 좌측으로 밀면서 숫자를 빼냄
        let repeatCount = numberIndex
        for _ in 0..<repeatCount {
            let frontNumber = deq.dequeueFront()
            deq.enqueueBack(frontNumber!)
        }
        result += repeatCount
        deq.dequeueFront()
    }
}

print(result)

//10 10
//1 6 3 2 7 9 8 4 10 5
//
//14