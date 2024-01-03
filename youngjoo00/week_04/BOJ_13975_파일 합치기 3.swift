// BOJ_13975_파일 합치기 3.swift
// 모든 장을 합치는데 필요한 최소비용을 출력한다.

let T = Int(readLine()!)!
for _ in 0..<T {
    var minPQ = PriorityQueue<Int>(sort: <)
    var result = 0
    let K = Int(readLine()!)!
    let chapter = readLine()!.split(separator: " ").map { Int($0)! }
    
    for i in chapter {
        minPQ.enqueue(element: i)
    }
    
    // 힙에 하나가 남을때까지 반복
    while minPQ.heap.nodes.count != 1 {
        // 최소값 두개를 빼서 더해준다.
        let firstMin = minPQ.dequeue()!
        let secondMin = minPQ.dequeue()!
        
        let sum = firstMin + secondMin
        minPQ.enqueue(element: sum)
        result += sum
    }
    
    print(result)
}

// 힙 구현
public struct Heap<T> {

  /** 힙 노드를 저장하는 배열입니다. */
  var nodes = [T]()

  /**
   * 힙 내에서 두 노드를 비교하는 방법을 결정합니다.
   * '>'는 최대 힙, '<'는 최소 힙을 만들 때 사용하거나,
   * 튜플과 같은 사용자 지정 요소로 구성된 힙인 경우 비교 방법을 제공할 수 있습니다.
   */
  private var orderCriteria: (T, T) -> Bool

  /**
   * 빈 힙을 생성합니다.
   * 정렬 함수는 이 힘이 최소 힙 또는 최대 힙인지를 결정합니다.
   * 비교 가능한 데이터 유형의 경우, '>'는 최대 힙을 만들고, '<'는 최소 힙을 만듭니다.
   */
  public init(sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
  }

  /**
   * 배열에서 힙을 생성합니다. 배열의 순서는 중요하지 않으며,
   * 요소는 정렬 함수에 의해 결정된 순서로 힙에 삽입됩니다.
   * 비교 가능한 데이터 유형의 경우, '>'는 최대 힙을 만들고, '<'는 최소 힙을 만듭니다.
   */
  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
    configureHeap(from: array)
  }

  /**
   * 배열에서 최대 힙 또는 최소 힙을 설정합니다. 성능: 대략 O(n).
   */
  private mutating func configureHeap(from array: [T]) {
    nodes = array
    for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
      shiftDown(i)
    }
  }

  public var isEmpty: Bool {
    return nodes.isEmpty
  }

  public var count: Int {
    return nodes.count
  }

  /**
   * 인덱스 i의 요소의 부모의 인덱스를 반환합니다.
   * 인덱스 0의 요소는 트리의 루트이며 부모가 없습니다.
   */
  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
    return (i - 1) / 2
  }

  /**
   * 인덱스 i의 요소의 왼쪽 자식의 인덱스를 반환합니다.
   * 이 인덱스가 힙 크기보다 큰 경우 왼쪽 자식이 없습니다.
   */
  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 1
  }

  /**
   * 인덱스 i의 요소의 오른쪽 자식의 인덱스를 반환합니다.
   * 이 인덱스가 힙 크기보다 큰 경우 오른쪽 자식이 없습니다.
   */
  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 2
  }

  /**
   * 최대 힙(또는 최소 힙)에서 최대(또는 최소) 값을 반환합니다.
   */
  public func peek() -> T? {
    return nodes.first
  }

  /**
   * 새 값을 힙에 추가합니다. 이로 인해 최대 힙 또는 최소 힙 속성이 유지됩니다. 성능: O(log n).
   */
  public mutating func insert(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }

  /**
   * 값의 시퀀스(나열된 순차적인 데이터 구조)를 힙에 추가합니다. 이로 인해 최대 힙 또는 최소 힙 속성이 유지됩니다. 성능: O(log n).
   */
  public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
    for value in sequence {
      insert(value)
    }
  }

  /**
   * 요소를 변경할 수 있도록 합니다. 이로 인해 최대 힙 또는 최소 힙 속성이 유지됩니다.
   */
  public mutating func replace(index i: Int, value: T) {
    guard i < nodes.count else { return }

    remove(at: i)
    insert(value)
  }

  /**
   * 힙에서 루트 노드를 제거합니다. 최대 힙의 경우 최대 값이되며,
   * 최소 힙의 경우 최소 값입니다. 성능: O(log n).
   */
  @discardableResult public mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }

    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      // 마지막 노드를 사용하여 첫 번째 노드를 대체한 다음,
      // 이 새로운 첫 번째 노드를 적절한 위치로 이동하여 힙을 수정합니다.
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }

  /**
   * 힙에서 임의의 노드를 제거합니다. 성능: O(log n).
   * 노드의 인덱스를 알아야 합니다.
   */
  @discardableResult public mutating func remove(at index: Int) -> T? {
    guard index < nodes.count else { return nil }

    let size = nodes.count - 1
    if index != size {
      nodes.swapAt(index, size)
      shiftDown(from: index, until: size)
      shiftUp(index)
    }
    return nodes.removeLast()
  }

  /**
   * 자식 노드를 가져와서 부모와 비교하고,
   * 부모가 자식보다 크지 않으면(최대 힙의 경우) 또는 더 작지 않으면(최소 힙의 경우),
   * 두 노드를 교환합니다.
   */
  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)

    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }

    nodes[childIndex] = child
  }

  /**
   * 부모 노드를 살펴보고 여전히 더 큰지(최대 힙) 또는
   * 더 작은지(최소 힙) 확인합니다.
   */
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1

    // 정렬 함수에 따라 이들을 정렬하면 어떤 것이 먼저 오는지 알아냅니다:
    // 부모, 왼쪽 자식 또는 오른쪽 자식. 부모가 먼저 오면 끝입니다.
    // 그렇지 않으면 해당 요소는 잘못된 위치에 있으며 "트리를 아래로 내립니다"하여 힙 속성을 복원합니다.
    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }

    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }

  internal mutating func shiftDown(_ index: Int) {
    shiftDown(from: index, until: nodes.count)
  }

}

// MARK: - Searching

extension Heap where T: Equatable {

  /** 노드의 인덱스를 가져옵니다. 성능: O(n). */
  public func index(of node: T) -> Int? {
      return nodes.firstIndex(where: { $0 == node })
  }

  /** 힙에서 첫 번째 발견된 노드를 제거합니다. 성능: O(n). */
  @discardableResult public mutating func remove(node: T) -> T? {
    if let index = index(of: node) {
      return remove(at: index)
    }
    return nil
  }

}

// 우선순위 큐 구현
public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }

  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}