// BOJ_2217_로프.swift

let N = Int(readLine()!)!
var rope = [Int]()
var result = 0
for _ in 0..<N {
    rope.append(Int(readLine()!)!)
}

// 입력 받은 값을 내림차순 정렬
rope.sort(by: >)

for i in 0..<rope.count {
    // i번째 로프가 감당할 수 있는 최대 무게를 구한다.
    // rope[i] * i+1 을 하는 이유는,
    // 가장 큰 순서대로 정렬해뒀으니 다음 로프 순서대로 자기가 감당할 수 있는 최대 무게만 구하면 되기 때문이다.
    let weight = rope[i] * (i+1)
    result = max(result, weight)
}

print(result)