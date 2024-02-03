from heapq import *
import sys
input = sys.stdin.readline

N = int(input().rstrip())
result = 0
pq = []
for _ in range(N) :
    heappush(pq,list(reversed(list(map(int,input().split())))))

pre_end = 0
for _ in range(N) :
    start,end= list(reversed(heappop(pq)))
    if pre_end <= start :
        result += 1 #횟수만 저장
        pre_end = end
print(result)