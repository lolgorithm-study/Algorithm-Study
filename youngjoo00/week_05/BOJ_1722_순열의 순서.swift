// BOJ_1722_순열의 순서.swift
// k번째 수열을 나타내는 N개의 수를 출력하거나, 몇 번째 수열인지를 출력하면 된다.

let N = Int(readLine()!)!
var permutation: [Int] = []

for i in 1...N {
    permutation.append(i)
}

let input = readLine()!.split(separator: " ").map { Int($0)! }

if input[0] == 1 {
    // k번째 순열 구하기
    // 남은 순열에서 k번째를 찾기 위해 k를 0부터 시작하는 인덱스로 변환
    var k = input[1] - 1
    for i in 0..<N {
        // factorial(N-i-1)은 남은 숫자 중 가능한 모든 경우의 수
        // k를 나누면 k번째 순열의 인덱스를 찾을 수 있음
        let index = k / factorial(N-i-1)
        // 찾은 순열의 인덱스를 출력하고 permutation 배열에서 제거
        print(permutation.remove(at: index), terminator: " ")
        // 남은 경우의 수에서 k를 구하기 위해 나머지를 사용
        k %= factorial(N-i-1)
    }
} else if input[0] == 2 {
    // 주어진 순열이 몇번째 순열인지 구하기
    var answer = 1
    for i in 0..<N {
        // 주어진 순열의 숫자가 permutation 배열에서 몇번째에 있는지 찾음
        let index = permutation.firstIndex(of: input[i+1])!
        // 인덱스와 남은 숫자의 가능한 모든 경우의 수를 곱하고 answer에 더함
        answer += index * factorial(N-i-1)
        // 찾은 숫자를 permutation 배열에서 제거
        permutation.remove(at: index)
    }
    print(answer)
}

func factorial(_ n: Int) -> Int {
    return n < 2 ? 1 : (2...n).reduce(1, *)
}