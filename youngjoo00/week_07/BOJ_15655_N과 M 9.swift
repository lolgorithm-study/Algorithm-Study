// BOJ_15655_N과 M (9).swift

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])
let number = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var visited = [Bool](repeating: false, count: N)
var arr : [Int] = []

func backTraking(arr: [Int]) {
    // 재귀가 끝나는 조건
    if arr.count == M {
        arr.forEach { print($0, terminator: " ") }
        print()
        return
    }
    
    var check = 0
    // 0~N-1 까지의 숫자만 반복해서 돌림
    for i in 0..<number.count {
        // 방문하지 않았고, 이번에 확인할 배열이 이전과 같지 않다면
        if !visited[i] && check != number[i] {
            // 유망한 루트이다. => 방문처리해주고, 이번에 넣은 값을 체크하기위해 값을 넣어줌
            visited[i] = true
            // 같은 값은 반드시 정렬되어 있기에 이 다음에 중복된다면 이걸로 거를수 있음
            check = number[i]
            backTraking(arr: arr + [number[i]])
            visited[i] = false
        }
    }
}

backTraking(arr: [])