// BOJ_5568_카드 놓기.swift
// 첫째 줄에 n이, 둘째 줄에 k가 주어진다. 셋째 줄부터 n개 줄에는 카드에 적혀있는 수가 주어진다.
// 첫째 줄에 상근이가 만들 수 있는 정수의 개수를 출력한다.

// n가지 중 r 개를 뽑는 것을 순열이라고 하며 nPr 이라고 한다. (중복된 경우의 수를 합친 값)
// nPr 을 돌며 중복되는 값을 제외하면 되지만, 직접 짜는게 내 머리로는 불가능해서 답을 봤습니다.

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var cards: [String] = []
var visited = Array(repeating: 0, count: n)
var result: Set<String> = []

for _ in 0..<n {
   cards.append(readLine()!)
}

func sol(_ current: String, cnt: Int) {
   if cnt == k {
       result.insert(current)
       return
   } else {
       for i in (0..<n) {
           if visited[i] == 0 {
               // 현재 돌고있는 자신은 제외하기 위한 코드
               visited[i] = 1
               // 재귀함수를 이용해 i자리의 모든 경우의 수를 구해서 result 에 넣음
               sol(current + cards[i], cnt: cnt + 1)
               // n = 4, k = 2, cards[1, 2, 12, 1] 일 경우
//                검증 :  1 1
//                검증 :  12 2
//                검증 :  112 2
//                검증 :  11 2
//                검증 :  2 1
//                검증 :  21 2
//                검증 :  212 2
//                검증 :  21 2
//                검증 :  12 1
//                검증 :  121 2
//                검증 :  122 2
//                검증 :  121 2
//                검증 :  1 1
//                검증 :  11 2
//                검증 :  12 2
//                검증 :  112 2

               // 자신을 포함한 경우의 수를 모두 구했다면 0으로 만드는 코드
               visited[i] = 0
           }
       }
   }
}

sol("", cnt: 0)
print(result.count)

//4
//2
//1
//2
//12
//1
//
//7