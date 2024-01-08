// BOJ_9081_단어 맞추기.swift
// 다음 순열을 이용하는 방법이지만, 문자열을 사용해야함
// 근데 swift 특성상 문자열을 굉장히 다루기 힘들고, 특정 인덱스를 찾을때마다 O(n)이 걸려서 문자열배열로 변경해서 배열처럼 사용한다.
let T = Int(readLine()!)!

for _ in 0..<T {
    var permutation = Array(readLine()!)
    var pivotIndex = -1

    // 1. 배열의 뒤에서부터 permutation[i-1] < permution[i] 조건에 맞는 값 찾고, pivotIndex 에 담기
    for i in stride(from: permutation.count-1, through: 1, by: -1) {
        if permutation[i-1] < permutation[i] {
            pivotIndex = i-1
            break
        }
    }

    // 2. pivotIndex 가 -1 이 아니면, permutation[pivotIndex] < permutation[j] 조건을 만족하는 값 찾아서 스왑
    if pivotIndex != -1 {
        for j in stride(from: permutation.count-1, through: 1, by: -1) {
            if permutation[pivotIndex] < permutation[j] {
                permutation.swapAt(pivotIndex, j)
                break
            }
        }

        // 3. pivotIndex+1 부터 N 까지의 값은 내림차순으로 구성되어 있었으니 뒤집어서 오름차순으로 변경한다.
        // 여기서 문자열로 다시 변환
        print(String(permutation[...pivotIndex] + permutation[(pivotIndex+1)...].reversed()))
    } else {
        print(String(permutation))
    }
}