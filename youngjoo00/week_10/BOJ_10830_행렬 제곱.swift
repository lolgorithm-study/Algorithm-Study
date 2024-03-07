// BOJ_10830_행렬 제곱.swift

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, b) = (input[0], input[1])

var A = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    A[i].append(contentsOf: input)
}

func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                result[i][j] += (A[i][k] * B[k][j]) % 1000
            }
            result[i][j] %= 1000
        }
    }
    
    return result
}

func power(_ A: [[Int]], _ b: Int) -> [[Int]] {
    // 1. Base
    if b == 1 {
        return A
    } else {
        // 2. Base 로 만들어주기 위해 b 를 반씩 조짐
        var temp = power(A, b / 2)
        
        // 3. 반으로 조져진 문제를 제곱해줌
        temp = multiply(temp, temp)
        
        // 4. 거듭 제곱하는 횟수가 홀수 일 경우 한번 더 자기 자신을 곱해줘야 함
        if b % 2 == 0 {
            return temp
        } else {
            return multiply(temp, A)
        }
    }
}

// 거듭제곱 횟수 b
let result = power(A, b)

for item in result {
    // b가 1일 때 1000 이라는 값이 있으면 이것도 나눠줘야함
    print(item.map { $0 % 1000 }.map { String($0) }.joined(separator: " "))
}