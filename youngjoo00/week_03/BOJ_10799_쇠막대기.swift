// BOJ_10799_쇠막대기.swift
//쇠막대기는 자신보다 긴 쇠막대기 위에만 놓일 수 있다. - 쇠막대기를 다른 쇠막대기 위에 놓는 경우 완전히 포함되도록 놓되, 끝점은 겹치지 않도록 놓는다.
//각 쇠막대기를 자르는 레이저는 적어도 하나 존재한다.
//레이저는 어떤 쇠막대기의 양 끝점과도 겹치지 않는다.
// 잘려진 조각의 총 개수를 나타내는 정수를 한 줄에 출력한다.

// 도저히 모르겠어서 코드는 안보고 접근 방법만 보고 풀었습니다.

var input = readLine()!.map { $0 }
var result = 0
var stack: [String] = []

for i in 0..<input.count {
    // 들어온 값이 여는 괄호라면 stack에 push
    if input[i] == "(" {
        stack.append(String(input[i]))
    } else if input[i-1] == "(" {
        // 들어온 값이 닫는 괄호면서, 이 전에 들어온 값이 여는 괄호일 경우 stack에 pop
        stack.popLast()
        // 잘라진 쇠막대기 부분을 넣기위해 stack에 들어있는 여는괄호의 개수만큼 result 에 더해줌
        result += stack.count
    } else {
        // 들어온 값이 닫는 괄호면서, 이 전에 들어온 값이 여는 괄호가 아닐 경우 stack에 pop
        stack.popLast()
        // 뒤에 있는 닫힌 괄호는 쇠막대기의 꽁다리 부분이니까 꽁다리 하나를 더해줌
        result += 1
    }
}

print(result)

//()(((()())(())()))(())
//17
