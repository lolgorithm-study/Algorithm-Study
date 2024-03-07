// BOJ_2630_색종이 만들기.swift

let N = Int(readLine()!)!
var list: [[Int]] = Array(repeating: Array(repeating: 0, count: 0), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    list[i].append(contentsOf: input)
}

var whiteCount = 0
var blueCount = 0

// 1. 베이스 조건 찾기
// 종이가 모두 하얀색 또는 모두 파란색으로 칠해져 있거나, 하나의 정사각형 칸이 되어 더 이상 자를 수 없을 때까지 반복한다.
// 근데 결국 반으로 쪼개는 순간 최종적으로는 하나만 칠해져 있는 상태가 될 수 있으니 이 부분을 Base 조건으로 잡았다.

// 2. 1/4 씩 분할해서 최대한 작은 문제로 쪼개고 해결해야 하니 변동되야 하는 값은 행, 열, 크기 이다.
// 그래서 함수에 행, 열, 크기를 매개변수로 받아준다.
func divide(_ row: Int, _ col: Int, _ size: Int) {
    
    // 3. 들어온 행, 열, 크기를 갖고 배열의 색상을 확인하는 함수를 호출한다.
    if let color = searchColor(row, col, size) {
        // 5. 베이스 조건에 만족한다면 count 를 올려준다.
        if color == 0 {
            whiteCount += 1
        } else {
            blueCount += 1
        }
    } else {
        // 6. 베이스 조건에 만족하지 않는다면, 사이즈를 반으로 나눈다.
        // 7. 1/4 로 각각 쪼개서 행과 열, 사이즈를 넣어서 베이스 조건에 근접하게끔 재귀를 시작한다.
        let newSize = size / 2
        // 1. 좌상단
        divide(row, col, newSize)
        // 2. 우상단
        divide(row, col + newSize, newSize)
        // 3. 좌하단
        divide(row + newSize, col, newSize)
        // 4. 우하단
        divide(row + newSize, col + newSize, newSize)
    }
    
}

func searchColor(_ row: Int, _ col: Int, _ size: Int) -> Int? {
    // 배열의 행, 열 값의 베이스 색상을 넣어놓는다.
    let baseColor = list[row][col]
    
    // 4. 행부터 행 + 사이즈까지, 열부터 열 + 사이즈 까지 서치해야함
    // 행과 열의 값이 바뀌게 되고, 행과 열의 값이 바뀜에 따라 구해야 하는 사이즈도 그만큼 바뀌어야 하니까.
    for i in row..<row + size {
        for j in col..<col + size {
            if list[i][j] != baseColor {
                return nil
            }
        }
    }
    return baseColor
}

divide(0, 0, N)
print(whiteCount)
print(blueCount)