// BOJ_2910_빈도 정렬.swift
// 수열이 주어졌을 때, 빈도 정렬을 하는 프로그램을 작성하시오.
// 첫째 줄에 입력으로 주어진 수열을 빈도 정렬한 다음 출력한다.
// 수열의 두 수 X와 Y가 있을 때, X가 Y보다 수열에서 많이 등장하는 경우에는 X가 Y보다 앞에 있어야 한다.
// 만약, 등장하는 횟수가 같다면, 먼저 나온 것이 앞에 있어야 한다.

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], C = input[1]
let sequence = readLine()!.split(separator: " ").map { Int($0)! }

var dic: [Int: Int] = [:]
var result: [Int] = []

// 딕셔너리에 sequence숫자 : 빈도수 를 넣어줌
for i in sequence {
    dic[i, default: 0] += 1
}

// 빈도 정렬 시작
let sortedDic = dic.sorted {
    if $0.value == $1.value {
        // 순차적으로 비교하는데 만약 빈도수가 같으면,
        // 현재 비교하는 Key 의 Index 를 가져와서 오름차순으로 정렬 (Index가 낮을수록 먼저 입력한 값)
        if let index1 = sequence.firstIndex(of: $0.key), let index2 = sequence.firstIndex(of: $1.key) {
            return index1 < index2
        }
    }
    // 빈도수 내림차순 정렬
    return $0.value > $1.value
}

// 빈도 정렬된 변수의 인덱스를 순차적으로 넣어서
for i in sortedDic {
    // result 배열에 해당 인덱스의 Value 만큼 반복해서 Key를 넣어줌
    for _ in 0..<i.value {
        result.append(i.key)
    }
}

result.forEach { print($0, terminator: " ")}


//5 2
//2 1 2 1 2
//
//2 2 2 1 1