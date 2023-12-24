// 일곱 난쟁이_2309.swift
//아홉 개의 줄에 걸쳐 난쟁이들의 키가 주어진다. 주어지는 키는 100을 넘지 않는 자연수이며,
//아홉 난쟁이의 키는 모두 다르며, 가능한 정답이 여러 가지인 경우에는 아무거나 오름차순으로 출력한다.

var input: [Int] = []
var result: [Int] = []
for _ in 0..<9 {
    input.append(Int(readLine()!)!)
}

// 2중 반복을 사용해 배열의 [i], [j] 값을 0 으로 만들어서 7개의 유효한 값으로 만든 뒤
// 더했을 때 100이 되면 오름차순 정렬 후 출력
for i in 0..<9 {
    for j in 0..<9 {
        if j != i {
            result = input
            result[i] = 0
            result[j] = 0
            if result.reduce(0, +) == 100 {
                break
            }
        }
    }
    if result.reduce(0, +) == 100 {
        result.sorted().filter { $0 != 0 }.forEach { print($0) }
        break
    }
}


//20
//7
//23
//19
//10
//15
//25
//8
//13

//7
//8
//10
//13
//19
//20
//23