'''
'배열에서 절댓값이 가장 작은 값을 출력하고'
즉 우선순위 큐의 우선순위 기준은 '절댓값'이다.
절댓값으로 비교 연산을 진행하며, 실제값도 출력해야하므로,
tuple로 절댓값과 실제값을 저장한다.
'''
from heapq import *
import sys
input = sys.stdin.readline
N = int(input().rstrip())
pq = []
for _ in range(N) :
    x = int(input().rstrip())
    if x == 0 :
        if len(pq) == 0 :
            print(0)
        else :
            print(heappop(pq)[1])
    else :
        #이 경우 튜플의 첫번째 원소인 abs(x)가 기준이 되어 힙 삽입 연산이 된다.
        heappush(pq,(abs(x),x)) 