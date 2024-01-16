// BOJ_3085_사탕 게임.swift
// 1. 행, 열 기준 인접한 다른 사탕이 있을 경우 바꾸고, (사탕의 종류 C, P, Z, Y)
// 2. 행, 열 기준 최대로 먹을 수 있는 사탕의 개수 찾고,
// 3. 다시 사탕 자리 되돌리기

let N = Int(readLine()!)!
var arr: [[Character]] = []
var result = 0

for i in 0..<N {
    arr.append(readLine()!.map{ $0 })
}

for i in 0..<N {
    for j in 0..<N-1 {
        // 행을 기준으로 서치
        // 다른 사탕이 있다면 swap 후, 사탕의 개수를 체크한다.
        if arr[i][j] != arr[i][j+1] {
            arr[i].swapAt(j, j+1)
            checkedCandyCount(arr)
            arr[i].swapAt(j, j+1)
        }
        // 열을 기준으로 서치
        // 여기도 동일하지만, 열끼리는 swapAt 사용이 불가능해서 튜플로 묶어서 swap 해주었다.
        if arr[j][i] != arr[j+1][i] {
            (arr[j][i], arr[j+1][i]) = (arr[j+1][i], arr[j][i])
            checkedCandyCount(arr)
            (arr[j][i], arr[j+1][i]) = (arr[j+1][i], arr[j][i])
        }
    }
}

func checkedCandyCount(_ arr: [[Character]]) {
    for i in 0..<N {
        // 행 기준
        // 일단 0번째 공간에 사탕 한 개
        var count = 1
        for j in 1..<N {
            // 1...N 까지 같은 사탕들의 개수를 합해줌
            if arr[i][j-1] == arr[i][j] {
                count += 1
            } else {
                count = 1
            }
            // 이번 반복에서 가장 큰 개수와 결과값의 개수와 비교해서 더 큰걸 결과값에 넣음
            result = max(result, count)
        }
    }
    
    for i in 0..<N {
        // 열 기준
        // 여기도 로직은 동일합니다.
        var count = 1
        for j in 1..<N {
            if arr[j][i] == arr[j-1][i] {
                count += 1
            } else {
                count = 1
            }
            result = max(result, count)
        }
    }
}

print(result)