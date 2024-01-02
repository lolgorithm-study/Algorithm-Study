// BOJ_26090_완전한 수열.swift
// 수열의 연속 부분 수열중, 완전한 수열의 갯수를 찾아서 수열의 안정도 출력
// 완전한 수열의 조건
// 1. 수열의 길이가 소수
// 2. 수열의 합이 소수

let N = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map { Int($0)! }

// 총 수열의 갯수와 수열의 합 중 뭐가 더 큰지 비교하기 위해 합을 구함
let sum = sequence.reduce(0, +)

var primes: Set<Int> = []
var result = 0

// 에라토스테네스의 체를 사용하여 소수 구하기
func getPrimes(_ limit: Int) -> Set<Int> {
    var primes: Set<Int> = []
    var number: [Bool] = [false, false] + repeatElement(true, count: limit-1)
    
    for i in 2...limit {
        if number[i] {
            primes.insert(i)
            for j in stride(from: i, through: limit, by: i) {
                number[j] = false
            }
        }
    }
    
    return primes
}

// 소수 판별
if 500 > sum {
    primes = getPrimes(500)
} else if sum >= 2 {
    primes = getPrimes(sum)
}


for i in 0..<sequence.count-1 {
    for j in i+1..<sequence.count {
        // 부분 순열을 만들어서 완전한 수열의 조건이 맞는지 확인
        let partialSequence = sequence[i...j]
        if primes.contains(partialSequence.count) && primes.contains(partialSequence.reduce(0, +)){
            result += 1
        }
    }
}

print(result)