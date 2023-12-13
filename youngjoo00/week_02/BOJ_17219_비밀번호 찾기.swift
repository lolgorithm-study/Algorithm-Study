// BOJ_17219_비밀번호 찾기.swift
// 메모장에서 비밀번호를 찾아주는 프로그램을 만들어보자.
// 첫 번째 줄부터 M개의 줄에 걸쳐 비밀번호를 찾으려는 사이트 주소의 비밀번호를 차례대로 각 줄에 하나씩 출력한다.

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]

var note: [String:String] = [:]
var result: String = ""

// note 에 입력받은 값들을 넣음
for _ in 0..<N {
    let data = readLine()!.split(separator: " ")
    note[String(data[0])] = String(data[1])
}

// 찾고있는 주소를 note의 Key 에 넣어서 값을 출력함
for _ in 0..<M {
    let data = readLine()!
    print(note[String(data)]!)
}

//16 4
//noj.am IU
//acmicpc.net UAENA
//startlink.io THEKINGOD
//google.com ZEZE
//nate.com VOICEMAIL
//naver.com REDQUEEN
//daum.net MODERNTIMES
//utube.com BLACKOUT
//zum.com LASTFANTASY
//dreamwiz.com RAINDROP
//hanyang.ac.kr SOMEDAY
//dhlottery.co.kr BOO
//duksoo.hs.kr HAVANA
//hanyang-u.ms.kr OBLIVIATE
//yd.es.kr LOVEATTACK
//mcc.hanyang.ac.kr ADREAMER
//startlink.io
//acmicpc.net
//noj.am
//mcc.hanyang.ac.kr
//
//THEKINGOD
//UAENA
//IU
//ADREAMER