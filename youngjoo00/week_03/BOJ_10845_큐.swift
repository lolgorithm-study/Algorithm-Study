// BOJ_10845_큐.swift
//정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.
//push X: 정수 X를 큐에 넣는 연산이다.
//pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
//size: 큐에 들어있는 정수의 개수를 출력한다.
//empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
//front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
//back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.

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

    public var back: T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
}

let N = Int(readLine()!)!
var queue = Queue<Int>()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    switch input[0] {
    case "push":
        queue.enqueue(Int(input[1])!)
        break
    case "pop":
        print(queue.dequeue() ?? -1)
        break
    case "size":
        print(queue.count)
        break
    case "empty":
        print(queue.isEmpty ? 1 : 0)
        break
    case "front":
        print(queue.front ?? -1)
        break
    case "back":
        print(queue.back ?? -1)
        break
    default: break
    }
}

//15
//push 1
//push 2
//front
//back
//size
//empty
//pop
//pop
//pop
//size
//empty
//pop
//push 3
//empty
//front
//
//1
//2
//2
//0
//1
//2
//-1
//0
//1
//-1
//0
//3