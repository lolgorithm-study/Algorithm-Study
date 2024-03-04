// BOJ_1806_부분합.swift
// 첫째 줄에 구하고자 하는 최소의 길이를 출력한다. 만일 그러한 합을 만드는 것이 불가능하다면 0을 출력하면 된다.

/*
 처음에 합은 두 개 이상의 수를 더하는 연산을 의미한다고 생각했어서 반드시 2개 이상의 수를 더해야하게끔 구조를 짰더니 계속 답이 안나왔다.
 + 마지막 조건문 때문에 개고생했다..
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, S) = (input[0], input[1])
let list = readLine()!.split(separator: " ").map { Int($0)! }

var len = N + 1
var start = 0
var end = 0
var sum = 0

while end <= N {
    if sum >= S { // sum 이 S 보다 크다면 최소 길이인지 확인해야함
        len = min(len, end - start)
        sum -= list[start] // start 의 인덱스를 올릴거니까 현재 인덱스의 요소 값을 제외
        start += 1
    } else if end < N { // 반대의 경우, sum 에 list[end] 를 담아주기 위해 작은 경우부터 비교함 + end < N 보다 작은 경우까지만
        sum += list[end]
        end += 1
    } else { // 진짜 조건문 잘못 다뤄서 몇번을 틀린건지 모르겠다.
        // end가 배열의 끝에 도달했고, sum이 여전히 S 미만인 경우, 즉 더 이상 탐색할 요소가 없는 상황에서는 while 루프를 종료
        break
    }
}

// len 이 한번도 안바뀌었다면, 0
print(len == N + 1 ? 0 : len)