'''
최악의 경우 N이 1500이면 1500^2개의 수가 존재하나,
메모리는 12MB로 매우 작다.
따라서 메모리 관리를 하는 것이 주요 포인트
'''
from heapq import *
import sys
input = sys.stdin.readline
pq = []
N = int(input().rstrip())
for _ in range(N) :
    for j in list(map(int,input().split())) :
        if len(pq) < N : #N-1개 까지는 모두 push
            heappush(pq, j)
        else : #N개를 유지하며 heap push, pop을 진행
            #heappushpop(pq,j)은 j를 넣고 heappop을 진행하는 것
            heappushpop(pq, j) 
print(heappop(pq))