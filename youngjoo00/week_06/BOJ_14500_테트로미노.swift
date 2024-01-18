// BOJ_14500_테트로미노.swift
// 1. 각 테트로미노 블럭의 형태를 xy 좌표로 잡아둠
// 2. 탐색을 시작할 위치 0~N, 0~M 를 기준으로 잡고 반복문을 돌린다.
// 3. 탐색을 시작한 위치에 각 블럭의 형태를 넣어주고, 바깥을 나가는지 확인한다.
// 4. 블럭의 형태를 입력받은 arr 에 대입해서 값들의 합을 얻어내고, 끝까지 반복해서 최대값을 출력한다.

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])
var arr: [[Int]] = []
var result = 0

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

let i_Index = [[0,0,0],[1,2,3],[0,1,1],[1,2,2],
          [0,0,1],[0,1,2],[0,0,-1],[1,1,2],
          [0,-1,-1],[0,0,1],[0,-1,1],[0,-1,0],
          [1,1,2],[1,1,2],[0,1,1],[0,-1,-2],
          [0,0,1],[0,1,2],[1,1,1]]

let j_Index = [[1,2,3],[0,0,0],[1,0,1],[0,0,1],
          [1,2,0],[1,1,1],[1,2,2],[0,1,1],
          [1,1,2],[1,2,1],[1,1,1],[1,1,2],
          [0,1,0],[0,-1,-1],[1,1,2],[1,1,1],
          [1,2,2],[1,0,0],[0,1,2]]

func poliomino(x:Int, y:Int) -> Int{
    var result = 0
    for i in 0..<19{
        // arr를 temp 에 저장해둔다.
        var temp = arr[x][y]
        // 도형은 0,0 부터 기본으로 시작하며, 나머지 3개의 위치만 알면 되니 3번 반복
        for j in 0..<3{
            // 탐색을 시작한 위치에 블럭을 놓는다.
            let nx = x + i_Index[i][j]
            let ny = y + j_Index[i][j]
            // 놓은 블럭이 밖을 나가는지 확인
            if nx<0 || nx>=N || ny<0 || ny>=M{
                temp = 0
                break
            }
            // arr 에 접근하여 값들을 더함
            temp += arr[nx][ny]
        }
        result = max(result, temp)
    }
    return result
}

for i in 0..<N{
    for j in 0..<M{
        result = max(result, poliomino(x: i, y: j))
    }
}
print(result)