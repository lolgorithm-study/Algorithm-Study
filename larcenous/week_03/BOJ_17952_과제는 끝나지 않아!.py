import sys
input = sys.stdin.readline
N = int(input())
stack = [] #list로 stack을 구현
score = 0 #총 점수
for _ in range(N) : 
    assign = list(map(int,input().rstrip().split()))
    if len(assign) == 3 : #assign의 원소가 3개면
        o, A, T = assign
    else :
        o = 0

    if o == 1 :
        stack.append([A,T]) #stack은 이차원 리스트가 되어, [점수, 남은시간]의 리스트를 원소로 가진다.
        stack[-1][-1] -= 1 #받자마자 과제를 시작하므로, 가장 마지막 리스트 원소의 남은시간을 1 줄인다.
    elif o == 0 and len(stack) > 0: #만약 입력값이 0인데, stack에 과제(리스트)가 존재한다면
        stack[-1][-1] -= 1 #마찬가지로 맨 끝에 놓인 과제(stack의 top)의 남은시간을 1 줄인다
    
    if len(stack) > 0 and stack[-1][-1] == 0 : 
        score += stack.pop()[0] #남은 시간을 1 줄인 후에 0이 된다면, stack에서 top을 pop하고 A(점수)를 결과에 더한다  
print(score)