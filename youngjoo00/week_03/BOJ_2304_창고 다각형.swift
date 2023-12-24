// BOJ_2304_창고 다각형.swift
// 기둥들의 위치와 높이가 주어질 때, 가장 작은 창고 다각형의 면적을 구하는 프로그램을 작성하시오.
// 첫 줄에는 기둥의 개수를 나타내는 정수 N이 주어진다. N은 1 이상 1,000 이하이다.
// 그 다음 N 개의 줄에는 각 줄에 각 기둥의 왼쪽 면의 위치를 나타내는 정수 L과 높이를 나타내는 정수 H가 한 개의 빈 칸을 사이에 두고 주어진다.
// L과 H는 둘 다 1 이상 1,000 이하이다.

// 기본적으로 자기보다 큰 높이가 나오면 두 거리를 빼서 나온 값 * 높이 를 해주면 되는 문제

struct PolygonData {
    var L: Int
    var H: Int
}

let N = Int(readLine()!)!

var polygon: [PolygonData] = []
var result = 0

for _ in 0..<N {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    polygon.append(PolygonData(L: data[0], H: data[1]))
}

// L 순서대로 정렬
polygon.sort { $0.L < $1.L }


// 좌측 지붕 계산
var target = PolygonData(L: polygon[0].L, H: polygon[0].H)

for i in 1..<N{
    if target.H < polygon[i].H {
        result += (polygon[i].L - target.L) * target.H
        target = polygon[i]
    }
}

// 우측 지붕 계산
target = PolygonData(L: polygon[N-1].L, H: polygon[N-1].H)

for i in stride(from: N-1, through: 0, by: -1) {
    if target.H < polygon[i].H {
        result += (target.L - polygon[i].L) * target.H
        target = polygon[i]
    }
}

// 중앙의 가장 큰 지붕 값들 찾아서 배열로 뽑아내기
let max = polygon.filter { $0.H == polygon.max { $0.H < $1.H }?.H }

// 큰 지붕이 한 개일때와 여러개 일때 구분해서 출력
if max.count < 1 {
    print(result + target.H)
} else {
    print(result + (max.last!.L+1 - max.first!.L) * max[0].H)
}


//7
//2 4
//11 4
//15 8
//4 6
//5 3
//8 10
//13 6
//
//98