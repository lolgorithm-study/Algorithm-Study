from heapq import *
import sys
input = sys.stdin.readline
N = int(input().rstrip())
heap = []
for _ in range(N) :
    x = int(input().rstrip())
    if x == 0 :
        if len(heap) == 0 :
            print(0)
        else :
            print(heappop(heap))
    else :
        heappush(heap, x)