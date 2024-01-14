// BOJ_16955_오목, 이길 수 있을까?.swift
// 10x10 의 오목판에 구사과가 턴을 한 번 가져서 이길 수 있으면 1, 없으면 0을 출력한다.
// x 는 구사과의 돌, o 는 큐브러버의 돌, . 는 빈 칸

// .을 X로 바꿨을 때 자신의 기준으로 가로, 세로, 대각선으로 X 가 4개가 있으면서, 공백이 있으면 되는 문제

import Foundation

var arr: [[Character]] = Array(repeating: Array(repeating: ".", count: 10), count: 10)

// 중앙기준으로 8방향을 잡는 방법과 좌측 끝을 기준으로 4방향을 탐색하는 방법이 있다.
// 이 방법은 2번째 방법이며, X들을 찾을 때 가로로 중앙을 넘지 않는 범위로 마지막을 제외하고 찾게 된다.

func funcCheck() -> Bool {
    var count: Int
    for i in 0..<10 {
        for j in 0..<10 {
            // 가로 확인
            if j <= 5 {
                count = 0
                for k in 0..<5 {
                    // j...j+k 까지 X 가 있는지 확인
                    if arr[i][j + k] == "X" {
                        count += 1
                        // 만약 하나라도 O 가 있다면 break
                    } else if arr[i][j + k] == "O" {
                        break
                    }

                    // K 가 4일때, count가 4 이상이면 끝
                    if k == 4 && count >= 4 {
                        return true
                    }
                }
            }
            
            // 세로 확인
            if i <= 5 {
                count = 0
                for k in 0..<5 {
                    // 여기도 마찬가지로 i...i+k 까지 확인
                    if arr[i + k][j] == "X" {
                        count += 1
                        // 중간에 O가 하나라도 있으면 break
                    } else if arr[i + k][j] == "O" {
                        break
                    }

                    if k == 4 && count >= 4 {
                        return true
                    }
                }
            }
            
            // 대각선 우하향
            count = 0
            for k in 0..<5 {
                if i + k >= 10 || j + k >= 10 {
                    break
                }
                
                // 행과 열의 인덱스를 k 를 이용해 같이 늘려서 대각선으로 탐색하게끔 구현
                if arr[i + k][j + k] == "X" {
                    count += 1
                } else if arr[i + k][j + k] == "O" {
                    break
                }

                if k == 4 && count >= 4 {
                    return true
                }
            }

            // 대각선 우상향
            count = 0
            for k in 0..<5 {

                if i - k < 0 || j + k >= 10 {
                    break
                }
                // i는 점점 낮추고, j를 점점 올리면 아래에서부터 올라가는 대각선으로 탐색함
                if arr[i - k][j + k] == "X" {
                    count += 1
                } else if arr[i - k][j + k] == "O" {
                    break
                }

                if k == 4 && count >= 4 {
                    return true
                }
            }
            
        }
    }
    return false
}

for i in 0..<10 {
    let line = readLine()!
    // 2차원 배열에 입력 값 할당
    for (j, char) in line.enumerated() {
        arr[i][j] = char
    }
}

// 조건이 만족됐다면 그에 맞게 출력
if funcCheck() {
    print("1")
} else {
    print("0")
}