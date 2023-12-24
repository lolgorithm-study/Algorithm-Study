// BOJ_27964_콰트로치즈피자.swift
// 입력으로 주어진 토핑의 목록이 Cheese 로 끝나는 단어가 4개 이상일 경우, yummy, 만들 수 없으면 sad를 출력하라.

let N = Int(readLine()!)!
var topping = readLine()!.split(separator: " ").map { $0 }

// 토핑 변수를 Set 으로 변환시키고, suffix 를 이용해 문자열의 뒤에서 6개를 떼와서 Cheese 와 같은지 확인 후 필터 배열로 반환한 배열의 갯수가 4 이상인지 체크
print(Set(topping).filter { $0.suffix(6) == "Cheese" }.count >= 4 ? "yummy" : "sad")

//4
//CheddarCheese MozzarellaCheese GoudaCheese GranaPadanoCheese
//
//yummy