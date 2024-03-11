// BOJ_2512_예산.swift
//N개의 정수 A[1], A[2], …, A[N]이 주어져 있을 때, 이 안에 X라는 정수가 존재하는지 알아내는 프로그램을 작성하시오.

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let M = Int(readLine()!)!

func binarySearch(A: [Int], total: Int) -> Int {
    
    // 시작 값은 0 으로 잘 지정해줍시다..
    var front = 0
    var back = A.last!
    
    while front <= back {
        let mid = (front + back) / 2
        var sum = 0
        
        // 상한액으로 맞춰서 덧셈
        for item in A {
            if item > mid {
                sum += mid
            } else {
                sum += item
            }
        }
        
        // 상한액으로 구한 sum 과 total 값을 비교했을 때,
        // sum 이 더 크다면 예산을 줄여야한다! -> 중간 값에서 1을 뺀 값을 상한액으로 책정
        if sum > total {
            back = mid - 1
        } else { // 반대라면, 예산을 늘려야한다! -> 중간 값에서 1을 더한 값을 상한액으로 책정
            front = mid + 1
        }
    }

    // 최종적으로 나오는 back 의 값이 예산의 상한액
    return back
}

print(binarySearch(A: A, total: M))