// BOJ_16970_정수 좌표의 개수.swift
// 첫째 줄에 지나가는 점의 개수가 K개인 선분의 수를 출력한다.
// 선분의 시작점과 끝 점의 사이 점들을 알아내기 위해 끝점 좌표 - 시작점 좌표를 하고, 끝점과 시작점을 추가하기 위해 x, y 좌표의 최대공약수에 +1 을 해준다.
// 이걸 브루트포스로 무한으로 즐기면서 지나는 점의 개수가 k와 같으면 count 를 올린다.

// 참고로, 진짜 이거 문제 이해도 힘들었고, 접근 방법을 보면서 푸는것도 이해하기 너무 힘들었다.
let input = readLine()!.split(separator: " ").map { Int($0)! }

// tuple 을 이용해 여러개의 값을 동시에 할당하거나 반환 가능
let (N, M, K) = (input[0], input[1], input[2])

var count = 0

// 선분이 움직이는 시작점 좌표부터 끝 점 좌표까지 모든 경우의 수 계산
// 시작점 (x1, y1), 끝 점 (y1, y2)
for x1 in 0...N {
    for y1 in 0...M {
        for x2 in 0...N {
            for y2 in 0...M {
                if gcd(abs(x2-x1), abs(y2-y1)) + 1 == K {
                    count += 1
                }
            }
        }
    }
}

// 시작점을 기준으로 끝점까지 모두 계산하다보면,
// 시작점이 (N,M) 값이 되어있고, 끝 값이 (0, 0) 이 되어있을 때도 있다.
// 이처럼, 시작점부터 끝점까지도 계산이 되지만, 끝점에서 시작점까지도 계산이 중복되어 count가 올라갔기에 count에 2를 나누어준다.
print(count / 2)

func gcd(_ first: Int, _ second: Int) -> Int {
    var first = first
    var second = second
    while second != 0 {
        let temp = second
        second = first % second
        first = temp
    }
    
    return first
}