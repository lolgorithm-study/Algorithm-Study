'''
1번부터 N번까지 N개의 풍선이 원형으로 놓여 있고. 
i번 풍선의 오른쪽에는 i+1번 풍선이 있고, 왼쪽에는 i-1번 풍선이 있다. 
단, 1번 풍선의 왼쪽에 N번 풍선이 있고, N번 풍선의 오른쪽에 1번 풍선이 있다. 
각 풍선 안에는 종이가 하나 들어있고, 종이에는 -N보다 크거나 같고, N보다 작거나 같은 정수가 하나 적혀있다. 
이 풍선들을 다음과 같은 규칙으로 터뜨린다.

우선, 제일 처음에는 1번 풍선을 터뜨린다. 
다음에는 풍선 안에 있는 종이를 꺼내어 그 종이에 적혀있는 값만큼 이동하여 다음 풍선을 터뜨린다. 
양수가 적혀 있을 경우에는 오른쪽으로, 음수가 적혀 있을 때는 왼쪽으로 이동한다. 
이동할 때에는 이미 터진 풍선은 빼고 이동한다.

예를 들어 다섯 개의 풍선 안에 차례로 3, 2, 1, -3, -1이 적혀 있었다고 하자.
이 경우 3이 적혀 있는 1번 풍선, -3이 적혀 있는 4번 풍선, -1이 적혀 있는 5번 풍선, 1이 적혀 있는 3번 풍선, 2가 적혀 있는 2번 풍선의 순서대로 터지게 된다.
'''

import sys

N = int(input())
li = list(map(int, sys.stdin.readline().split()))

from collections import deque

D = {}
for i in range(N) :
    D[i+1] = li[i] #D라는 dictionary에 key를 i+1, value를 i로 저장

deq = deque([i+1 for i in range(N)]) #1부터 N까지로 이루어진 deque 생성

result = []

while len(deq) > 0 :
    deque_pop = deq.popleft()
    result.append(deque_pop)
    if D[deque_pop] > 0 : #풍선에 적힌 수가 양수인 경우
        #양수이면 오른쪽으로 이동, 즉 deque를 왼쪽(반시계방향)으로 회전       
        deq.rotate(1-D[deque_pop]) #popleft를 통해 이미 한 번 돌린 효과
    else :
        #음수이면 왼쪽으로 이동, 즉 deque를 오른쪽(시계방향)으로 회전
        deq.rotate(-D[deque_pop])

#map함수를 통해 result의 각 원소를 문자열로 변환 후, join으로 각 원소를 하나의 문자열로 합친 뒤 출력
print(' '.join(map(str, result))) 