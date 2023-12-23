import sys
input = sys.stdin.readline
N = int(input().rstrip())
height = [int(input().rstrip()) for _ in range(N)]

class Stack(): #stack 자료 구조를 Stack class로 정의
    def __init__(self) :
        self.stack = []
    
    def push(self, data) :
        self.stack.append(data)
    
    def pop(self) :
        pop_object = -1
        if self.isEmpty() :
            pass
        else :
            pop_object = self.stack.pop()
        
        return pop_object
    
    def top(self) :
        top_object = -1
        if self.isEmpty() :
            pass
        else :
            top_object = self.stack[-1]

        return top_object
    
    def isEmpty(self) :
        is_empty = 0
        if len(self.stack) == 0 :
            is_empty = 1

        return is_empty

stack = Stack()
for i in height :
    while stack.top() <= i and not stack.isEmpty(): #top보다 새로 들어올 i가 크다면 
        stack.pop() #stack의 top을 pop
    stack.push(i) #i가 남아있는 stack의 top보다 작은 경우에 push하게 된다.

print(len(stack.stack))