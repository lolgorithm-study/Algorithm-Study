import sys
from heapq import *
input = sys.stdin.readline
T = int(input().strip())
for _ in range(T) :
    ans = 0 #비용을 저장
    K = int(input())
    num = list(map(int, input().split()))
    heapify(num) #num 배열을 힙화한다
    while len(num) > 1 :
        a = heappop(num)
        b = heappop(num)
        c = a+b #합쳐진 파일의 크기를 c에 저장
        ans += c #합쳐진 파일의 크기만큼의 비용이 발생
        heappush(num, c)
    print(ans)