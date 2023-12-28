from heapq import *
n = int(input())
hq = []
for _ in range(n) :
    a = list(map(int,input().split()))
    if len(a) == 1 : #길이가 1이면 0인 것
        a = 0
        if len(hq) == 0 : #0인데 hq가 비어있다면
            print(-1)
        else :
            print(-heappop(hq))
    else :
        for val in a[1:] : # a[1:] 선물의 가치 부분만 사용
            heappush(hq, -val) #최대 힙을 구현해야하므로, -를 곱해 구현