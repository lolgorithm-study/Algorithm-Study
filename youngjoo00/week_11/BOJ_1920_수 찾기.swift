// BOJ_1920_수 찾기.swift
//N개의 정수 A[1], A[2], …, A[N]이 주어져 있을 때, 이 안에 X라는 정수가 존재하는지 알아내는 프로그램을 작성하시오.

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let M = Int(readLine()!)!
let B = readLine()!.split(separator: " ").map { Int($0)! }

func binarySearch(A: [Int], B: Int) -> Int {
    var front = 0
    var back = A.count - 1
    
    // front 가 back 보다 작거나 같을때까지만 탐색해야 내가 찾는 값이 있는지 확인할 수 있음
    while front <= back {
        // 중간 값 얻기
        let mid = (front + back) / 2
        
        // 중간 값과 내가 원하는 타겟인 B 가 같은지 비교하고, 같다면 바로 리턴
        if A[mid] == B {
            return 1
        } else if A[mid] < B { // 중간 값보다 내가 원하는 타겟이 더 크다면
            front = mid + 1 // front 를 중간 index + 1
        } else {
            back = mid - 1 // 반대라면, back 을 중간 index - 1
        }
    }
    
    // front 가 back 보다 커졌을 경우 내가 찾는 값이 없음
    return 0
}

for i in 0..<B.count {
    print(binarySearch(A: A, B: B[i]))
}