// BOJ_9933_민균이의 비밀번호.swift
//민균이의 파일에 적혀있는 단어가 모두 주어졌을 때, 비밀번호의 길이와 가운데 글자를 출력하는 프로그램을 작성하시오

// 해시 맵을 어떻게 써야할지 감이 안잡혀서 그냥 문자열을 사용했다..
import Foundation

let N = Int(readLine()!)!
var passwordArr: [String] = []

for _ in 0..<N {
    passwordArr.append(readLine()!)
}

for i in 0..<N {
    // 팰린드롬인지 확인하기 위해 배열의 문자열을 뒤집어서 서칭
    let reversedPassword = String(passwordArr[i].reversed())
    if passwordArr.contains(reversedPassword) {
        // 조건에 맞는 문자열의 개수 / 문자열의 첫 문자를 기준으로 문자열을 2로 나눈 값의 차이만큼 떨어져있는 인덱스를 찾아서 해당 문자를 반환
        print("\(reversedPassword.count) \(reversedPassword[reversedPassword.index(reversedPassword.startIndex, offsetBy: reversedPassword.count / 2)])")
        break
    }
}

//4
//las
//god
//psala
//sal
//
//3 a