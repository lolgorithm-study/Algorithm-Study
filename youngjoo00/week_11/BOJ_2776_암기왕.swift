// BOJ_2776_암기왕.swift

// 분명 이분탐색을 잘 쓴거 같았는데 뭐가 문제인가 봤더니 역시나 느린 입출력이 문제여서 fileIO 를 사용했다.
import Foundation

let file = FileIO()

let T = file.readInt()

for _ in 0..<T {
    let N = file.readInt()
    var A: [Int] = []
    for _ in 0..<N {
        A.append(file.readInt())
    }
    A.sort()
    
    let M = file.readInt()
    var B: [Int] = []
    for _ in 0..<M {
        B.append(file.readInt())
    }
    
    for item in B {
        print(binarySearch(A: A, B: item))
    }
}

func binarySearch(A: [Int], B: Int) -> Int {
    
    var front = 0
    var back = A.count - 1
    
    while front <= back {
        let mid = (front + back) / 2
        
        if A[mid] == B {
            return 1
        } else if A[mid] > B {
            back = mid - 1
        } else {
            front = mid + 1
        }
    }

    return 0
}

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 {
            now = read()
        }
        if now == 45{ //음수 처리
            isPositive.toggle(); now = read()
        }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}