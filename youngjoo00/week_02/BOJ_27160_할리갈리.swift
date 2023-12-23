// BOJ_27160_할리갈리.swift
// 과일의 개수가 5가 되면 YES 출력, 아닐때는 NO 출력
// STRAWBERRY, BANANA, LIME, PLUM

let N = Int(readLine()!)!
var boardgame: [String:Int] = [:]

for _ in 0..<N {
    let data = readLine()!.split(separator: " ")
    // boardgame 에 해당 키가 없다면, 처음에는 일단 값을 넣어줌
    if boardgame[String(data[0])] == nil {
        boardgame.updateValue(Int(data[1])!, forKey: String(data[0]))
    } else {
        // 이미 키에 값이 있다면, 기존의 값과 방금 입력한 값을 더함
        boardgame.updateValue(boardgame[String(data[0])]! + Int(data[1])!, forKey: String(data[0]))
    }
}

// boardgame.keys : 사용된 Key 이름을 배열로 뽑아낸다.
// .filter : boardgame 에 Key로 뽑아낸 배열의 요소를 하나씩 넣어서 값이 5 인게 하나 이상인지 확인 후 출력
//boardgame.keys.filter { boardgame[$0] == 5 }.count >= 1 ? print("YES") : print("NO")

// 사실 더 간편하게 boardgame.values 를 이용해 값을 배열로 뽑아내고, 5인 값이 있는지 판별 후 출력하는게 더 좋다
print(boardgame.values.contains(5) ? "YES" : "NO")

//3
//BANANA 2
//PLUM 4
//BANANA 3
//
//YES