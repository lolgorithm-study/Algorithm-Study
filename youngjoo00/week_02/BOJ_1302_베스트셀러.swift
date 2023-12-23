// BOJ_1302_베스트셀러.swift
// 첫째 줄에 오늘 하루 동안 팔린 책의 개수 N이 주어진다. 이 값은 1,000보다 작거나 같은 자연수이다.
// 둘째부터 N개의 줄에 책의 제목이 입력으로 들어온다. 책의 제목의 길이는 50보다 작거나 같고, 알파벳 소문자로만 이루어져 있다.
// 첫째 줄에 가장 많이 팔린 책의 제목을 출력한다. 만약 가장 많이 팔린 책이 여러 개일 경우에는 사전 순으로 가장 앞서는 제목을 출력한다.

let N = Int(readLine()!)!
var book: [String:Int] = [:]

for _ in 0..<N {
    let data = readLine()!
    // 입력한 데이터가 book 딕셔너리에 없으면 입력한 값을 Key : 1 로 넣어줌
    if book[data] == nil {
        book[data] = 1
    } else {
        // 입력한 데이터가 이미 있다면 해당 Key 에 += 1 해줌
        book[data]! += 1
    }
}

// Key 기준으로 오름차순으로 정렬
let sortedBook = book.keys.sorted()

// 가장 매출이 높은 값을 max 에 넣어줌
let max = book.values.max()!

// 정렬된 배열의 요소 i 를 이용해 book에 접근하여 최대값과 일치하면 출력
for i in sortedBook {
    if book[i] == max {
        print(i)
        break
    }
}

//5
//top
//top
//top
//top
//kimtop

//top
