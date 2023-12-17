// BOJ_9375_패션왕 신해빈.swift
// 각 테스트 케이스에 대해 해빈이가 알몸이 아닌 상태로 의상을 입을 수 있는 경우를 출력하시오.

// ABC 의 케이스가 있을 경우, (A+1)(B+1)(C+1)-1 의 계산을 하면 경우의 수가 나온다.
let testcase = Int(readLine()!)!

for _ in 0..<testcase {
    let n = Int(readLine()!)!

    var costume: [String:Int] = [:]

    for _ in 0..<n {
        let data = readLine()!.split(separator: " ")
        // 옷이 없으면 해당 의류를 Key 로 사용하고, 초기값을 2로 줌 (어짜피 A+1 할거니까)
        if costume[String(data[1])] == nil {
            costume[String(data[1])] = 2
        } else {
            // 의류가 이미 있다면 +1 씩 더해줌
            costume[String(data[1])]! += 1
        }
    }
    
    // 각 의류끼리 곱해주고 마지막에 옷을 입지않은 경우의 수를 제외하면 끝
    print(costume.values.reduce(1, *)-1)
}

//2
//3
//hat headgear
//sunglasses eyewear
//turban headgear
//3
//mask face
//sunglasses face
//makeup face

//5
//3